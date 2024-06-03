{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
    ./nixvim
  ];

  home.pointerCursor = {
    name = "Catppuccin-Macchiato-Dark-Cursors";
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
  };

  catppuccin = {
    enable = true;
    flavor = "macchiato";
    accent = "peach";
  };

  home.packages = with pkgs; [
    st
    dmenu
    discord
    pass
    pavucontrol
    neofetch
    dconf
    ripgrep
    fd
    alejandra
    vimPlugins.nvim-treesitter.withAllGrammars
    update-nix-fetchgit
    krita
    xclip
    prettierd
    exercism
    (nerdfonts.override {fonts = ["FiraCode"];})
    (writeShellScriptBin "shot" ''
      #!/bin/sh

      ${pkgs.scrot}/bin/scrot -f -s ~/Media/screenshots/screen.png -e '${pkgs.xclip}/bin/xclip -selection clipboard -target image/png -i $f'
    '')
  ];

  fonts.fontconfig.enable = true;

  home.stateVersion = "23.11";

  services.gpg-agent = {
    enable = true;
    enableScDaemon = true;
    enableSshSupport = true;
    enableZshIntegration = true;
    defaultCacheTtl = 3600;
    pinentryPackage = pkgs.pinentry-gnome3;
  };
  services.picom = {
    enable = true;
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userEmail = "julius@kreutz.dev";
    userName = "Julius Kreutz";
    signing = {
      key = null;
      signByDefault = true;
    };
    extraConfig = {
      push = {
        autoSetupRemote = true;
      };
    };
  };

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    history = {
      ignoreAllDups = true;
    };
    shellAliases = {
      ".." = "cd ..";
      "cat" = "bat";
    };
    plugins = [
      {
        name = "pure";
        src = pkgs.fetchFromGitHub {
          owner = "sindresorhus";
          repo = "pure";
          rev = "da1a722238febb9a4b97c77628fae753d1817490";
          sha256 = "0iq19nf382qq0bxidw7z6nqmhwsjy7yjjnk6ankbjdk4cp0gkmhx";
        };
      }
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "c7fb028ec0bbc1056c51508602dbd61b0f475ac3";
          sha256 = "061jjpgghn8d5q2m2cd2qdjwbz38qrcarldj16xvxbid4c137zs2";
        };
      }
    ];
    initExtra =
      # bash
      ''
        bindkey -v '^?' backward-delete-char
        zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always --icons $realpath'
      '';
  };

  programs.direnv.enable = true;

  programs.fzf = {
    enable = true;
    defaultCommand = "fd --type f --color=always";
    defaultOptions = ["--height 40%" "--reverse" "--ansi"];
  };
  programs.eza = {
    enable = true;
    git = true;
    icons = true;
  };
  programs.fd = {
    enable = true;
    hidden = true;
    extraOptions = ["--no-ignore"];
  };
  programs.gpg.enable = true;
  programs.kitty = {
    enable = true;
    settings = {
      tab_bar_style = "powerline";
      clear_all_shortcuts = true;
      enable_audio_bell = false;
      background_opacity = "0.8";
      font_family = "FiraCode Nerd Font";
      font_size = 14;
    };
    keybindings = {
      "command+c" = "copy_to_buffer clipboard";
      "command+v" = "paste_from_buffer clipboard";
      "command+shift+up" = "change_font_size all +1";
      "command+shift+down" = "change_font_size all -1";
      "ctrl+space>ctrl+space" = "new_tab_with_cwd";
      "ctrl+space>n" = "next_tab";
      "ctrl+space>ctrl+n" = "next_tab";
      "ctrl+space>p" = "previous_tab";
      "ctrl+space>ctrl+p" = "previous_tab";
    };
  };
  programs.chromium.enable = true;
  programs.browserpass.enable = true;
  programs.bat.enable = true;

  gtk = {
    enable = true;
    catppuccin.cursor.enable = false;
  };
}
