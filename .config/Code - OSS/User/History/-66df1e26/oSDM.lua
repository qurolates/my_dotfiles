require("nvchad.configs.lspconfig").defaults()

local servers = { "clangd", "rust_analyzer", "pyright" }

vim.lsp.enable(servers)

-- Для кастомизации (опционально):
-- vim.lsp.config("pyright", {
--   root_dir = vim.lsp.root_dir,
-- })
