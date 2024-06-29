return {
{
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "html-lsp",
        "templ",
        "htmx-lsp",
        "typescript-language-server",
        "rust-analyzer",
        "tailwindcss-language-server",
        "clangd",
        "vue-language-server",
        "haskell-language-server",
        "sqls",
      },
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
    lazy= false,
  },
}
