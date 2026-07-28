_: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      format = ''
        [╭─ ](#FF8A00)$os$directory$git_branch$git_status
        [╰─](#FF8A00)$character'';

      add_newline = true;

      os = {
        disabled = false;
        style = "bold #FF8A00";
        symbols = {
          NixOS = " ";
          Arch = "󰣇 ";
          Ubuntu = "󰕈 ";
          Debian = "󰣚 ";
          Linux = "󰌽 ";
        };
      };

      directory = {
        style = "bold #FFB86C";
        truncation_length = 3;
        truncation_symbol = "…/";
        format = "[$path]($style) ";
      };

      git_branch = {
        symbol = " ";
        style = "bold #FF8A00";
        format = "on [$symbol$branch]($style) ";
      };

      git_status = {
        style = "bold #FFC857";
        format = "([\\[$all_status$ahead_behind\\]]($style) )";

        untracked = "\${count} ";
        staged = "\${count} ";
        modified = "\${count} ";
        deleted = "󰆴\${count} ";

        ahead = "⇡\${count} ";
        behind = "⇣\${count} ";
        diverged = "⇕⇡\${ahead_count}⇣\${behind_count} ";
        conflicted = "🏳 ";
        stashed = "📦 ";
      };

      character = {
        success_symbol = "[❯](#FF8A00) ";
        error_symbol = "[❯](#FF5C5C) ";
      };
    };
  };
}
