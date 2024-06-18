return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.rainbow = { enable = true, disable = { "html" } }
    opts.matchup = { enable = true, disable = { "sh", "bash" } }
    ---@diagnostic disable-next-line: missing-parameter
    vim.list_extend(opts.ensure_installed, {
      "c",
      "cmake",
      "comment",
      "cpp",
      "css",
      "diff",
      "dockerfile",
      "go",
      "make",
      "rust",
      "toml",
      "java",
      "elixir",
    })
  end,
  dependencies = {
    { "HiPhish/nvim-ts-rainbow2" },
  },
}
