{
  pkgs,
  config,
  ...
}:
{
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = nvim-lspconfig;
      dependencies = [
        nvim-cmp
        cmp-nvim-lsp
        telescope-nvim
      ];
      opts = {
        servers = {
          nixd = config.lib.nixvim.emptyTable;
          rust_analyzer = {
            settings = {
              rust-analyzer = {
                check.command = "clippy";
              };
            };
          };
          gleam = config.lib.nixvim.emptyTable;
          gopls = config.lib.nixvim.emptyTable;
          taplo = config.lib.nixvim.emptyTable;
          yamlls = {
            settings = {
              yaml = {
                format = {
                  enable = true;
                };
                schemas = {
                  "https://json.schemastore.org/github-workflow.json" = "/.github/workflows/*";
                };
                schemaStore = {
                  enable = true;
                };
              };
            };
          };
          basedpyright = config.lib.nixvim.emptyTable;
          ruff = config.lib.nixvim.emptyTable;
          zls = config.lib.nixvim.emptyTable;
          clangd = config.lib.nixvim.emptyTable;
          hls = config.lib.nixvim.emptyTable;
        };
      };
      config =
        # lua
        ''
          function(_, opts)
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local on_attach = function(client, bufnr)
          	  local opts = { buffer = bufnr }

          	  local telescope = require("telescope.builtin")
          	  vim.keymap.set("n", "gd", telescope.lsp_definitions, opts)
          	  vim.keymap.set("n", "gr", telescope.lsp_references, opts)

          	  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          	  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

          	  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

          	  if client.server_capabilities.inlayHintProvider then
          		vim.lsp.inlay_hint.enable(true)
          	  end
            end

            for name, config in pairs(opts.servers) do
                config.capabilities = capabilities
                config.on_attach = on_attach

                vim.lsp.config(name, config)
                vim.lsp.enable(name)
            end

            local cmp = require("cmp")
            local config = cmp.get_config()
            table.insert(config.sources, { name = "nvim_lsp" })
            cmp.setup(config)
          end
        '';
    }
  ];
}
