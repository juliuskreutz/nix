{ pkgs, ... }:
{
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = gitsigns-nvim;
      event = "VeryLazy";
      config =
        #lua
        ''
          function()
            local gs = require("gitsigns")
            gs.setup()
            vim.keymap.set("n", "<leader>g", gs.preview_hunk_inline)
          end
        '';
    }
  ];
}
