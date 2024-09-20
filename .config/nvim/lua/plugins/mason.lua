return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
      "clangd",
      "lua-language-server",
      "python-lsp-server",
      "marksman",
    },
  },
}
