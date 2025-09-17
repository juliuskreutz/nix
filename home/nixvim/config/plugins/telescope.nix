{ pkgs, ... }:
{
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = telescope-nvim;
      event = "VimEnter";
      dependencies = [
        plenary-nvim
        telescope-ui-select-nvim
      ];
      config =
        # lua
        ''
          function()
            local telescope = require("telescope")
              local actions = require("telescope.actions")

              telescope.setup({
                defaults = {
                  mappings = {
                    i = {
                      ["<C-y>"] = actions.select_default,
                    },
                    n = {
                      ["<C-y>"] = actions.select_default,
                    },
                  },
                },
                extensions = {
                  ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                  },
                },
              })
              telescope.load_extension("ui-select")

              local builtin = require("telescope.builtin")
              vim.keymap.set("n", "<leader>sh", builtin.help_tags)
              vim.keymap.set("n", "<leader>sk", builtin.keymaps)
              vim.keymap.set("n", "<leader>sf", builtin.find_files)
              vim.keymap.set("n", "<leader>ss", builtin.builtin)
              vim.keymap.set("n", "<leader>sw", builtin.grep_string)
              vim.keymap.set("n", "<leader>sg", builtin.live_grep)
              vim.keymap.set("n", "<leader>sd", builtin.diagnostics)
              vim.keymap.set("n", "<leader><leader>", builtin.buffers)
          end
        '';
    }
  ];
}
