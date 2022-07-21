local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use("shaunsingh/nord.nvim")
	use("kwsp/halcyon-neovim")

	use("xiyaowong/nvim-transparent")

	use("rainbowhxch/beacon.nvim")

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"David-Kunz/cmp-npm",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
	})

	use({
		"neovim/nvim-lspconfig",
		"williamboman/nvim-lsp-installer",
		"SmiteshP/nvim-navic",
		{ "glepnir/lspsaga.nvim", branch = "main" },
		{
			"jose-elias-alvarez/null-ls.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
			},
		},
	})

	use({
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
	})

	use("David-Kunz/jester")

	use({
		{
			{
				"nvim-telescope/telescope.nvim",
				requires = {
					"nvim-lua/plenary.nvim",
				},
			},
			"nvim-telescope/telescope-ui-select.nvim",
		},
		{
			"nvim-telescope/telescope-media-files.nvim",
			requires = {
				"nvim-lua/popup.nvim",
			},
		},
	})

	use({
		{
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		},
		"p00f/nvim-ts-rainbow",
		"windwp/nvim-ts-autotag",
	})

	use("rcarriga/nvim-notify")

	use({
		"simrat39/rust-tools.nvim",
		{
			"saecki/crates.nvim",
		},
	})

	use("napmn/react-extract.nvim")

	use("windwp/nvim-autopairs")

	use("kylechui/nvim-surround")

	use({
		"numToStr/Comment.nvim",
		"JoosepAlviste/nvim-ts-context-commentstring",
	})

	use("norcalli/nvim-colorizer.lua")

	use({
		"lewis6991/gitsigns.nvim",
		"akinsho/git-conflict.nvim",
	})

	use({
		"kyazdani42/nvim-tree.lua",
		"kyazdani42/nvim-web-devicons",
	})

	use({
		{
			"akinsho/bufferline.nvim",
			tag = "*",
			requires = "kyazdani42/nvim-web-devicons",
		},
		"famiu/bufdelete.nvim",
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})

	use("lukas-reineke/indent-blankline.nvim")

	use("yamatsum/nvim-cursorline")

	use("simrat39/symbols-outline.nvim")

	use("akinsho/toggleterm.nvim")

	use("ahmedkhalf/project.nvim")

	use("lewis6991/impatient.nvim")

	use({
		"goolord/alpha-nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})

	use("folke/which-key.nvim")

	use("ellisonleao/glow.nvim")

	use({ "phaazon/hop.nvim" })

	use("karb94/neoscroll.nvim")

	use({ "kevinhwang91/nvim-hlslens" })

	use({
		"anuvyklack/pretty-fold.nvim",
		{
			"anuvyklack/fold-preview.nvim",
			requires = "anuvyklack/nvim-keymap-amend",
		},
	})

	use("mizlan/iswap.nvim")

	use("nacro90/numb.nvim")

	use({
		"bennypowers/nvim-regexplainer",
		requires = {
			"nvim-treesitter/nvim-treesitter",
			"MunifTanjim/nui.nvim",
		},
	})

	use({
		"potamides/pantran.nvim",
	})

	use("Mofiqul/trld.nvim")

	use("j-hui/fidget.nvim")

	use("aserowy/tmux.nvim")

	use("stevearc/dressing.nvim")

	use("stevearc/aerial.nvim")

	use("folke/zen-mode.nvim")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
