require("core.options")
require("core.keymaps")
require("core.lazy")

-- LSP servers (nvim 0.11+)
vim.lsp.config("clangd", {
  cmd = { "clangd", "--background-index", "--clang-tidy" },
  capabilities = { offsetEncoding = "utf-8" },
})
vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = { command = "clippy" },
      inlayHints = { locationLinks = false },
    },
  },
})
vim.lsp.config("pyright", { single_file_support = true })
vim.lsp.enable("clangd", "rust_analyzer", "pyright")

-- DAP auto-setup (codelldb для C++/Rust, debugpy для Python