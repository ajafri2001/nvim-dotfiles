return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        opts = require "configs.conform",
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
        ft = { "scala", "sbt" },
        opts = function()
            local nvlsp = require "nvchad.configs.lspconfig"
            local metals_config = require("metals").bare_config()

            -- Wrap on_attach to add custom keymaps
            local original_on_attach = nvlsp.on_attach
            metals_config.on_attach = function(client, bufnr)
                original_on_attach(client, bufnr)

                local opts = { noremap = true, silent = true, buffer = bufnr }
                local map = vim.keymap.set

                -- Single-key: insert type annotation if available
                map("n", "<leader>ca", function()
                    local params = vim.lsp.util.make_range_params(0, "utf-8")
                    vim.lsp.buf_request(bufnr, "textDocument/codeAction", params, function(err, result)
                        if err then
                            return
                        end
                        if not result or vim.tbl_isempty(result) then
                            return
                        end

                        -- Look for Metals "Insert Type Annotation"
                        for _, action in ipairs(result) do
                            if action.title:match "Insert Type Annotation" then
                                if action.edit or action.command then
                                    vim.lsp.buf.execute_command(action.command or action)
                                end
                                return
                            end
                        end

                        -- fallback: open code action menu if not found
                        vim.lsp.buf.code_action()
                    end)
                end, opts)
            end

            metals_config.on_init = nvlsp.on_init
            metals_config.capabilities = nvlsp.capabilities

            metals_config.settings = {
                defaultBspToBuildTool = true,
                showInferredType = true, -- relevant for type hints
            }

            return metals_config
        end,
        config = function(_, metals_config)
            vim.filetype.add {
                pattern = {
                    [".*%.scala%.html"] = "scala",
                },
            }

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
        version = "^1.0.0",
        opts = {
            registries = {
                "github:nvim-java/mason-registry",
                "github:mason-org/mason-registry",
            },
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        version = "^1.0.0",
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
}
