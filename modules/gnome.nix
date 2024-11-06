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
    gnome-extension-manager
    adw-gtk3
    yaru-theme
  ];
  
  environment.variables = {
    GSK_RENDERER = "vulkan";
  };
}
