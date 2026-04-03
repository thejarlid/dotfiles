return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- disable netrw so nvim-tree takes over directory handling
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require("nvim-tree").setup({
            view = { width = 35 },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = false,
            },
            actions = {
                open_file = {
                    quit_on_open = false,   -- keep tree open after opening a file
                    window_picker = {
                        enable = true,      -- open file in the last used editing window
                    },
                },
            },
            on_attach = function(bufnr)
                local api = require("nvim-tree.api")
                -- apply default mappings first
                api.config.mappings.default_on_attach(bufnr)
                local opts = function(desc)
                    return { buffer = bufnr, noremap = true, silent = true, desc = desc }
                end
                -- override open keys to match telescope conventions
                vim.keymap.set("n", "<CR>",  api.node.open.edit,             opts("Open"))
                vim.keymap.set("n", "<C-s>", api.node.open.horizontal,       opts("Open in horizontal split"))
                vim.keymap.set("n", "<C-v>", api.node.open.vertical,         opts("Open in vertical split"))
                vim.keymap.set("n", "<C-t>", api.node.open.tab,              opts("Open in new tab"))
            end,
        })

        vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file tree" })
    end,
}
