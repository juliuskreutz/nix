{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = [ "wlr" ];
  };

  catppuccin.sddm = {
    background = ../wallpaper.png;
    loginBackground = false;
    accent = "blue";
  };

  services.displayManager = {
    sessionPackages = [ pkgs.river-classic ];
    sddm = {
      enable = true;
      wayland = {
        enable = true;
        compositor = "kwin";
      };
    };
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
