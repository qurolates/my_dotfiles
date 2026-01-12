return {
  {
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000
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