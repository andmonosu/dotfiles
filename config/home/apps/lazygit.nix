_: {
  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        # Un toque estético para que use líneas finas en Hyprland
        border = "single";
        theme = {
          activeBorderColor = [
            "#FF8A00"
            "bold"
          ]; # Tu Naranja Primario
          inactiveBorderColor = [ "#5C5C66" ];
          searchingActiveBorderColor = [
            "#FFB86C"
            "bold"
          ];
        };
      };
    };
  };
}
