return {
  {
    'Mofiqul/vscode.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme vscode]])
    end,
  },
  {
    "junegunn/fzf",
    keys = {
      {"<C-f>", "<cmd>:FZF<cr>"},
    },
  },
  {
    "rust-lang/rust.vim",
    config = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {
      default_file_explorer = true,
    },
  },
}
