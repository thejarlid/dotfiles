return {
    "nvim-lualine/lualine.nvim",
    opts = {
        options = {
            theme = "auto",
            section_separators = "",
            component_separators = "|",
            globalstatus = true,
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = { { "filename", path = 1 } },  -- relative path
            lualine_x = { "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
    },
}
