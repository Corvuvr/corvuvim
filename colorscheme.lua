local M = {}

function M.setup()

    local PALETTE_RED   = "#ff0000"
    local PALETTE_GOLD  = "#f7e277"
    local PALETTE_WHITE = "#ffffff"
    
    vim.api.nvim_set_hl(0, "@keyword.conditional",  { fg = PALETTE_RED                })
    vim.api.nvim_set_hl(0, "@keyword.parameter",    { fg = PALETTE_RED                })
    vim.api.nvim_set_hl(0, "@variable.parameter",   { fg = PALETTE_RED                })
    vim.api.nvim_set_hl(0, "@keyword.function",     { fg = PALETTE_RED                })
    vim.api.nvim_set_hl(0, "@keyword.repeat",       { fg = PALETTE_RED                })
    vim.api.nvim_set_hl(0, "@keyword.return",       { fg = PALETTE_RED                })
    vim.api.nvim_set_hl(0, "@function.macro",       { fg = PALETTE_RED                })
    vim.api.nvim_set_hl(0, "@string.escape",        { fg = PALETTE_RED                })
    vim.api.nvim_set_hl(0, "Conditional",           { fg = PALETTE_RED                })
    vim.api.nvim_set_hl(0, "Identifier",            { fg = PALETTE_RED                })
    vim.api.nvim_set_hl(0, "Keyword",               { fg = PALETTE_RED                })
    vim.api.nvim_set_hl(0, "Title",                 { fg = PALETTE_RED,   bold=true   })
    vim.api.nvim_set_hl(0, "Statement",             { fg = PALETTE_RED,   italic=true })
    vim.api.nvim_set_hl(0, "Type",                  { fg = PALETTE_RED,   italic=true })
    vim.api.nvim_set_hl(0, "@type",                 { fg = PALETTE_RED,   italic=true })
    vim.api.nvim_set_hl(0, "@property",             { fg = PALETTE_RED,   italic=true })
    vim.api.nvim_set_hl(0, "@type.builtin",         { fg = PALETTE_RED,   italic=true })
    vim.api.nvim_set_hl(0, "@module",               { fg = PALETTE_WHITE              })
    vim.api.nvim_set_hl(0, "@variable",             { fg = PALETTE_WHITE              })
    vim.api.nvim_set_hl(0, "@variable.member",      { fg = PALETTE_WHITE              })
    vim.api.nvim_set_hl(0, "LineNr",                { fg = PALETTE_WHITE,             })
    vim.api.nvim_set_hl(0, "Special",               { fg = PALETTE_WHITE,             })
    vim.api.nvim_set_hl(0, "Constant",              { fg = PALETTE_WHITE              })
    vim.api.nvim_set_hl(0, "Operator",              { fg = PALETTE_WHITE,             })
    vim.api.nvim_set_hl(0, "Function",              { fg = PALETTE_WHITE,             })
    vim.api.nvim_set_hl(0, "@function.builtin",     { fg = PALETTE_WHITE,             })
    vim.api.nvim_set_hl(0, "Visual",                { fg = PALETTE_GOLD,bg = "#99110F"})
    vim.api.nvim_set_hl(0, "@constant.builtin",     { fg = PALETTE_GOLD,  italic=true })
    vim.api.nvim_set_hl(0, "@variable.builtin",     { fg = PALETTE_GOLD,  italic=true })
    vim.api.nvim_set_hl(0, "@markup.list",          { fg = PALETTE_GOLD,  italic=true })
    vim.api.nvim_set_hl(0, "@string",               { fg = PALETTE_GOLD,  italic=true })
    vim.api.nvim_set_hl(0, "@parameter",            { fg = PALETTE_GOLD,  italic=true })
    vim.api.nvim_set_hl(0, "DiagnosticHint",        { fg = PALETTE_GOLD,  italic=true })
    vim.api.nvim_set_hl(0, "Number",                { fg = PALETTE_GOLD,  italic=true })
    vim.api.nvim_set_hl(0, "String",                { fg = PALETTE_GOLD,  italic=true })
    vim.api.nvim_set_hl(0, "PreProc",               { fg = PALETTE_GOLD,  italic=true })
end

return M
