{pkgs, ...}: {
  imports = [
    ./waybar.nix
  ];

  xdg.portal = {
    enable = true;
    configPackages = [pkgs.gnome-session];
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  programs.fuzzel.enable = true;
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      terminal = "${pkgs.kitty}/bin/kitty";
      menu = "${pkgs.fuzzel}/bin/fuzzel";
      keybindings = {
        "${modifier}+Shift+q" = "exit";
        "${modifier}+Shift+c" = "kill";
        "${modifier}+f" = "fullscreen";
        "${modifier}+space" = "floating toggle";
        "${modifier}+Shift+Return" = "exec ${terminal}";
        "${modifier}+p" = "exec ${menu}";
        "${modifier}+e" = "exec ${pkgs.chromium}/bin/chromium";
        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";
        "${modifier}+Shift+1" = "move container to workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5";
        "${modifier}+Shift+6" = "move container to workspace number 6";
        "${modifier}+Shift+7" = "move container to workspace number 7";
        "${modifier}+Shift+8" = "move container to workspace number 8";
        "${modifier}+Shift+9" = "move container to workspace number 9";
      };
      gaps.inner = 10;
      window.titlebar = false;
      output = {
        eDP-1 = {
          bg = "${./wallpaper.png} fill";
        };
      };
      colors = {
        focused = {
          border = "$lavender";
          background = "$base";
          text = "$text";
          indicator = "$rosewater";
          childBorder = "$lavender";
        };
        focusedInactive = {
          border = "$overlay0";
          background = "$base";
          text = "$text";
          indicator = "$rosewater";
          childBorder = "$overlay0";
        };
        unfocused = {
          border = "$overlay0";
          background = "$base";
          text = "$text";
          indicator = "$rosewater";
          childBorder = "$overlay0";
        };
        urgent = {
          border = "$peach";
          background = "$base";
          text = "$peach";
          indicator = "$overlay0";
          childBorder = "$peach";
        };
        placeholder = {
          border = "$overlay0";
          background = "$base";
          text = "$text";
          indicator = "$overlay0";
          childBorder = "$overlay0";
        };
        background = "$base";
      };
      bars = [
        {
          command = "${pkgs.waybar}/bin/waybar";
        }
      ];
      input = {
        "*" = {
          xkb_layout = "de";
          repeat_delay = "300";
          repeat_rate = "30";
        };
      };
    };
    extraConfigEarly =
      #bash
      ''
        exec_always ${pkgs.autotiling}/bin/autotiling
      '';
    extraOptions = ["--unsupported-gpu"];
  };

  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
