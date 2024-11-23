{ spicePkgs, ... }:
{
    programs.spicetify = {
        enable = true;
        enabledExtensions = with spicePkgs.extensions; [
            adblock
            hidePodcasts
            beautifulLyrics
            shuffle
        ];
        # theme = spicePkgs.themes.catppuccin;
        # colorScheme = "mocha";
    };
}
