{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins
    ./keymap.nix
    ./options.nix
  ];

  programs.nixvim = {

    enable = true;
    viAlias = true;
    vimAlias = true;
  };
}
