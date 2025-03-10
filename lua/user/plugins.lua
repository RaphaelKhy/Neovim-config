local fn = vim.fn

-- Install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Package Manager
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "numToStr/Comment.nvim" -- commenting
  use "kyazdani42/nvim-web-devicons" -- icons
  use {
    "kyazdani42/nvim-tree.lua", -- file explorer
    commit = "0f0f858348aacc94f98ba32880760c5a5440b825",
  }
  use "akinsho/bufferline.nvim" -- tabs
  use "moll/vim-bbye" -- deleting buffers
  use "nvim-lualine/lualine.nvim" -- statusline
  use "akinsho/toggleterm.nvim" -- toggle terminal
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"
  use "ap/vim-css-color"
  use "Pocco81/AutoSave.nvim"
  use "github/copilot.vim"

  -- Autopairs
  use "windwp/nvim-autopairs" -- brackets, etc
  use "windwp/nvim-ts-autotag" -- HTML, JSX

  -- Colorschemes
  use "lunarvim/colorschemes"
  use "lunarvim/darkplus.nvim"
  use 'marko-cerovac/material.nvim'
  use "ellisonleao/gruvbox.nvim"
  use 'navarasu/onedark.nvim'
  use 'folke/tokyonight.nvim'
  use 'rafi/awesome-vim-colorschemes'
  use 'phanviet/vim-monokai-pro'

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    commit = "2472e47e15eb56e8d6d421d7c2c7169140db2813",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then -- Put this at the end after all plugins
    require("packer").sync()
  end
end)
