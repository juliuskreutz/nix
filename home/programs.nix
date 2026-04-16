{
  lib,
  pkgs,
  secrets,
  ...
}:
{
  programs.chromium.enable = true;
  programs.vesktop = {
    enable = true;
    vencord.settings = {
      plugins = {
        FakeNitro.enabled = true;
        SilentTyping = {
          enabled = true;
          showIcon = true;
        };
      };
    };
  };
  programs.element-desktop.enable = true;

  programs.bottom.enable = true;
  programs.jq.enable = true;
  programs.fastfetch.enable = true;
  programs.ripgrep.enable = true;
  programs.direnv.enable = true;
  programs.gpg.enable = true;
  programs.bat.enable = true;
  programs.gh = {
    enable = true;
    settings.git_protocol = "ssh";
  };
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
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        pkief.material-icon-theme
        wakatime.vscode-wakatime
        fill-labs.dependi
        biomejs.biome
        myriad-dreamin.tinymist
      ];
      userSettings = {
        "workbench.iconTheme" = lib.mkForce "material-icon-theme";
        "workbench.colorTheme" = "Catppuccin Macchiato";
        "editor.fontFamily" = "ComicCodeLigatures Nerd Font";
        "editor.fontLigatures" = true;
        "editor.mouseWheelZoom" = true;
        "editor.formatOnSave" = true;
        "terminal.integrated.stickyScroll.enabled" = false;
        "biome.suggestInstallingGlobally" = false;
      };
    };
  };
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = secrets.ssh.matchBlocks;
  };
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user = {
        email = "julius@kreutz.dev";
        name = "Julius Kreutz";
      };
      push.autoSetupRemote = true;
    };
    signing = {
      key = "EBE7 5BC0 5820 6BC9 F440  895F F7D6 E464 4ACD 05A4";
      signByDefault = true;
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
          rev = "v1.27.1";
          sha256 = "sha256-Fhk4nlVPS09oh0coLsBnjrKncQGE6cUEynzDO2Skiq8=";
        };
      }
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "v1.3.0";
          sha256 = "sha256-8atbysoOyCBW2OYKmdc91x9V/Mk3eyg3hvzvhJpQ32w=";
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
      shell-integration-features = "ssh-env";
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
