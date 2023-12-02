local M = {}

require("plugins.lang.java").setup(M)
require("plugins.lang.cpp").setup(M)
require("plugins.lang.rust").setup(M)

return M