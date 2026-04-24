{
  config,
  ...
}:
{
  programs.nixvim = {
    lsp = {
      inlayHints.enable = true;
      servers = {
        nixd.enable = true;
        rust_analyzer = {
          enable = true;
          packageFallback = true;
          config.settings.rust-analyzer.check.command = "clippy";
        };
        taplo.enable = true;
        basedpyright.enable = true;
        ruff.enable = true;
        clangd.enable = true;
      };
      keymaps = [
        {
          key = "<leader>rn";
          lspBufAction = "rename";
        }
        {
          key = "<leader>ca";
          lspBufAction = "code_action";
        }
        {
          key = "gd";
          action = config.lib.nixvim.mkRaw "require('telescope.builtin').lsp_definitions";
        }
        {
          key = "gr";
          action = config.lib.nixvim.mkRaw "require('telescope.builtin').lsp_references";
        }
      ];
    };
    plugins = {
      lspconfig.enable = true;
      cmp.settings.sources = [ { name = "nvim_lsp"; } ];
    };
  };
}
