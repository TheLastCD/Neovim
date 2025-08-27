local function map(m, k, v)
	vim.keymap.set(m, k, v, { noremap = true, silent = true })
end


-- utils
map("n", "<leader>P", ":PlugInstall<CR>") --vim-plug

-- buffers
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")
map("n", "<leader>U", "::bufdo bd<CR>") --close all
map('n', '<leader>vs', ':vsplit<CR>:bnext<CR>') --ver split + open next buffer
map("n", "<leader>w", ":w<CR>") --write but one less key

-- Fuzzy Finding
map("n", "<leader>f", ":lua require('fzf-lua').files()<CR>") --search cwd
map("n", "<leader>Fh", ":lua require('fzf-lua').files({ cwd = '~/' })<CR>") --search home
map("n", "<leader>Fl", ":lua require('fzf-lua').files({ cwd = '~/.local/src' })<CR>") --search .local/src
map("n", "<leader>Ff", ":lua require('fzf-lua').files({ cwd = '..' })<CR>") --search above
map("n", "<leader>Fr", ":lua require('fzf-lua').resume()<CR>") --last search
map("n", "<leader>g", ":FzfLua live_grep <CR>") --live grep
map("n", "<leader>Fg", ":lua require('fzf-lua').grep()<CR>") --grep
map('n', '<leader><leader>', ":lua require('fzf-lua').buffers()<CR>")
map('n', '<leader>M', ":Mason<CR>")


-- Register
map("n", "<leader>R", ":registers<CR>") --show registers


-- Terminal
map('n', '<leader>z', ":lua require('FTerm').open()<CR>") --open term
map('t', '<Esc>', '<C-\\><C-n><CMD>lua require("FTerm").close()<CR>') --preserves session

--Session
map('n', '<leader>q', ":lua require('persistence').load()<CR>") --open term
map('n', '<leader>Q', ":lua require('persistence').select()<CR>") --open term

--code
map('n', '<leader>ch', ":Ouroboros<CR>")

vim.keymap.set('n','<leader>cm', ':TMUXcompile Make<CR>', {silent=true})

vim.api.nvim_set_keymap(
  'n',                 -- normal mode
  '<leader>cl',         -- key combo, e.g. leader + l
  ':lua require("lint").try_lint()<CR>', -- function to run lint
  { noremap = true, silent = true }
)


vim.keymap.set({ "n", "v" }, "<leader>cf", function()
  require("conform").format({
    async = true,
    lsp_fallback = true,
  })
end, { desc = "Format file or range" })


vim.keymap.set('n', 'gd', function()
  require('fzf-lua').lsp_definitions()
end, { noremap = true, silent = true, desc = "Go to LSP Definition (fzf-lua)" })


vim.keymap.set('n', 'gr', function()
  require('fzf-lua').lsp_references()
end, { noremap = true, silent = true, desc = "Show LSP References (fzf-lua)" })

-- Git
map('n', '<leader>Gb', ":Gitsigns blame-line<CR>") --blame line
map('n', '<leader>Gd', ":Gitsigns diffthis<CR>") -- diff

--Misc
map('n', '<leader>s', ":lua require('ssr').open()<CR>") --Search and Replace
map('n', '<leader>cc', ":CopilotChat<CR>") --open Copilot chatbot

map("n", "<leader>nn", function() --toggle relative vs absolute line numbers
	if vim.wo.relativenumber then
		vim.wo.relativenumber = false
		vim.wo.number = true
	else
		vim.wo.relativenumber = true
	end
end)


-- Spotify

map("n", '<leader>Sn', ':!spotify_player playback next<CR><CR>')






