-- Options are automatically loaded before lazy.nvim startup

local opt = vim.opt

opt.relativenumber = false -- relative line numbers

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
