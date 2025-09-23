return {
  -- Mason untuk install LSP / DAP / Linters
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function() require("mason").setup() end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      automatic_installation = true,
    },
  },

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(client, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        local keymap = vim.keymap.set

        keymap("n", "K", vim.lsp.buf.hover, bufopts)
        keymap("n", "<leader>gd", vim.lsp.buf.definition, bufopts)
        keymap("n", "<leader>gr", vim.lsp.buf.references, bufopts)
        keymap("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
        keymap("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
      end

      local servers = {
        "tsserver",
        "lua_ls",
        "html",
        "cssls",
        "jdtls",
      }

      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end
    end,
  },
}
