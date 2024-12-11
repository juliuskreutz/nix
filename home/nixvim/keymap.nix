{
  programs.nixvim = {
    globals.mapleader = " ";

    keymaps = [
      {
        mode = "v";
        key = "J";
        action = ":m '>+1<CR>gv=gv";
      }
      {
        mode = "v";
        key = "K";
        action = ":m '<-2<CR>gv=gv";
      }
      {
        mode = "x";
        key = "<leader>p";
        action = "\"_dP";
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>d";
        action = "\"_d";
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>y";
        action = "\"+y";
      }
      {
        mode = "n";
        key = "<leader>e";
        action.__raw =
          # lua
          "vim.diagnostic.open_float";
      }
    ];
  };
}
