-- Autocmds are automatically loaded on the VeryLazy event

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("CommentString", {})

autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    vim.opt_local.commentstring = "// %s"
  end,
  group = "CommentString",
})

autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "wscript*",
  callback = function()
    vim.bo.filetype = "python"
  end,
})

require("scripts/lntoggle")

-- " Filetype-specific settings "
-- autocmd FileType text,tex setlocal textwidth=78 spell
-- autocmd FileType svn,*commit* setlocal spell
-- autocmd FileType svn,*commit* call setpos('.', [0, 1, 1, 0])
-- autocmd FileType gitcommit exec "au! VimEnter * exec 'normal! gg' | startinsert!"
