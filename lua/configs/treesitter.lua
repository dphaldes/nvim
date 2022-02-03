local present, ts_config = pcall(require, "nvim-treesitter.configs")
local rp_colors = require("rose-pine.palette")

if not present then
	return
end

local config = {
	highlight = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
		colors = {
			rp_colors.love,
			rp_colors.gold,
			rp_colors.rose,
			rp_colors.pine,
			rp_colors.foam,
			rp_colors.iris,
		},
	},
}

local M = {}
M.setup = function()
	ts_config.setup(config)
end

return M
