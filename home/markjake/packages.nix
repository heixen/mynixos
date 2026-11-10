# User-facing packages managed by Home Manager.
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # --- keep: needed for day-to-day work ---
    git
    kitty
    mpv
    neovim
    tree
    coreutils
    gawk
    bc

    # --- re-enabled after the flake switch ---
    libreoffice
    discord
    spotify
    gnome-calendar

    jq
  ];
}
