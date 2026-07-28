_: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos";
        color = {
          "1" = "38;2;255;184;108"; # Naranja Claro (#FFB86C)
          "2" = "38;2;255;138;0"; # Naranja Primario (#FF8A00)
          "3" = "38;2;255;184;108"; # Naranja Claro
          "4" = "38;2;255;138;0"; # Naranja Primario
          "5" = "38;2;255;184;108"; # Naranja Claro
          "6" = "38;2;255;138;0"; # Naranja Primario
        };
        padding = {
          right = 4;
        };
      };
      display = {
        separator = " ➜  ";
        color = {
          keys = "38;2;255;138;0"; # Color naranja para tus iconos y etiquetas
          title = "38;2;255;138;0"; # Color naranja para el usuario@host
        };
      };
      modules = [
        "title"
        {
          type = "separator";
          string = "---------------------------------------------";
        }
        {
          type = "os";
          key = "󰦓 OS";
        }
        {
          type = "kernel";
          key = "󰡄 Kernel";
        }
        {
          type = "uptime";
          key = "󱎫 Uptime";
        }
        {
          type = "packages";
          key = "󰏖 Packages";
        }
        {
          type = "shell";
          key = "󱆃 Shell";
        }
        {
          type = "display";
          key = "󰍹 Display";
        }
        {
          type = "wm";
          key = "󱂬 WM";
        }
        {
          type = "terminal";
          key = "󰆍 Terminal";
        }
        {
          type = "font";
          key = "󰛖 Font";
        }
        {
          type = "cpu";
          key = "󰻠 CPU";
        }
        {
          type = "gpu";
          key = "󰢮 GPU";
        }
        {
          type = "memory";
          key = "󰑭 Memory";
        }
        {
          type = "disk";
          key = "󰋊 Disk";
        }
        {
          type = "localip";
          key = "󰩟 Local IP";
        }
        {
          type = "break";
        }
        {
          type = "colors";
          symbol = "circle";
        }
      ];
    };
  };
}
