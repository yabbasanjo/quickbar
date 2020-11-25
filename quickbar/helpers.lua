
local h = {
    keymap = {
        DIK_GRAVE = '`',
        DIK_ESCAPE = 'escape',
        DIK_1 = '1',
        DIK_2 = '2',
        DIK_3 = '3',
        DIK_4 = '4',
        DIK_5 = '5',
        DIK_6 = '6',
        DIK_7 = '7',
        DIK_8 = '8',
        DIK_9 = '9',
        DIK_0 = '0',
        DIK_MINUS = '-',
        DIK_EQUALS = '=',
        DIK_BACK = 'backspace',
        DIK_TAB = 'tab',
        DIK_Q = 'q',
        DIK_W = 'w',
        DIK_E = 'e',
        DIK_R = 'r',
        DIK_T = 't',
        DIK_Y = 'y',
        DIK_U = 'u',
        DIK_I = 'i',
        DIK_O = 'o',
        DIK_P = 'p',
        DIK_LBRACKET = '[',
        DIK_RBRACKET = ']',
        DIK_RETURN = 'enter',
        DIK_RETURN = 'return',
        DIK_LCONTROL = 'ctrl',
        DIK_LCONTROL = 'lctrl',
        DIK_A = 'a',
        DIK_S = 's',
        DIK_D = 'd',
        DIK_F = 'f',
        DIK_G = 'g',
        DIK_H = 'h',
        DIK_J = 'j',
        DIK_K = 'k',
        DIK_L = 'l',
        DIK_SEMICOLON = ';',
        DIK_APOSTROPHE = '\'',
        DIK_LSHIFT = 'shift',
        DIK_LSHIFT = 'lshift',
        DIK_BACKSLASH = '\\',
        DIK_Z = 'z',
        DIK_X = 'x',
        DIK_C = 'c',
        DIK_V = 'v',
        DIK_B = 'b',
        DIK_N = 'n',
        DIK_M = 'm',
        DIK_COMMA = ',',
        DIK_PERIOD = '.',
        DIK_SLASH = '/',
        DIK_RSHIFT = 'rshift',
        DIK_MULTIPLY = 'numpad*',
        DIK_LMENU = 'alt',
        DIK_LMENU = 'lalt',
        DIK_SPACE = 'space',
        DIK_CAPITAL = 'capslock',
        DIK_F1 = 'f1',
        DIK_F2 = 'f2',
        DIK_F3 = 'f3',
        DIK_F4 = 'f4',
        DIK_F5 = 'f5',
        DIK_F6 = 'f6',
        DIK_F7 = 'f7',
        DIK_F8 = 'f8',
        DIK_F9 = 'f9',
        DIK_F10 = 'f10',
        DIK_NUMLOCK = 'numlock',
        DIK_SCROLL = 'scrolllock',
        DIK_NUMPAD7 = 'numpad7',
        DIK_NUMPAD8 = 'numpad8',
        DIK_NUMPAD9 = 'numpad9',
        DIK_SUBTRACT = 'numpad-',
        DIK_NUMPAD4 = 'numpad4',
        DIK_NUMPAD5 = 'numpad5',
        DIK_NUMPAD6 = 'numpad6',
        DIK_ADD = 'numpad+',
        DIK_NUMPAD1 = 'numpad1',
        DIK_NUMPAD2 = 'numpad2',
        DIK_NUMPAD3 = 'numpad3',
        DIK_NUMPAD0 = 'numpad0',
        DIK_DECIMAL = 'numpad.',
        DIK_F11 = 'f11',
        DIK_F12 = 'f12',
        DIK_KANA = 'kana',
        DIK_CONVERT = 'convert',
        DIK_NOCONVERT = 'noconvert',
        DIK_YEN = 'yen',
        DIK_KANJI = 'kanji',
        DIK_NUMPADENTER = 'numpadenter',
        DIK_RCONTROL = 'rctrl',
        DIK_SYSRQ = 'sysrq',
        DIK_RMENU = 'ralt',
        DIK_PAUSE = 'pause',
        DIK_HOME = 'home',
        DIK_UP = 'up',
        DIK_PRIOR = 'pageup',
        DIK_LEFT = 'left',
        DIK_RIGHT = 'right',
        DIK_END = 'end',
        DIK_DOWN = 'down',
        DIK_NEXT = 'pagedown',
        DIK_INSERT = 'insert',
        DIK_DELETE = 'delete',
        DIK_LWIN = 'windows',
        DIK_LWIN = 'lwindows',
        DIK_RWIN = 'rwindows',
        DIK_APPS = 'apps',
        DIK_MAIL = 'mail',
        DIK_MEDIASELECT = 'mmselect',
        DIK_MEDIASTOP = 'mmstop',
        DIK_MUTE = 'mute',
        DIK_MYCOMPUTER = 'mycomputer',
        DIK_NEXT = 'mmnext',
        DIK_NEXTTRACK = 'mmnexttrack',
        DIK_PLAYPAUSE = 'mmplaypause',
        DIK_POWER = 'power',
        DIK_PREVTRACK = 'mmprevtrack',
        DIK_STOP = 'mmstop',
        DIK_VOLUMEDOWN = 'mmvolup',
        DIK_VOLUMEUP = 'mmvoldown',
        DIK_WEBBACK = 'webback',
        DIK_WEBFAVORITES = 'webfav',
        DIK_WEBFORWARD = 'webforward',
        DIK_WEBHOME = 'webhome',
        DIK_WEBREFRESH = 'webrefresh',
        DIK_WEBSEARCH = 'websearch',
        DIK_WEBSTOP = 'webstop',
    }
}

function h.to_xml_table(tab)

    local rettab = {}
    
    for t in tab:it() do
        local inner = {}
        for k,v in pairs(t) do
            inner[#inner + 1] = { name = k, val = v}
        end
        rettab[#rettab + 1] = inner
    end

    return rettab
end

function h.from_xml_table(tab)

    local rettab = L{}

    for k,v in pairs(tab) do
        local inner = {}
        for j,x in pairs(v) do
            inner[x.name] = x.val
        end
        rettab:append(inner)
    end
    
    return rettab

end

function h.bindkeys()
    windower.add_to_chat(70,'binding quickbar keys')
    -- for k,v in pairs(settings.keybinds) do
    --     windower.add_to_chat(70,string.format('%s %s', tostring(k), tostring(v)))
    --     --windower.send_command(string.format('bind %%s %s', keymap[tostring(k)], v))
    -- end
end



return h