_: {
  programs.git = {
    enable = true;
    includes = [
      { path = "~/.gitconfig.local"; }
    ];

    settings = {
      user.name = "Andreu Montagut Osuna";
      user.email = "YOUR_EMAIL";

      init.defaultBranch = "main";
    };
  };
}
