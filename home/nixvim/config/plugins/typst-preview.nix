{ pkgs, ... }:
{
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = typst-preview-nvim;
      ft = "typst";
    }
  ];
}
