{ ... }:
{
  programs.nixvim.plugins.crates = {
    enable = true;
    settings = {
      lsp = {
        enabled = true;
        on_attach.__raw = ''
          function()
            vim.keymap.set('n', '<leader>cu', require('crates').update_all_crates)
          end
        '';
        actions = true;
        completion = true;
        hover = true;
      };
    };
  };
}
