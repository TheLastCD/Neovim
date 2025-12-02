require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})

require("CopilotChat").setup({
  window = {
    layout = 'float',
    width = 80, -- Fixed width in columns
    height = 25, -- Fixed height in rows
    border = 'rounded', -- 'single', 'double', 'rounded', 'solid'
    title = '🤖 Clanker',
    zindex = 100, -- Ensure window stays on top
  },

  headers = {
    user = '👤 You: ',
    assistant = '🤖 Copilot: ',
    tool = '🔧 Tool: ',
  },
  separator = '━━',
  show_folds = false, -- Disable folding for cleaner look
  auto_insert_mode = true,

})


