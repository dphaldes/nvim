local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end
--
-- local path_ok, path = pcall(require, "plenary.path")
-- if not path_ok then
-- 	return
-- end

local theta = require("alpha.themes.theta")

theta.config.layout[2] = {
	type = "text",
	val = {
		"               ▄▄██████████▄▄             ",
		"               ▀▀▀   ██   ▀▀▀             ",
		"       ▄██▄   ▄▄████████████▄▄   ▄██▄     ",
		"     ▄███▀  ▄████▀▀▀    ▀▀▀████▄  ▀███▄   ",
		"    ████▄ ▄███▀              ▀███▄ ▄████  ",
		"   ███▀█████▀▄████▄      ▄████▄▀█████▀███ ",
		"   ██▀  ███▀ ██████      ██████ ▀███  ▀██ ",
		"    ▀  ▄██▀  ▀████▀  ▄▄  ▀████▀  ▀██▄  ▀  ",
		"       ███           ▀▀           ███     ",
		"       ██████████████████████████████     ",
		"   ▄█  ▀██  ███   ██    ██   ███  ██▀  █▄ ",
		"   ███  ███ ███   ██    ██   ███▄███  ███ ",
		"   ▀██▄████████   ██    ██   ████████▄██▀ ",
		"    ▀███▀ ▀████   ██    ██   ████▀ ▀███▀  ",
		"     ▀███▄  ▀███████    ███████▀  ▄███▀   ",
		"       ▀███    ▀▀██████████▀▀▀   ███▀     ",
		"         ▀    ▄▄▄    ██    ▄▄▄    ▀       ",
		"               ▀████████████▀             ",
	},
	opts = {
		position = "center",
		hl = "Constant",
	},
}
alpha.setup(theta.config)
-- autocmd FileType alpha hi NonText guifg=bg
