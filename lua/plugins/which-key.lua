local wk = require("which-key")
wk.add({
{ "<leader>f", desc = "fzf" },
{ "<leader>g", desc = "grep" },
{ "<leader>w", desc = "write" },
{ "<leader>q", desc = "Attach Session" },
--{ "<leader>Q", desc = "close buf!" },
{ "<leader>U", desc = "close ALL buf" },
{ "<leader>nn", desc = "toggle relative nums" },
{ "<leader>F", desc = "fzf opts" },
{ "<leader><leader>", desc = "open buffers"},
--fzf opts
{"<leader>Ff", desc = "Search Above"},
{"<leader>Fr", desc = "Resume Search"},
{"<leader>Fh", desc = "Search Home"},
{"<leader>Fl", desc = "Search nvim"},
{ "<leader>Fg", desc = "Grep" },

-- code
{"<leader>c", desc = "Code actions"},
{"<leader>cf", desc = "Code Format"},
{"<leader>cl", desc = "Code Lint"},
{"<leader>ch", desc = "Code Goto Header"},

--Git
{"<leader>Gb", desc = "Git Blame"},
{"<leader>Gd", desc = "Git Diff"},

--Misc
{"<leader>M", desc = "Lsp"},
{ "<leader>z", desc = "terminal" },
{ "<leader>s", desc = "Search & Replace" },
{ "<leader>Q", desc = "persistence sessions"},
{ "<leader>R", desc = "Registry" },
{ "<leader>cc", desc = "Copilot" }

})



wk.setup({
	preset = 'helix'
})
