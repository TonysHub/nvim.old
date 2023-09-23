local Remap = require("tonylee.keymap")
local nnoremap = Remap.nnoremap

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

nnoremap("<leader>a", mark.add_file)
nnoremap("<C-e>", ui.toggle_quick_menu)

nnoremap("<leader>1", function() ui.nav_file(1) end)
nnoremap("<leader>2", function() ui.nav_file(2) end)
nnoremap("<leader>3", function() ui.nav_file(3) end)
nnoremap("<leader>4", function() ui.nav_file(4) end)
nnoremap("<leader>5", function() ui.nav_file(5) end)
