local map = vim.keymap.set

-- remap escape
map("i", "jj", "<ESC>", { nowait = true })

-- window navigation
map("n", "<leader>w", "<C-w>v<C-w>l",  { desc = "Split window right" })
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- buffers
map("n", "<Tab>",   ":bnext<CR>",         { desc = "Next buffer" })
map("n", "<S-Tab>", ":bprev<CR>",         { desc = "Prev buffer" })
map("n", "<leader>d", ":bd<CR>",          { desc = "Close buffer" })
map("n", "<leader>b", ":Telescope buffers<CR>", { desc = "Pick buffer" })

-- tags
map("n", "<C-]>",    "g<C-]>")
map("n", "<C-w>]",   "<C-w>g]")
map("n", "<leader>]", ":tselect<CR>",     { desc = "Tag select" })
