return {
    "williamboman/mason.nvim",
    lazy = false,
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "neovim/nvim-lspconfig",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            automatic_installation = false,
            ensure_installed = {
                -- General purpose
                "lua_ls",
                "bashls",
                "dockerls",
                "marksman",            -- markdown
                "tinymist",           -- Typst support

                -- Web / Frontend
                "ts_ls",
                "angularls",
                "html",
                "cssls",
                "tailwindcss",
                "emmet_ls",

                -- Backend / Languages
                "pyright",
                "omnisharp",
                "clangd",

                -- Databases
                "sqls",
                "sqlls",

                -- Optionally include jsonls/yamlls if config files are in use
                "jsonls",
                "yamlls",
            },
        })

        mason_tool_installer.setup({
            ensure_installed = {
                -- Python
                "black",
                "isort",
                "flake8",
                "mypy",
                "ruff",

                -- .NET
                -- No formatter directly installable; use dotnet format via CLI

                -- Shell
                "shfmt",
                "shellcheck",

                -- Docker
                "hadolint",

                -- JS / TS / HTML / CSS
                "prettier",
                "eslint_d",

                -- Lua
                "stylua",

                -- Markdown
                "markdownlint",

                -- SQL
                "sql-formatter",
            },
        })
    end,
}
