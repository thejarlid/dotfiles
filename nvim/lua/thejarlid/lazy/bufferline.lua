return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("bufferline").setup({
            options = {
                numbers = "ordinal",                -- show buffer numbers
                diagnostics = "nvim_lsp",           -- show LSP error/warn counts
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "Files",
                        highlight = "Directory",
                        separator = true,           -- visual separator between tree and buffers
                    },
                },
                show_buffer_close_icons = false,
                show_close_icon = false,
            },
        })

        -- jump to buffer by number
        for i = 1, 9 do
            vim.keymap.set("n", "<leader>" .. i, function()
                require("bufferline").go_to(i, true)
            end, { desc = "Go to buffer " .. i })
        end
    end,
}
