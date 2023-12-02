return {
  setup = function(mod)
    local plugin = {
      "Civitasv/cmake-tools.nvim",
      ft = "cmake, cpp",
      opts = {
        cmake_build_directory = "build/${variant:buildType}",
      },
    }
    table.insert(mod, plugin)
  end,
}