_: {
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12.0;
    };

    settings = {
      # --- Transparencia (Requerido para el blur en Hyprland) ---
      background_opacity = "0.75";

      # --- Esquema de Colores (Inspirado en el Wallpaper Gris-Naranja) ---

      # Colores principales (Texto y Fondo)
      foreground = "#E6E1DC";
      background = "#0E0E10";
      selection_foreground = "#0E0E10";
      selection_background = "#FF8A00";

      # Configuración del Cursor
      cursor = "#FF8A00";
      cursor_text_color = "#0E0E10";

      # Color de URLs e hipervínculos
      url_color = "#FFB86C";

      # --- Paleta de 16 Colores ANSI ---

      # Black (Fondo y variaciones oscuras)
      color0 = "#0E0E10";
      color8 = "#5C5C66";

      # Red (Acentos de error / estados críticos)
      color1 = "#FF5C5C";
      color9 = "#FF7D71";

      # Green (Éxito / estados normales)
      color2 = "#7BD08F";
      color10 = "#9CEAAE";

      # Yellow (Advertencias / acentos cálidos)
      color3 = "#FFC857";
      color11 = "#FFE082";

      # Blue (Información / acentos fríos)
      color4 = "#64B5F6";
      color12 = "#8AB4F8";

      # Magenta (Acentos secundarios)
      color5 = "#C678DD";
      color13 = "#D19EEB";

      # Cyan (Enlaces alternativos / estados limpios)
      color6 = "#4DD0E1";
      color14 = "#80DEEA";

      # White (Texto principal y brillante)
      color7 = "#E6E1DC";
      color15 = "#FFFFFF";

      # --- Bordes de Ventanas y Pestañas (Diseño Material) ---
      active_border_color = "#FF8A00";
      inactive_border_color = "#242428";

      active_tab_foreground = "#0E0E10";
      active_tab_background = "#FF8A00";
      inactive_tab_foreground = "#B8B3A7";
      inactive_tab_background = "#1A1A1D";
      tab_bar_background = "#0E0E10";
    };
  };
}
