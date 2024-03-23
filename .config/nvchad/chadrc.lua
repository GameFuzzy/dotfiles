---@type ChadrcConfig
local M = {}
M.ui = {
	theme = "solarized_dark",
	transparency = true,
	term = {
		enabled = false,
	},
}
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")
return M
