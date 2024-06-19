return {
  "neovim/nvim-lspconfig",
  opts = {
    capabilities = {
      textDocument = {
        foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true,
        },
      },
    },
    servers = {
      bashls = {},
      cssls = {},
      html = {},
      gradle_ls = {},
      groovyls = {},
      lua_ls = {},
      jdtls = {},
      jsonls = {},
      dockerls = {},
      tsserver = {},
      rust_analyzer = {},
      yamlls = {},
    },
  },
}
