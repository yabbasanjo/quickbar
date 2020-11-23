local common = require('common')
local c = {
    storedTarget = ''
}
    


local CONST_QB_SEND_OTHERS = 'send @others qb %d %s'
local CONST_ST_SEND_OTHERS = 'send @others st '
local CONST_QB_INPUT_CMD = 'input %s'
local CONST_QB_CMD_TARG = '%s %s'
function c.help()
    
end

function c.run(cmdNumber, cmdTarget, cmdCustom)
    local input = ''
    local targ = ''

    --send target to others ahead of time before commands are sent
    if storedTarget ~= '' then
        windower.send_command(CONST_ST_SEND_OTHERS..storedTarget)
    end

    if cmdNumber == '0' then
        input = create_command(cmdCustom, cmdTarget)
    else
        input = create_command(cmdNumber, cmdTarget)
    end

    if common.sendOthers then
        if targ == '' then
            targ = common.gettarget()
        end
        windower.send_command(string.format(CONST_QB_SEND_OTHERS, cmdNumber, targ))
    end
end


function c.targetthis(target)
    storedTarget = target
    if target == nil then 
        storedTarget = ''
    end

    windower.add_to_chat(204, 'Target '..storedTarget)

    return t
end

function c.settarget()
    local t = common.gettarget()
    if t ~= '' then
        common.send_to_others(true)
    else
        common.send_to_others()
    end  

    storedTarget = t

    windower.add_to_chat(204, 'Target Saved '..storedTarget)
end

function c.mode(selector)
    if (selector == 'up' or selector == 'u') or (selector == 'down' or selector == 'd') then
        --cycle up or down through job commandsets
    else
        --select specific commandset

        --select default if bad selector
    end
end



function create_command(command, target)
    if target == nil then target = '' end

    local input = command
    local targ = ''
    
    if (string.find(input,'<st') ~= nil or string.find(input,'<me>') ~= nil) then
        targ = ''
    end

    if string.find(input,' <TT>') ~= nil then
        input = string.gsub(input, ' <TT>', '');
        targ = common.gettarget();
    end

    if target ~= '' then
        targ = target
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

    --TODO: old, hopefully replace with gs c nuke T5 etc
    -- if state.QuickBar.value == 'Nukes' then	
    --     if p < 7 then
    --         if targ == 0 then 
    --             targ = '' 
    --         end
    --         input = string.format('%s%s%d %s', input, state.OffenseElement.value, p, targ)
    --         add_to_chat(123, 'nuke'..input)
    --     end
    -- else
    --     add_to_chat(123, 'Target: '..targ)
    --     input = string.format('%s %s', input, targ)
    --     add_to_chat(123, 'Formatted Input: '..input)
    -- end

    input = string.gsub(input, '"','\"')

    -- TODO: old, not sure whyyyyy im doing it this way..
    -- if not targ == '' then
			
    -- else
    --     send_command(input)
    -- end 

    windower.send_command(input)


    return input 
end


return c