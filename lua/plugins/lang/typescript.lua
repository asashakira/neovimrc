vim.lsp.enable("vtsls")
vim.lsp.config("vtsls", {})
vim.lsp.enable("eslint")
vim.lsp.config("eslint", {
  settings = {
    -- Don’t let ESLint format; let Conform do it
    format = false,
    -- Important for flat config (eslint.config.js / cjs / mjs / ts)
    experimental = { useFlatConfig = true },
    -- Make root detection robust in monorepos
    workingDirectory = { mode = "auto" },
    -- Run on keystrokes (default is usually "onType", but set explicitly)
    run = "onType",
    codeAction = {
      disableRuleComment = { enable = true, location = "separateLine" },
      showDocumentation = { enable = true },
    },
    validate = "on",
  },
  on_attach = function(client, bufnr)
    -- Keep formatting with Conform only
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    -- Optional: :EslintFixAll
    vim.api.nvim_buf_create_user_command(bufnr, "EslintFixAll", function()
      vim.lsp.buf.code_action({
        context = { only = { "source.fixAll.eslint" } },
        apply = true,
      })
    end, { desc = "ESLint: Fix all problems" })
  end,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
})

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "javascript", "typescript", "tsx" } },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "vtsls",
        "prettierd",
        "eslint_d",
        "eslint-lsp",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        javascript = { "eslint_d", "prettierd" },
        typescript = { "eslint_d", "prettierd" },
        typescriptreact = { "eslint_d", "prettierd" },
      },
    },
  },
}
