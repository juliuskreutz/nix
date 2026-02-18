{ ... }:
{
  programs.nix-ld.enable = true;
  programs.zsh.enable = true;
  # Important for gtk
  programs.dconf.enable = true;
}
