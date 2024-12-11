{ pkgs, ... }:
{
  programs.direnv.enable = true;
  programs.fzf = {
    enable = true;
    defaultCommand = "${pkgs.fd}/bin/fd --type f --color=always";
    defaultOptions = [
      "--height 40%"
      "--reverse"
      "--ansi"
    ];
  };
  programs.eza = {
    enable = true;
    git = true;
    icons = "auto";
  };
  programs.fd = {
    enable = true;
    hidden = true;
    extraOptions = [ "--no-ignore" ];
  };
  programs.gpg = {
    enable = true;
    scdaemonSettings.disable-ccid = true;
  };
  programs.kitty = {
    enable = true;
    settings = {
      tab_bar_style = "powerline";
      clear_all_shortcuts = true;
      enable_audio_bell = false;
      background_opacity = "0.8";
      font_family = "ComicCodeLigatures Nerd Font";
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
  programs.chromium = {
    enable = true;
    commandLineArgs = [
      "--enable-features=WaylandWindowDecorations"
      "--ozone-platform-hint=auto"
    ];
  };
  programs.browserpass.enable = true;
  programs.bat.enable = true;
  programs.vscode = {
    enable = true;
    extensions =
      with pkgs.vscode-extensions;
      [
        catppuccin.catppuccin-vsc
        pkief.material-icon-theme
        esbenp.prettier-vscode
        wakatime.vscode-wakatime
        svelte.svelte-vscode
        bradlc.vscode-tailwindcss
        ritwickdey.liveserver
        rust-lang.rust-analyzer
        fill-labs.dependi
        tamasfe.even-better-toml
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "argus";
          publisher = "gavinleroy";
          version = "0.1.13";
          sha256 = "MmGSNMfCtbQzR31Ji9kXHxe8ZUV97zZ0zbyJAcjOxuc=";
        }
        {
          name = "vs-code-extension";
          publisher = "inlang";
          version = "1.48.3";
          sha256 = "4/Jday2YcP5yVq5OE4xZXY5Go8/oyTPhJphS423pEUA=";
        }
      ];
    userSettings = {
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.colorTheme" = "Catppuccin Macchiato";
      "editor.fontFamily" = "ComicCodeLigatures Nerd Font";
      "editor.mouseWheelZoom" = true;
      "rust-analyzer.check.command" = "clippy";
      "svelte.enable-ts-plugin" = true;
      "editor.formatOnSave" = true;
      "sherlock.userId" = "cc054ca2-0d34-4562-b3d3-b738b514b241";
      "[json]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[html]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[css]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[javascript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[typescript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[svelte]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
    };
  };
  programs.ssh = {
    enable = true;
    matchBlocks = {
      stardb = {
        hostname = "94.103.188.220";
        user = "root";
      };
      guoba = {
        hostname = "95.179.225.104";
        user = "root";
      };
    };
  };
  programs.thunderbird = {
    enable = true;
    profiles = {
      main = {
        isDefault = true;
      };
    };
  };
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
    history.ignoreAllDups = true;
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
          rev = "92b8e9057988566b37ff695e70e2e9bbeb7196c8";
          sha256 = "1q6pxa1lq21f9956v1684bgkfrkdfx4jy9n8gvffp0672agapcsd";
        };
      }
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "b6e1b22458a131f835c6fe65bdb88eb45093d2d2";
          sha256 = "04mj0kfjai8yzgh0z7s7jqdckap7c1n9mssa9gpx7b5mlfjz63p0";
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
}
