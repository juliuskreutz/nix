{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
    inputs.nixvim.homeManagerModules.nixvim
    ./river
    ./packages
    ./jdks.nix
    ./programs.nix
    ./services.nix
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "25.05";

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

  xdg.enable = true;

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
    _JAVA_AWT_WM_NONREPARENTING = 1;
    AWT_TOOLKIT = "MToolkit";
  };

  fonts.fontconfig.enable = true;
}
