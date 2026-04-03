-- basic configuration

vim.opt.number = true               -- show current line number
vim.opt.relativenumber = true       -- show relative line numbers
vim.opt.clipboard = 'unnamedplus'   -- use system keyboard for yank
vim.opt.ignorecase = true 			-- case insensitive search
vim.opt.smartcase = true 			-- smart case to avoid ignore case toggles
vim.opt.incsearch = true			-- incremental seach

-- tab settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- misc
vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.hlsearch = true
vim.opt.autoread = true
vim.opt.updatetime = 200
vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.wrap = true
vim.opt.textwidth = 120
vim.opt.colorcolumn = "100"
vim.opt.hidden = true           -- allow switching buffers without saving
vim.opt.tags = "./tags;"        -- search up the tree for a tags file

-- focus autocmds (cursorline dims on inactive pane)
vim.api.nvim_create_autocmd("FocusGained", {
    callback = function() vim.opt.cursorline = true end,
})
vim.api.nvim_create_autocmd("FocusLost", {
    callback = function()
        vim.opt.cursorline = false
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
    end,
})
