{ pkgs, ... }:
{
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = nvim-autopairs;
      event = "InsertEnter";
      dependencies = [ nvim-cmp ];
      config =
        # lua
        ''
          function()
            local autopairs = require("nvim-autopairs")
            autopairs.setup()

            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local cmp = require("cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
          end
        '';
    }
  ];
}
