_: {
  programs.fzf = {
    enable = true;
    enableZshIntegration = false;

    defaultOptions = [
      "--height 40%"
      "--layout=reverse"
      "--border"
    ];

    colors = {
      "fg" = "#E6E1DC";
      "bg" = "-1";
      "hl" = "#FFB86C";
      "fg+" = "#E6E1DC";
      "bg+" = "#242428";
      "hl+" = "#FF8A00";
      "info" = "#64B5F6";
      "prompt" = "#FF8A00";
      "pointer" = "#FF8A00";
      "marker" = "#7BD08F";
      "header" = "#5C5C66";
    };
  };
}
