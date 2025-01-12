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
vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.wrap = true
vim.opt.textwidth = 120
