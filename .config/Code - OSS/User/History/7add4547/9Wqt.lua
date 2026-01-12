return {
  { "williamboman/mason.nvim", opts = { ui = { border = "rounded" } } },
  { "williamboman/mason-lspconfig.nvim", opts = { automatic_installation = true } },
  { "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "clangd", "rust_analyzer", "pyright", "codelldb", "debugpy" } },
  },

  -- DAP с lazy-loading по командам/клавишам
  {
    "mfussenegger/nvim-dap",
    keys = { "<F9>", "<F10>", "<F11>", "<F12>", "<leader>b" },  -- Lazy по клавишам
    config = function()
      local dap = require("dap")
      -- C++/Rust debugger
      dap.adapters.codelldb = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = { command = "codelldb", args = { "--port", "${port}" } },
      }
      dap.configurations.cpp = {
        {
          name = "Launch",
          type = "codelldb",
          request = "launch",
          program = function() return vim.fn.input("Path: ", vim.fn.getcwd() .. "/", "file") end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
      dap.configurations.rust = dap.configurations.cpp
      dap.configurations.python = {
        {
          name = "Python Debug",
          type = "python",
          request = "launch",
          program = "${file}",
          console = "integratedTerminal",
        },
      }
    end,
  },
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" }, keys = { "<leader>du" }, config = true },
}
