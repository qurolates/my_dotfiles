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

-- DAP auto-setup (codelldb для C++/Rust, debugpy для Python)
local dap = require("dap")
dap.adapters.codelldb = { type = "server", host = "localhost", port = "${port}", executable = { command = "codelldb", args = { "--port", "${port}" } } }
dap.configurations.cpp = { { name = "Launch", type = "codelldb", request = "launch", program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end } }
dap.configurations.rust = dap.configurations.cpp
dap.configurations.python = { { name = "Python Debug", type = "python", request = "launch", program = "${file}", pythonPath = function() return "/usr/bin/python" end } }
