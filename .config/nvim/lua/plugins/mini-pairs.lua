return {
  "echasnovski/mini.pairs",
  opts = {
    mappings = {
      ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\][^%a]" },
      ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\][^%a]" },
      ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\][^%a]" },

      ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\][^%a]", register = { cr = false } },
      ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\][^%a]", register = { cr = false } },
      ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\][^%a]", register = { cr = false } },
    },
  },
}
