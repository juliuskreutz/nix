{ ... }:
{
  programs.nixvim.plugins = {
    telescope = {
      enable = true;
      extensions.ui-select.enable = true;
      keymaps = {
        "<leader>sf" = {
          action = "find_files";
        };
        "<leader>sg" = {
          action = "live_grep";
        };
      };
      settings.defaults.mappings.i."<C-y>".__raw = "require('telescope.actions').select_default";
    };
  };
}
