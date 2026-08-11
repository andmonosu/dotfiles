{
  pkgs,
  lib,
  rustPlatform,
  fetchFromGitHub,
}:
let
  libevdi = pkgs.stdenv.mkDerivation rec {
    pname = "libevdi";
    version = "1.14.16";
    src = fetchFromGitHub {
      owner = "DisplayLink";
      repo = "evdi";
      rev = "v${version}";
      hash = "sha256-5FDXVW9SfD123g//sylGiYkFTccjVbrK27VYlphX4i4=";
    };
    nativeBuildInputs = [ pkgs.pkg-config ];
    buildInputs = [ pkgs.libdrm ];
    buildPhase = ''
      runHook preBuild
      make -C library
      runHook postBuild
    '';
    installPhase = ''
      runHook preInstall
      make -C library install PREFIX=$out
      install -Dm644 library/evdi_lib.h $out/include/evdi_lib.h
      runHook postInstall
    '';
    meta = with lib; {
      description = "Userspace library for evdi (Extensible Virtual Display Interface)";
      homepage = "https://github.com/DisplayLink/evdi";
      license = licenses.lgpl21Plus;
      platforms = platforms.linux;
    };
  };

  src = fetchFromGitHub {
    owner = "sgtaziz";
    repo = "lian-li-linux";
    rev = "v0.7.5";
    fetchSubmodules = true;
    sha256 = "sha256-1vX6sXMX20X5+UILjiWPPJ8WGsqJkgBIgHxl7KcATRU=";
  };

  frontend = pkgs.buildNpmPackage {
    pname = "lianli-gui-frontend";
    version = "0.7.5";
    inherit src;
    sourceRoot = "${src.name}/crates/lianli-gui";

    postPatch = ''
      cp ${./lianli-gui-package-lock.json} package-lock.json
    '';

    npmDepsHash = "sha256-n7I2WgHNer7bsyq6AcXWKa6E0Po2m45GQZSDgDqi+eQ=";
    npmBuildScript = "build:nocheck";

    installPhase = ''
      runHook preInstall
      cp -r dist $out
      runHook postInstall
    '';
  };
in
rustPlatform.buildRustPackage rec {
  pname = "lian-linux";
  version = "0.7.5";
  inherit src;

  cargoHash = "sha256-A1vxCQLJ8bJ81dGjZGF4EPHoXYh7e1M02vwePqlsvE0=";

  preBuild = ''
    export LIBCLANG_PATH="${pkgs.llvmPackages.libclang.lib}/lib"
    mkdir -p dist
    cp -r ${frontend}/* dist/
    substituteInPlace crates/lianli-gui/src-tauri/tauri.conf.json \
      --replace '"../dist"' '"../../../dist"'
  '';

  nativeBuildInputs = [
    pkgs.pkg-config
    pkgs.wrapGAppsHook4
    pkgs.cmake
    pkgs.nasm
    pkgs.clang
  ];

  buildInputs = [
    pkgs.glib
    pkgs.gtk3
    pkgs.webkitgtk_4_1
    pkgs.libsoup_3
    pkgs.systemd
    pkgs.ffmpeg
    libevdi
  ];

  postInstall = ''
    install -Dm644 packaging/systemd/lianli-daemon.service \
      $out/lib/systemd/user/lianli-daemon.service
    substituteInPlace $out/lib/systemd/user/lianli-daemon.service \
      --replace "/usr/bin/lianli-daemon" "$out/bin/lianli-daemon"

    install -Dm644 packaging/udev/99-lianli.rules \
      $out/lib/udev/rules.d/99-lianli.rules
    substituteInPlace $out/lib/udev/rules.d/99-lianli.rules \
      --replace "/bin/chmod" "${pkgs.coreutils}/bin/chmod"

    install -Dm644 packaging/modules-load.d/lianli-evdi.conf \
      $out/lib/modules-load.d/lianli-evdi.conf

    install -Dm644 packaging/desktop/com.sgtaziz.lianlilinux.desktop \
      $out/share/applications/com.sgtaziz.lianlilinux.desktop
  '';

  meta = with lib; {
    description = "Controlador e interfaz de Lian Li para Linux";
    homepage = "https://github.com/sgtaziz/lian-li-linux";
    license = licenses.mit;
    platforms = platforms.linux;
    mainProgram = "lianli-gui";
  };
}
