return {
  "gbprod/cutlass.nvim",
  lazy = false,
  config = function()
    require("cutlass").setup({
      override_del = true,
      exclude = { "nd", "nD", "xd", "xD" },
    })
  end,
}
