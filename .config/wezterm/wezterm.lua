local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

config.font_size = 20
config.color_scheme_dirs = { "$HOME/.config/wezterm/colors/" }
config.color_scheme = "Selenized Dark"
config.window_background_opacity = 0.9
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

-- Spawn a fish shell in login mode
config.default_prog = { "/opt/homebrew/bin/fish" }

config.keys = {
	-- Unbind defaults
	{
		key = "n",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},
	---------------

	{ key = "e", mods = "CMD", action = act.SendString('\x00"') }, -- split tmux window vertically
	{ key = "e", mods = "CMD|SHIFT", action = act.SendString("\x00%") }, -- split tmux window horizontally
	{ key = "f", mods = "CMD", action = act.SendString("lfcd\n") }, -- open file manager 'gokcehan/lf'
	{ key = "f", mods = "CMD|SHIFT", action = act.SendString("\x00\x5b\x2f") }, -- start tmux search mode
	{ key = "g", mods = "CMD", action = act.SendString("\x00g") }, -- open git manager 'jesseduffield/lazygit'
	{ key = "s", mods = "CMD", action = act.SendString("\x00\x54") }, -- open t - tmux smart session manager
	{ key = "p", mods = "CMD", action = act.SendString("\x00L") }, -- switch to the last tmux session
	{ key = "o", mods = "CMD", action = act.SendString("\x00u") }, -- open URLs 'joshmedeski/tmux-fzf-url'
	{ key = "t", mods = "CMD", action = act.SendString("\x00c") }, -- create a new tmux window
	{ key = "w", mods = "CMD", action = act.SendString("\x00x") }, -- kill the current pane
	{ key = "z", mods = "CMD", action = act.SendString("\x00z") }, -- toggle zoom state of the current tmux pane
	{ key = "Tab", mods = "CTRL", action = act.SendString("\x00n") }, -- switch to next tmux window
	{ key = ".", mods = "CTRL", action = act.SendString("\x00p") }, -- switch to previous tmux window
	{ key = ",", mods = "CMD", action = act.SendString("\x00,") }, -- rename the current tmux window
	{ key = "[", mods = "CMD", action = act.SendString("\x00p") }, -- switch to next tmux window
	{ key = "]", mods = "CMD", action = act.SendString("\x00n") }, -- switch to previous tmux window
	{ key = ";", mods = "CMD", action = act.SendString("\x00:") }, -- enter the tmux command prompt
	{ key = "1", mods = "CMD", action = act.SendString("\x001") }, -- select tmux window 1
	{ key = "2", mods = "CMD", action = act.SendString("\x002") }, --                ... 2
	{ key = "3", mods = "CMD", action = act.SendString("\x003") }, --                ... 3
	{ key = "4", mods = "CMD", action = act.SendString("\x004") }, --                ... 4
	{ key = "5", mods = "CMD", action = act.SendString("\x005") }, --                ... 5
	{ key = "6", mods = "CMD", action = act.SendString("\x006") }, --                ... 6
	{ key = "7", mods = "CMD", action = act.SendString("\x007") }, --                ... 7
	{ key = "8", mods = "CMD", action = act.SendString("\x008") }, --                ... 8
	{ key = "9", mods = "CMD", action = act.SendString("\x009") }, --                ... 9

	-- vim bindings for switching between panes
	{
		key = "h",
		mods = "CMD",
		action = act.Multiple({
			act.SendKey({ key = "w", mods = "CTRL" }),
			act.SendKey({ key = "h", mods = "CTRL" }),
		}),
	},
	{
		key = "j",
		mods = "CMD",
		action = act.Multiple({
			act.SendKey({ key = "w", mods = "CTRL" }),
			act.SendKey({ key = "j", mods = "CTRL" }),
		}),
	},
	{
		key = "k",
		mods = "CMD",
		action = act.Multiple({
			act.SendKey({ key = "w", mods = "CTRL" }),
			act.SendKey({ key = "k", mods = "CTRL" }),
		}),
	},
	{
		key = "l",
		mods = "CMD",
		action = act.Multiple({
			act.SendKey({ key = "w", mods = "CTRL" }),
			act.SendKey({ key = "l", mods = "CTRL" }),
		}),
	},
}

return config
