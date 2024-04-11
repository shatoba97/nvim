return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        "angular-language-server",
        "typescript-language-server",
        "json-lsp",
        "prettier",
        "shfmt",
        "stylua",
        "shellcheck",
        "flake8",
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "angularls",
          "tsserver",
          "jsonls",
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
      { "folke/neodev.nvim", opts = {} },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      setup = {
        angularls = function(_, opts)
          require("angularls").setup({ server = opts })
        end,
      },
    },
    config = function()
      require("lspconfig").lua_ls.setup({})

      -- require 'lspconfig'.html.setup({})
      require("lspconfig").tsserver.setup({})
    end,
  },
}
