-- Entrypoint principal para Hyprland en Lua
-- Ubicación sugerida: ~/.config/hypr/hyprland.lua

-- 1. Cargar variables globales y configuraciones de hardware primarias
_G.env = require("env")
_G.vars = require("variables")

-- 2. Cargar aspecto visual y comportamiento de ventanas
require("theme")
require("layouts")
require("windows-rules")

-- 3. Entorno operativo (Binds y procesos en segundo plano)
require("autostart")
require("bindings")
require("workspaces")
