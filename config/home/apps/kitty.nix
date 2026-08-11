_: {
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12.0;
    };
    extraConfig = "include ~/.config/kitty/themes/Matugen.conf";
  };
}
