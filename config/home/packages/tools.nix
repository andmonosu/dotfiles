{ pkgs, ... }: {
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
  ];
}
