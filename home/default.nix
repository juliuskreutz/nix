{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./nixvim
    ./river
    ./packages.nix
    ./programs.nix
    ./services.nix
    inputs.catppuccin.homeManagerModules.catppuccin
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";

  catppuccin = {
    enable = true;
    flavor = "macchiato";
    accent = "peach";
    pointerCursor.enable = false;
  };

  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-macchiato-blue-compact";
      package =
        pkgs.catppuccin-gtk.override
        {
          accents = ["blue"];
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

  accounts.email.accounts = {
    main = {
      address = "julius@kreu.tz";
      imap = {
        host = "imappro.zoho.eu";
        port = 993;
      };
      smtp = {
        host = "smtppro.zoho.eu";
        port = 465;
      };
      mbsync = {
        enable = true;
        create = "maildir";
      };
      thunderbird = {
        enable = true;
      };
      primary = true;
      realName = "Julius Kreutz";
      userName = "julius@kreu.tz";
    };
    dev = {
      address = "julius@kreutz.dev";
      imap = {
        host = "imappro.zoho.eu";
        port = 993;
      };
      smtp = {
        host = "smtppro.zoho.eu";
        port = 465;
      };
      mbsync = {
        enable = true;
        create = "maildir";
      };
      thunderbird.enable = true;
      realName = "Julius Kreutz";
      userName = "julius@kreutz.dev";
    };
  };
}
