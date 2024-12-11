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
          nil_ls = config.lib.nixvim.emptyTable;
          rust_analyzer = {
            settings = {
              rust-analyzer = {
                checkOnSave = {
                  command = "clippy";
                };
              };
            };
          };
          gleam = config.lib.nixvim.emptyTable;
          gopls = config.lib.nixvim.emptyTable;
          taplo = config.lib.nixvim.emptyTable;
          pyright = config.lib.nixvim.emptyTable;
          ruff = config.lib.nixvim.emptyTable;
          zls = config.lib.nixvim.emptyTable;
          bottom = config.lib.nixvim.emptyTable;
          dockerls = config.lib.nixvim.emptyTable;
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

            local lspconfig = require("lspconfig")
            local configs = require("lspconfig.configs")

            configs.bottom = {
                default_config = {
                    cmd = {"/home/julius/Projects/rust/bottom/target/release/bottom", "lsp"},
                    root_dir = lspconfig.util.root_pattern(".git"),
                    filetypes = {"bottom"},
                },
            }

            for name, server in pairs(opts.servers) do
                if (name == "rust_analyzer")
                then
                  -- server.capabilities = vim.lsp.protocol.make_client_capabilities()
                  server.capabilities = require("cmp_nvim_lsp").default_capabilities({
                    resolveSupport = {
                      properties = {
                        "documentation",
                        "detail",
                        "additionalTextEdits",
                        "sortText",
                        "filterText",
                        "insertText",
                        "insertTextFormat",
                        "insertTextMode"
                      }
                    }
                  })
                else
                  server.capabilities = capabilities
                end

                server.on_attach = on_attach
                lspconfig[name].setup(server)
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
