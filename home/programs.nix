{
  lib,
  pkgs,
  secrets,
  ...
}:
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
      extensions =
        with pkgs.vscode-extensions;
        [
          pkief.material-icon-theme
          wakatime.vscode-wakatime
          bradlc.vscode-tailwindcss
          fill-labs.dependi
          james-yu.latex-workshop
          biomejs.biome
        ]
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "native-preview";
            publisher = "TypeScriptTeam";
            version = "0.20251022.1";
            sha256 = "sha256-X3j8kr+/7CjecQo8QmLREUJrXP49ZIP0C+BC2kbsld0=";
          }
        ];
      userSettings = {
        "workbench.iconTheme" = lib.mkForce "material-icon-theme";
        "workbench.colorTheme" = "Catppuccin Macchiato";
        "editor.fontFamily" = "ComicCodeLigatures Nerd Font";
        "editor.fontLigatures" = true;
        "editor.mouseWheelZoom" = true;
        "editor.formatOnSave" = true;
        "latex-workshop.formatting.latex" = "latexindent";
        "latex-workshop.latex.build.forceRecipeUsage" = false;
        "terminal.integrated.stickyScroll.enabled" = false;
        "typescript.experimental.useTsgo" = true;
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
      shell-integration-features = "ssh-terminfo";
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
