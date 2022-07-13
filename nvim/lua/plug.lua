local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  } print("Installing packer. Close and reopen Neovim...") vim.cmd [[packadd packer.nvim]] end
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print("Couldn't require `packer`")
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function ()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


-- ====Install your plugins here====
return packer.startup(function(use)
      use "wbthomason/packer.nvim" -- plugin manager

      use "altercation/vim-colors-solarized"

      use 'kana/vim-submode'

      -- use 'preservim/nerdtree'
      use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
      }

      use 'mhinz/vim-startify' -- TODO learn to use

      use 'yamatsum/nvim-cursorline'

      use 'preservim/nerdcommenter'

      use "ryanoasis/vim-devicons" -- after plugins that use it (nerdtree)

      use {'neoclide/coc.nvim', branch = 'release'}
  -- === Yura's plugins ===
      ---- fonts

      ---- Send stuff to REPL 
      --use "jpalardy/vim-slime"

      -- use "kyazdani42/nvim-web-devicons" -- optional, for file icons

      ---- completion plugins
      --use "hrsh7th/nvim-cmp" -- The completion plugin
      --use "hrsh7th/cmp-buffer" -- buffer completions
      --use "hrsh7th/cmp-path" -- path completions
      --use "hrsh7th/cmp-cmdline" -- cmdline completions
      --use "saadparwaiz1/cmp_luasnip" -- snippet completions
      --use "hrsh7th/cmp-nvim-lsp" -- LSP completion

      ---- snippets
      --use "L3MON4D3/LuaSnip" --snippet engine
      --use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

      ---- Language Server Protocol
      ---- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
      --use "neovim/nvim-lspconfig" -- enable LSP
      ---- TODO: Maybe remove?
      ---- -- this is for scala (compatible with `nvim-lspconfig`)
      ---- use {
      ----   -- see https://github.com/scalameta/nvim-metals
      ----   "scalameta/nvim-metals",
      ----   requires = { "nvim-lua/plenary.nvim" },
      ---- }

      ---- File explorer
      --use {
      --  "kyazdani42/nvim-tree.lua",
      --  requires = { "kyazdani42/nvim-web-devicons" },
      --}

      ---- Comments
      --use "tpope/vim-commentary" -- Easy comments (gcc). This is used in combination with the `nvim-ts-context-commentstring` plugin

      ---- Tree-sitter
      ---- TODO: Don't forget to run `:TSInstall all` after installation of the plugin
      --use "nvim-treesitter/nvim-treesitter" -- This is configured in `./treesitter.lua`

      ---- Fuzzy Finder
      --use "nvim-telescope/telescope.nvim"

      ---- statsline/tabline
      ---- use "itchyny/lightline.vim"

      ---- Start screen
      --use {
      --  "goolord/alpha-nvim",
      --  requires = { "kyazdani42/nvim-web-devicons" },
      --  config = function ()
      --      require("alpha").setup(require("alpha.themes.startify").config)
      --  end
      --}

      ---- HTML/CSS
      --use "mattn/emmet-vim" -- HTML and CSS speed coding.

      ---- LaTeX
      --use "LaTeX-Box-Team/LaTeX-Box" -- Lightweight toolbox for LaTeX.

      ---- Markdown rendering server
      ----  Run :LivedownPreview (to kill it :LivedownKill)
      ----  or :LivedownToggle
      ----  TODO: Don't forget ot `npm install -g livedown`
      --use "shime/vim-livedown"

      ---- Viewing binaries
      --use "fidian/hexmode" -- hex/binary viewer. Just write :Hexmode
  -- === Yura's plugins ===


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins.
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
