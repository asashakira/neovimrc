return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim", config = function() end },

      -- Useful status updates for LSP.
      { "j-hui/fidget.nvim", opts = {} },

      -- Allows extra capabilities provided by blink.cmp
      "saghen/blink.cmp",
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    opts = function()
      local ret = {
        ui = {
          window = {
            default_options = {
              border = "rounded",
            },
          },
        },
      }
      return ret
    end,
    config = function()
    end,
  },
  {

    "mason-org/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "shfmt",
      },
    },
    --   ---@param opts MasonSettings | {ensure_installed: string[]}
    --   config = function(_, opts)
    --     require("mason").setup(opts)
    --     local mr = require("mason-registry")
    --     mr:on("package:install:success", function()
    --       vim.defer_fn(function()
    --         -- trigger FileType event to possibly load this newly installed LSP server
    --         require("lazy.core.handler.event").trigger({
    --           event = "FileType",
    --           buf = vim.api.nvim_get_current_buf(),
    --         })
    --       end, 100)
    --     end)
    --
    --     mr.refresh(function()
    --       for _, tool in ipairs(opts.ensure_installed) do
    --         local p = mr.get_package(tool)
    --         if not p:is_installed() then
    --           p:install()
    --         end
    --       end
    --     end)
    --   end,
  },
}
