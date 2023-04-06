return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      jsonls = { mason = false },
      clangd = {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=never",
        },
      },
    },
  },
}
