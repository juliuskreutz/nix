{ pkgs, ... }:
{
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = git-blame-nvim;
      event = "VeryLazy";
      opts = {
        enabled = false;
      };
    }
  ];
}
