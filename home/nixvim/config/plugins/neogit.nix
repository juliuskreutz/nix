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
      cmd = "Neogit";
      config = true;
    }
  ];
}
