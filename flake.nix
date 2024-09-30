{
  description = "A template that shows all standard flake outputs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, home-manager, nixpkgs, nixvim, ... }@inputs: {
    nixosConfigurations.sisifo = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./system/sisifo.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.users.pourtz = import ./home;
        }
      ];
    };

    nixosConfigurations.proto = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./system/proto.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.pourtz = import ./home;
        }
      ];
    };
  };
}
