-- Autocmds are automatically loaded on the VeryLazy event

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("CommentString", { clear = true })
autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    vim.opt_local.commentstring = "// %s"
  end,
  group = "CommentString",
})

augroup("CommitEditMsg", { clear = true })
autocmd("FileType", {
  pattern = { "svn", "*commit*" },
  callback = function()
    autocmd("VimEnter", {
      callback = function()
        vim.cmd("normal! gg")
        vim.cmd("startinsert!")
      end,
    })
  end,
  group = "CommitEditMsg",
})

require("scripts/lntoggle")
