{ pkgs, ... }:
{
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = vim-abolish;
      cmd = "S";
    }
  ];
}
