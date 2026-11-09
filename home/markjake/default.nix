# Home Manager configuration for user "markjake".
{ ... }:
{
  imports = [
    ./packages.nix
    ./shell.nix
    ./dotfiles.nix
  ];

  home.username = "markjake";
  home.homeDirectory = "/home/markjake";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
