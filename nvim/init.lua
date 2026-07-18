require("config.lazy")

vim.wo.number = true
vim.wo.cursorline = true
vim.keymap.set("n", "<Esc><Esc>", "<cmd>nohl<cr>", { desc = "Turn off search highlight" })
vim.api.nvim_create_user_command('E', function(opts)
  vim.cmd('Oil ' .. opts.args)
end, { nargs = '*', desc = 'Open Oil file explorer' })
