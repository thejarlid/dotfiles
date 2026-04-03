return {
    "Lokaltog/vim-monotone",
    priority = 1000, -- load before other plugins
    config = function()
        vim.g.monotone_color = { 48, 90, 50 }           -- batman yellow (#f0c000)
        vim.g.monotone_secondary_hue_offset = 80
        vim.g.monotone_emphasis_multiplier = 1.4
        vim.cmd("colorscheme monotone")

        -- transparent background so tmux pane dimming shows through
        vim.api.nvim_set_hl(0, "Normal",      { bg = "none" })
        vim.api.nvim_set_hl(0, "NonText",     { bg = "none" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

        -- make comments and line numbers more visible
        local comment_hl = { fg = "#f0c000", italic = true }
        vim.api.nvim_set_hl(0, "Comment",                  comment_hl)
        vim.api.nvim_set_hl(0, "@comment",                 comment_hl) -- general comments
        vim.api.nvim_set_hl(0, "@comment.documentation",   comment_hl) -- JSDoc, Doxygen, Rust ///
        vim.api.nvim_set_hl(0, "@string.documentation",    comment_hl) -- Python docstrings
        vim.api.nvim_set_hl(0, "CursorLine",   { bg = "#1e1c14" })
        vim.api.nvim_set_hl(0, "LineNr",       { fg = "#505050" })
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#f0c000", bold = true })
    end,
}
