# Composition root for the "nixos" machine.
# Only host-specific wiring belongs here; shared settings live in modules/nixos.
{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
  ];
}
