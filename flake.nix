{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    app-pkgs.url = "nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "app-pkgs";
    };

    forceblur = {
      url = "github:taj-ny/kwin-effects-forceblur";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = { self, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";

      # I Don't know why but unfree only works when i import it like this.
      pkgs = import inputs.nixpkgs { inherit system; config.allowUnfree = true; };
      app-pkgs = import inputs.app-pkgs { inherit system; config.allowUnfree = true; };
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
      spiceModule = inputs.spicetify-nix.homeManagerModules.default;

      blurPkg = inputs.forceblur.packages.${system}.default;

      user = "rotlug";
      host = "pc";
      desktop = "kde";
    in
    {
      nixosConfigurations = {
        ${host} = inputs.nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${user} = import ./home.nix;
              home-manager.extraSpecialArgs = { inherit inputs user system host app-pkgs spicePkgs spiceModule; };
            }
          ];
          specialArgs = { inherit user host desktop app-pkgs blurPkg; };
        };
      };
    };
}
