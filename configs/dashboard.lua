function mergeTables(t1, t2)
    for _, value in ipairs(t2) do
        table.insert(t1, value)
    end
    return t1
end

local config = function()
    local db = require("dashboard")
    local ascii = require("ascii")
    db.setup({
        theme = 'hyper',
        config = {
            header = mergeTables(ascii.art.animals.cats.pouncy, ascii.art.text.neovim.the_edge),
            shortcut = {
                { 
                    desc = '󰊳 Update', 
                    group = '@property', 
                    action = 'Lazy update', 
                    key = 'u' 
                },
                {
                    icon = ' ',
                    icon_hl = '@variable',
                    desc = 'Files',
                    group = 'Label',
                    action = 'Telescope find_files',
                    key = 'f',
                },
                {
                    desc = ' Apps',
                    group = 'DiagnosticHint',
                    action = 'Telescope app',
                    key = 'a',
                },
                {
                    desc = ' dotfiles',
                    group = 'Number',
                    action = 'Telescope dotfiles',
                    key = 'd',
                },
            },
        },
    })
end

return config 
