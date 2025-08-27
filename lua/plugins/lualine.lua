
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    transparent_mode = true,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      "alpha", "dashboard"
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = false,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    },
  },
  sections = {
    lualine_a = { {
      'mode',
      fmt = function(res)
        return res:sub(1, 1)
      end,
    } },
    lualine_b = { 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = {},
    lualine_y = { 'fileformat', 'filetype' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = { 'lazy', 'mason', 'fzf' },
}
