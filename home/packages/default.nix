{
  pkgs,
  inputs,
  ...
}:
{
  home.packages = with pkgs; [
    # Programs
    jetbrains.idea-ultimate
    krita
    libreoffice-qt
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
