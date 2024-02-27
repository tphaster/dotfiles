return {
  "echasnovski/mini.pairs",
  opts = {
    mappings = {
      ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\][^%w%p]" },
      ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\][^%w%p]" },
      ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\][^%w%p]" },

      ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\][^%w%p]", register = { cr = false } },
      ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\][^%w%p]", register = { cr = false } },
      ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\][^%w%p]", register = { cr = false } },
    },
  },
}
