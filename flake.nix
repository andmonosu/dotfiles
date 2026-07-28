{
  description = "My NixOS System";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland/v0.55.0";
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    melangey-tmux = {
      url = "github:OwlfaceGames/melangey_tmux";
      flake = false; # Indica que es un repositorio de código normal
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      hyprland,
      spicetify-nix,
      ...
    }:
    {
      nixosConfigurations.andreu = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          (_: {
            nixpkgs.overlays = import ./overlays;
          })
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              extraSpecialArgs = { inherit inputs; };

              users.andreu = import ./config/home/default.nix;
              backupFileExtension = "backup";
            };
          }
        ];
      };
    };
}
