local set = vim.opt_local
local tab = 2

set.expandtab = true
set.softtabstop = tab
set.shiftwidth = tab
set.formatoptions:append({ c = true, r = true, o = true, q = true })
