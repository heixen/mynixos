# Home Manager configuration for user "markjake".
{ inputs, ... }:

{
  imports = [
    ./packages.nix
    ./shell.nix
    ./dotfiles.nix

    inputs.zen-browser.homeModules.twilight
  ];

  # new
  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
  };

  home.username = "markjake";
  home.homeDirectory = "/home/markjake";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
