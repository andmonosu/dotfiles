hl.layer_rule({
	name = "Kitty Layer Blur",
	match = { namespace = "kitty" },
	blur = true,
})

-- 󰄬 SPOTIFY (Usa window_rule. Al aplicar opacidad, tu configuración global de blur hace el resto)
hl.window_rule({
	name = "Spotify Blur and Opacity",
	match = { class = "[Ss]potify" }, -- Captura tanto 'Spotify' como 'spotify'
	opacity = "0.85 0.85", -- 85% de opacidad enfocada e indexada
})

-- 󰄬 FIREFOX (Usa window_rule. Un pelín más opaco para asegurar la legibilidad del texto en la web)
hl.window_rule({
	name = "Firefox Blur and Opacity",
	match = { class = "[Ff]irefox" }, -- Captura tanto 'Firefox' como 'firefox'
	opacity = "0.93 0.93", -- Con 0.93 consigues el look sutil sin destrozar la lectura
})

hl.window_rule({
	name = "Vesktop Blur and Opacity",
	match = { class = "[Vv]esktop" },
	opacity = "0.85 0.85", -- Mismo nivel de opacidad excelente que Spotify
})

-- =============================================================================
-- REGLAS DEL SISTEMA
-- =============================================================================

-- Evitar maximizados no deseados
hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

-- Correcciones de arrastre XWayland
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

-- Regla de posición para comandos rápidos
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },
	move = "20 monitor_h-120",
	float = true,
})
