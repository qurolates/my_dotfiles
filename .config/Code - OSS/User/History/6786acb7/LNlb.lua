return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufRead",
  opts = {
    ensure_installed = { "cpp", "rust", "python", "lua", "go", "zig", "c" },
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = { enable = true },
  },
}
