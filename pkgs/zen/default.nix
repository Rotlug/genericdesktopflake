{
    lib, stdenv, xorg,
    libGL ,libGLU ,libevent ,libffi ,libjpeg ,libpng ,libstartup_notification ,libvpx ,libwebp, fontconfig ,libxkbcommon ,zlib ,freetype,
    makeWrapper, copyDesktopItems, wrapGAppsHook,
    gtk3 ,libxml2 ,dbus ,xcb-util-cursor ,alsa-lib ,libpulseaudio ,pango ,atk ,cairo ,gdk-pixbuf ,glib,
	udev ,libva ,mesa ,libnotify ,cups ,pciutils,
	ffmpeg ,libglvnd ,pipewire,
    ...
}:
let
    runtimeLibs = [
        libGL libGLU libevent libffi libjpeg libpng libstartup_notification libvpx libwebp
        stdenv.cc.cc fontconfig libxkbcommon zlib freetype
        gtk3 libxml2 dbus xcb-util-cursor alsa-lib libpulseaudio pango atk cairo gdk-pixbuf glib
	udev libva mesa libnotify cups pciutils
	ffmpeg libglvnd pipewire
      ] ++ (with xorg; [
        libxcb libX11 libXcursor libXrandr libXi libXext libXcomposite libXdamage
	libXfixes libXScrnSaver
      ]);
in
stdenv.mkDerivation rec {
    pname = "zen-browser";
    version = "1.0.1-a.22";

    src = builtins.fetchTarball {
        url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-generic.tar.bz2";
        sha256 = "sha256:065rl1fhg79bkj1qy960qcid7wr7vd7j3wsf7bbr69b4rgmqqv3z";
    };

    buildInputs = [
        makeWrapper
        wrapGAppsHook
        copyDesktopItems
    ];

    nativeBuildInputs = [
        makeWrapper copyDesktopItems wrapGAppsHook
    ];

    desktopSrc = ./.;

    phases = [ "installPhase" "fixupPhase" ];


    installPhase = ''
        mkdir -p $out/bin && cp -r $src/* $out/bin
        install -D $desktopSrc/zen.desktop $out/share/applications/zen.desktop
        install -D $src/browser/chrome/icons/default/default128.png $out/share/icons/hicolor/128x128/apps/zen.png
    '';

    fixupPhase = ''
        chmod 755 $out/bin/*
        patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" $out/bin/zen
        wrapProgram $out/bin/zen --set LD_LIBRARY_PATH "${lib.makeLibraryPath runtimeLibs}" \
                --set MOZ_LEGACY_PROFILES 1 --set MOZ_ALLOW_DOWNGRADE 1 --set MOZ_APP_LAUNCHER zen --prefix XDG_DATA_DIRS : "$GSETTINGS_SCHEMAS_PATH"
        patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" $out/bin/zen-bin
        wrapProgram $out/bin/zen-bin --set LD_LIBRARY_PATH "${lib.makeLibraryPath runtimeLibs}" \
                --set MOZ_LEGACY_PROFILES 1 --set MOZ_ALLOW_DOWNGRADE 1 --set MOZ_APP_LAUNCHER zen --prefix XDG_DATA_DIRS : "$GSETTINGS_SCHEMAS_PATH"
        patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" $out/bin/glxtest
        wrapProgram $out/bin/glxtest --set LD_LIBRARY_PATH "${lib.makeLibraryPath runtimeLibs}"
        patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" $out/bin/updater
        wrapProgram $out/bin/updater --set LD_LIBRARY_PATH "${lib.makeLibraryPath runtimeLibs}"
        patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" $out/bin/vaapitest
        wrapProgram $out/bin/vaapitest --set LD_LIBRARY_PATH "${lib.makeLibraryPath runtimeLibs}"
    '';

    meta = {
        description = "A highly customizable binary Window Decoration and Application Style plugin for recent versions of the KDE Plasma desktop";
        homepage = "https://github.com/paulmcauley/klassy";
        changelog = "https://github.com/paulmcauley/klassy/releases/tag/${version}";
        license = with lib.licenses; [ bsd3 cc0 fdl12Plus gpl2Only gpl2Plus gpl3Only mit ];
    };
}
