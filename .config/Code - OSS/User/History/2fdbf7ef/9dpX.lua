return {
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "folke/tokyonight.nvim" },  -- тема
  { "nvim-lualine/lualine.nvim" },  -- статусбар
  { "nvim-tree/nvim-tree.lua" },  -- файловый менеджер
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  -- LSP
  {
    "mason-org/mason.nvim",
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    }
  },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },  -- автодополнение
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "L3MON4D3/LuaSnip" },  -- сниппеты
}
