{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ./nixvim
    ./river
    ./packages
    ./programs.nix
    ./services.nix
    inputs.catppuccin.homeModules.catppuccin
  ];

  # FIXME: TEMP
  catppuccin.mako.enable = false;
  # FIXME: TEMP

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";

  catppuccin = {
    enable = true;
    flavor = "macchiato";
    accent = "peach";
    cursors.enable = false;
  };

  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-macchiato-blue-compact";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        variant = "macchiato";
        size = "compact";
      };
    };
  };

  home.pointerCursor = {
    name = "catppuccin-macchiato-dark-cursors";
    package = pkgs.catppuccin-cursors.macchiatoDark;
    size = 32;
    gtk.enable = true;
    x11.enable = true;
  };

  home.username = "julius";
  home.homeDirectory = "/home/julius";

  home.sessionVariables = {
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    _JAVA_AWT_WM_NONREPARENTING = 1;
    AWT_TOOLKIT = "MToolkit";
  };

  fonts.fontconfig.enable = true;
}
