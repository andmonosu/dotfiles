{ pkgs, ... }:

let
  spotifyLocalDir = "/home/andreu/.local/share/spotify-writable";
in
{
  # Forzamos los valores del usuario para que Home Manager valide bien las rutas de origen
  home.username = "andreu";
  home.homeDirectory = "/home/andreu";

  home.packages = [
    # Wrapper inteligente de spicetify
    (pkgs.writeShellScriptBin "spicetify" ''
      if ${pkgs.spicetify-cli}/bin/spicetify "$@" 2>&1 | grep -q "version are mismatched"; then
        echo "⚠️ Mismatch detectado en Spicetify. Reparando backup automáticamente..."
        rm -rf /home/andreu/.config/spicetify/Backup
        rm -rf "${spotifyLocalDir}"
        
        mkdir -p "${spotifyLocalDir}"
        cp -rL ${pkgs.spotify}/share/spotify/* "${spotifyLocalDir}/"
        chmod -R +w "${spotifyLocalDir}"
        ${pkgs.spicetify-cli}/bin/spicetify backup apply
        
        exec ${pkgs.spicetify-cli}/bin/spicetify "$@"
      fi

      exec ${pkgs.spicetify-cli}/bin/spicetify "$@"
    '')

    # Wrapper inteligente de spotify
    (pkgs.writeShellScriptBin "spotify" ''
      CURRENT_HASH=$(echo "${pkgs.spotify}" | grep -oE "[a-z0-9]{32}")

      if [ -d "${spotifyLocalDir}" ]; then
        if [ ! -f "${spotifyLocalDir}/.store-hash" ] || [ "$(cat "${spotifyLocalDir}/.store-hash")" != "$CURRENT_HASH" ]; then
          echo "🔄 Se detectó una nueva versión de Spotify en NixOS. Limpiando entorno viejo..."
          rm -rf /home/andreu/.config/spicetify/Backup
          rm -rf "${spotifyLocalDir}"
        fi
      fi

      if [ ! -d "${spotifyLocalDir}" ]; then
        echo "Preparando entorno mutable para Spicetify..."
        mkdir -p "${spotifyLocalDir}"
        cp -rL ${pkgs.spotify}/share/spotify/* "${spotifyLocalDir}/"
        chmod -R +w "${spotifyLocalDir}"
        echo "$CURRENT_HASH" > "${spotifyLocalDir}/.store-hash"
        
        echo "🛠️ Inicializando nuevo backup limpio en Spicetify..."
        /etc/profiles/per-user/andreu/bin/spicetify backup apply || true
      fi

      exec ${pkgs.spotify}/bin/spotify --args="--app-path=${spotifyLocalDir}/Apps" "$@"
    '')
  ];

  # Generamos el archivo de configuración de forma nativa.
  # Al haber definido arriba 'homeDirectory', ahora compilará perfectamente sin errores de path.
  home.file.".config/spicetify/config-xpui.ini".text = ''
    [Setting]
    spotify_path           = ${spotifyLocalDir}
    prefs_path             = /home/andreu/.config/spotify/prefs
    current_theme          = Sleek
    color_scheme           = matugen
    inject_css             = 1
    replace_colors         = 1
    overwrite_assets       = 0
    spotify_launch_flags   = 

    [Preprocesses]
    disable_sentry     = 1
    disable_ui_logging = 1
    remove_rtl_rule    = 1
    expose_apis        = 1

    [AdditionalOptions]
    extensions            = 
    custom_apps           = 
    sidebar_config        = 1
    home_config           = 1
    experimental_features = 1

    [Patch]
  '';
}
