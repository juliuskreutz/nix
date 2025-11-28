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
    element-desktop

    # Fonts
    inputs.comic-code-ligatures-nerd-font.packages.x86_64-linux.comic-code-ligatures-nerd-font
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji

    # LSP
    dockerfile-language-server
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
    git-crypt

    # Programming
    nodejs

    # Custom
    (callPackage ./zoho.nix { })
    (callPackage ./hayase.nix { })
  ];
}
