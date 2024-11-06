{ user, ... }:
{
  programs.adb.enable = true;

  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "adbusers" ];
  };

  # Not Related to ADB But needed to compile APK's successfully
  programs.nix-ld.enable = true;
}
