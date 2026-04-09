{ ... }:
{
  programs.nixvim.plugins = {
    oil-git-status.enable = true;
    oil.settings.win_options.signcolumn = "yes:2";
  };
}
