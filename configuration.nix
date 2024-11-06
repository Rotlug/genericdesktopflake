{ app-pkgs, ... }:
{
  imports = [
    ./modules/boot.nix
    ./modules/hardware-configuration.nix
    ./modules/nvidia.nix
    ./modules/sound.nix

    # Desktops
    ./modules/kde.nix
    ./modules/gnome.nix
    ./modules/pantheon.nix
    ./modules/lxqt.nix

    ./modules/firewall.nix
    ./modules/networking.nix
    ./modules/user.nix # Random Packages (games etc)
    ./modules/musicprod.nix
    ./modules/yt.nix # YTDL Commands
    ./modules/adb.nix
    #     ./modules/vscode.nix
  ];

  # Set your time zone.
  time.timeZone = "Asia/Jerusalem";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us,il";
      options = "grp:alt_shift_toggle";
    };
  };

  # rtkit is optional but recommended
  security.rtkit.enable = true;

  # Password feedback for the 'sudo' command
  security.sudo.extraConfig = ''
    Defaults env_reset,pwfeedback
  '';

  fonts.packages = with app-pkgs; [
    ubuntu_font_family
    inter
    monaspace
  ];

  # Dconf
  programs.dconf.enable = true;

  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with app-pkgs; [
    git
    wget
    curl
    zip
    unzip
    p7zip
    nano
    unar
  ];

  system.stateVersion = "24.05";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs.nix-ld = {
    enable = true;
    libraries =
      (app-pkgs.steam-run.fhsenv.args.multiPkgs app-pkgs)
      ++ (with app-pkgs; [
        xorg.libxkbfile
      ]);
  };
}
