{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
    ];
  };

  # users.users.jellyfin.extraGroups = [
  #   "render"
  #   "video"
  # ];

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
}
