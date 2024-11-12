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
  home.stateVersion = "24.05";

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
      flavor = "gmail.com";
      mbsync = {
        enable = true;
        create = "maildir";
      };
      thunderbird = {
        enable = true;
        settings = id: {
          "mail.smtpserver.smtp_${id}.authMethod" = 10;
          "mail.server.server_${id}.authMethod" = 10;
        };
      };
      primary = true;
      realName = "Julius Kreutz";
      userName = "julius@kreu.tz";
    };
    personal = {
      address = "julius@kreutz.au";
      imap = {
        host = "ventraip.email";
        port = 993;
      };
      mbsync = {
        enable = true;
        create = "maildir";
      };
      thunderbird.enable = true;
      realName = "Julius Kreutz";
      smtp = {
        host = "ventraip.email";
        port = 465;
      };
      userName = "julius@kreutz.au";
    };
    dev = {
      address = "julius@kreutz.dev";
      imap = {
        host = "mail.hosting.de";
        port = 993;
      };
      mbsync = {
        enable = true;
        create = "maildir";
      };
      thunderbird.enable = true;
      realName = "Julius Kreutz";
      smtp = {
        host = "mail.hosting.de";
        port = 465;
      };
      userName = "julius@kreutz.dev";
    };
    gmail = {
      address = "juliuskreutz.jk@gmail.com";
      flavor = "gmail.com";
      mbsync = {
        enable = true;
        create = "maildir";
      };
      thunderbird = {
        enable = true;
        settings = id: {
          "mail.smtpserver.smtp_${id}.authMethod" = 10;
          "mail.server.server_${id}.authMethod" = 10;
        };
      };
      realName = "Julius Kreutz";
      userName = "juliuskreutz.jk@gmail.com";
    };
  };
}
