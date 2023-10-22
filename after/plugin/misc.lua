local Remap = require("tonylee.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local silent = { silent = true }

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
})

require("nvim-treesitter.configs").setup({
  context_commentstring = { enable = true },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
  },
  indent = {
    enable = false,
    -- disable = { "cpp", "typescript", "typescriptreact", "rust" },
  },
})

require("nvim-autopairs").setup()
-- require("nvim-surround").setup()
require("cloak").setup()
require("ccc").setup()
require("harpoon").setup()
vim.g["mkdp_markdown_css"] = vim.fn.expand("~/.config/nvim/md.css")
vim.g["mkdp_theme"] = "light"

local spectre = require("spectre")
local harpoon_ui = require("harpoon.ui")
spectre.setup()

-- keymaps

nnoremap("<leader>so", '<cmd>lua require("spectre").toggle()<CR>', silent)
vnoremap("<leader>so", spectre.open_visual)
nnoremap("<leader>u", "<Cmd>UndotreeToggle<CR>", silent)
nnoremap("<leader>gg", "<Cmd>LazyGit<CR>", silent)
nnoremap("<leader>co", "<Cmd>CccPick<CR>", silent)
nnoremap("<leader>cc", "<Cmd>CccHighlighterToggle<CR>", silent)
nnoremap("<leader>cv", "<Cmd>CccConvert<CR>", silent)

for i = 1, 10 do
  nnoremap("<leader>" .. i % 10, function() harpoon_ui.nav_file(i) end, silent)
end
