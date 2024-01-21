-- auto install packer if not installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
      vim.cmd([[packadd packer.nvim]])
      return true
    end
    return false
  end
  local packer_bootstrap = ensure_packer() -- true if packer was just installed

  require('packer').reset()
 require('packer').init({
    compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'solid' })
      end,
    },
  })
  
  -- autocommand that reloads neovim and installs/updates/removes plugins
  -- when file is saved
  vim.cmd([[ 
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]])
  
  -- import packer safely
  local status, packer = pcall(require, "packer")
  if not status then
    return
  end

  local use = require('packer').use

  -- Packer can manage itself.
  use('wbthomason/packer.nvim')

  -- Theme
  use('Mofiqul/dracula.nvim')
  use ( 'DanilaMihailov/beacon.nvim' )              -- cursor jump
  use({
  'nvim-lualine/lualine.nvim',
  main = "ibl",
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('user/plugins/lualine')
  end,
})

  -- Commenting support.
use('tpope/vim-commentary')

-- Add, change, and delete surrounding text.
use('tpope/vim-surround')

-- Useful commands like :Rename and :SudoWrite.
use('tpope/vim-eunuch')

-- Pairs of handy bracket mappings, like [b and ]b.
use('tpope/vim-unimpaired')

-- Indent autodetection with editorconfig support.
use('tpope/vim-sleuth')

-- Allow plugins to enable repeating of commands.
use('tpope/vim-repeat')

-- Display buffers as tabs.
use({
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    after = 'dracula.nvim',
    config = function()
      require('user/plugins/bufferline')
    end,
  })
  
  -- Display indentation lines.
  use({
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('user/plugins/indent-blankline')
    end,
  })

  -- Fuzzy finder
use({
  'nvim-telescope/telescope.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
    'nvim-telescope/telescope-live-grep-args.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  },
  config = function()
    require('user/plugins/telescope')
  end,
})

  -- autocompletion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  use("neovim/nvim-lspconfig") -- easily configure language servers
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  }) -- enhanced lsp uis
  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

  -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

  -- treesitter configuration
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  -- Automatically create parent dirs when saving.
  use('jessarcher/vim-heritage')

  -- File tree sidebar
  use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('user/plugins/nvim-tree')
    end,
  }) 


  if packer_bootstrap then
    require("packer").sync()
  end
