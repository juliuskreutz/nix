{ ... }:
{
  programs.nixvim.plugins.indent-blankline = {
    enable = true;
    settings = {
      scope = {
        show_start = false;
        show_end = false;
      };
    };
  };
}
