return {
    "Lokaltog/vim-monotone",
    priority = 1000, -- load before other plugins
    config = function()
        vim.cmd("colorscheme monotone")
        -- transparent background so tmux pane dimming shows through
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
    end,
}
