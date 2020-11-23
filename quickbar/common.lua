
local c = {}

c.sendOthers = false

function c.gettarget()
    local mob = windower.ffxi.get_mob_by_target('st') or windower.ffxi.get_mob_by_target('t')
    if mob and mob.id > 0 then
        return mob.id
    else
        windower.add_to_chat(123, '-- no target --')
    end
    return ''
end

function c.send_to_others(value)
    if value == nil then
        sendOthers = not sendOthers;
    else
        sendOthers = value;
    end 
    
    windower.add_to_chat(070, 'Send Target: '..(sendOthers and 'ON' or 'OFF'))
end

return c