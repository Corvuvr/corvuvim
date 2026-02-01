local PALETTE = {}

PALETTE.RED    = "#FF0000"
PALETTE.CHERRY = "#99110F"
PALETTE.SAND   = "#E3C46F"
PALETTE.GOLD   = "#F7E277"
PALETTE.BROWN  = "#332215"
PALETTE.WHITE  = "#FFFFFF"
PALETTE.BLACK  = "#000000"

function PALETTE.setup()
    
    vim.api.nvim_set_hl(0, "@keyword.conditional",  { fg = PALETTE.RED                })
    vim.api.nvim_set_hl(0, "@keyword.parameter",    { fg = PALETTE.RED                })
    vim.api.nvim_set_hl(0, "@keyword.function",     { fg = PALETTE.RED                })
    vim.api.nvim_set_hl(0, "@keyword.repeat",       { fg = PALETTE.RED                })
    vim.api.nvim_set_hl(0, "@keyword.return",       { fg = PALETTE.RED                })
    vim.api.nvim_set_hl(0, "@function.macro",       { fg = PALETTE.RED                })
    vim.api.nvim_set_hl(0, "@string.escape",        { fg = PALETTE.RED                })
    vim.api.nvim_set_hl(0, "Conditional",           { fg = PALETTE.RED                })
    vim.api.nvim_set_hl(0, "Identifier",            { fg = PALETTE.RED                })
    vim.api.nvim_set_hl(0, "Keyword",               { fg = PALETTE.RED                })
    vim.api.nvim_set_hl(0, "Title",                 { fg = PALETTE.RED,   bold=true   })
    vim.api.nvim_set_hl(0, "Statement",             { fg = PALETTE.RED,   italic=true })
    vim.api.nvim_set_hl(0, "Type",                  { fg = PALETTE.RED,   italic=true })
    vim.api.nvim_set_hl(0, "@type",                 { fg = PALETTE.RED,   italic=true })
    vim.api.nvim_set_hl(0, "@property",             { fg = PALETTE.RED,   italic=true })
    vim.api.nvim_set_hl(0, "@type.builtin",         { fg = PALETTE.RED,   italic=true })
    vim.api.nvim_set_hl(0, "@module",               { fg = PALETTE.WHITE              })
    vim.api.nvim_set_hl(0, "@variable",             { fg = PALETTE.WHITE              })
    vim.api.nvim_set_hl(0, "@variable.member",      { fg = PALETTE.WHITE              })
    vim.api.nvim_set_hl(0, "@variable.parameter",   { fg = PALETTE.WHITE,             })
    vim.api.nvim_set_hl(0, "LineNr",                { fg = PALETTE.WHITE,             })
    vim.api.nvim_set_hl(0, "Special",               { fg = PALETTE.WHITE,             })
    vim.api.nvim_set_hl(0, "Constant",              { fg = PALETTE.WHITE              })
    vim.api.nvim_set_hl(0, "Operator",              { fg = PALETTE.WHITE,             })
    vim.api.nvim_set_hl(0, "Function",              { fg = PALETTE.WHITE,             })
    vim.api.nvim_set_hl(0, "@function.builtin",     { fg = PALETTE.WHITE,             })
    vim.api.nvim_set_hl(0, "Visual",                { fg = PALETTE.GOLD,bg = "#99110F"})
    vim.api.nvim_set_hl(0, "@constant.builtin",     { fg = PALETTE.GOLD,  italic=true })
    vim.api.nvim_set_hl(0, "@variable.builtin",     { fg = PALETTE.GOLD,  italic=true })
    vim.api.nvim_set_hl(0, "@markup.list",          { fg = PALETTE.GOLD,  italic=true })
    vim.api.nvim_set_hl(0, "@string",               { fg = PALETTE.GOLD,  italic=true })
    vim.api.nvim_set_hl(0, "@parameter",            { fg = PALETTE.GOLD,  italic=true })
    vim.api.nvim_set_hl(0, "DiagnosticHint",        { fg = PALETTE.GOLD,  italic=true })
    vim.api.nvim_set_hl(0, "Number",                { fg = PALETTE.GOLD,  italic=true })
    vim.api.nvim_set_hl(0, "String",                { fg = PALETTE.GOLD,  italic=true })
    vim.api.nvim_set_hl(0, "PreProc",               { fg = PALETTE.GOLD,  italic=true })

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })
end

return PALETTE
