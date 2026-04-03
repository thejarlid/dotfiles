return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig", -- provides server definitions, loaded automatically
        },
        config = function()
            -- apply capabilities to all servers (enhanced by blink.cmp if available)
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            local ok, blink = pcall(require, "blink.cmp")
            if ok then
                capabilities = blink.get_lsp_capabilities(capabilities)
            end
            vim.lsp.config("*", { capabilities = capabilities })

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "pyright",       -- python
                    "ts_ls",         -- typescript / javascript
                    "lua_ls",        -- lua
                    "clangd",        -- c / c++ / objective-c
                    "rust_analyzer", -- rust
                    -- swift / objective-c: uses sourcekit-lsp which ships with Xcode,
                    -- no mason install needed, nvim picks it up automatically
                },
                automatic_enable = true, -- calls vim.lsp.enable() for each installed server
            })

            -- keymaps only active when an LSP attaches to a buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
                    end
                    map("gd",         vim.lsp.buf.definition,  "Go to definition")
                    map("gr",         vim.lsp.buf.references,   "Go to references")
                    map("K",          vim.lsp.buf.hover,        "Hover docs")
                    map("<leader>rn", vim.lsp.buf.rename,       "Rename symbol")
                    map("<leader>ca", vim.lsp.buf.code_action,  "Code action")
                    map("[d",         vim.diagnostic.goto_prev, "Previous diagnostic")
                    map("]d",         vim.diagnostic.goto_next, "Next diagnostic")
                end,
            })

            vim.opt.signcolumn = "yes"
        end,
    },
}
