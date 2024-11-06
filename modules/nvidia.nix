{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    lshw
    nvtopPackages.nvidia
    glxinfo
  ];

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];
  
  # Enable Graphics
  hardware.graphics.enable = true;

  hardware.nvidia = {
    # Modesetting is required.
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      version = "560.35.03";
      sha256_64bit = "sha256-8pMskvrdQ8WyNBvkU/xPc/CtcYXCa7ekP73oGuKfH+M=";
      sha256_aarch64 = pkgs.lib.fakeSha256;
      openSha256 = "sha256-rtDxQjClJ+gyrCLvdZlT56YyHQ4sbaL+d5tL4L4VfkA=";
      settingsSha256 = "sha256-kQsvDgnxis9ANFmwIwB7HX5MkIAcpEEAHc8IBOLdXvk=";
      persistencedSha256 = pkgs.lib.fakeSha256;
    };
  };

  boot.kernelParams = [
    "nvidia_drm.modeset=1"
    "nvidia.NVreg_EnableGpuFirmware=0"
  ];
}
