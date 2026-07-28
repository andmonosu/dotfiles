{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    baseIndex = 1; # ventanas empiezan en 1, no en 0
    keyMode = "vi";
    mouse = true;
    terminal = "tmux-256color";
    historyLimit = 50000;
    escapeTime = 0; # evita el delay al pulsar Esc en nvim
    shortcut = "a"; # prefix = C-a (clásico, estilo screen)

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator # navegación de panes sin choque con nvim
      yank # copiar al portapapeles del sistema
    ];

    extraConfig = ''
      # ============================================================
      #  General
      # ============================================================
      set -g renumber-windows on
      set -g set-titles on
      set -g set-titles-string "#T"
      set -g focus-events on
      set -sg escape-time 0

      # ============================================================
      #  Splits (panes) — más intuitivo que % y "
      # ============================================================
      unbind '"'
      unbind %
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

      # Navegación de panes con prefix + hjkl
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Redimensionar panes con prefix + HJKL
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      # ============================================================
      #  Ventanas (tabs)
      # ============================================================
      bind , command-prompt -I "#W" "rename-window '%%'"
      bind n next-window
      bind p previous-window
      bind -n M-Right next-window
      bind -n M-Left previous-window

      # ============================================================
      #  Modos de opencode (con puerto estático 50000)
      # ============================================================

      # 1. En una nueva pestaña/tab completa (prefix + o)
      bind o new-window -n "opencode" -c "#{pane_current_path}" "opencode --port 50000"

      # 2. En un panel a la derecha al 30% del ancho actual (prefix + O)
      bind O split-window -h -p 30 -c "#{pane_current_path}" "opencode --port 50000"

      # ============================================================
      #  lazygit / lazydocker: cada uno en su propia tab.
      # ============================================================
      bind g run-shell 'tmux select-window -t lazygit 2>/dev/null || tmux new-window -n lazygit -c "#{pane_current_path}" lazygit'
      bind D run-shell 'tmux select-window -t lazydocker 2>/dev/null || tmux new-window -n lazydocker -c "#{pane_current_path}" lazydocker'

      # ============================================================
      #  Recargar config
      # ============================================================
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "tmux.conf recargado"

      # ============================================================
      #  Tema por defecto (Melangey Tmux)
      # ============================================================
      # Seteamos la variable que los submódulos del tema necesitan
      set -g @melangey_path "~/.config/tmux/themes/melangey"

      # Cargamos el archivo de configuración estático, saltándonos el script de Bash roto
      source-file ~/.config/tmux/themes/melangey/melangey-tmux.conf
    '';
  };
}
