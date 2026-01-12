vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(e) local opts = { buffer = e.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<F5>", vim.lsp.buf.restart, opts)
  end,
})
vim.keymap.set("n", "<F9>", require("dap").continue)
vim.keymap.set("n", "<F10>", require("dap").step_over)
