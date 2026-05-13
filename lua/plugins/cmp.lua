require("mini.snippets").setup({})
require("blink.cmp").setup({
	keymap = {
		["<Down>"] = {},
		["<Up>"] = {},
		['<C-k>'] = { 'select_next' },
		['<C-j>'] = { 'select_prev' },
	},
	fuzzy = { implementation = "lua" },
	cmdline = { enabled = false },
	snippets = { preset = "mini_snippets" },
})
require("blink.cmp").get_lsp_capabilities()
