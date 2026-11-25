{
  pkgs,
  inputs,
  ...
}:
{
  home.packages = with pkgs; [
    nixfmt

    # Programs
    jetbrains.idea
    krita
    onlyoffice-desktopeditors
    pavucontrol
    proton-pass
    proton-vpn
    veracrypt
    signal-desktop
    zoho-mail-desktop
    eduvpn-client
    localsend

    # Fonts
    inputs.comic-code-ligatures-nerd-font.packages.x86_64-linux.comic-code-ligatures-nerd-font
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji

    # Util
    devenv
    ffmpeg
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
