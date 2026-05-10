local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
  -- Treesitter plugin not available yet; do nothing instead of erroring.
  return
end

configs.setup {
  ensure_installed = {
    "bash", "c", "css", "cpp", "go", "html", "java", "javascript",
    "json", "jsonc", "lua", "markdown", "markdown_inline",
    "python", "rust", "tsx", "typescript",
  },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}

-- require("nvim-treesitter.configs").setup {
--   ensure_installed = { "jsonc", "lua", "javascript", "typescript"},
--   highlight = { enable = true },
-- }

-- require'nvim-treesitter.configs'.setup {
-- 	ensure_installed = { "bash", "c", "css", "cpp", "go", "html", "java", "javascript", "json", "lua", "markdown", "markdown_inline", "python", "rust", "tsx", "typescript" },
-- 	highlight = {
-- 		enable = true,
--     -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
--     -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
--     -- Using this option may slow down your editor, and you may see some duplicate highlights.
--     -- Instead of true it can also be a list of languages
-- 		additional_vim_regex_highlighting = false,
-- 	},
-- 	incremental_selection = {
-- 		enable = true,
-- 		keymaps = {
-- 		init_selection = "gnn", -- set to `false` to disable one of the mappings
-- 		node_incremental = "grn",
-- 		scope_incremental = "grc",
-- 		node_decremental = "grm",
-- 		},
-- 	},
-- }
