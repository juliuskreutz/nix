{ ... }:
{
  programs.nixvim = {
    plugins.undotree.enable = true;
    keymaps = [
      {
        mode = "n";
        key = "<leader>u";
        action.__raw = "vim.cmd.UndotreeToggle";
      }
    ];
  };
}
