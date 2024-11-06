{ user, lib, app-pkgs, ... }:
{
    users.users.${user}.packages = with app-pkgs; [
        ardour
        carla
        surge-XT
        samplv1
        drumkv1
        sfizz
        cardinal
        x42-plugins
        airwindows-lv2
        calf
    ];

    environment.variables = let
        makePluginPath = format:
        (lib.strings.makeSearchPath format [
            "$HOME/.nix-profile/lib"
            "/run/current-system/sw/lib"
            "/etc/profiles/per-user/$USER/lib"
        ])
        + ":$HOME/.${format}";
    in {
      DSSI_PATH   = makePluginPath "dssi";
      LADSPA_PATH = makePluginPath "ladspa";
      LV2_PATH    = makePluginPath "lv2";
      LXVST_PATH  = makePluginPath "lv2";
      VST_PATH    = makePluginPath "vst";
      VST3_PATH   = makePluginPath "vst3";
    };
}
