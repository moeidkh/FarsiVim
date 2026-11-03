local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader><leader>", "<cmd>Telescope find_files<CR>")
map("n", "<leader>sg", "<cmd>Telescope live_grep<CR>", { desc = "Search by grep" })
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

map("n", "<leader>fa", function()
  require("telescope.builtin").find_files({
    hidden = true,
    no_ignore = true,
  })
end, { desc = "Find all files (including hidden and ignored)" })

map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

map("n", "<leader>rp", function()
  vim.opt_local.rightleft = not vim.opt_local.rightleft:get()
  vim.notify(vim.opt_local.rightleft:get() and "RTL Mode Enabled" or "RTL Mode Disabled")
end, { desc = "Toggle RTL (Persian)" })

vim.keymap.set("n", "<leader>h", function()
  vim.cmd("belowright 12split")
  vim.cmd("terminal")
  vim.cmd("startinsert")

  vim.api.nvim_create_autocmd("TermClose", {
    buffer = 0,
    once = true,
    callback = function()
      vim.schedule(function()
        if vim.api.nvim_win_is_valid(vim.api.nvim_get_current_win()) then
          vim.cmd("close")
        end
      end)
    end,
  })
end, { desc = "Terminal below code" })
vim.keymap.set("n", "<leader>fw", function()
  Snacks.picker.grep({
    layout = {
      preset = "default",
    },
  })
end, { desc = "Live Grep (Project)" })
