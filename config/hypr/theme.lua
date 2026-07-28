---------------------------
---- LOOK AND FEEL (THEME) ----
---------------------------

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 20,
		border_size = 2,

		-- Bordes basados en tu paleta Gris-Naranja
		["col.active_border"] = "rgba(FF8A00FF)", -- Naranja vibrante para la ventana activa
		["col.inactive_border"] = "rgba(242428FF)", -- Gris oscuro (Surface Variant) para inactivas

		resize_on_border = false,
		allow_tearing = false,
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 0.9, -- Ligera transparencia en inactivas para potenciar el blur de fondo

		shadow = {
			enabled = true,
			range = 12, -- Sombra ligeramente más amplia para dar profundidad de diseño Material
			render_power = 3,
			color = "rgba(0E0E1066)",
		},

		-- Configuración optimizada para la filosofía Blur del sistema
		blur = {
			enabled = true,
			size = 10, -- Aumentado para un desenfoque más denso y estético
			passes = 4, -- 4 pasadas aseguran suavidad total estilo "Frosted Glass"
			ignore_opacity = true, -- Crucial: Hace que el blur ignore la opacidad de la ventana y se procese siempre
			new_optimizations = true,
			xray = true,
		},
	},

	animations = {
		enabled = true,
	},
})

-- Curvas de Animación
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

-- Asignación de Animaciones
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })
