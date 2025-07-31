local fterm = require("FTerm")

_G.htop = fterm:new({
	ft = 'fterm_htop',
	cmd = "htop"
})


-- Create a new FTerm instance to run your set command, e.g. "top", "htop", or a shell command
local myterm = fterm:new({
  cmd = 'spotify_player',  -- replace with your desired command
  -- optional:
  ft = 'fterm_myterm',        -- custom filetype for this terminal buffer
  dimensions = {
    height = 0.8,
    width = 0.8,
  },
  border = 'rounded',
})

-- Map a key (say <leader>t) to toggle this custom terminal
vim.keymap.set('n', '<leader>Zs', function()
  myterm:toggle()
end, { noremap = true, silent = true, desc = "Spotify Player" })

