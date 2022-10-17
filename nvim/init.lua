--[[ init.lua ]]


-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-- MISC ??
vim.opt.updatetime = 250              -- after X milliseconds of not typing swp file is created

vim.opt.foldmethod = "indent"         
vim.opt.foldenable = true

vim.api.nvim_set_option("clipboard","unnamed") -- copy to system clipboard

vim.api.nvim_set_keymap('n', '<leader>nt', ':NvimTreeToggle<Enter>', {}) -- nvim-tree

vim.api.nvim_set_keymap('n','<Leader>t',':tabnew<Enter>',{noremap = true})

vim.cmd("autocmd FileType elm inoremap <localleader>ar ->")
vim.cmd("autocmd FileType scala inoremap <localleader>ar =>")

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
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- COLORSCHEME
vim.cmd("colorscheme solarized")
vim.g.lightline = { colorscheme = "solarized", }
-- vim.opt.background = "light"

-- VIEW ORGANIZATION
vim.opt.laststatus = 2

---- windows spliting
vim.api.nvim_set_keymap('n','<Leader>hs',':sp<Enter><C-w><C-w>',{noremap = true})
vim.api.nvim_set_keymap('n','<Leader>vs',':vsp<Enter><C-w><C-w>',{noremap = true})
vim.cmd("call submode#enter_with('resize', 'n', '', '<Leader>b')")
vim.cmd("call submode#map('resize', 'n', '', 'j', ':res +3<CR>')")
vim.cmd("call submode#map('resize', 'n', '', 'k', ':res -3<CR>')")
vim.cmd("call submode#map('resize', 'n', '', 'h', ':vertical resize -3<CR>')")
vim.cmd("call submode#map('resize', 'n', '', 'l', ':vertical resize +3<CR>')")

---- tab Switching
vim.api.nvim_set_keymap('n',',','<C-w><C-w>',{noremap = true})
vim.cmd("call submode#enter_with('tab-switching', 'n', '', '<Leader><Tab>', 'gt')")
vim.cmd("call submode#map('tab-switching', 'n', '', '<Tab>', 'gt')")

-- NERDCommenter
vim.api.nvim_set_keymap('n','<Leader>\'','<Leader>c<Space>',{})
vim.api.nvim_set_keymap('v','<Leader>\'','<Leader>c<Space>',{})
vim.cmd('let g:NERDSpaceDelims = 1')
          

-- COC
vim.api.nvim_set_keymap('n','[e','<Plug>(coc-diagnostic-prev)',{})
vim.api.nvim_set_keymap('n',']e','<Plug>(coc-diagnostic-next)',{})
vim.api.nvim_set_keymap('n','<leader>rn','<Plug>(coc-rename)',{})
vim.api.nvim_set_keymap('n','gd','<Plug>(coc-definition)',{})
vim.api.nvim_set_keymap('n','gr','<Plug>(coc-references)',{})
vim.api.nvim_set_keymap('n','gi','<Plug>(coc-implementation)',{})
vim.api.nvim_set_keymap('n','gy','<Plug>(coc-type-definition)',{})
vim.api.nvim_set_keymap('n','<leader>k',':call CocActionAsync(\'doHover\')<Enter>',{})
vim.cmd( -- use <tab> for trigger completion and navigate to the next complete item
  [[
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~ '\s'
    endfunction

    inoremap <silent><expr> <Tab>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<Tab>" :
          \ coc#refresh()
  ]]
)
vim.api.nvim_set_keymap('n','<leader>qf','<Plug>(coc-fix-current)',{})
vim.cmd('autocmd BufWritePre *.elm call CocAction(\'format\')')
-- TELESCOPE
vim.api.nvim_set_keymap('n','<leader>s','<cmd>Telescope find_files<cr>',{noremap = true})
vim.api.nvim_set_keymap('n','<leader>fg','<cmd>Telescope live_grep<cr>',{noremap = true})
vim.api.nvim_set_keymap('n','<leader>fb','<cmd>Telescope buffers<cr>',{noremap = true})
vim.api.nvim_set_keymap('n','<leader>fh','<cmd>Telescope help_tags<cr>',{noremap = true})

-- GitGutter
vim.api.nvim_set_keymap('n','<leader>gs',':GitGutterStageHunk<Enter>',{noremap = true})
vim.api.nvim_set_keymap('n','<leader>gu',':GitGutterUnstageHunk<Enter>',{noremap = true})
vim.api.nvim_set_keymap('n','<leader>gp',':GitGutterPreviewHunk<Enter>',{noremap = true})

-- PLUGINS
require('plug')
require('nvim-tree').setup({
  filters = {
    dotfiles = false,
  },
  git = {
    ignore = false
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
require('telescope').load_extension('fzf')

-- https://github.com/lukas-reineke/indent-blankline.nvim
-- Indent Guides
vim.opt.list = true
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    show_end_of_line = true,
}
