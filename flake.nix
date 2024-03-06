{
  description = "A template that shows all standard flake outputs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, home-manager, nixpkgs, ... }: {
    nixosConfigurations.sisifo = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./system/sisifo.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
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
