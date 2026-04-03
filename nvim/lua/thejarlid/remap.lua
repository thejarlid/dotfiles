local map = vim.keymap.set

-- remap escape
map("i", "jj", "<ESC>", { nowait = true })

-- window navigation
map("n", "<leader>w", "<C-w>v<C-w>l")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- buffers
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprev<CR>")
map("n", "<leader>d", ":bd<CR>")
map("n", "<leader>b", ":ls<CR>:b<Space>")

-- tags
map("n", "<C-]>", "g<C-]>")
map("n", "<C-w>]", "<C-w>g]")
map("n", "<leader>]", ":tselect<CR>")
