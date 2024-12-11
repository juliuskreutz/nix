{ pkgs, ... }:
{
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = crates-nvim;
      event = "BufRead Cargo.toml";
      dependencies = [
        plenary-nvim
        nvim-cmp
      ];
      opts = {
        lsp = {
          enabled = true;
          on_attach.__raw =
            # lua
            ''
              function()
                vim.keymap.set("n", "<leader>cu", require("crates").update_all_crates)
              end
            '';
          actions = true;
          completion = true;
          hover = true;
        };
        completion = {
          cmp = {
            enabled = true;
          };
        };
      };
      config =
        # lua
        ''
          function(_, opts)
            require("crates").setup(opts)

            local cmp = require("cmp")
            local config = cmp.get_config()
            table.insert(config.sources, { name = "crates" })
            cmp.setup(config)
          end
        '';
    }
  ];
}
