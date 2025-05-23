-- 自动安装packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- 保存此文件就自动更新安装插件
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd  BufWritePost plugins-setup.lua source <afile> | PackerSync
	augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- My plugins here
  use 'folke/tokyonight.nvim'
  use {
	'nvim-lualine/lualine.nvim', -- 状态栏
	requires = {'kyazdani42/nvim-web-devicons', opt = true} -- 状态栏图标
  }
  use {
	'nvim-tree/nvim-tree.lua',
  	requires = {
    		'nvim-tree/nvim-web-devicons', -- 图标
  	},
  }
  use("christoomey/vim-tmux-navigator") -- 用ctrl-hjkl 来定位窗口
  use("nvim-treesitter/nvim-treesitter") -- 语法高亮
  use 'HiPhish/rainbow-delimiters.nvim' -- 配合treesitter实现括号的匹配

  -- LSP
  use {
	  "williamboman/mason.nvim",
	  "williamboman/mason-lspconfig.nvim",
	  "neovim/nvim-lspconfig"
  }

  -- 自动补全
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "L3MON4D3/LuaSnip" -- snippets引擎，不装这个自动补全会出问题
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"
  use "hrsh7th/cmp-path" -- 文件路径

  use "windwp/nvim-autopairs" -- 自动补全括号

  use "akinsho/bufferline.nvim" -- buffer分割线
  use "lewis6991/gitsigns.nvim" -- 左则git提示

  -- 文件检索
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
