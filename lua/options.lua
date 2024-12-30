require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!

o.expandtab = true
o.shiftwidth = 4
o.smartindent = false
o.tabstop = 4
o.softtabstop = 4

vim.wo.relativenumber = true
vim.wo.number = true

-- Automatically switch between relative and normal line numbers based on mode
vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    callback = function()
        vim.wo.relativenumber = false
        vim.wo.number = true
    end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    callback = function()
        vim.wo.relativenumber = true
        vim.wo.number = true
    end,
})
