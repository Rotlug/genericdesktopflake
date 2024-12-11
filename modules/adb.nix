{ user, ... }:
{
  programs.adb.enable = true;

  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "adbusers" ];
  };
}
