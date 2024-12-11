{ pkgs, ... }:
{
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = trouble-nvim;
      cmd = "Trouble";
      dependencies = [ nvim-web-devicons ];
      config = true;
    }
  ];
}
