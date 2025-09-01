-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- set colorscheme
vim.cmd.colorscheme("tokyonight")

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

local set = vim.opt

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  set.clipboard = "unnamedplus"
end)

-- Enable auto write
set.autowrite = true

-- tabs
set.expandtab = true
set.shiftwidth = 2
set.tabstop = 2

-- Enable break indent
set.breakindent = true

-- Disable line wrap
set.wrap = false

-- column
set.number = true
set.relativenumber = true

-- Keep signcolumn on by default
set.signcolumn = "yes"

-- Don't show the mode, since it's already in the status line
set.showmode = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
set.ignorecase = true
set.smartcase = true

-- mouse
vim.o.mouse = "a"

-- cursor
set.guicursor = ""
set.cursorline = true

-- Save undo history
set.undofile = true

-- so we can actually see
vim.o.scrolloff = 10
vim.o.sidescrolloff = 10

-- Enables 24-bit RGB color in the TUI
vim.o.termguicolors = true

-- Decrease update time
set.updatetime = 250

-- Decrease mapped sequence wait time
set.timeoutlen = 300

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
set.confirm = true

set.fileformats = { "unix", "dos" }
