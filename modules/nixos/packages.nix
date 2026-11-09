# System-wide packages (available to every user).
# NOTE: user-facing applications will gradually move to Home Manager
# (home/markjake/packages.nix). This file keeps the current list so the
# first flake rebuild behaves exactly like the old configuration.
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    #################################################
    # Wayland / Hyprland
    #################################################
    noctalia
    foot
    wofi
    fuzzel
    wlsunset
    slurp
    grim
    libnotify
    wl-clipboard
    brightnessctl
    waybar
    awww
    hyprlock
    cava
    peaclock
    playerctl
    mpvpaper

    # lyrics needs python
    # TODO(space): python312

    #################################################
    # Editors & Documentation
    #################################################
    vim
    man-pages
    tree-sitter
    lazygit
    fzf
    fd

    #################################################
    # Terminal Utilities
    #################################################
    wget
    curl
    unzip
    ripgrep
    htop
    btop
    fastfetch
    nix-search-cli

    #################################################
    # Development Tools
    #################################################
    gcc
    clang
    cmake
    gnumake
    clang-tools
    cmake-format
    cmake-lint
    tree-sitter-grammars.tree-sitter-sql
    pyright
    lua-language-server
    nixfmt

    #################################################
    # File Management & MTP
    #################################################
    libmtp

    #################################################
    # KDE / Dolphin Integration
    #################################################
    # TODO(space): the KDE stack is one of the largest groups; re-enable later.
    # kdePackages.dolphin
    # kdePackages.qtwayland
    # kdePackages.qtsvg
    # kdePackages.breeze-icons
    # kdePackages.kdegraphics-thumbnailers
    # kdePackages.ffmpegthumbs
    # kdePackages.kio-extras
    # kdePackages.kio-fuse
    # kdePackages.kio-admin

    #################################################
    # Images & Graphics
    #################################################
    # TODO(space): kdePackages.gwenview
    sxiv

    #################################################
    # Audio
    #################################################
    pavucontrol
    pwvucontrol
    pamixer
    # TODO(space): easyeffects
    alsa-utils

    #################################################
    # Bluetooth
    #################################################
    # TODO(space): bluetuith

    #################################################
    # Others
    #################################################
    gnome-calculator
    gsimplecal
    # TODO(space): cheese
    cronie
    bat
    mycli

    #################################################
    # Cursors & themes
    #################################################
    rose-pine-hyprcursor
    rose-pine-cursor
    rose-pine-icon-theme
    adwaita-icon-theme
    hicolor-icon-theme
  ];
}
