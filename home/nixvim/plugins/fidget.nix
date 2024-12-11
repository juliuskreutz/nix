{ pkgs, ... }:
{
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = fidget-nvim;
      event = "LspAttach";
      config = true;
    }
  ];
}
