return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        local actions = require("telescope.actions")

        require('telescope').setup({
            defaults = {
                mappings = {
                    i = {
                        ["<CR>"]  = actions.select_default,      -- open in current window
                        ["<C-s>"] = actions.select_horizontal,   -- open in horizontal split
                        ["<C-v>"] = actions.select_vertical,     -- open in vertical split
                        ["<C-t>"] = actions.select_tab,          -- open in new tab
                    },
                },
            },
        })

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files,  { desc = 'Find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep,   { desc = 'Live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers,     { desc = 'Buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags,   { desc = 'Help tags' })
        vim.keymap.set('n', '<leader>?',  builtin.keymaps,     { desc = 'Keymaps' })
        vim.keymap.set('n', '<C-p>',      builtin.git_files,   { desc = 'Git files' })
        vim.keymap.set('n', '<leader>pws', function()
            builtin.grep_string({ search = vim.fn.expand("<cword>") })
        end, { desc = 'Grep word under cursor' })
        vim.keymap.set('n', '<leader>pWs', function()
            builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
        end, { desc = 'Grep WORD under cursor' })
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = 'Grep prompt' })
    end
}
