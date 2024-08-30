-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  {
    "davidosomething/format-ts-errors.nvim",
    ft = { "typescript", "typescriptreact" },
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },
  {
    "f-person/git-blame.nvim",
    event = "BufEnter",
  },
  {
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy",
  },
}
