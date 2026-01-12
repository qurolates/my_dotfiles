-- LSP + DAP keymaps (работает только после LspAttach/DapAttach)
vim.api.nvim_create_autocmd({ "LspAttach", "DapAttach" }, {
  callback = function(args)
    local bufnr = args.buf
    local opts = { buffer = bufnr, noremap = true, silent = true }

    -- LSP
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)

    -- DAP (только если dap доступен)
    local ok, dap = pcall(require, "dap")
    if ok then
      vim.keymap.set("n", "<F9>", dap.continue, opts)
      vim.keymap.set("n", "<F10>", dap.step_over, opts)
      vim.keymap.set("n", "<F11>", dap.step_into, opts)
      vim.keymap.set("n", "<F12>", dap.step_out, opts)
      vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, opts)
    end
  end,
})
