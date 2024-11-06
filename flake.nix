{
  description = "A very basic flake";

  inputs = {
#     nixpkgs.url = "github:NixOS/nixpkgs?rev=4c2fcb090b1f3e5b47eaa7bd33913b574a11e0a0";
    nixpkgs.url = "github:NixOS/nixpkgs?rev=b5ce3d74d2021774b00fb125231ef086e346d4e8";
    app-pkgs.url = "nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = { self, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";

      # I Don't know why but unfree only works when i import it like this.
      pkgs = import inputs.nixpkgs { inherit system; config.allowUnfree = true; };
      app-pkgs = import inputs.app-pkgs { inherit system; config.allowUnfree = true; };

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
                home-manager.extraSpecialArgs = { inherit inputs user system host app-pkgs; };
              }
          ];
          specialArgs = { inherit user host desktop app-pkgs; };
        };
      };
    };
}
