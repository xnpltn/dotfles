return {
  {
    "williamboman/mason.nvim",
    opts = {
    },
  },
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,

  },
  {
    "lukas-reineke/lsp-format.nvim",
    lazy = false,
  },
}
