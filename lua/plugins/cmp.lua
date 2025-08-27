require("mini.snippets").setup({})
require("blink.cmp").setup({
	fuzzy = {implementation = "lua"},
	cmdline = { enabled = false },
	snippets = {preset = 'mini_snippets'},
})
require("blink.cmp").get_lsp_capabilities()

