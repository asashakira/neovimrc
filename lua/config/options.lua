-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local tabs = 4

-- tabs indents
vim.o.tabstop = tabs
vim.o.softtabstop = tabs
vim.o.shiftwidth = tabs
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false

-- column
vim.o.number = true
vim.o.relativenumber = true
-- vim.o.colorcolumn = "80"
vim.o.signcolumn = "yes"

-- search
vim.o.hlsearch = false
vim.o.incsearch = true

-- mouse and cursor
vim.o.mouse = "a"
vim.o.guicursor = ""
vim.o.cursorline = true

-- buffers files windows splits
vim.o.swapfile = false
vim.o.backup = false
vim.o.hidden = true
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

-- so we can actually see
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

vim.o.guifont = "Hack Nerd Font:h21"

vim.o.helpheight = 999 -- full screen help
vim.o.clipboard = "unnamedplus" -- access system clipboard
vim.o.termguicolors = true -- more colors

vim.o.updatetime = 50

vim.o.conceallevel = 0 -- don't hide my json strings

vim.g.mapleader = " "

vim.g.autoformat = false -- don't auto format
