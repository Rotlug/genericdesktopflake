{user, spiceModule, ... }:
{
  imports = [
    dotfiles/vscode.nix
    dotfiles/spicetify.nix
    spiceModule
  ];

  home.username = user;
  home.homeDirectory = "/home/${user}";
  home.stateVersion = "24.05";
}
