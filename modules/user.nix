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
      
      # Games
      #prismlauncher
      jdk21_headless
      #dolphin-emu
      cemu

      # Utilities
      ungoogled-chromium

      # Apps
      vesktop
      godot_4
      
      # (callPackage ../pkgs/chordcat {})
      appimage-run
      #qbittorrent
    ] ++ (with pkgs; [
      # QT Apps should use the same nixpkgs version as kde, as it avoids some bugs for now.

      qbittorrent
      prismlauncher
      dolphin-emu
      vlc
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
  };

  services.flatpak.enable = true; # for gnome app dev
}
