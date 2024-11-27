-- Keymaps are automatically loaded on the VeryLazy event

local map = vim.keymap.set
local unmap = vim.keymap.del

map("i", "<Insert>", "<Nop>")

map("n", "<C-Up>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-Down>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-Left>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-Right>", "<C-w>l", { desc = "Go to right window" })

map("n", "<C-PageUp>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<C-PageDown>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("i", "<C-PageUp>", "<Esc><cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("i", "<C-PageDown>", "<Esc><cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

map("n", "<F2>", "<cmd>setlocal list!<cr>", { silent = true })
map("i", "<F2>", "<Esc><cmd>setlocal list!<cr>", { silent = true })

map("n", "<F6>", "<cmd>setlocal spell!<cr>", { silent = true })
map("i", "<F6>", "<Esc><cmd>setlocal spell!<cr>", { silent = true })

map("n", "gs", "<cmd>ClangdSwitchSourceHeader<cr>", { silent = true })
