{ pkgs, ... }:
let
  parserInstallDir = "$XDG_DATA_HOME/nvim/treesitter";
in
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      gcc
      vimPlugins.nvim-treesitter.withAllGrammars
    ];
  };
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = nvim-treesitter.withAllGrammars;
      event = "VeryLazy";
      opts = {
        ensure_installed = "all";
        parser_install_dir = parserInstallDir;
        highlight = {
          enable = true;
          additional_vim_regex_highlighting = false;
        };
      };
      config =
        # lua
        ''
          function(_, opts)
            vim.opt.runtimepath:prepend("${parserInstallDir}")
            require("nvim-treesitter.configs").setup(opts)
          end
        '';
    }
  ];
}
