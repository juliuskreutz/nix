{pkgs, ...}: {
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = ["wlr"];
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

  services.displayManager.sessionPackages = [pkgs.river];
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
    catppuccin.background = ../wallpaper.png;
    catppuccin.loginBackground = false;
  };
  services.xserver = {
    xkb.layout = "de";
  };
  services.pcscd.enable = true;
  services.postgresql = {
    enable = true;
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
  # services.cloudflare-warp.enable = true;
  services.dbus.packages = [pkgs.gcr];
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
