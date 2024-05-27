{
  config,
  lib,
  pkgs,
  nixvim,
  catppuccin,
  ...
}: {
  home.username = "julius";
  home.homeDirectory = "/home/julius";

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
    (nerdfonts.override {fonts = ["FiraCode"];})
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
    # plugins = [
    #   {
    #     name = "pure";
    #     src = pkgs.fetchFromGitHub {
    #       owner = "sindresorhus";
    #       repo = "pure";
    #       rev = "v1.23.0";
    #       sha256 = "1jcb5cg1539iy89vm9d59g8lnp3dm0yv88mmlhkp9zwx3bihwr06";
    #     };
    #   }
    # ];
  };
  programs.starship.enable = true;
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
  # programs.neovim = {
  #   enable = true;
  #   defaultEditor = true;
  # };
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
  };
  programs.kitty.enable = true;
  programs.chromium.enable = true;
  programs.browserpass.enable = true;

  gtk = {
    enable = true;
    cursorTheme.size = 32;
  };
}
