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

  virtualisation = {
    podman = {
      enable = true;
    };
  };

  catppuccin.sddm.background = ../wallpaper.png;
  catppuccin.sddm.loginBackground = false;
  # catppuccin.sddm.enable = false;

  services.displayManager.sessionPackages = [ pkgs.river ];
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
  };
  services.xserver.xkb.layout = "de";

  services.pcscd.enable = true;

  services.blueman.enable = true;

  # Important
  services.dbus.packages = [ pkgs.gcr ];

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
