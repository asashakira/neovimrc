return {
  "stevearc/conform.nvim",
  lazy = true,
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ timout_ms = 10000 })
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
  },
  opts = {
    default_format_opts = {
      timout_ms = 10000,
      async = false,
      quiet = false,
      lsp_format = "fallback",
    },
    formatters_by_ft = {},
  },
}
