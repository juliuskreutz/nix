{ pkgs, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      gcc
      tree-sitter
    ];
    autoCmd = [
      {
        command = ":lua pcall(vim.treesitter.start)";
        event = [ "BufRead" ];
      }
    ];
  };
  programs.nixvim.plugins = {
    lazy.plugins = with pkgs.vimPlugins; [
      {
        pkg = nvim-treesitter.withAllGrammars;
        # config = true;
      }
    ];
  };
}
