return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "lua",
      "javascript",
      "typescript",
      "tsx",
      "json",
      "html",
      "css",
      "java",
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  },
}
