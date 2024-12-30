return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        opts = require "configs.conform",
    },
    {
        "sphamba/smear-cursor.nvim",
        opts = {},
        lazy = false,
    },
    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },
    {
        "realprogrammersusevim/md-to-html.nvim",
        cmd = { "MarkdownToHTML", "NewMarkdownToHTML" },
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
        ---@module 'render-markdown'
        opts = {},
    },
    {
        "glepnir/template.nvim",
        cmd = { "Template", "TemProject" },
        config = function()
            require("template").setup {
                temp_dir = "~/.config/nvim/templates/",
                author = "ajafri2001", -- Set your name
                email = "abdullahjafri2001@gmail.com", -- Set your email address
            }
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "javascript",
                "vim",
                "lua",
                "vimdoc",
                "html",
                "css",
                "python",
                "rust",
                "markdown",
                "markdown_inline",
                "java",
                "kotlin",
                "c",
                "cpp",
            },
        },
    },
    {
        "scalameta/nvim-metals",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        ft = { "scala", "sbt" },
        opts = function()
            local nvlsp = require "nvchad.configs.lspconfig"
            local metals_config = require("metals").bare_config()

            metals_config.on_attach = nvlsp.on_attach
            metals_config.on_init = nvlsp.on_init
            metals_config.capabilities = nvlsp.capabilities

            return metals_config
        end,
        config = function(_, metals_config)
            local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "scala", "sbt" },
                callback = function()
                    require("metals").initialize_or_attach(metals_config)
                end,
                group = nvim_metals_group,
            })
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            registries = {
                "github:nvim-java/mason-registry",
                "github:mason-org/mason-registry",
            },
        },
    },
    {
        "hrsh7th/nvim-cmp",
        opts = function()
            return require "configs.cmp"
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup {
                -- Configuration here, or leave empty to use defaults
            }
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "User FilePost",
        opts = function()
            return require "nvchad.configs.gitsigns"
        end,
    },
    {
        "lervag/vimtex",
        lazy = false, -- we don't want to lazy load VimTeX
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
            -- VimTeX configuration goes here, e.g.
            vim.g.vimtex_view_method = "zathura"
        end,
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        opts = {},
    },
    {
        "mfussenegger/nvim-dap", -- Make sure nvim-dap is installed first
    },
    {
        "nvim-java/nvim-java",
        lazy = false,
        dependencies = {
            "nvim-java/lua-async-await",
            "nvim-java/nvim-java-core",
            "nvim-java/nvim-java-test",
            "nvim-java/nvim-java-dap",
            "MunifTanjim/nui.nvim",
            "neovim/nvim-lspconfig",
            "mfussenegger/nvim-dap",
        },
    },
    {
        "mrcjkb/haskell-tools.nvim",
        version = "^4", -- Recommended
        lazy = false, -- This plugin is already lazy
    },
}
