{ pkgs, ... }:
{
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = undotree;
      event = [
        "BufReadPre"
        "BufNewFile"
      ];
      config =
        # lua
        ''
          function()
            vim.opt.swapfile = false
            vim.opt.backup = false
            vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
            vim.opt.undofile = true

            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
          end
        '';
    }
  ];
}
