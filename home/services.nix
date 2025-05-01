{ pkgs, ... }:
{
  services.gpg-agent = {
    enable = true;
    enableScDaemon = true;
    enableSshSupport = true;
    enableZshIntegration = true;
    defaultCacheTtl = 3600;
    pinentry.package = pkgs.pinentry-gnome3;
  };
}
