 --#region Variables
local c = {}
local CONST_QB_SEND_OTHERS = 'send @others qb exec %d %s'
local CONST_QB_TARGET_THIS = 'send @others qb tt '
local CONST_QB_INPUT_CMD = 'input %s'
local CONST_QB_CMD_TARG = '%s %s'

local CONST_ST_SEND_OTHERS = 'send @others st '

local CONST_KEY_MAP = {
    ['DIK_GRAVE'] = '`',
    ['DIK_ESCAPE'] = 'escape',
    ['DIK_1'] = '1',
    ['DIK_2'] = '2',
    ['DIK_3'] = '3',
    ['DIK_4'] = '4',
    ['DIK_5'] = '5',
    ['DIK_6'] = '6',
    ['DIK_7'] = '7',
    ['DIK_8'] = '8',
    ['DIK_9'] = '9',
    ['DIK_0'] = '0',
    ['DIK_MINUS'] = '-',
    ['DIK_EQUALS'] = '=',
    ['DIK_BACK'] = 'backspace',
    ['DIK_TAB'] = 'tab',
    ['DIK_Q'] = 'q',
    ['DIK_W'] = 'w',
    ['DIK_E'] = 'e',
    ['DIK_R'] = 'r',
    ['DIK_T'] = 't',
    ['DIK_Y'] = 'y',
    ['DIK_U'] = 'u',
    ['DIK_I'] = 'i',
    ['DIK_O'] = 'o',
    ['DIK_P'] = 'p',
    ['DIK_LBRACKET'] = '[',
    ['DIK_RBRACKET'] = ']',
    ['DIK_RETURN'] = 'enter',
    ['DIK_RETURN'] = 'return',
    ['DIK_LCONTROL'] = 'ctrl',
    ['DIK_LCONTROL'] = 'lctrl',
    ['DIK_A'] = 'a',
    ['DIK_S'] = 's',
    ['DIK_D'] = 'd',
    ['DIK_F'] = 'f',
    ['DIK_G'] = 'g',
    ['DIK_H'] = 'h',
    ['DIK_J'] = 'j',
    ['DIK_K'] = 'k',
    ['DIK_L'] = 'l',
    ['DIK_SEMICOLON'] = ';',
    ['DIK_APOSTROPHE'] = '\'',
    ['DIK_LSHIFT'] = 'shift',
    ['DIK_LSHIFT'] = 'lshift',
    ['DIK_BACKSLASH'] = '\\',
    ['DIK_Z'] = 'z',
    ['DIK_X'] = 'x',
    ['DIK_C'] = 'c',
    ['DIK_V'] = 'v',
    ['DIK_B'] = 'b',
    ['DIK_N'] = 'n',
    ['DIK_M'] = 'm',
    ['DIK_COMMA'] = ',',
    ['DIK_PERIOD'] = '.',
    ['DIK_SLASH'] = '/',
    ['DIK_RSHIFT'] = 'rshift',
    ['DIK_MULTIPLY'] = 'numpad*',
    ['DIK_LMENU'] = 'alt',
    ['DIK_LMENU'] = 'lalt',
    ['DIK_SPACE'] = 'space',
    ['DIK_CAPITAL'] = 'capslock',
    ['DIK_F1'] = 'f1',
    ['DIK_F2'] = 'f2',
    ['DIK_F3'] = 'f3',
    ['DIK_F4'] = 'f4',
    ['DIK_F5'] = 'f5',
    ['DIK_F6'] = 'f6',
    ['DIK_F7'] = 'f7',
    ['DIK_F8'] = 'f8',
    ['DIK_F9'] = 'f9',
    ['DIK_F10'] = 'f10',
    ['DIK_NUMLOCK'] = 'numlock',
    ['DIK_SCROLL'] = 'scrolllock',
    ['DIK_NUMPAD7'] = 'numpad7',
    ['DIK_NUMPAD8'] = 'numpad8',
    ['DIK_NUMPAD9'] = 'numpad9',
    ['DIK_SUBTRACT'] = 'numpad-',
    ['DIK_NUMPAD4'] = 'numpad4',
    ['DIK_NUMPAD5'] = 'numpad5',
    ['DIK_NUMPAD6'] = 'numpad6',
    ['DIK_ADD'] = 'numpad+',
    ['DIK_NUMPAD1'] = 'numpad1',
    ['DIK_NUMPAD2'] = 'numpad2',
    ['DIK_NUMPAD3'] = 'numpad3',
    ['DIK_NUMPAD0'] = 'numpad0',
    ['DIK_DECIMAL'] = 'numpad.',
    ['DIK_F11'] = 'f11',
    ['DIK_F12'] = 'f12',
    ['DIK_KANA'] = 'kana',
    ['DIK_CONVERT'] = 'convert',
    ['DIK_NOCONVERT'] = 'noconvert',
    ['DIK_YEN'] = 'yen',
    ['DIK_KANJI'] = 'kanji',
    ['DIK_NUMPADENTER'] = 'numpadenter',
    ['DIK_RCONTROL'] = 'rctrl',
    ['DIK_SYSRQ'] = 'sysrq',
    ['DIK_RMENU'] = 'ralt',
    ['DIK_PAUSE'] = 'pause',
    ['DIK_HOME'] = 'home',
    ['DIK_UP'] = 'up',
    ['DIK_PRIOR'] = 'pageup',
    ['DIK_LEFT'] = 'left',
    ['DIK_RIGHT'] = 'right',
    ['DIK_END'] = 'end',
    ['DIK_DOWN'] = 'down',
    ['DIK_NEXT'] = 'pagedown',
    ['DIK_INSERT'] = 'insert',
    ['DIK_DELETE'] = 'delete',
    ['DIK_LWIN'] = 'windows',
    ['DIK_LWIN'] = 'lwindows',
    ['DIK_RWIN'] = 'rwindows',
    ['DIK_APPS'] = 'apps',
    ['DIK_MAIL'] = 'mail',
    ['DIK_MEDIASELECT'] = 'mmselect',
    ['DIK_MEDIASTOP'] = 'mmstop',
    ['DIK_MUTE'] = 'mute',
    ['DIK_MYCOMPUTER'] = 'mycomputer',
    ['DIK_NEXT'] = 'mmnext',
    ['DIK_NEXTTRACK'] = 'mmnexttrack',
    ['DIK_PLAYPAUSE'] = 'mmplaypause',
    ['DIK_POWER'] = 'power',
    ['DIK_PREVTRACK'] = 'mmprevtrack',
    ['DIK_STOP'] = 'mmstop',
    ['DIK_VOLUMEDOWN'] = 'mmvolup',
    ['DIK_VOLUMEUP'] = 'mmvoldown',
    ['DIK_WEBBACK'] = 'webback',
    ['DIK_WEBFAVORITES'] = 'webfav',
    ['DIK_WEBFORWARD'] = 'webforward',
    ['DIK_WEBHOME'] = 'webhome',
    ['DIK_WEBREFRESH'] = 'webrefresh',
    ['DIK_WEBSEARCH'] = 'websearch',
    ['DIK_WEBSTOP'] = 'webstop',
}
local CONST_VAL_MAP = nil
--#endregion

 --#region Interface

 --#region help
function c.help()
    print('help stuff soon')
end
--#endregion

 --#region save
function c.save(name)
end
--#endregion

 --#region load
function c.load()

    print('quickbar: binding default keys')
    for k,v in pairs(settings.keybinds) do
        --windower.add_to_chat(204,string.format('%s %s', CONST_KEY_MAP[k], v))
        --coroutine.sleep(.1)
        --windower.send_command(string.format('bind %%s %s', CONST_KEY_MAP[k], v))
        windower.send_command('bind %'..CONST_KEY_MAP[k]..' '..v)
        
    end

    CONST_VAL_MAP = table_invert(CONST_KEY_MAP)
    
end
--#endregion

 --#region c.run
function c.run(cmdNumber, cmdTarget, cmdCustom)
    local input = ''
    local targ = ''
    local tmpTarg = gettarget()
    
    if settings.target ~= '' then
        targ = settings.target
    end

    if settings.sendothers and targ == '' then
        targ = gettarget()
    end

    input = create_command(cmdNumber, targ, cmdCustom)

    --send target to others ahead of time before commands are sent
    if settings.sendothers then
        windower.send_command(string.format(CONST_QB_SEND_OTHERS, cmdNumber, targ))
        windower.send_command(CONST_ST_SEND_OTHERS..targ)
    end

end
--#endregion

 --#region execute
function c.execute(cmdNumber, cmdTarget, cmdCustom)
    local input = ''
    local targ = ''
    local targCurrent = gettarget()
    
    if settings.target ~= '' then
        targ = settings.target
    end

    if targ == '' then
        targ = cmdTarget
    end

    if tostring(targ) == tostring(targCurrent) then
        input = create_command(cmdNumber, targ, cmdCustom)
    else
        c.queue = {
            id = cmdNumber,
            target = targ,
            custom = cmdCustom
        }
    end
end
--#endregion

 --#region targetthis
function c.targetthis(target)
    
    if target == nil then 
        settings.target = ''
    else
        settings.target = target
    end

    windower.add_to_chat(204, 'Target '..settings.target)

    return t
end
--#endregion

 --#region settarget()
function c.settarget()
    local targ = gettarget()

    settings.target = targ
    if targ == '' then
        send_to_others()
    else
        send_to_others(true)
    end  

    windower.send_command(CONST_QB_TARGET_THIS..settings.target)
    

    windower.add_to_chat(204, 'Target Saved '..settings.target)
end
--#endregion

 --#region c.mode(selector)
function c.mode(selector)
    local t = {}
    local itbl = 1
    local newmode = 0

    for k in pairs(settings.commandsets) do
        table.insert(t, k)
    end
    table.sort(t)

    if settings.mode == nil or settings.mode == '' then
        settings.mode = t[1]
    end

    local done = false

    --cycle up through job commandsets
    if L{'up','u','n','next'}:contains(selector) then
        for i=1, #t do
            if t[i] == settings.mode then 
                newmode = i + 1
            end
        end

        if newmode > #t then 
            newmode = 1
        end

    elseif L{'down','d','back','b'}:contains(selector) then
        for i=1, #t do
            if t[i] == settings.mode then 
                newmode = i-1
                break
            end
        end

        if newmode == 0 then
            newmode = #t
        end

    else
        for i=1, #t do
            if t[i] == selector then
                newmode = i
                break
            end
        end

        if newmode == 0 then
            newmode = 1
        end

    end

    settings.mode = t[newmode]

    print(settings.mode)
end
--#endregion

 --#region senddelay
function c.senddelay(delay)
    settings.senddelay = delay
end
--#endregion

--#endregion

 --#region Internal Functions

 --#region create_command
function create_command(number, target, custom)
    if target == nil then target = '' end
    local targ = ''
    local input = ''
    if number == '0' then
        input = custom
    else
        input = settings.commandsets[settings.mode][number]
    end
    
    if string.find(input,' <TT>') ~= nil then
        input = string.gsub(input, ' <TT>', '');
        targ = gettarget();
    end

    if target ~= '' then
        targ = target
    end

    if (string.find(input,'<st') ~= nil or string.find(input,'<me>') ~= nil) then
        targ = ''
    end

    --handle /commands
    local nonlua = string.find(input, '/')
    if nonlua ~= nil then
        if nonlua == 1 then
            input = string.format(CONST_QB_INPUT_CMD, input) 
        end
    end

    --handle nukes or gearswap commands
    input = string.format(CONST_QB_CMD_TARG, input, targ)

    input = string.gsub(input, '"','\"')

    windower.send_command(input)

    return input 
end
--#endregion

 --#region gettarget()
function gettarget()
    local mob = windower.ffxi.get_mob_by_target('st') or windower.ffxi.get_mob_by_target('t')
    if mob and mob.id > 0 then
        return mob.id
    else
        windower.add_to_chat(123, '-- no target --')
    end
    return ''
end
--#endregion

 --#region send_to_others
function send_to_others(value)
    if value == nil then
        settings.sendothers = not settings.sendothers;
    else
        settings.sendothers = value;
    end 

    
    
    print('Send Target: ', (settings.sendothers and 'ON' or 'OFF'))
    
end
--#endregion

 --#region table_invert
function table_invert(t)
    local s={}
    for k,v in pairs(t) do
      s[v]=k
    end
    return s
 end
--#endregion

--#endregion


return c