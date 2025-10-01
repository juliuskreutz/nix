{ pkgs, ... }:
{
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableZshIntegration = true;
    defaultCacheTtl = 3600;
    pinentry.package = pkgs.pinentry-gnome3;
    sshKeys = [ "B22F697B459E84F8146F1809917143A596F984D8" ];
  };
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        useGrimAdapter = true;
      };
    };
  };
}
