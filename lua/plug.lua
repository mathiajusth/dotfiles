--[[ lua/plug.lua ]]

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

      use 'nvim-treesitter/nvim-treesitter' -- TODO: Don't forget to run `:TSInstall all` after installation of the plugins

      use { -- TODO check githun and `:checkhealth telescope` for dependencies and install them
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons'}
      }

      use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

      use 'airblade/vim-gitgutter'

      -- https://github.com/jwoudenberg/elm-pair/issues/23
      -- use {'jwoudenberg/elm-pair', rtp = 'editor-integrations/neovim'}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins.
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
