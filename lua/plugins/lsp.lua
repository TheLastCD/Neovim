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


vim.diagnostic.config({
  signs = {
    severity = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
    -- Optionally numhl and linehl can be configured similarly
  },
})
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

