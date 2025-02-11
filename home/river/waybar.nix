{ ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        modules-left = [ "river/tags" ];
        modules-center = [ "river/window" ];
        modules-right = [
          "tray"
          "clock"
          "battery"
        ];

        "river/tags" = {
          num-tags = 9;
        };

        "river/window" = {
          max-length = 50;
        };

        "tray" = {
          icon-size = 24;
          spacing = 8;
        };

        "clock" = {
          interval = 1;
          format = "{:%a %d %b %T}";
        };

        "battery" = {
          interval = 60;
          format-icons = [
            "󰂎"
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          format = "{icon} {capacity}%";
          format-charging = "{icon} {capacity}%";
        };
      };
    };
    style = builtins.readFile ./waybar.css;
  };
}
