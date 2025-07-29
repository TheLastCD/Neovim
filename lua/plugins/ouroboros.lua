require('ouroboros').setup({
  extension_preferences_table = {
    c   = { h = 2, hpp = 1 },
    h   = { cpp = 2, c = 1, hpp = 1 },
    cpp = { hpp = 2, h = 1 },
    hpp = { cpp = 2, h = 1 },  -- Crucial addition here!
  },
  switch_to_open_pane_if_possible = true,
  score_required_to_be_confident_match_is_found = 75,
})

-- vim.g.ouroboros_debug = 1
