-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("swaybg -i /home/andreu/Wallpapers/background.png")
	hl.exec_cmd("hyprctl setcursor Adwaita 24")

	hl.exec_cmd("dbus-update-activation-environment --systemd --all")
	hl.exec_cmd("systemctl --user import-environment --all")

	-- Arranca Quickshell una vez el entorno está 100% clonado
	hl.exec_cmd("systemctl --user start quickshell")
	hl.exec_cmd("openrgb --startminimized")

	-- Exportar variables de entorno para Spotify con Spicetify
	hl.exec_cmd("export __SPICETIFY_DIRS_APPEND=1")
	hl.exec_cmd("export XDG_CURRENT_DESKTOP=Hyprland")
	hl.exec_cmd("export XDG_SESSION_DESKTOP=Hyprland")
	hl.exec_cmd('export __SPICETIFY_CONFIG="$HOME/.config/spicetify"')
	hl.exec_cmd('export __SPICETIFY_STATE="$HOME/.local/state/spicetify"')
end)
