-- VIM OPTIONS
vim.cmd("set number")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- It seems like unnamed(+) registers preserve blockwise metadata more strictly than internal registers,
-- meaning that pasting over in VISUAL-BLOCK mode keep shape of the initially yanked block.
--
-- EXAMPLE:
-- 1) Delete (d) "longer_text" in VISUAL-BLOCK mode;
-- 2) Paste "longer_text" over "longer_text" selected in VISUAL-BLOCK mode;
-- 3) The following pasting will result in:
--    3a) "shortr_txt " (with trailing space) when using unnamed(+) clipboard;
--    3b) "shortr_txt" (without trailing space) when no clipboard specified.
--
-- When vim.opt.clipboard is not specified, "" register is used by default (:h 'clipboard').
--
vim.opt.clipboard = { 
    "unnamed",    -- Use "*" register for all YANK, DELETE, CHANGE and PUT operations.

    "unnamedplus" -- Use "+" register for all YANK, DELETE, CHANGE and PUT operations. 
                  -- When "unnamed" is also included, YANK and DELETE operations (but not PUT)
			      -- will additionally copy the text into register "*"
} 
-- On Windows and Mac OS X, "+" and "*" are pointing to the same thing.
-- On Linux:
--    The "*" register automatically captures any text highlighted with mouse. Paste with <MMB> or <Shift-Insert>.
--    The "+" register is populated only when CUT or COPY command explicitly used (like <Ctrl-c>). Paste with <Ctrl-V>.

-- Mapleader is set up before plugins section since their mappings will depend on it.
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
require("lsp")
