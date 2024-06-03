{
  imports = [
    ./autopairs.nix
    ./cmp.nix
    ./conform.nix
    # ./copilot.nix
    ./crates.nix
    ./fidget.nix
    ./lspconfig.nix
    ./lualine.nix
    ./oil.nix
    ./sleuth.nix
    ./telescope.nix
    ./theme.nix
    ./todo-comments.nix
    ./treesitter.nix
    ./trouble.nix
    ./undotree.nix
  ];

  programs.nixvim.plugins.lazy.enable = true;
}
