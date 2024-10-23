local overrides = require "custom.configs.overrides"

local plugins = {
    {
        "windwp/nvim-ts-autotag",
        ft = {
            "javascript", "javascriptreact", "typescript", "typescriptreact", "html"
        },
        config = function ()
            require("nvim-ts-autotag").setup()
        end
    },
    {
        "willamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "gopls",

                "pyright",

                "typescript-language-server",
                "tailwindcss-language-server",
                "eslint-lsp",

                "prettierd",
            },
        }
    },
    {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function()
            local op = require "plugins.configs.treesitter"
            op.ensure_installed = {
                "go",
                "lua",
                "python",
                "javascript",
                "typescript",
                "tsx",
                "css",
            }
            return op
        end
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        ft = "go",
        opts = function ()
            return require "custom.configs.null-ls"
        end
    },
    {
        "mfussenegger/nvim-dap",
        init = function ()
            require("core.utils").load_mappings("dap")
        end
    },
    {
        "leoluz/nvim-dap-go",
        ft = "go",
        dependencies = "mfussenegger/nvim-dap",
        config = function (_, opts)
            require("dap-go").setup(opts)
            require("core.utils").load_mappings("dap_go")
        end
    },
    {
        "olexsmir/gopher.nvim",
        ft = "go",
        config = function (_, opts)
            require("gopher").setup(opts)
        end,
        build = function ()
            vim.cmd [[silent! GoInstallDeps]]
        end
    },
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = overrides.copilot,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function ()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = {
      sources = {
        { name = "nvim_lsp", group_index = 2 },
        { name = "copilot", group_index = 2 },
        { name = "luasnip", group_index = 2 },
        { name = "buffer", group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "path", group_index = 2 },
      },
    },
  },
}

return plugins
