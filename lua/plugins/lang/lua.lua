vim.lsp.enable("lua_ls")
vim.lsp.config("lua_ls", {})
return {
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "lua-language-server", "stylua" } },
  },
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
