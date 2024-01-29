-- Options are automatically loaded before lazy.nvim startup

local g = vim.g
local opt = vim.opt

g.autoformat = false -- disable auto formatting

opt.relativenumber = false -- relative line numbers
g.editorconfig = true -- enable .editorconfig support

opt.spelllang = { "en", "pl" } -- Polish/English spell checking

opt.listchars = { -- set nice characters for :list command
  tab = "→ ",
  trail = "·",
  extends = "»",
  precedes = "«",
  nbsp = "␣",
}

-- set colorcolumn=+2
-- let c_space_errors = 1
