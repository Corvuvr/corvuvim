return {

    -- UI
    { 
        'norcalli/nvim-colorizer.lua' 
    },
    {
        "xiyaowong/transparent.nvim"
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "v1.10.0",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = require("configs.nvim-tree")
    },
    {
        "nvim-lualine/lualine.nvim", 
        config = require("configs.lualine")
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = require("configs.telescope")
    },
    {
        "folke/which-key.nvim", 
        event = "VeryLazy",
        config = function()
            vim.api.nvim_set_hl(0, "WhichKey", { bg = "#000000" })
            vim.api.nvim_set_hl(0, "WhichKeyDesc", { fg = "#f7e277" })
            vim.api.nvim_set_hl(0, "WhichKeyNormal", { bg = "#000000" })
        end
    },
    {
        "sphamba/smear-cursor.nvim",
        opts = {
            max_kept_windows = 1,
            stiffness = 1,      -- animation speed
            time_interval = 3,  -- framerate
            
        },
    },
    {
        "MaximilianLloyd/ascii.nvim",
        lazy = false, name = "ascii",
        dependencies = { "MunifTanjim/nui.nvim" },
        -- config = function()
        --     header = require("ascii").get_random_global()
        -- end,
    },
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = require("configs.dashboard"),
        dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },

    -- Refactoring
    {
        "nvim-treesitter/nvim-treesitter",
        -- Call TSInstall python if you need syntax highlighting
        config = function() 
            require ('nvim-treesitter.config').setup {
                highlight = {
                    enable = true,
                }
            }
        end,
    },
    {
        "nvim-lua/plenary.nvim"
    },
    {
        "ThePrimeagen/refactoring.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"},
            {"nvim-treesitter/nvim-treesitter"}
        },
        lazy=false,
        opts={}
    },

    -- LSP and completions
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = require("configs.nvim-lspconfig"),
    },
    -- {
    --     -- Shows LSP pop-ups and provides many utilities
    --     -- (Currently turned off completions in favor of nvim-cmp)
    --     "neoclide/coc.nvim",       
    --     lazy = false, 
    --     branch = "release", 
    -- },
    {
        'hrsh7th/nvim-cmp',             -- Completion plugin
        dependencies = {
            'L3MON4D3/LuaSnip',         -- Snippet engine
            'hrsh7th/cmp-nvim-lsp',     -- LSP source for nvim-cmp
        },
        config = function()

            local cmp = require('cmp')
            cmp.setup({
                window = {
                    completion = { 
                        side = "left",
                        border = "rounded",
                        winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:CmpLine",
                    },
                },
                mapping = {
                    ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                },
                sources = {
                    { 
                        name = 'nvim_lsp',
                        entry_filter = function(entry, ctx)
                            return require('cmp.types').lsp.CompletionItemKind[entry:get_kind()] ~= 'Text'
                        end
                    },
                    -- { name = 'buffer' },
                    -- { name = 'path' },
                    -- { name = 'cmdline' },
                    -- { name = 'luasnip' },
                },
            })

            local PALETTE = require("colorscheme")
            
            vim.api.nvim_set_hl(0, "CmpNormal", { fg = PALETTE.GOLD, bg = PALETTE.BLACK })
            vim.api.nvim_set_hl(0, "CmpBorder", { fg = PALETTE.GOLD, bg = PALETTE.BLACK })
            vim.api.nvim_set_hl(0, "CmpLine",   { fg = PALETTE.GOLD, bg = PALETTE.CHERRY })

        end,
    },
    {
        "mfussenegger/nvim-jdtls",
        dependencies = {
            "mfussenegger/nvim-dap",
            "neovim/nvim-lspconfig",
        },
        event = "VeryLazy",
    },


    -- DAP
    {
        "mfussenegger/nvim-dap", 
        lazy = false, 
        dependencies = "stevearc/overseer.nvim", -- support for .vscode/tasks.json
        -- config = function(_, opts) 
        --     require("overseer").enable_dap() 
        -- end,
    },
    {
        "rcarriga/nvim-dap-ui",
        lazy = false,
        dependencies = "mfussenegger/nvim-dap",
        config = require("configs.nvim-dap-ui")
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
        },
        config = function(_, opts)
            -- local path = "/home/test/miniconda3/bin/python"
            require("dap-python").setup("python3")
        end,
    },

    -- MASON
    {
        "mason-org/mason.nvim",
        opts = { ensure_installed = { "codelldb", "pyright", "jdtls" }, },
        config = function() 
            require("mason").setup()
            -- Workaround for jdtls to load external packages
            vim.api.nvim_create_autocmd('FileType', {
                pattern = 'java',
                callback = function(args)
                    require('configs.nvim-jdtls').setup()
                end
            })
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "mfussenegger/nvim-dap",
        },
        opts = { 
            handlers = {},
            ensure_installed = { "codelldb" },
        },
    },

}
