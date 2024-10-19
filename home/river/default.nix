{pkgs, ...}: {
  imports = [
    ./waybar.nix
  ];

  programs.fuzzel.enable = true;
  wayland.windowManager.river = {
    enable = true;
    xwayland.enable = true;
    settings = {
      map = {
        normal = {
          "Super+Shift Q" = "exit";
          "Super+Shift C" = "close";
          "Super Space" = "toggle-float";
          "Super F" = "toggle-fullscreen";
          "Super H" = "swap left";
          "Super L" = "swap right";
          "Super+Shift Return" = "spawn ${pkgs.kitty}/bin/kitty";
          "Super E" = "spawn ${pkgs.chromium}/bin/chromium";
          "Super P" = "spawn ${pkgs.fuzzel}/bin/fuzzel";
          "Super S" = "spawn shot";
          # Super+[1-9] to focus tag [0-8]
          "Super 1" = "set-focused-tags 1";
          "Super 2" = "set-focused-tags 2";
          "Super 3" = "set-focused-tags 4";
          "Super 4" = "set-focused-tags 8";
          "Super 5" = "set-focused-tags 16";
          "Super 6" = "set-focused-tags 32";
          "Super 7" = "set-focused-tags 64";
          "Super 8" = "set-focused-tags 128";
          "Super 9" = "set-focused-tags 256";
          # Super+Shift+[1-9] to tag focused view with tag [0-8]
          "Super+Shift 1" = "set-view-tags 1";
          "Super+Shift 2" = "set-view-tags 2";
          "Super+Shift 3" = "set-view-tags 4";
          "Super+Shift 4" = "set-view-tags 8";
          "Super+Shift 5" = "set-view-tags 16";
          "Super+Shift 6" = "set-view-tags 32";
          "Super+Shift 7" = "set-view-tags 64";
          "Super+Shift 8" = "set-view-tags 128";
          "Super+Shift 9" = "set-view-tags 256";
        };
      };
      map-pointer = {
        normal = {
          "Super BTN_LEFT" = "move-view";
          "Super BTN_RIGHT" = "resize-view";
        };
      };
      keyboard-layout = "de";
      set-repeat = "30 250";
      default-layout = "rivertile";
      focus-follows-cursor = "always";
      spawn = [
        "rivertile"
        "\"${pkgs.swaybg}/bin/swaybg -i ${../../wallpaper.png} -m fill\""
        "waybar"
      ];
    };
    extraSessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };
}
