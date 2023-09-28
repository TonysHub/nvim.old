local nnoremap = require("tonylee.keymap").nnoremap

vim.opt.termguicolors = true
require("bufferline").setup {
    options = {
        offsets = {
            {
                filetype = "NvimTree",
                text = function()
                    return vim.fn.getcwd()
                end,
                highlight = "Directory",
                text_align = "left"
            }
        }
    }
}
nnoremap("<S-h>", "<cmd>BufferLineCyclePrev<cr>")
nnoremap("<S-l>", "<cmd>BufferLineCycleNext<cr>")
