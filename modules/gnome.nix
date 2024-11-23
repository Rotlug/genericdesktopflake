{ pkgs, lib, desktop, ... }:
lib.mkIf (desktop == "gnome")
{
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };

  environment.gnome.excludePackages = with pkgs; [
    gnome-photos
    gnome-tour
    gedit
    cheese
    geary
    evince
    atomix
    iagno
    tali
    totem
    epiphany
    gnome-music
    gnome-terminal
  ];

  environment.systemPackages = with pkgs; [
    adw-gtk3
    yaru-theme
    gnome-tweaks
    rnote
    shortwave
    decibels
    papers
    showtime
    amberol
  ];
  
  environment.variables = {
    GSK_RENDERER = "vulkan";
  };
}
