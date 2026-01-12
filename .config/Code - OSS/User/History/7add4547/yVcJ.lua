return {
  { "williamboman/mason.nvim", opts = { ui = { border = "rounded" } } },
  { "williamboman/mason-lspconfig.nvim", opts = { automatic_installation = true } },
  { "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "clangd", "rust_analyzer", "pyright", "gopls", "zls",
        "codelldb", "debugpy"  -- Для debugger
      },
    },
  },
  { "mfussenegger/nvim-dap" },  -- Debugger
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
}
