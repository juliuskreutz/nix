{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # rwm = {
    #   url = "github:juliuskreutz/rwm";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # rmenu = {
    #   url = "github:juliuskreutz/rmenu";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # rstatus = {
    #   url = "github:juliuskreutz/rstatus";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    comic-code-ligatures-nerd-font = {
      url = "git+ssh://git@github.com/juliuskreutz/ComicCodeLigaturesNerdFont";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    ...
  }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit inputs;
            };
            home-manager.users.julius = {
              imports = [
                ./home.nix
              ];
            };
          }
        ];
      };
    };
  };
}
