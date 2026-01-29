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
        -- enabled = false, -- very slow
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
    {"nvim-lua/plenary.nvim"},
    {"nvim-treesitter/playground"},
    {
        "nvim-treesitter/nvim-treesitter",
        -- Call TSInstall python if you need syntax highlighting
        config = function() 
            require ('nvim-treesitter.configs').setup {
                highlight = {
                    enable = true,
                }
            }
        end,
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
    {
        "neoclide/coc.nvim", -- Shows LSP pop-ups and provides many utilities        
        lazy = false, 
        branch = "release", 
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
        "nvim-neotest/nvim-nio",
    },
    {
        "mfussenegger/nvim-dap", 
        lazy = false, 
        config = function(_, opts) 
            -- require("overseer").enable_dap() 
        end,
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
    {
        'stevearc/overseer.nvim', -- support for .vscode/tasks.json
        ---@module 'overseer'
        ---@type overseer.SetupOpts
        opts = {},
        -- config = function(_, opts)
        --     -- local path = "/home/test/miniconda3/bin/python"
        --     require("overseer").setup({
        --         dap = false,
        --     })
        -- end,
    },

    -- MASON
    {
        "williamboman/mason.nvim",
        opts = { ensure_installed = { "codelldb", "pyright", "jdtls" }, },
        config = function() 
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
        "mason-org/mason-lspconfig.nvim",
        opts = {
            automatic_enable = { exclude = { 'jdtls' } }
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = { 
            handlers = {},
            ensure_installed = { "codelldb" },
        },
    },

}
