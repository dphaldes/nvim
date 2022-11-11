local present, ts_config = pcall(require, "nvim-treesitter.configs")
-- local rp_colors = require("rose-pine.palette")

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
	},
}

local M = {}
M.setup = function()
	ts_config.setup(config)
end

return M
