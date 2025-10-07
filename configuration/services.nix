{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = [ "wlr" ];
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  catppuccin.sddm.background = ../wallpaper.png;
  catppuccin.sddm.loginBackground = false;
  catppuccin.sddm.accent = "blue";

  services.displayManager.sessionPackages = [ pkgs.river-classic ];
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
  };
  services.xserver.xkb.layout = "de";

  services.pcscd.enable = true;

  services.blueman.enable = true;

  # Important for gpg
  services.dbus.packages = [ pkgs.gcr ];

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    extraConfig.pipewire-pulse = {
      "disable-auto-gain" = {
        "pulse.rules" = [
          {
            matches = [ { "media.class" = "Audio/Source"; } ];
            actions = {
              quirks = [ "block-source-volume" ];
            };
          }
        ];
      };
    };
  };
}
