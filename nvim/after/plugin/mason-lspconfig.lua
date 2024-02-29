require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "bashls", "lua_ls", "rust_analyzer", "clangd", "gopls", "glint"},
}
