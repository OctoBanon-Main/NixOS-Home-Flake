{
  description = "OctoBanon's flake for home pc";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
        
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };


  outputs = inputs@{ nixpkgs, chaotic, home-manager, lanzaboote, nix-flatpak, ... }: {
   nixosConfigurations = {
      octopc-nix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./system/configuration.nix
          ./overlay/imports.nix
          
          lanzaboote.nixosModules.lanzaboote

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.octobanon = import ./home/home.nix;
          }

          chaotic.nixosModules.default
        ];
      };
    };

    homeConfigurations.octobanon = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [ ./home/home.nix ];
    };
  };
}
