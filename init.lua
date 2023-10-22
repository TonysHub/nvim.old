vim.g.mapleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.loader.enable()

require("tonylee")
require("notify").setup({
  background_colour = "#000000",
})
-- -- vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd([[colorscheme gruvbox-material]])
