# User-facing packages managed by Home Manager.
#
# TODO(space): several large apps are temporarily disabled so the first
# flake build fits on disk. Uncomment them after switching successfully.
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

    # --- TODO(space): re-enable after the flake switch ---
    # libreoffice
    # discord
    # spotify
    # gnome-calendar
    # microsoft-edge
  ];
}
