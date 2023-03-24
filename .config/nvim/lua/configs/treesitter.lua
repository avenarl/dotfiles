require'nvim-treesitter.configs'.setup {
  refactor = {
    highlight_definitions = {
      enable = true,
      -- Set to false if you have an `updatetime` of ~100.
      highlight_current_scope = { enable = true },
    },
  },
  additional_vim_regex_highlighting = false,
  indent = { enable = true },
}
