{pkgs, ...}: {
  programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
    {
      pkg = pkgs.vimUtils.buildVimPlugin {
        name = "oil-git-status.nvim";
        src = pkgs.fetchFromGitHub {
          owner = "refractalize";
          repo = "oil-git-status.nvim";
          rev = "a7ea816bac0cc3b8b4c3605e2f2b87960be60a05";
          sha256 = "sha256-IXjpuzWipF7Pjp4N92ZuNKktYNe5oTYzyCykqkmNRkg=";
        };
      };
      dependencies = [oil-nvim];
      config = true;
    }
  ];
}
