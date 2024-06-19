return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    ---@diagnostic disable-next-line: missing-parameter
    opts.ensure_installed = vim.list_extend(opts.ensure_installed, {
      "bashls",
      "cssls",
      "html",
      "gradle_ls",
      "groovyls",
      "lua_ls",
      "jdtls",
      "jsonls",
      "dockerls",
      "tsserver",
      "rust_analyzer",
      "yamlls",
    })
  end,
}
