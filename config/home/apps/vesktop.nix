_: {
  programs.vesktop = {
    enable = true;

    vencord = {
      themes = {
        "industrial-orange.css" = ''
          /* Forzar transparencia base completa para que actúe el blur de Hyprland */
          body, html, #app-mount {
              background: transparent !important;
          }

          :root {
              /* Colores exactos de tu imagen con canales alfa refinados */
              --background-primary: rgba(14, 14, 16, 0.50) !important;   /* #0E0E10 con blur */
              --background-secondary: rgba(26, 26, 29, 0.60) !important; /* #1A1A1D */
              --background-tertiary: rgba(10, 10, 12, 0.70) !important;  /* #0A0A0C */
              --background-floating: rgba(36, 36, 40, 0.90) !important;  /* #242428 */
              
              /* El Naranja Primary de tu paleta */
              --brand-experiment: #FF8A00 !important;
              --brand-experiment-500: #FF8A00 !important;
              --brand-experiment-600: #4D1E00 !important; /* Primary Container como tono oscuro */
              
              /* Textos de la paleta oficial */
              --text-normal: #E6E1DC !important; /* On Background */
              --text-muted: #B8B3A7 !important;  /* On Background Secondary */
              --text-link: #FFB86C !important;   /* Tertiary para links interesantes */
          }

          /* Selectores para mantener paneles flotantes translúcidos */
          [class^="sidebar_"], 
          [class^="chat_"], 
          [class^="container_"], 
          [class^="channels_"], 
          [class^="panels_"], 
          [class^="wrapper_"] {
              background: transparent !important;
          }
        '';
      };

      settings = {
        enabledThemes = [ "industrial-orange.css" ];
        plugins = {
          FakeNitro = {
            enabled = true;
          };
          AnonymiseFileNames = {
            enabled = true;
          };
        };
      };
    };
  };
}
