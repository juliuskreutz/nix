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
    miru
    obs-studio
    openvpn
    pavucontrol
    pcmanfm
    proton-pass
    protonvpn-gui
    veracrypt
    vesktop
    xournalpp

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
    rustup

    # Custom
    (writeShellScriptBin "shot" ''
      FILE="$HOME/Screenshots/screenshot_$(($(ls "$HOME/Screenshots" | grep -oP 'screenshot_\K[0-9]+' | sort -n | tail -1) + 1)).png" && ${grim}/bin/grim -g "$(${slurp}/bin/slurp)" "$FILE" && ${wl-clipboard}/bin/wl-copy < "$FILE"
    '')
    (callPackage ./zoho.nix { })
  ];
}
