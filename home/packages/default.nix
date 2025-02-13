{
  pkgs,
  inputs,
  ...
}:
{
  home.packages = with pkgs; [
    inputs.comic-code-ligatures-nerd-font.packages.x86_64-linux.comic-code-ligatures-nerd-font
    vesktop
    xdg-utils
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    zip
    unzip
    protonvpn-gui
    pavucontrol
    neofetch
    ripgrep
    fd
    nixfmt-rfc-style
    nixd
    nil
    vimPlugins.nvim-treesitter.withAllGrammars
    update-nix-fetchgit
    krita
    xclip
    prettierd
    nodejs
    rustup
    bottom
    ffmpeg
    ntfs3g
    unrar
    jq
    tokei
    libreoffice-qt
    wakatime-cli
    obs-studio
    miru
    dockerfile-language-server-nodejs
    wl-clipboard
    wget
    xournalpp
    (writeShellScriptBin "shot" ''
      # ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" ~/Media/screenshots/screenshot.png
      # ${grim}/bin/grim -g "$(${slurp}/bin/slurp)" "$HOME/Media/screenshots/screenshot_$(($(ls "$HOME/Media/screenshots" | grep -oP 'screenshot_\K[0-9]+' | sort -n | tail -1 || echo 0) + 1)).png"
      FILE="$HOME/Screenshots/screenshot_$(($(ls "$HOME/Screenshots" | grep -oP 'screenshot_\K[0-9]+' | sort -n | tail -1) + 1)).png" && ${grim}/bin/grim -g "$(${slurp}/bin/slurp)" "$FILE" && ${wl-clipboard}/bin/wl-copy < "$FILE"
    '')
    feh
    veracrypt
    gh
    scrcpy
    pcmanfm
    unityhub
    (callPackage ./zoho.nix { })
    (callPackage ./proton-pass.nix { })
  ];
}
