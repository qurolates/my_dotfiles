return {
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim", opts = { automatic_installation = true } },
  { "neovim/nvim-lspconfig" },  -- Только для configs, без require('lspconfig')

  -- Авто-включение серверов после mason
  { "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = { "clangd", "rust_analyzer", "gopls", "zls" },  -- Под твои языки
    },
  },
}
