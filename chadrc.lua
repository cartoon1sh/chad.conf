vim.opt.relativenumber = true

vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

---@type ChadrcConfig
local M = {}
M.ui = {
    theme = "oceanic-next",
    transparency = true,
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
