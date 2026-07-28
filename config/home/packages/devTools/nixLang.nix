{ pkgs, ... }: {
  home.packages = with pkgs; [
    nixd
    statix
    nixfmt
  ];
}
