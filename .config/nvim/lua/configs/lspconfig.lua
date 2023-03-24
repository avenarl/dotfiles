local lspconfig = require('lspconfig')

-- TypeScript language server configuration
lspconfig.tsserver.setup{} 

-- ESLint configuration
lspconfig.efm.setup {
    init_options = {documentFormatting = true},
    filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            javascript = {
                {lintCommand = "eslint -f unix --stdin --stdin-filename ${INPUT}", lintStdin = true, lintFormats = {"%f:%l:%c: %m"}}
            },
            javascriptreact = {
                {lintCommand = "eslint -f unix --stdin --stdin-filename ${INPUT}", lintStdin = true, lintFormats = {"%f:%l:%c: %m"}}
            },
            typescript = {
                {lintCommand = "eslint -f unix --stdin --stdin-filename ${INPUT}", lintStdin = true, lintFormats = {"%f:%l:%c: %m"}}
            },
            typescriptreact = {
                {lintCommand = "eslint -f unix --stdin --stdin-filename ${INPUT}", lintStdin = true, lintFormats = {"%f:%l:%c: %m"}}
            },
			html = {
                {lintCommand = "eslint -f unix --stdin --stdin-filename ${INPUT}", lintStdin = true, lintFormats = {"%f:%l:%c: %m"}}
            },
        },
    },
}

