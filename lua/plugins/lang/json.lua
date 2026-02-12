return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "json" } },
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "prettierd" } },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        json = { "prettierd" },
      },
    },
  },
}
