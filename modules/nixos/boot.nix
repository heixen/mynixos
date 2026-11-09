{ ... }:
{
  boot.loader.systemd-boot.enable = true;
  # boot.loader.systemd-boot.graceful = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
