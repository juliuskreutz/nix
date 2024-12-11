{ pkgs, ... }:
{
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = todo-comments-nvim;
      event = "VimEnter";
      dependencies = [ plenary-nvim ];
      config = true;
    }
  ];
}
