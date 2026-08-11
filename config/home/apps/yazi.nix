_: {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "y";
    settings = {
      mgr = {
        show_hidden = true;
        sort_by = "modified";
        sort_dir_first = true;
      };
    };
  };
}
