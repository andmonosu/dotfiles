{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [ ./hardware-configuration.nix ];

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    initrd.kernelModules = [ "amdgpu" ];
    kernelModules = [
      "i2c-dev"
      "i2c-piix4"
    ];
  };

  networking = {
    hostName = "andreu";
    networkmanager.enable = true;
  };

  services.getty.autologinUser = "andreu";

  time.timeZone = "Europe/Madrid";

  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    hardware.openrgb.enable = true;
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        libva-utils
        libva-vdpau-driver
        libvdpau-va-gl
      ];
    };
    amdgpu.opencl.enable = true;
  };

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    };
    zsh.enable = true;
    steam = {
      enable = true;
      extraCompatPackages = with pkgs; [ proton-ge-bin ];
    };
    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };

  # xdg.portal = {
  #   enable = true;
  #   extraPortals = with pkgs; [
  #     xdg-desktop-portal-hyprland
  #     xdg-desktop-portal-gtk
  #   ];
  # };

  environment = {
    systemPackages = with pkgs; [
      vim
      wget
      kitty
      git
      swaybg
      quickshell
      openrgb-with-all-plugins
    ];

    variables = {
      NIXOS_OZONE_WL = "1";
      QML2_IMPORT_PATH = "${pkgs.quickshell}/lib/qt-6/qml";
      QT_QPA_PLATFORM = "wayland";
      QT_QPA_PLATFORMTHEME = "xdgdesktopportal";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      __SPICETIFY_DIRS_APPEND = "1";
    };

    sessionVariables = {
      VDPAU_DRIVER = "radeonsi";
      LIBVA_DRIVER_NAME = "radeonsi";
    };

    shellAliases = {
      ll = "ls -l";
      edit = "sudo -e";
      btw = "echo I use nixos, btw";
      nrs = "sudo nixos-rebuild switch --flake ~/dotfiles#andreu && hyprctl reload";
      vim = "nvim";
    };
  };

  users.users.andreu = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "openrgb"
      "video"
      "input"
      "plugdev"
      "i2c"
    ];
    packages = with pkgs; [ tree ];
    shell = pkgs.zsh;
  };

  systemd.user.services.quickshell = {
    description = "Quickshell desktop component service";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    after = [
      "graphical-session.target"
      "xdg-desktop-portal.service"
      "xdg-desktop-portal-hyprland.service"
    ];
    path = with pkgs; [
      bash
      coreutils
      procps
      gnugrep
      gnused
      networkmanager
      xdg-utils
      systemd
    ];
    environment.PATH = lib.mkForce "/etc/profiles/per-user/andreu/bin:/run/current-system/sw/bin:/home/andreu/.nix-profile/bin:$PATH";
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.quickshell}/bin/quickshell";
      Restart = "on-failure";
      RestartSec = 1;
      StandardOutput = "append:/home/andreu/quickshell.log";
      StandardError = "append:/home/andreu/quickshell.log";
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "26.05";
}
