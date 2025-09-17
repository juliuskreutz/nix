{ pkgs, ... }:
{
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = oil-nvim;
      dependencies = [ nvim-web-devicons ];
      opts.win_options = {
        signcolumn = "yes:2";
      };
    }
  ];
}
