{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    font-awesome
    font-awesome_5
    # nerd-fonts.droid-sans-mono
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  services.displayManager.ly.enable = true;

  # Needed for Wayland greeters, polkit agents and portals.
  security.polkit.enable = true;
  security.polkit.enablePkexecWrapper = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };

  # Keyboard layout (also set it in Hyprland's own config for Wayland sessions).
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  programs.firefox.enable = true;

  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  services.tumbler.enable = true;
  programs.thunar.plugins = with pkgs; [
    thunar-archive-plugin
    thunar-volman
  ];

  services.gvfs.enable = true;
}
