{ app-pkgs, user, ... }:
{
  users.users.${user}.packages = with app-pkgs; [
    yt-dlp
    spotdl
  ];
  
   programs.fish.shellAliases = {
    "ytwav" = "yt-dlp -x --embed-metadata --audio-format wav --audio-quality 0";
    "ytmp4" = "yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best:' --cookies-from-browser=chromium ";
  };
}
