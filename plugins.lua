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
    -- {
    --     "nvim-treesitter/playground", -- Provides :Inspect command
    --     requires = {
    --         {"nvim-treesitter/nvim-treesitter"}
    --     },
    -- }, 
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
        config = function()
            -- local jdtls = require("jdtls")
            -- nnoremap <A-o> <Cmd>lua require'jdtls'.organize_imports()<CR>
            -- nnoremap crv <Cmd>lua require('jdtls').extract_variable()<CR>
            -- vnoremap crv <Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>
            -- nnoremap crc <Cmd>lua require('jdtls').extract_constant()<CR>
            -- vnoremap crc <Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>
            -- vnoremap crm <Esc><Cmd>lua require('jdtls').extract_method(true)<CR>
            -- 
            -- 
            -- -- If using nvim-dap
            -- -- This requires java-debug and vscode-java-test bundles, see install steps in this README further below.
            -- nnoremap <leader>df <Cmd>lua require'jdtls'.test_class()<CR>
            -- nnoremap <leader>dn <Cmd>lua require'jdtls'.test_nearest_method()<CR>
            -- vim.keymap.set('n', 'gd',   function() vim.lsp.buf.definition() end)

        end
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
    -- {
    --     "mason-org/mason-lspconfig.nvim",
    --     opts = {
    --         automatic_enable = { exclude = { 'jdtls' } }
    --     },
    --     dependencies = {
    --         { "mason-org/mason.nvim", opts = {} },
    --         "neovim/nvim-lspconfig",
    --     },
    --     requires = {
    --         "mason-org/mason.nvim",
    --         "neovim/nvim-lspconfig",
    --     },
    -- },
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
