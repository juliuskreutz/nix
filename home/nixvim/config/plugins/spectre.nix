{ pkgs, ... }:
{
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = nvim-spectre;
      cmd = "Spectre";
      dependencies = [ plenary-nvim ];
      config = true;
    }
  ];
}
