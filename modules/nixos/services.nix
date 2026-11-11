{ pkgs, ... }:
{
  hardware.bluetooth.enable = true;

  services.printing.enable = true;

  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };

  services.udisks2.enable = true;
  services.tailscale.enable = true;

  services.jellyfin = {
    enable = true;
    openFirewall = true;

    hardwareAcceleration = {
      enable = true;
      type = "vaapi";
      device = "/dev/dri/renderD128";
    };
  };
}
