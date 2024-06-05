-- Pull in the wezterm API
local wezterm = require("wezterm")
-- local mux = wezterm.mux

-- wezterm.on("gui-startup", function()
-- 	local tab, pane, window = mux.spawn_window({})
-- 	window:gui_window():maximize()
-- end)

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- config.default_prog = {
-- 	"/bin/zsh",
-- 	"-l",
-- 	"-c",
-- 	"yazi",
-- }

-- This is where you actually apply your config choices
config.font = wezterm.font("VictorMono Nerd Font Mono")
config.font_size = 16

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

config.skip_close_confirmation_for_processes_named = {
	"bash",
	"sh",
	"zsh",
	"fish",
	"tmux",
	"nu",
	"cmd.exe",
	"pwsh.exe",
	"powershell.exe",
	"yazi",
}

config.window_decorations = "RESIZE"
config.window_padding = {
	left = 4,
	right = 4,
	top = 4,
	bottom = 4,
}

config.keys = {
	-- Turn off the default CMD-m Hide action, allowing CMD-m to
	-- be potentially recognized and handled by the tab
	-- {
	-- 	key = "p",
	-- 	mods = "CTRL|SHIFT",
	-- 	action = wezterm.action.ActivateTabRelative(-1),
	-- },
	-- {
	-- 	key = "n",
	-- 	mods = "CTRL|SHIFT",
	-- 	action = wezterm.action.ActivateTabRelative(1),
	-- },
	-- {
	-- 	key = "t",
	-- 	mods = "CTRL|SHIFT",
	-- 	action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	-- },
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "s",
		mods = "CTRL|SHIFT",
		action = wezterm.action.QuickSelect,
	},
	{
		key = "|",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "_",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
}

config.color_scheme = "Tokyo Night"
-- config.window_background_image = '/path/to/wallpaper.jpg'

-- and finally, return the configuration to wezterm
return config
