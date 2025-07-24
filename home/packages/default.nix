{
  pkgs,
  inputs,
  ...
}:
let
  pkg-pr419026 = import inputs.nixpkgs-pr419026 {
    system = pkgs.system;
    config = {
      allowUnfree = true;
    };
  };
  pkg-pr426285 = import inputs.nixpkgs-pr426285 {
    system = pkgs.system;
  };
in
{
  home.packages = with pkgs; [
    # Programs
    (pkg-pr419026.jetbrains.idea-ultimate.override {
      jdk = pkg-pr426285.jetbrains.jdk;
    })
    # (
    #   (jetbrains.idea-ultimate.override {
    #     inherit jdk;
    #   }).overrideAttrs
    #   (o: {
    #     patches = [
    #       (pkgs.fetchpatch {
    #         url = "https://patch-diff.githubusercontent.com/raw/NixOS/nixpkgs/pull/419026.patch";
    #         hash = "sha256-3lu4/2E7GICoMR+VdiSYdWuQX3ngt12E3ZtSdupfsWc=";
    #       })
    #     ];
    #   })
    # )
    krita
    libreoffice-qt
    obs-studio
    openvpn
    pavucontrol
    proton-pass
    protonvpn-gui
    veracrypt
    vesktop
    xournalpp
    signal-desktop

    # Fonts
    inputs.comic-code-ligatures-nerd-font.packages.x86_64-linux.comic-code-ligatures-nerd-font
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji

    # LSP
    dockerfile-language-server-nodejs
    jq
    nixd
    nixfmt-rfc-style
    prettierd
    yaml-language-server

    # Util
    brightnessctl
    bottom
    devenv
    fd
    feh
    ffmpeg
    gh
    neofetch
    ntfs3g
    ripgrep
    tokei
    unrar
    unzip
    wakatime-cli
    wget
    wl-clipboard
    xclip
    xdg-utils
    zip

    # Programming
    nodejs

    # Custom
    (callPackage ./zoho.nix { })
    (callPackage ./hayase.nix { })
  ];
}
