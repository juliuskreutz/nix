{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./config
  ];

  programs.nixvim = {
    defaultEditor = true;
    enable = true;
  };
}
