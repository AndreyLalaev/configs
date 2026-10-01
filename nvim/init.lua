require("config.lazy")

vim.wo.number = true
vim.wo.cursorline = true
vim.opt.splitbelow = true
vim.opt.swapfile = false

vim.keymap.set("n", "<Esc><Esc>", "<cmd>nohl<cr>", { desc = "Turn off search highlight" })

vim.keymap.set({"n", "i"}, "<F8>",
  function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local name = vim.trim(vim.system({"git", "--no-pager", "config", "get", "user.name"}):wait().stdout)
    local email = vim.trim(vim.system({"git", "--no-pager", "config", "get", "user.email"}):wait().stdout)

    local signed_off = string.format("Signed-off-by: %s <%s>", name, email)
    vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { signed_off })
  end,
  { desc = "Signed-off-by", noremap = true, silent = true }
)

vim.api.nvim_create_user_command('E', function(opts)
  vim.cmd('Oil ' .. opts.args)
end, { nargs = '*', desc = 'Open Oil file explorer' })

vim.filetype.add({
  extension = {
    rules = 'udevrules',
    h = 'c',
  }
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
