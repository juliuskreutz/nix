{
  pkgs,
  inputs,
  laptop,
  ...
}:
{
  imports = [
    (if laptop then ./graphics/laptop.nix else ./graphics/desktop.nix)
    ./services.nix
    ./programs.nix
    inputs.catppuccin.nixosModules.catppuccin
  ];

  catppuccin = {
    enable = true;
    flavor = "macchiato";
    accent = "peach";
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      5201
    ];
  };

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  console.keyMap = "de";

  users.users.julius = {
    isNormalUser = true;
    description = "Julius Kreutz";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };
  security.sudo.wheelNeedsPassword = false;
  security.rtkit.enable = true;

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.11";
}
