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
}