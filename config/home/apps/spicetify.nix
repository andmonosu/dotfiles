{
  pkgs,
  inputs,
  ...
}:
{
  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      theme = spicePkgs.themes.sleek;
      colorScheme = "custom";

      customColorScheme = {
        main = "0e0e10"; # Background
        sidebar = "1a1a1d"; # Surface
        player = "0e0e10"; # Background
        text = "e6e1dc"; # On Background
        subtext = "b8b3a7"; # On Background (Secondary)
        sidebar-text = "e6e1dc";
        card = "242428"; # Surface Variant
        shadow = "0a0a0c"; # Surface Container Lowest
        selected-row = "4d1e00"; # Primary Container (Ese tono teja/marrón quemado oscuro)
        button = "ff8a00"; # Primary (Naranja vibrante)
        button-active = "f5a623"; # Secondary Naranja suave
        button-disabled = "35353a"; # Surface Container Highest
        tab-active = "ff8a00"; # Primary
        notification = "1a1a1d";
        notification-error = "ff5c5c"; # Color Error exacto de tu imagen
        misc = "b8b3a7";
      };

      enabledSnippets = [
        ''
          /* 󰄬 FORZAR TRANSPARENCIA BASE COMPLETA (Para el Blur de Hyprland) */
          .Root__top-container, 
          .main-view-container, 
          .main-navBar-navBar, 
          .Root__now-playing-bar,
          body,
          #main {
            background-color: transparent !important;
            background: transparent !important;
          }
          .main-entityHeader-overlay,
          .main-actionBarBackground-background {
            background-image: none !important;
            background-color: transparent !important;
          }

          /* 󰄬 CORRECCIÓN DEFINITIVA DE LA BARRA DE PROGRESO */
          .playback-bar .x-progressBar-fillColor,
          .playback-bar .progress-bar__fg,
          .progress-bar__fg_wrapper,
          .progress-bar__fg {
            background-color: #ff8a00 !important;
            --fg-color: #ff8a00 !important;
            opacity: 1 !important;
          }

          .progress-bar {
            --fg-color: #ff8a00 !important;
            --bg-color: rgba(255, 138, 0, 0.20) !important;
          }

          .progress-bar__slider {
            background-color: #e6e1dc !important;
          }

          /* 󰄬 CORRECCIÓN DE ICONOS INFERIORES: Forzar el Naranja Primary */
          .main-nowPlayingBar-right .button,
          .main-nowPlayingBar-right button,
          .main-nowPlayingBar-left .button,
          .main-nowPlayingBar-left button,
          .playback-bar + button,
          .player-controls__buttons button,
          .main-genericButton-button {
            color: #ff8a00 !important;
            --spice-button: #ff8a00 !important;
            --spice-misc: #ff8a00 !important;
          }

          .player-controls__buttons button--active,
          .main-nowPlayingBar-right button[aria-checked="true"] {
            color: #f5a623 !important;
          }

          /* 󰄬 CORRECCIÓN DEL BOTÓN PLAY FLOTANTE EN LAS TARJETAS (HOVER) */
          /* Evita que mute a verde y usa el naranja secundario suave de tu paleta */
          .main-playButton-PlayButton button:hover,
          .main-playButton-PlayButton:hover button,
          [class*="playButton"] button:hover,
          [class*="playButton"]:hover button,
          .Button-sc-17v60ao-0:hover {
            background-color: #f5a623 !important;
            color: #1a1a1d !important; /* Icono interno oscuro sobre el botón naranja */
            --spice-button-active: #f5a623 !important;
          }

          /* 󰄬 CORRECCIÓN DEL ECUALIZADOR (GRÁFICO DE BARRAS EN MOVIMIENTO) */
          /* Fuerza a las onditas de la lista a bailar en tu Naranja Primary */
          .main-trackList-playingIcon,
          [class*="playingIcon"],
          .x-trackList-playingIcon {
            color: #ff8a00 !important;
            fill: #ff8a00 !important;
            background-color: #ff8a00 !important;
          }
        ''
      ];

      enabledExtensions = with spicePkgs.extensions; [
        fullAppDisplay
        shuffle
        hidePodcasts
      ];
    };
}
