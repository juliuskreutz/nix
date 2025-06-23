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
  programs.chromium.enable = true;
  programs.bat.enable = true;
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        pkief.material-icon-theme
        esbenp.prettier-vscode
        wakatime.vscode-wakatime
        svelte.svelte-vscode
        bradlc.vscode-tailwindcss
        ritwickdey.liveserver
        fill-labs.dependi
        james-yu.latex-workshop
        asvetliakov.vscode-neovim
      ];
      userSettings = {
        "workbench.iconTheme" = "material-icon-theme";
        "workbench.colorTheme" = "Catppuccin Macchiato";
        "editor.fontFamily" = "ComicCodeLigatures Nerd Font";
        "editor.mouseWheelZoom" = true;
        "svelte.enable-ts-plugin" = true;
        "editor.formatOnSave" = true;
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
          "editor.defaultFormatter" = "svelte.svelte-vscode";
        };
        "latex-workshop.formatting.latex" = "latexindent";
        "latex-workshop.latex.build.forceRecipeUsage" = false;
        "extensions.experimental.affinity" = {
          "asvetliakov.vscode-neovim" = 1;
        };
        "prettier.tabWidth" = 4;
      };
    };
  };
  programs.ssh = {
    enable = true;
    matchBlocks = {
      kreutz-fun = {
        hostname = "5.252.227.206";
        user = "root";
      };
      stardb = {
        hostname = "94.103.188.220";
        user = "root";
      };
      uncover = {
        hostname = "213.232.235.104";
        user = "root";
      };
      clematis = {
        hostname = "157.173.212.148";
        user = "root";
      };
      guoba = {
        hostname = "95.179.225.104";
        user = "root";
      };
      loesch = {
        hostname = "94.16.117.113";
        user = "root";
      };
      volkan = {
        hostname = "202.61.196.85";
        user = "root";
      };
    };
  };
  programs.git = {
    enable = true;
    userEmail = "julius@kreutz.dev";
    userName = "Julius Kreutz";
    signing = {
      key = "EBE7 5BC0 5820 6BC9 F440  895F F7D6 E464 4ACD 05A4";
      signByDefault = true;
    };
    extraConfig.push.autoSetupRemote = true;
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
          rev = "v1.23.0";
          sha256 = "1q6pxa1lq21f9956v1684bgkfrkdfx4jy9n8gvffp0672agapcsd";
        };
      }
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "v1.2.0";
          sha256 = "1brljd9744wg8p9v3q39kdys33jb03d27pd0apbg1cz0a2r1wqqi";
        };
      }
    ];
    initContent =
      # bash
      ''
        bindkey -v '^?' backward-delete-char
        zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always --icons $realpath'
      '';
  };

  programs.ghostty = {
    enable = true;
    clearDefaultKeybinds = true;
    settings = {
      theme = "catppuccin-macchiato";
      font-family = "ComicCodeLigatures Nerd Font";
      font-size = 14;
      gtk-titlebar = false;
      background-opacity = 0.8;
      keybind = [
        "super+c=copy_to_clipboard"
        "super+v=paste_from_clipboard"
        "super+shift+up=increase_font_size:1"
        "super+shift+down=decrease_font_size:1"
        "ctrl+space>n=new_tab"
        "ctrl+space>ctrl+n=new_tab"
        "ctrl+space>l=next_tab"
        "ctrl+space>ctrl+l=next_tab"
        "ctrl+space>h=previous_tab"
        "ctrl+space>ctrl+h=previous_tab"
      ];
    };
  };
}
