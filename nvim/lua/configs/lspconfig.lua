require("nvchad.configs.lspconfig").defaults()

local servers = { "asm-lsp", "bash_ls", "fish_ls", "lua_ls", "cssls", "rust_analyzer" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
