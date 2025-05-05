require'nvim-treesitter.configs'.setup {
  -- 添加不同语言
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "bash", "markdown", "markdown_inline" },

  highlight = { enable = true },
  indent = { enable = true },
}
