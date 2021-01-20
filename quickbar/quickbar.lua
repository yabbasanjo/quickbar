--[[
    Copyright © 2020, YabbaSanjo
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:

        * Redistributions of source code must retain the above copyright
        notice, this list of conditions and the following disclaimer.
        * Redistributions in binary form must reproduce the above copyright
        notice, this list of conditions and the following disclaimer in the
        documentation and/or other materials provided with the distribution.
        * Neither the name of <addon name> nor the
        names of its contributors may be used to endorse or promote products
        derived from this software without specific prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
    ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
    WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
    DISCLAIMED. IN NO EVENT SHALL <your name> BE LIABLE FOR ANY
    DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
    (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
    ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
    SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--]]

_addon.name = 'quickbar'
_addon.author = 'YabbaSanjo'
_addon.version = '0.0.0.1'
_addon.commands = {'quickbar','qb'}

require('tables')

local config = require('config')
local defaults = require('defaults')
settings = config.load(defaults)

local commands = require('commands')

local handlers = {} 

local function handle_command(cmd, ...)
    local cmd = cmd or 'help'
    if handlers[cmd] then
        local msg = handlers[cmd](unpack({...}))
        if msg then
            error(msg)
        end
    else
        error("Unknown command %s":format(cmd))
    end
end

local function receive_target(index)
    if index ~= 0 then
        local mob = windower.ffxi.get_mob_by_index(index)
        if commands.queue ~= nil then
            
            if tostring(commands.queue.target) == tostring(mob.id) then
                commands.execute(commands.queue.id, commands.queue.target, commands.queue.custom)
                commands.queue = nil
            end
        end
    end
end


handlers['help'] = commands.help
handlers['run'] = commands.run
handlers['c'] = commands.run
handlers['exec'] = commands.execute
handlers['e'] = commands.execute
handlers['send'] = commands.send
handlers['s'] = commands.send
handlers['st'] = commands.settarget
handlers['tt'] = commands.targetthis
handlers['mode'] = commands.mode
handlers['save'] = commands.save
handlers['load'] = commands.load
handlers['delay'] = commands.senddelay
handlers['d'] = commands.senddelay

windower.register_event('addon command', handle_command)
windower.register_event('target change', receive_target)
coroutine.sleep(.1)
windower.send_command('qb load')