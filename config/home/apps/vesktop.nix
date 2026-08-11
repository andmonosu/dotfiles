_: {
  programs.vesktop = {
    enable = true;

    vencord = {
      settings = {
        plugins = {
          FakeNitro = {
            enabled = true;
          };
          AnonymiseFileNames = {
            enabled = true;
          };
        };
      };
    };
  };
}
