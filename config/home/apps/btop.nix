_: {
  programs.btop = {
    enable = true;
    settings = {
      theme_background = false;
      truecolor = true;
      vim_keys = true;
      graph_symbol = "braille";
      update_ms = 1500;
      proc_sorting = "cpu changed";
    };
  };
}
