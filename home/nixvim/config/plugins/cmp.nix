{ pkgs, ... }:
{
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = nvim-cmp;
      event = "InsertEnter";
      dependencies = [
        cmp-path
        luasnip
      ];
      config =
        # lua
        ''
          function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
              snippet = {
                expand = function(args)
                  luasnip.lsp_expand(args.body)
                end,
              },
              mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-l>"] = cmp.mapping(
                  function()
                    if luasnip.expand_or_locally_jumpable() then
                      luasnip.expand_or_jump()
                    end
                  end, { "i", "s" }
                ),
                ["<C-h>"] = cmp.mapping(
                  function()
                    if luasnip.locally_jumpable(-1) then
                      luasnip.jump(-1)
                    end
                  end, { "i", "s" }
                ),
              }),
              sources = cmp.config.sources({
                { name = "path" },
              }),
            })
          end
        '';
    }
  ];
}
