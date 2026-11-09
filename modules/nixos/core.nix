{ ... }:
{
  # Version of the stateful data layout (keep the release the system was installed with).
  system.stateVersion = "26.05";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Allow unfree packages system-wide (Home Manager inherits this via useGlobalPkgs).
  nixpkgs.config.allowUnfree = true;

  # Hardlink identical files across store paths to save space.
  nix.settings.auto-optimise-store = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    # 64 GiB disk: keep two weeks of rollbacks instead of a month.
    options = "--delete-older-than 14d";
  };

  nix.optimise = {
    automatic = true;
    dates = "weekly";
  };

  time.timeZone = "Asia/Manila";

  i18n.defaultLocale = "en_PH.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fil_PH";
    LC_IDENTIFICATION = "fil_PH";
    LC_MEASUREMENT = "fil_PH";
    LC_MONETARY = "fil_PH";
    LC_NAME = "fil_PH";
    LC_NUMERIC = "fil_PH";
    LC_PAPER = "fil_PH";
    LC_TELEPHONE = "fil_PH";
    LC_TIME = "fil_PH";
  };

  documentation.doc.enable = false;
  documentation.man.cache.enable = false;
}
