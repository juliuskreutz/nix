{
  imports = [
    ./abolish.nix
    ./autopairs.nix
    ./cmp.nix
    ./conform.nix
    ./crates.nix
    ./fidget.nix
    ./gitsigns.nix
    ./indent-blankline.nix
    ./lspconfig.nix
    ./lualine.nix
    ./markdown-preview.nix
    ./neogit.nix
    ./oil.nix
    ./sleuth.nix
    ./spectre.nix
    ./telescope.nix
    ./theme.nix
    ./todo-comments.nix
    ./treesitter.nix
    ./trouble.nix
    ./undotree.nix
    ./wakatime.nix
  ];

  programs.nixvim.plugins.lazy.enable = true;
}
