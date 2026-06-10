vim.lsp.config("gopls", {
  settings = {
    gopls = {
      buildFlags = { "-tags=integration" },
    },
  },
})
vim.lsp.enable("gopls")
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "go", "gomod", "gowork", "gosum" } },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofumpt" },
      },
    },
  },
}
