vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.o.signcolumn = "yes"
vim.opt.termguicolors = true

-- auto install vim-plug and plugins, if not found
local data_dir = vim.fn.stdpath('data')
if vim.fn.empty(vim.fn.glob(data_dir .. '/site/autoload/plug.vim')) == 1 then
	vim.cmd('silent !curl -fLo ' .. data_dir .. '/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
	vim.o.runtimepath = vim.o.runtimepath
	vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

local vim = vim
local Plug = vim.fn['plug#']

vim.g.start_time = vim.fn.reltime()
vim.loader.enable()
vim.call('plug#begin')

Plug('ellisonleao/gruvbox.nvim', { ['as'] = 'gruvbox' }) --colorscheme
Plug('nvim-tree/nvim-web-devicons') --pretty icons
Plug('folke/which-key.nvim') --mappings popup
Plug('ibhagwan/fzf-lua') --fuzzy finder and grep
Plug('nvim-treesitter/nvim-treesitter') --syntax highlight
Plug('ron-rs/ron.vim') --ron highlighter
Plug('lewis6991/gitsigns.nvim') --git
Plug('mfussenegger/nvim-lint') --linter
Plug('neovim/nvim-lspconfig') -- lsp config
Plug('saghen/blink.cmp') --code complete
Plug('L3MON4D3/LuaSnip') --snippets
Plug('MeanderingProgrammer/render-markdown.nvim') --md renderer
Plug('numToStr/FTerm.nvim') --terminal
Plug('nvim-lualine/lualine.nvim') --Status Line
Plug('cshuaimin/ssr.nvim') -- Search and Replace
Plug('nmac427/guess-indent.nvim') -- identation
Plug('folke/persistence.nvim') -- Session Managment
Plug('rcarriga/nvim-notify')

--lsp
Plug('stevearc/conform.nvim')
Plug('mason-org/mason.nvim')
Plug('mason-org/mason-lspconfig.nvim')
Plug("zeioth/none-ls-autoload.nvim")
Plug("nvimtools/none-ls.nvim")
Plug('j-hui/fidget.nvim')



--code
Plug('nvim-telescope/telescope.nvim')
Plug('nvim-lua/plenary.nvim')
Plug('jakemason/ouroboros')

--misc



vim.call('plug#end')


require("config.mappings")
require("config.theme")
require("config.autocmd")


require("plugins.mason")
require("plugins.lsp")

vim.defer_fn(function()
		--defer non-essential configs,
		--purely for experimental purposes:
		--this only makes a difference of +-10ms on initial startup
require("plugins.fzf")
require("plugins.which-key")
require("plugins.lint")
require("plugins.cmp")
require("plugins.gitsigns")
require("plugins.treesitter")
require("plugins.md")
require("plugins.term")
require("plugins.lualine")
require("plugins.indent")
require("plugins.session")
require("plugins.conform")
require("plugins.ouroboros")
require("plugins.notify")
end, 100)
