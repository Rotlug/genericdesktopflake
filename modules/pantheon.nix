{ lib, desktop, ... }:
lib.mkIf (desktop == "pantheon")
{
    services.xserver.desktopManager.pantheon.enable = true;
}
