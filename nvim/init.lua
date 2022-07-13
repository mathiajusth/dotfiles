--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = " "
vim.g.localleader = ","

-- MISC ??
vim.opt.updatetime = 250              -- after X milliseconds of not typing swp file is created
vim.opt.foldmethod = "indent"         
vim.api.nvim_set_option("clipboard","unnamed") -- copy to system clipboard
vim.api.nvim_set_keymap('n', '<leader>nt', ':NvimTreeToggle<Enter>', {}) -- nvim-tree
-- vim.api.nvim_set_keymap('n', '<leader>nt', ':NERDTree<Enter>', {})    -- nerd-tree

vim.api.nvim_set_keymap('n', '<leader>w', ':w<Enter>', {})    -- nerd-tree

-- CONTEXT
vim.opt.number = true                 -- Show line numbers
vim.opt.scrolloff = 4                 -- Min num lines of before and after cursoe while scrolling
vim.opt.signcolumn = "yes"            
vim.opt.syntax = "ON"                -- str:  Allow syntax highlighting
vim.opt.wrap = false                


-- ENCODINGs
vim.opt.encoding = 'utf8'            -- str:  String encoding to use
vim.opt.fileencoding = 'utf8'        -- str:  File encoding to use


-- SEARCH
vim.opt.ignorecase = true        -- Ignore case in search patterns
vim.opt.smartcase = true         -- Override ignorecase if search contains capitals
vim.opt.incsearch = true         -- searchs while typing (before hitting <Enter>)
vim.opt.hlsearch = true          -- Highlight search matches
vim.api.nvim_set_keymap('n','<CR>',':noh<CR>',{noremap = true})

-- WHITESPACE
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- COLORSCHEME
vim.cmd("colorscheme solarized")
vim.g.lightline = { colorscheme = "solarized", }
-- vim.opt.background = "light"

-- VIEW ORGANIZATION
vim.opt.laststatus = 2

---- tab Switching
vim.api.nvim_set_keymap('n',',','<C-w><C-w>',{noremap = true})
vim.cmd("call submode#enter_with('tab-switching', 'n', '', '<Leader><Tab>', 'gt')")
vim.cmd("call submode#map('tab-switching', 'n', '', '<Tab>', 'gt')")

---- windows spliting
vim.api.nvim_set_keymap('n','<Leader>hs',':sp<Enter><C-w><C-w>',{noremap = true})
vim.api.nvim_set_keymap('n','<Leader>vs',':vsp<Enter><C-w><C-w>',{noremap = true})
vim.cmd("call submode#enter_with('resize', 'n', '', '<Leader>b')")
vim.cmd("call submode#map('resize', 'n', '', 'j', ':res +3<CR>')")
vim.cmd("call submode#map('resize', 'n', '', 'k', ':res -3<CR>')")
vim.cmd("call submode#map('resize', 'n', '', 'h', ':vertical resize -3<CR>')")
vim.cmd("call submode#map('resize', 'n', '', 'l', ':vertical resize +3<CR>')")

-- NERDCommenter
vim.api.nvim_set_keymap('n','<Leader>\'','<Leader>c<Space>',{})
vim.api.nvim_set_keymap('v','<Leader>\'','<Leader>c<Space>',{})
vim.cmd('let g:NERDSpaceDelims = 1')
          

-- COC
vim.api.nvim_set_keymap('n','[e','<Plug>(coc-diagnostic-prev)',{})
vim.api.nvim_set_keymap('n',']e','<Plug>(coc-diagnostic-next)',{})
-- PLUGINS
require('plug')
require("nvim-tree").setup({
  filters = {
    dotfiles = true,
  },
  hijack_cursor = true,
})
require('nvim-cursorline').setup {
  cursorline = {
    enable = true,
    timeout = 0,
    number = false,
  },
  cursorword = {
    enable = false,
    min_length = 3,
    hl = { underline = true },
  }
}
