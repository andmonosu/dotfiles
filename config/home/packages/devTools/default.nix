{ pkgs, ... }: {
  imports = [
    ./python.nix
    ./lua.nix
    ./java.nix
    ./nixLang.nix
    ./web.nix
    ./docker.nix
  ];

  home.packages = with pkgs; [
    tree-sitter
    neovim
  ];
}
