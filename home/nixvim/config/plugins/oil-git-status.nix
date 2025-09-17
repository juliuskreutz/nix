{ pkgs, ... }:
{
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = oil-git-status-nvim;
      dependencies = [ oil-nvim ];
      config = true;
    }
  ];
}
