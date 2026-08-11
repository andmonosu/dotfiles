{ pkgs, ... }:
{
  gtk = {
    enable = true;

    gtk3.enable = true;
    gtk4.enable = true;
  };

  home.packages = with pkgs; [
    glib
    gsettings-desktop-schemas
    adwaita-icon-theme
    adw-gtk3
  ];
}
