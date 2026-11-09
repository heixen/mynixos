{ pkgs, ... }:
{
  hardware.bluetooth.enable = true;

  services.printing.enable = true;

  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };

  services.udisks2.enable = true;

  # services.flatpak.enable = true;
}
