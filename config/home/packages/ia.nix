{ pkgs, ... }: {
  home.packages = with pkgs; [
    llama-cpp-vulkan
    llama-swap
    opencode
  ];
}
