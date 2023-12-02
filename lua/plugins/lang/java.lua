local function loadJdtls()
  local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls/"
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

  local workspace_dir = "/home/chonky/cache/jdlts/" .. project_name

  local config = {
    cmd = {
      "java",
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      "-Dlog.level=ALL",
      "-Xmx1g",
      "--add-modules=ALL-SYSTEM",
      "--add-opens",
      "java.base/java.util=ALL-UNNAMED",
      "--add-opens",
      "java.base/java.lang=ALL-UNNAMED",

      "-jar",
      vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),

      "-configuration",
      jdtls_path .. "/config_linux",

      "-data",
      workspace_dir,
    },

    root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),

    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
      java = {
        configuration = {
          runtimes = {
            {
              name = "OpenJDK-17",
              path = "/usr/lib/jvm/java-17-openjdk/",
            },
          },
        },
      },
    },

    -- Language server `initializationOptions`
    -- You need to extend the `bundles` with paths to jar files
    -- if you want to use additional eclipse.jdt.ls plugins.
    --
    -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
    --
    -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
    init_options = {
      bundles = {},
    },
  }
  require("jdtls").start_or_attach(config)
end

return {
  setup = function(mod)
    local plugin = {
      "mfussenegger/nvim-jdtls",
      ft = "java",
      config = function()
        vim.api.nvim_create_autocmd("FileType", {
          pattern = "java",
          callback = function()
            loadJdtls()
          end,
        })
      end,
    }
    table.insert(mod, plugin)
  end,
}