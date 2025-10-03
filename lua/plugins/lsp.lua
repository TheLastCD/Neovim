require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "lua_ls" },
  automatic_installation = true,
  handlers = {
    function(server_name) -- default handler
      vim.lsp.config[server_name].setup({})
    end,
  },
})

vim.lsp.config.lua_ls = {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },  -- fix "undefined global vim" warnings
      },
      runtime = { version = "LuaJIT" },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
    },
  },
}
vim.lsp.enable("lua_ls")

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn",  text = "" },
  { name = "DiagnosticSignInfo",  text = "" },
  { name = "DiagnosticSignHint",  text = "" },
}
for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.lsp.config.ts_ls = {
  init_options = {
    preferences = {
      disableSuggestions = false,
    },
    noErrorTruncation = true,
  },
}
vim.lsp.enable("ts_ls")

vim.diagnostic.config({
  virtual_text = {
    prefix = '● ',  -- change diagnostic inline prefix icon
    spacing = 4,   -- spacing between text and prefix
  }, -- enable virtual text (inline error messages)
  signs = true,          -- show signs in the gutter
  underline = true,      -- underline errors/warnings
  update_in_insert = false,
  severity_sort = true,
  float = {
    source = "always",   -- show source in floating diagnostics
    border = "rounded",
  },
})

require("ts-error-translator").setup({
  auto_override_publish_diagnostics = true,
})
vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx)
  require("ts-error-translator").translate_diagnostics(err, result, ctx)
  vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx)
end

require('tsc').setup()

