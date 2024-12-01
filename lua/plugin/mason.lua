return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        registries = {
          "github:nvim-java/mason-registry",
          "github:mason-org/mason-registry",
          "file:/home/chonky/.config/nvim/mason",
        },
      },
      config = function(opts)
        require("mason").setup(opts)
        require("mason-lspconfig").setup()
      end,
    },
  },
}
