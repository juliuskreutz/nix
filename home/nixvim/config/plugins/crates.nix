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
      };
    }
  ];
}
