{ ... }:
{
  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings.sources = [ { name = "path"; } ];
      settings = {
        snippet.expand = # lua
          "function(args) require('luasnip').lsp_expand(args.body) end";
        mapping = {
          __raw = ''
            cmp.mapping.preset.insert({
              ['<C-b>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-l>'] = cmp.mapping(
                function()
                  if require('luasnip').expand_or_locally_jumpable() then
                    require('luasnip').expand_or_jump()
                  end
                end, { 'i', 's' }
              ),
              ['<C-h>'] = cmp.mapping(
                function()
                  if require('luasnip').locally_jumpable(-1) then
                    require('luasnip').jump(-1)
                  end
                end, { 'i', 's' }
              ),
            })
          '';
        };
      };
    };
    luasnip.enable = true;
  };
}
