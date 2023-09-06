local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local workspace_dir = "/home/chonky/cache/jdlts/" .. project_name

local config = {
  cmd = { "/path/to/jdt-language-server/bin/jdtls" },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
}
-- require("jdtls").start_or_attach(config)
