return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      "nvim-telescope/telescope-fzf-native.nvim",

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = "make",

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  opts = function()
    -- Enable Telescope extensions if they are installed
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    local builtin = require("telescope.builtin")

    local custom_find_files = function()
      builtin.find_files({ find_command = {"rg", "--files", "--hidden", "--glob", "!.git/*"} })
    end

    vim.keymap.set("n", "<leader><space>", custom_find_files, { desc = "Find Files" })
    vim.keymap.set(
      "n",
      "<leader>,",
      "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
      { desc = "Switch Buffer" }
    )

    -- find
    vim.keymap.set("n", "<leader>ff", custom_find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
    vim.keymap.set("n", "<leader>fc", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "Find Config File" })

    -- git
    vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "commits" })
    vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "status" })

    -- search
    vim.keymap.set("n", "<leader>sa", "<cmd>Telescope autocommands<cr>", { desc = "[S]earch [A]uto Commands" })
    vim.keymap.set("n", "<leader>sc", "<cmd>Telescope command_history<cr>", { desc = "[S]earch [C]ommand History" })
    vim.keymap.set("n", "<leader>sC", "<cmd>Telescope commands<cr>", { desc = "[S]earch [C]ommands" })
    vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
    vim.keymap.set("n", "<leader>so", builtin.vim_options, { desc = "[S]earch Vim [O]ptions" })
    vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
    vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
    vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
    vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })

    vim.keymap.set("n", "<leader>/", function()
      builtin.current_buffer_fuzzy_find({
        previewer = false,
      })
    end, { desc = "[/] Fuzzily search in current buffer" })

    return {
      pickers = {
        find_files = {
          theme = "ivy",
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
        fzf = {},
      },
    }
  end,
}
