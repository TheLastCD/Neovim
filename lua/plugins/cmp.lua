require("blink.cmp").setup({
	fuzzy = {implementation = "rust"},
	cmdline = { enabled = false },
})
require("blink.cmp").get_lsp_capabilities()

