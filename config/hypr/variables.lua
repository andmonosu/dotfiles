local vars = {}

-- Preferencias de Aplicaciones
vars.terminal = "kitty"
vars.fileManager = "dolphin"
vars.menu = "hyprlauncher"

------------------
---- MONITORS ----
------------------
hl.monitor({
	output = "DP-1",
	mode = "1920x1080@144",
	position = "0x0",
	scale = "auto",
})

hl.monitor({
	output = "DP-2",
	mode = "1920x1080@60",
	position = "1920x-445",
	scale = "auto",
	transform = 3,
})

---------------
---- INPUT ----
---------------
hl.config({
	general = {
		layout = "master",
	},
	input = {
		kb_layout = "us",
		kb_variant = "intl",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,
		sensitivity = 0,

		touchpad = {
			natural_scroll = false,
		},
	},
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

hl.config({
	cursor = {
		enable_hyprcursor = true,
		no_hardware_cursors = false,
	},
})

return vars
