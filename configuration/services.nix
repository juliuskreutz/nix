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
    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
    podman = {
      enable = true;
    };
  };

  catppuccin.sddm.background = ../wallpaper.png;
  catppuccin.sddm.loginBackground = false;

  services.displayManager.sessionPackages = [ pkgs.river ];
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
  };
  services.xserver = {
    xkb.layout = "de";
  };
  services.pcscd.enable = true;
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_17;
    ensureUsers = [
      {
        name = "julius";
        ensureClauses.superuser = true;
        ensureClauses.login = true;
      }
    ];
    authentication = ''
      host all all 0.0.0.0/0 trust
    '';
  };
  services.blueman.enable = true;
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
