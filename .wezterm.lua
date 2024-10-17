-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.default_prog = { "zsh" }
-- For example, changing the color scheme:
config.color_scheme = "catppuccin-mocha"
config.window_background_opacity = 0.5
config.enable_wayland = false
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 12
config.line_height = 1.2
config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = true
config.enable_scroll_bar = true
config.window_padding = {
	left = 0,
	right = 0,
	bottom = 0,
	top = 0,
}
wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)
-- and finally, return the configuration to wezterm
return config
