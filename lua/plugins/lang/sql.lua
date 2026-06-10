-- sqlfuff config
-- you will need a config file at the root of project
-- https://docs.sqlfluff.com/en/latest/configuration/setting_configuration.html
return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        sqlfluff = {
          args = {
            "lint",
            "--format=json",
          },
        },
      },
    },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        sql = { "sqruff" },
      }
    end,
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        sql = { "pg_format" },
      }
    }
  },
}
