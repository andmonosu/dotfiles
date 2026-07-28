{
  config,
  pkgs,
  inputs,
  ...
}:
let
  dotfiles = "${config.home.homeDirectory}/dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    hypr = "hypr";
    nvim = "nvim";
    lazydocker = "lazydocker";
    opencode = "opencode";
    quickshell = "quickshell-dotfiles";
    selene = "selene";
  };
in
{
  home = {
    username = "andreu";
    homeDirectory = "/home/andreu";
    stateVersion = "26.05";
    pointerCursor = {
      enable = true;
      gtk.enable = true;
      x11.enable = true;
      name = "Adwaita";
      size = 24;
      package = pkgs.adwaita-icon-theme;
    };
  };

  xdg = {
    dataFile = {
      "nvim/mason/packages/java-debug-adapter".source = pkgs.vscode-extensions.vscjava.vscode-java-debug;
      "nvim/lombok".source = pkgs.lombok;
    };
    configFile =
      builtins.mapAttrs (name: subpath: {
        source = create_symlink "${dotfiles}/${subpath}";
      }) configs
      // {
        "tmux/themes/melangey/melangey-tmux.conf".source = "${inputs.melangey-tmux}/melangey-tmux.conf";
      };
  };
}
