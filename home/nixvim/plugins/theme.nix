{ pkgs, ... }:
{
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = catppuccin-nvim;
      lazy = false;
      priority = 1000;
      opts = {
        flavour = "macchiato";
      };
      config =
        # lua
        ''
          function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin")
          end
        '';
    }
  ];
}
