{ pkgs, user, app-pkgs, ...}:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    description = user;
    extraGroups = [ "networkmanager" "wheel" "kvm" ];
    packages = with app-pkgs; [
      # Multimedia
      #vlc
      
      jdk23
      cemu

      # Apps
      vesktop

      appimage-run
      ffmpeg
      bottles
    ] ++ (with pkgs; [
      # QT Apps should use the same nixpkgs version as kde, as it avoids some bugs for now.

      qbittorrent
      prismlauncher
      dolphin-emu
      vlc
      godot_4
    ]);
  };

  programs = {
    steam.enable = true;
    steam.package = app-pkgs.steam;
    gamescope.enable = true;
    gamescope.package = app-pkgs.gamescope;
    gamemode.enable = true;

    direnv.enable = true;
    bash = {
      interactiveShellInit = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${app-pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '';
    };
    fish.enable = true;
  };

  services.flatpak.enable = true; # for gnome app dev

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # Wayland support for VSCode
    GTK_USE_PORTAL = "1"; # Native file picker for web browser
  };

  services.hardware.openrgb.enable = true;
}
