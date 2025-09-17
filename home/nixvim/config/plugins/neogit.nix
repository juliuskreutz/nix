{ pkgs, ... }:
{
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = neogit;
      dependencies = [
        plenary-nvim
        diffview-nvim
        telescope-nvim
      ];
      config = true;
    }
  ];
}
