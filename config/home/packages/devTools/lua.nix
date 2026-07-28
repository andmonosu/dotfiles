{ pkgs, ... }: {
  home.packages = with pkgs; [
    (lua5_1.withPackages (
      ps: with ps; [
        luarocks
        luacheck
      ]
    ))
    lua-language-server
    stylua
  ];
}
