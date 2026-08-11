{ pkgs, ... }:

let
  wallpaperState = "$HOME/.local/state/wallpaper/current";

  setWallpaper = pkgs.writeShellScriptBin "set-wallpaper" ''
    set -euo pipefail
    WALLPAPER="$1"
    mkdir -p "$(dirname "${wallpaperState}")"
    echo "$WALLPAPER" > "${wallpaperState}"
    awww img "$WALLPAPER"
    matugen image "$WALLPAPER"
  '';

  restoreWallpaper = pkgs.writeShellScriptBin "restore-wallpaper" ''
    set -euo pipefail
    STATE="${wallpaperState}"
    if [ -f "$STATE" ]; then
      matugen image "$(cat "$STATE")"
    else
      matugen image ~/Wallpapers/background.jpeg   # fallback for first-ever boot
    fi
  '';
in
{
  home.packages = [
    setWallpaper
    restoreWallpaper
  ];
}
