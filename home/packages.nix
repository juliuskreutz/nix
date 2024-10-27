{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    inputs.comic-code-ligatures-nerd-font.packages.x86_64-linux.comic-code-ligatures-nerd-font
    vesktop
    xdg-utils
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    zip
    unzip
    pass
    pavucontrol
    neofetch
    ripgrep
    fd
    alejandra
    nil
    vimPlugins.nvim-treesitter.withAllGrammars
    update-nix-fetchgit
    krita
    xclip
    prettierd
    exercism
    yubioath-flutter
    rustup
    bottom
    lsof
    ffmpeg
    ntfs3g
    unrar
    gparted
    jq
    tokei
    libreoffice-qt
    wakatime-cli
    obs-studio
    (miru.overrideAttrs (finalAttrs: previousAttrs: {
      buildCommand = builtins.replaceStrings ["Exec=miru"] ["Exec=miru --in-process-gpu"] previousAttrs.buildCommand;
    }))
    dockerfile-language-server-nodejs
    wl-clipboard
    wget
    xournalpp
    (pkgs.writeShellScriptBin
      "shot"
      ''
        ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" - | ${pkgs.wl-clipboard}/bin/wl-copy
      '')
  ];
}
