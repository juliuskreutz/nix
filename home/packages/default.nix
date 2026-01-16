{
  pkgs,
  inputs,
  laptop,
  ...
}:
{
  home.packages = with pkgs; [
    # Programs
    jetbrains.idea
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
    element-desktop
    zoho-mail-desktop
    eduvpn-client

    # Fonts
    inputs.comic-code-ligatures-nerd-font.packages.x86_64-linux.comic-code-ligatures-nerd-font
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji

    # LSP
    dockerfile-language-server
    jq
    nixd
    nixfmt
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
    git-crypt

    # Programming
    nodejs

    # Custom
    (callPackage ./hayase.nix { forceX11 = laptop; })
  ];
}
