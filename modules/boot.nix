{ ... }:
{
#   boot.kernelPackages = app-pkgs.linuxPackages_6_6;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.kernelParams = [ "nvidia-drm.modeset=1" "nvidia-drm.fbdev=1" ];
  boot.supportedFilesystems = ["ntfs"];
}
