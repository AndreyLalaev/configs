require("config.lazy")

vim.wo.number=true
vim.keymap.set("n", "<Esc><Esc>", "<cmd>nohl<cr>", { desc = "Turn off search highlight" })
