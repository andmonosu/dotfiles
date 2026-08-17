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
    matugen = "matugen";
  };

  #lianli-linux = pkgs.callPackage ./packages/custom/lianli.nix { };
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
    sessionVariables = {
      GSETTINGS_SCHEMA_DIR = "${config.xdg.dataHome}/gsettings-schemas/gsettings-desktop-schemas/glib-2.0/schemas";
    };
  };

  xdg = {
    dataFile = {
      "nvim/mason/packages/java-debug-adapter".source = pkgs.vscode-extensions.vscjava.vscode-java-debug;
      "nvim/lombok".source = pkgs.lombok;
      "gsettings-schemas/gsettings-desktop-schemas".source =
        let
          schemasDir = builtins.head (
            builtins.attrNames (builtins.readDir "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas")
          );
        in
        "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${schemasDir}";
    };
    configFile =
      builtins.mapAttrs (name: subpath: {
        source = create_symlink "${dotfiles}/${subpath}";
      }) configs
      // {
        "tmux/themes/melangey/melangey-tmux.conf".source = "${inputs.melangey-tmux}/melangey-tmux.conf";
      };
  };

  # Servicio de usuario del daemon de Lian Li.
  # (El paquete ya instala su propia unidad en $out/lib/systemd/user/,
  # pero la definimos aquí explícitamente para que home-manager la gestione
  # sin depender de que systemd --user escanee el store.)
  #systemd.user.services.lianli-daemon = {
  #  Unit = {
  #    Description = "Lian Li Device Daemon";
  #    After = [ "graphical-session.target" ];
  #    PartOf = [ "graphical-session.target" ];
  #  };
  #  Service = {
  #    Type = "simple";
  #    ExecStart = "${lianli-linux}/bin/lianli-daemon";
  #    Restart = "on-failure";
  #    RestartSec = 5;
  #  };
  #  Install = {
  #    WantedBy = [ "default.target" ];
  #  };
  #};
}
