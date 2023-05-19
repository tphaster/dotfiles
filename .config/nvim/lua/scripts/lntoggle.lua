-- lntoggle - toggle line numbers

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("lntoggle", { clear = true })

local function isInVisualMode()
  local currentMode = vim.api.nvim_get_mode().mode
  local match = string.match(currentMode, "[vV\x16]*")
  return (match ~= "") and (match ~= nil)
end

local function isCurrentBufferNeoTree()
  local currentBufferName = vim.api.nvim_buf_get_name(0)
  return string.find(currentBufferName, "neo%-tree filesystem") ~= nil
end

autocmd("ModeChanged", {
  pattern = "*:[vV\x16]*",
  callback = function()
    vim.opt_local.relativenumber = (not isCurrentBufferNeoTree()) and isInVisualMode()
  end,
  group = "lntoggle",
})

autocmd("ModeChanged", {
  pattern = "[vV\x16]*:*",
  callback = function()
    vim.opt_local.relativenumber = (not isCurrentBufferNeoTree()) and isInVisualMode()
  end,
  group = "lntoggle",
})

autocmd("ModeChanged", {
  pattern = "*:no*",
  callback = function()
    if (not isCurrentBufferNeoTree()) and (vim.v.operator == "y" or vim.v.operator == "d") then
      vim.opt_local.relativenumber = true
    end
  end,
  group = "lntoggle",
})

autocmd("ModeChanged", {
  pattern = "no*:[^n]*",
  callback = function()
    vim.opt_local.relativenumber = false
  end,
  group = "lntoggle",
})

autocmd({ "CursorHold", "TextYankPost" }, {
  pattern = "*",
  callback = function()
    vim.opt_local.relativenumber = false
  end,
  group = "lntoggle",
})
