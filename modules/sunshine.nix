{ pkgs, ... }:
let
    sunshineOverride = pkgs.sunshine.override { cudaSupport = true; stdenv = pkgs.cudaPackages.backendStdenv; };
in
{
    services.sunshine = {
        enable = true;
        capSysAdmin = true;
        openFirewall = true;
        autoStart = false;
        package = sunshineOverride;
    };
}
