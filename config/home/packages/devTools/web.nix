{ pkgs, ... }: {
  home.packages = with pkgs; [
    vtsls
    vscode-langservers-extracted
    angular-language-server
    vue-language-server
    biome
    stylelint
    eslint_d
    prettier
    typescript
    nodejs
  ];
}
