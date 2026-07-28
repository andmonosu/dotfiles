_: {
  programs.firefox = {
    enable = true;
    profiles.default = {
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };

      userChrome = ''
        /* Barra superior traslúcida en base Background real de tu paleta */
        #navigator-toolbox {
            background-color: rgba(14, 14, 16, 0.45) !important; /* Base #0E0E10 */
            backdrop-filter: none !important; 
            border-bottom: 2px solid #FF8A00 !important; /* Naranja Primary exacto */
        }

        /* Forzar transparencia en sub-elementos */
        #TabsToolbar, #nav-bar, #PersonalToolbar {
            background: transparent !important;
        }

        /* Pestaña activa: Naranja Primary */
        .tab-background[selected="true"] {
            background-color: #FF8A00 !important;
            background-image: none !important;
            border-radius: 6px 6px 0px 0px !important;
        }

        /* Texto de la pestaña activa (On Background / Cream) */
        .tabbrowser-tab[selected="true"] {
            color: #E6E1DC !important;
            font-weight: bold !important;
        }

        /* Pestañas inactivas: Texto secundario de tu paleta */
        .tabbrowser-tab:not([selected="true"]) {
            color: #B8B3A7 !important; 
        }

        /* Hover sobre pestañas inactivas usando el naranja primary sutil */
        .tabbrowser-tab:not([selected="true"]):hover .tab-background {
            background-color: rgba(255, 138, 0, 0.15) !important;
        }

        /* Barra de direcciones: Fondo Surface Container Lowest de tu imagen */
        #urlbar-background {
            background-color: rgba(10, 10, 12, 0.40) !important; /* #0A0A0C */
            border: 1px solid #5C5C66 !important; /* Color de contorno Outline */
            border-radius: 8px !important;
        }

        /* Foco de la barra de búsqueda: Naranja Primary vibrante */
        #urlbar[focused="true"] > #urlbar-background {
            border-color: #FF8A00 !important;
            box-shadow: 0 0 6px rgba(255, 138, 0, 0.6) !important;
        }

        /* Iconos de navegación consistentes con el Naranja Primary */
        #back-button, #forward-button, #reload-button, #home-button, .toolbarbutton-icon {
            fill: #FF8A00 !important;
            color: #FF8A00 !important;
        }
      '';
    };
  };
}
