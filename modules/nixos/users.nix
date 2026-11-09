{ ... }:
{
  users.users.markjake = {
    isNormalUser = true;
    description = "nixos";
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
      "audio"
    ];
    # User packages are managed by Home Manager (home/markjake/packages.nix).
  };
}
