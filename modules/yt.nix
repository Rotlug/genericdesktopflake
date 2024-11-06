{ app-pkgs, user, ... }:
{
  users.users.${user}.packages = with app-pkgs; [
    yt-dlp
  ];
  
   programs.bash.shellAliases = {
    "ytwav" = "yt-dlp -x --audio-format wav --audio-quality 0";
    "ytmp4" = "yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best:' --cookies-from-browser=chromium ";
  };
}
