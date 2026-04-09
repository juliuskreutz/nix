{ ... }:
{
  programs.nixvim.plugins.gitsigns = {
    enable = true;
    settings.on_attach = # lua
      "vim.keymap.set('n', '<leader>g', require('gitsigns').preview_hunk_inline)";
  };
}
