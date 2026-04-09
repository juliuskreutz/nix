{
  pkgs,
  inputs,
  ...
}:
{
  home.packages = with pkgs; [
    # Programs
    jetbrains.idea
    krita
    libreoffice-qt
    pavucontrol
    proton-pass
    proton-vpn
    veracrypt
    vesktop
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
    jq
    nixfmt

    # Util
    brightnessctl
    bottom
    devenv
    fd
    feh
    ffmpeg
    gh
    fastfetch
    ripgrep
    tokei
    unrar
    unzip
    wakatime-cli
    wget
    wl-clipboard
    xdg-utils
    zip
    git-crypt

    # Custom
    (callPackage ./hayase.nix { forceX11 = true; })
  ];
}
