vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")  -- дерево файлов
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")  -- поиск
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format)  -- форматирование
vim.keymap.set("n", "gd", vim.lsp.buf.definition)  -- goto definition
