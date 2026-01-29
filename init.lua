-- VIM OPTIONS
vim.cmd("set number")
vim.cmd("set expandtab")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.opt.clipboard = {"unnamed", "unnamedplus"}
-- Set up mapleader before plugins section since their mappings will depend on it 
vim.g.mapleader = " " 

-- PLUGINS
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- ~/.local/share/nvim/lazy
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", "https://github.com/folke/lazy.nvim.git", lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

local plugindir = (debug.getinfo(1,'S').source:sub(2):match("(.*/)") or "./")
package.path = package.path .. ";" .. plugindir .. "configs/?.lua"
package.path = package.path .. ";" .. plugindir .. "/?.lua"

local plugins = require("plugins")
require("lazy").setup(plugins, {})
require("mappings").setup()
require("colorscheme").setup()

-- Workaround for jdtls to load external packages
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'java',
    callback = function(args)
        require('configs.nvim-jdtls').setup()
    end
})
