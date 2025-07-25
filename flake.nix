{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-pr419026.url = "github:NixOS/nixpkgs/pull/419026/head";
    nixpkgs-pr426285.url = "github:NixOS/nixpkgs/pull/426285/head";
    catppuccin.url = "github:catppuccin/nix";
    nixvim = {
      url = "github:juliuskreutz/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    comic-code-ligatures-nerd-font = {
      url = "github:juliuskreutz/ComicCodeLigaturesNerdFont";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: {
    nixosConfigurations =
      let
        nixosSystem =
          laptop:
          let
            hostName = if laptop then "nix-laptop" else "nix-desktop";
            hardwareConfiguration =
              if laptop then ./hardware-configuration/laptop.nix else ./hardware-configuration/desktop.nix;
          in
          inputs.nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs laptop; };
            modules = [
              { networking.hostName = hostName; }
              hardwareConfiguration
              ./configuration
              inputs.home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  extraSpecialArgs = {
                    inherit inputs;
                  };
                  users.julius = ./home;
                };
              }
            ];
          };
      in
      {
        nix-desktop = nixosSystem false;
        nix-laptop = nixosSystem true;
      };
  };
}
