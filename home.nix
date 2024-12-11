{user, spiceModule, app-pkgs, ... }:
{
  imports = [
    dotfiles/vscode.nix
    dotfiles/spicetify.nix
    spiceModule
    dotfiles/kate.nix
  ];

  home.username = user;
  home.homeDirectory = "/home/${user}";
  home.stateVersion = "24.05";

  home.packages = with app-pkgs; [
    (callPackage ./pkgs/zen {})
  ];
}
