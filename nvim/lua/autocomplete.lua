-- Set up nvim-cmp
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Cr>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  })
})

-- Setup LSP
local lspconfig = require('lspconfig')

-- Enable Pyright for Python
lspconfig.pyright.setup {
  capabilities = require('cmp_nvim_lsp').default_capabilities()
}

-- LSP Hover: Show full message for diagnostics when cursor is over an error
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single",            -- Floating window border style
  focusable = true,             -- Make the window focusable
  source = "always",            -- Always show the source of the diagnostic
  header = "Diagnostic Info",   -- Optional header for the diagnostic message
})

-- Enable persistent diagnostics across modes
vim.diagnostic.config({
  virtual_text = true,          -- Show inline diagnostics (errors/warnings)
  signs = true,                 -- Show diagnostics in the sign column
  underline = true,             -- Underline the diagnostic locations
  update_in_insert = true,      -- Keep diagnostics visible in insert mode
  severity_sort = true,         -- Sort diagnostics by severity
  float = {
    source = "always",          -- Show source in the floating window
    header = "Diagnostic Info", -- Optional header
    border = "single",          -- Border for the floating window
  },
})
-- Define signs for error and warning diagnostics
vim.fn.sign_define("LspDiagnosticsSignError", { text = "✘", texthl = "LspDiagnosticsDefaultError" })
vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "⚠", texthl = "LspDiagnosticsDefaultWarning" })

-- Keep signcolumn always visible (prevent it from disappearing)
vim.opt.signcolumn = "yes"
