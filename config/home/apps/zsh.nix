_: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    shellAliases = {
      ll = "eza -la --icons --git --group-directories-first";
      edit = "sudo -e";
      btw = "echo I use nixos, btw";
      nrs = "sudo nixos-rebuild switch --flake ~/dotfiles#andreu && hyprctl reload";
      vim = "nvim";
      lg = "lazygit";
      lzd = "lazydocker";
      ide = "tmux new-session -n 'Editor' 'nvim' \\; split-window -h -p 30 'opencode --port 50000' \\; select-pane -L";
      ai-start = ''
        nohup llama-server \
          -m ~/AIModels/Qwen3.5-9B-Q6_K.gguf \
          -ngl 999 \
          -c 58000 \
          -fa on \
          -t 16 \
          -tb 16 \
          -b 2048 \
          -ub 512 \
          -np 1 \
          --reasoning auto \
          --metrics \
          --host 127.0.0.1 \
          --port 11434 \
          > ~/.local/state/llama-server.log 2>&1 &
      '';
      ai-logs = "tail -f ~/.local/state/llama-server.log";
      ai-stop = "pkill -f llama-server";
      ai-status = "curl http://127.0.0.1:11434/v1/models";
      ai-health = "curl http://127.0.0.1:11434/health";
    };

    history = {
      size = 10000;
      ignoreAllDups = true;
      path = "$HOME/.zsh_history";
      ignorePatterns = [
        "rm *"
        "pkill *"
        "cp *"
      ];
    };

    initContent = ''
      fastfetch
    '';

    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
          exec start-hyprland
      fi
    '';
  };
}
