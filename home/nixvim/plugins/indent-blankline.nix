{ pkgs, ... }:
{
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = indent-blankline-nvim;
      main = "ibl";
      opts = {
        scope = {
          show_start = false;
          show_end = false;
        };
      };
    }
  ];
}
