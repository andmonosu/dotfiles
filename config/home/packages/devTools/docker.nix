{ pkgs, ... }: {
  home.packages = with pkgs; [
    docker
    dockerfile-language-server
    docker-compose-language-service
    hadolint
    yaml-language-server
    yamllint
    lazydocker
  ];
}
