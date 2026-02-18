{ pkgs, ... }:
{
  programs.nixvim.extraPackages = with pkgs; [
    (import (fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/pull/482787/head.tar.gz";
      sha256 = "19gi0ng2ax0x5g9a9f0bm1bwdm7w1i95k5abwapgy34wj8sk33fa";
    }) { system = pkgs.stdenv.hostPlatform.system; }).tree-sitter
    gcc
  ];
  programs.nixvim.plugins.lazy.plugins = [
    {
      pkg = pkgs.vimPlugins.nvim-treesitter.withAllGrammars;
      config = true;
    }
  ];
  programs.nixvim.autoCmd = [
    {
      callback.__raw = # lua
        "function() pcall(vim.treesitter.start) end";
      event = [
        "FileType"
      ];
    }
  ];
}
