{
  inputs,
  ...
}:
{
  imports = [
    ./home.nix
    ./apps
    ./themes
    ./packages
    inputs.spicetify-nix.homeManagerModules.default
  ];
}
