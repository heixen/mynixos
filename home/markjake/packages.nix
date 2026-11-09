# User-facing packages managed by Home Manager.
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    git
    kitty
    mpv
    neovim
    libreoffice
    tree
    coreutils
    gawk
    bc
    discord
    gnome-calendar
    spotify
    microsoft-edge
  ];
}
