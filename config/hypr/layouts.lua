------------------
---- LAYOUTS ----
------------------

hl.config({
	-- Configuración para tu monitor Horizontal
	master = {
		new_status = "slave", -- SOLUCIÓN: Las nuevas ventanas van al lateral (lista de esclavos)
		special_scale_factor = 0.8,
		mfact = 0.55, -- El Master ocupa el 55% de la pantalla
	},

	-- Configuración para tu monitor Vertical
	dwindle = {
		preserve_split = true,
		force_split = 2, -- SOLUCIÓN: Fuerza el split hacia abajo (apila ventanas verticalmente)
	},

	scrolling = {
		fullscreen_on_one_column = true,
	},
})
