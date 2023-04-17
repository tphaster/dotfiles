-- Filetype detection

local add = vim.filetype.add

add({ pattern = { ["wscript*"] = "python" } })
add({ pattern = { ["*.grc"] = "yaml" } })
