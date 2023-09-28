local nnoremap = require("tonylee.keymap").nnoremap

vim.opt.termguicolors = true
require("bufferline").setup{}
nnoremap("<S-h>", "<cmd>BufferLineCyclePrev<cr>")
nnoremap("<S-l>", "<cmd>BufferLineCycleNext<cr>")
