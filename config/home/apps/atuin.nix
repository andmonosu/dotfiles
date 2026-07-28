_: {
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      style = "compact";
      inline_height = 15;
      show_preview = true;
      enter_accept = true;

      search_mode = "fuzzy";
      filter_mode = "global";
    };
  };
}
