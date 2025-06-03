{ pkgs, ... }:
{
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableZshIntegration = true;
    defaultCacheTtl = 3600;
    pinentry.package = pkgs.pinentry-gnome3;
  };
  services.flameshot = {
    enable = true;
    package = pkgs.flameshot.override { enableWlrSupport = true; };
  };
}
