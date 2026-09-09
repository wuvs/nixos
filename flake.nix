{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      mkHost =
        hostName:
        let
          host = import ./hosts/${hostName}/variables.nix // { inherit hostName; };
        in
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs host; };
          modules = [
            ./hosts/${hostName}/configuration.nix

            { nixpkgs.overlays = [ (import ./overlays) ]; }

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs host; };
              home-manager.users.${host.username} = import ./home;
            }
          ];
        };
    in
    {
      nixosConfigurations.laptop = mkHost "laptop";
    };
}
