vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
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


--UI & popups
Plug('ellisonleao/gruvbox.nvim', { ['as'] = 'gruvbox' }) --colorscheme
Plug('nvim-tree/nvim-web-devicons') --pretty icons
Plug('folke/which-key.nvim') --mappings popup
Plug('ibhagwan/fzf-lua') --fuzzy finder and grep
Plug('L3MON4D3/LuaSnip') --snippets
Plug('rcarriga/nvim-notify') --better Notifcation bubbles
Plug('MeanderingProgrammer/render-markdown.nvim') --md renderer
Plug('numToStr/FTerm.nvim') --terminal
Plug('nvim-lualine/lualine.nvim') --Status Line
Plug('gelguy/wilder.nvim') --Better WildMenu
Plug('j-hui/fidget.nvim') --UI for LSP Progress

--highlighting
Plug('nvim-treesitter/nvim-treesitter') --syntax highlight
Plug('ron-rs/ron.vim') --ron highlighter


--lsp & Linting
Plug('stevearc/conform.nvim')
Plug('mason-org/mason.nvim')
Plug('mason-org/mason-lspconfig.nvim')
Plug("zeioth/none-ls-autoload.nvim")
Plug("nvimtools/none-ls.nvim")
Plug('mfussenegger/nvim-lint') --linter
Plug('neovim/nvim-lspconfig') -- lsp config
Plug('saghen/blink.cmp') --code complete
Plug('echasnovski/mini.snippets') -- snippets
Plug('windwp/nvim-autopairs') -- auto insert {} and ''
Plug('dmmulroy/tsc.nvim')
Plug('dmmulroy/ts-error-translator.nvim')
--code
Plug('nvim-telescope/telescope.nvim')
Plug('nmac427/guess-indent.nvim') -- identation
Plug('nvim-lua/plenary.nvim') --better API Stuff
Plug('jakemason/ouroboros') --header fdile finder
Plug('karshPrime/tmux-compile.nvim') --custom compile setup

--AI
-- Plug('github/copilot.vim')
Plug('zbirenbaum/copilot.lua')
Plug('CopilotC-Nvim/CopilotChat.nvim')

--misc
Plug('lewis6991/gitsigns.nvim') --git
Plug('cshuaimin/ssr.nvim') -- Search and Replace
Plug('folke/persistence.nvim') -- Session Managment
Plug('esensar/nvim-dev-container') -- Dev container support
Plug('fei6409/log-highlight.nvim') -- log highlighting
Plug('alec-gibson/nvim-tetris') --tetris ;)



--Custom Plugins/local paths
-- Plug('TheLastCD/simple-note.nvim')
local local_plugin_path = vim.fn.expand('~/git/personal/simple-note.nvim')
vim.opt.runtimepath:append(local_plugin_path)


vim.call('plug#end')


require("config.mappings")
require("config.theme")
require("config.autocmd")

require("plugins.mason")
require("plugins.lsp")
require("plugins.devContainer")

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
require("plugins.autopair")
require("plugins.wilder")
require("plugins.notes")
require("plugins.copilot")
require("plugins.compile")
end, 100)
