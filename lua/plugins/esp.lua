-- All Esp32 related tools, contained in one place for easy disabling
-- Lua dependencies:
require("snacks").setup({
  ---@type snacks.Config
  opts = {
    bigfile      = { enabled = false },
    dashboard    = { enabled = false },
    explorer     = { enabled = false },
    indent       = { enabled = false },
    input        = { enabled = false },
    picker       = { enabled = false },
    notifier     = { enabled = false },
    quickfile    = { enabled = false },
    scope        = { enabled = false },
    scroll       = { enabled = false },
    statuscolumn = { enabled = false },
    words        = { enabled = false },
  },
})

--Actual ESP helpers
require("esp32").setup({
  build_dir = "build.custom",
})



--example keymap
-- vim.keymap.set("n", "<leader>em", function()
--   require("esp32").pick("monitor")
-- end, { desc = "ESP32: Pick & Monitor" })
