{ pkgs, ... }: {
  home.packages = with pkgs; [
    jdk21
    jdt-language-server
    checkstyle
    google-java-format
    vscode-extensions.vscjava.vscode-java-debug
    lombok
    maven
  ];
}
