{ pkgs, ... }: {

  home.packages = with pkgs; [
    lemminx
    xmlformat
    libxml2
  ];
}
