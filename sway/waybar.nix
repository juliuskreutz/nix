{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        modules-left = ["sway/workspaces"];
        modules-center = ["sway/window"];
        modules-right = ["clock"];

        "sway/workspaces" = {
          disable-click = true;
          disable-scroll = true;
          all-outputs = true;
          format = " {name} ";
        };

        "clock" = {
          interval = 1;
          format = "{:%a %d %b %T}";
          max-length = 25;
        };
      };
    };
    style = builtins.readFile ./waybar.css;
  };
}
