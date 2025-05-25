local map = vim.keymap.set

-- open netrw
map("n", "<leader>e", "<cmd>Oil<cr>", { desc = "oil" })

map("n", "<leader>xx", "<cmd>source %<cr>")

-- keep cursor centered
map("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
map("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- LSP
map("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
map("n", "gr", vim.lsp.buf.references, { desc = "References" })
map("n", "<leader>cd", function()
  vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "Line Diagnostics" })
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "K", function()
  vim.lsp.buf.hover({ border = "rounded" })
end, { desc = "Hover" })

-- wtf is <C-\><C-n>
map("t", "<esc><esc>", "<C-\\><C-n>")
