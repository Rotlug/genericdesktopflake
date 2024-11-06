{ pkgs, lib, desktop, ... }:
lib.mkIf (desktop == "lxqt")
{
  services.displayManager.sddm.enable = true;
  services.xserver.desktopManager.lxqt.enable = true;

  environment.systemPackages = with pkgs; [
    kdePackages.layer-shell-qt
    kdePackages.kwindowsystem
    kdePackages.kwin
  ];
}
