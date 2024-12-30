require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<C-d>", "<C-d>zz", { desc = "Centers screen when Ctrl-Ding" })
map("n", "<C-u>", "<C-u>zz", { desc = "Centers screen when Ctrl-Uing" })
map("n", "<C-j>", "jzz", { desc = "Centers screen when moving down" })
map("n", "<C-k>", "kzz", { desc = "Centers screen when up" })
