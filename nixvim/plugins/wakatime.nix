{pkgs, ...}: {
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = vim-wakatime;
      event = "VeryLazy";
    }
  ];
}
