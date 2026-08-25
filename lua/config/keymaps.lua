local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader><leader>", "<cmd>Telescope find_files<CR>")
map("n", "<leader>sg", "live-grep-native")
map({ "n", "v" }, "L", "$")
map({ "n", "v" }, "H", "^")
map({ "n", "v" }, "<C-j>", "<C-w><C-j>")
map({ "n", "v" }, "<C-k>", "<C-w><C-k>")
map({ "n", "v" }, "<leader-j>", ":m .+1<cr>==")
map({ "n", "v" }, "<leader-k>", ":m .-2<cr>==")
map("n", "q", "<cmd>bd<CR>")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map({ "n", "i" }, "<C-n>", "<C-^>")
map("n", "s", function()
  vim.cmd("w") -- save file
  vim.lsp.buf.format({ async = true }) -- format file with LSP
end, { desc = "Save & format" })
