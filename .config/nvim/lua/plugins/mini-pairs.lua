return {
  "echasnovski/mini.pairs",
  opts = {
    mappings = {
      ["("] = false,
      ["["] = false,
      ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\][^%w%p]" },
      ['"'] = false,
      ["'"] = false,
      ["`"] = false,
    },
  },
}
