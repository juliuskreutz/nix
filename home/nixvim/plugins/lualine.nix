{ pkgs, ... }:
{
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = lualine-nvim;
      dependencies = [ nvim-web-devicons ];
      config = true;
    }
  ];
}
