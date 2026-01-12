return {
  -- Пример плагина с lazy-loading
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },  -- Загрузка по событию
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "rust", "cpp" },
        highlight = { enable = true },
      })
    end,
  },
  { 
    "nvim-lualine/lualine.nvim", 
    dependencies = { "nvim-tree/nvim-web-devicons" } 
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = "<leader>ff",  -- Lazy-load по клавише
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip" },
    config = function() require("cmp").setup({}) end,
  }
}