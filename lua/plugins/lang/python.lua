vim.lsp.enable("ruff")
return {
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "ruff" } },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
      },
    },
  },
}
