# Shared NixOS modules, imported by every host.
{ ... }:
{
  imports = [
    ./core.nix
    ./boot.nix
    ./networking.nix
    ./audio.nix
    ./graphics.nix
    ./desktop.nix
    ./services.nix
    ./users.nix
    ./packages.nix
  ];
}
