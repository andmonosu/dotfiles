{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    nvtopPackages.amd
    vulkan-tools
    socat
    ripgrep
    pavucontrol
    gnumake
    gcc
    openrgb
    unzip
    curl
    fastfetch
    fd
    posting
    nautilus
    yazi
    inputs.matugen.packages.${system}.default
    awww
    spotify
    spicetify-cli
  ];
}
