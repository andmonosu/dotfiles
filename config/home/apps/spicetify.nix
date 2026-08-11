{
  pkgs,
  inputs,
  config,
  ...
}:

{
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  #home.packages = with pkgs; [
  # spicetify-cli
  # ];

  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        hidePodcasts
        shuffle
      ];

      theme = {
        name = "matugen";
        src = ../../spicetify/Themes/matugen;
      };
      colorScheme = "matugen";
    };
}
