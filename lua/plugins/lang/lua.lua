vim.lsp.enable("lua_ls")
vim.lsp.config("lua_ls", {})
return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
      },
    },
  },
}
