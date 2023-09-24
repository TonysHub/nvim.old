local Remap = require("tonylee.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local tnoremap = Remap.tnoremap
local vnoremap = Remap.vnoremap

local silent = { silent = true }

-- easier to enter normal mode
inoremap("<C-c>", "<Esc>")

-- built in terminal
nnoremap("<leader>t", "<Cmd>sp<CR> <Cmd>term<CR> <Cmd>resize 20N<CR> i", silent)

-- writing
nnoremap("<C-s>", "<Cmd>set spell!<CR>", silent)

-- misc
nnoremap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
nnoremap("<leader>q", "<Cmd>q<CR>")
nnoremap("<leader>w", "<Cmd>w<CR>")

-- shift current line up & down
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- append line from below
nnoremap("J", "mzJ`z")

-- move cursor up & down
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")

-- copy paste related
nnoremap("<leader>y", [["+y]])
vnoremap("<leader>y", [["+y]])

-- select all
vnoremap("<leader>g", "ggVG<CR>")
nnoremap("<leader>g", "ggVG<CR>")

-- apply formatting
nnoremap("<leader>f", vim.lsp.buf.format)

-- move through buffers
-- nnoremap("<leader>h", "<C-w><C-H>")
-- nnoremap("<leader>j", "<C-w>j<CR>")
-- nnoremap("<leader>k", "<C-w>k<CR>")
-- nnoremap("<leader>l", "<C-w>l<CR>")
