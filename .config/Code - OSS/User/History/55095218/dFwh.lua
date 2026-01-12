-- Глобальные capabilities для всех LSP
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Настройка конкретных серверов (опционально, overrides)
vim.lsp.config('pyright', {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    -- Ваши on_attach функции здесь
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap=true, silent=true })
  end,
})

vim.lsp.config('rust_analyzer', {
  capabilities = capabilities,
})

vim.lsp.config('clangd', {
  capabilities = capabilities,
})

-- Включить LSP для установленных серверов (Mason сделает остальное)
vim.lsp.enable({'pyright', 'rust_analyzer', 'clangd'})
