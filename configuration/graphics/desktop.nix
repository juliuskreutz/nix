{
  config,
  ...
}:
{
  hardware.graphics = {
    enable = true;
  };

  environment.variables = {
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
}
