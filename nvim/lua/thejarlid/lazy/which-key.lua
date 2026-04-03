return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        delay = 0,
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)

        -- group labels so the popup is organised
        wk.add({
            { "<leader>e",  group = "explorer" },
            { "<leader>f",  group = "find" },
            { "<leader>p",  group = "picker" },
            { "<leader>r",  group = "rename/grep" },
            { "<leader>c",  group = "code" },
        })
    end,
}
