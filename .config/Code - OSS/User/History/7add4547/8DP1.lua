return {
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim", dependencies = { "mason.nvim" } },
  { "neovim/nvim-lspconfig", dependencies = { "mason.nvim" },
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.clangd.setup({})
      lspconfig.rust_analyzer.setup({})
    end,
  },
}
