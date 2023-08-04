return {
  require("onedark").setup({
    style = "deep",
    transparent = true,
    colors = {
      fg = "#c0c0c0",
      grey = "#6279a5",
    },
    highlights = {
      MatchParen = { fg = "$yellow", bg = "$grey" },
    },
  }),
}
