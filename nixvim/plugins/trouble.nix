{pkgs, ...}: {
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = trouble-nvim;
      dependencies = [nvim-web-devicons];
    }
  ];
}
