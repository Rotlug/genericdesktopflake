{app-pkgs, user, ...}:
{
  users.users.${user}.packages = with app-pkgs; [
    vscodium
  ];

  environment.variables = {
    NIXOS_OZONE_WL = "1";
  };
}

