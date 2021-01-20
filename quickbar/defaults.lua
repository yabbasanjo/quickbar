local defaults = {
    target = '',
    sendothers = false,
    mode='nukes',
    senddelay = '0.2',
    queue = {
        command = '',
        target = '',
        custom = ''
    },
    keybinds = {
        DIK_1 = 'qb c 1',
        DIK_2 = 'qb c 2',
        DIK_3 = 'qb c 3',
        DIK_4 = 'qb c 4',
        DIK_5 = 'qb c 5',
        DIK_6 = 'qb c 6',
        DIK_7 = 'qb c 7',
        DIK_8 = 'qb c 8',
        DIK_9 = 'qb c 9',
        DIK_0 = 'qb c 10',
        DIK_EQUALS = 'qb mode d',
        DIK_BACK = 'qb mode u',
        DIK_GRAVE = 'qb st'
    },
    commandsets = {
        default = {
            DIK_1 = '',
            DIK_2 = '',
            DIK_3 = '',
            DIK_4 = '',
            DIK_5 = '',
            DIK_6 = '',
            DIK_7 = '',
            DIK_8 = '',
            DIK_9 = '',
            DIK_0 = '',
        },
        nukes = {
            DIK_1 = 'gs c nuke 1 .',
            DIK_2 = 'gs c nuke 2 .',
            DIK_3 = 'gs c nuke 3 .',
            DIK_4 = 'gs c nuke 4 .',
            DIK_5 = 'gs c nuke 5 .',
            DIK_6 = 'gs c nuke 6 .',
            DIK_7 = 'gs c nuke 2 helix',
            DIK_8 = 'input /ebullience',
            DIK_9 = 'input /focalization',
            DIK_0 = 'input /addendumblack; wait 1; input /darkarts',
        },
        cures = {

        }
    } 
}

return defaults