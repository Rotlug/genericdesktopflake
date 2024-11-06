{user, ... }:
{
  imports = [
    dotfiles/vscode.nix
  ];

  home.username = user;
  home.homeDirectory = "/home/${user}";
  home.stateVersion = "24.05";
}
