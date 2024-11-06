{ pkgs, lib, desktop, ... }:
lib.mkIf (desktop == "kde")
{
  environment.systemPackages = with pkgs; [
    kdePackages.oxygen
    # Klassy window decorations
    (callPackage ../pkgs/klassy {})

    # KDE Rounded Corners
    kde-rounded-corners

    # Lightly Theme
    #( callPackage ../pkgs/lightly {})

    # LSP Servers for Kate
    nil
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    plasma-browser-integration
    khelpcenter
  ];

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment.variables.QT_PLUGIN_PATH =
  let
    derefTheme =
      themes:
      map (
        theme:
        pkgs.runCommand "${lib.getName theme}-workaround" { } ''
          plugins="${theme.outPath}/${pkgs.qt6.qtbase.qtPluginPrefix}"
          cp -r --dereference "$plugins" $out
        ''
      ) themes;
  in
  derefTheme (
    with pkgs;
    [
      kdePackages.breeze
      (callPackage ../pkgs/klassy {})
      kdePackages.oxygen
    ]
  );
}
