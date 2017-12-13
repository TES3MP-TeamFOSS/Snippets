-- RealWorldTime.lua -*-lua-*-


Methods = {}


-- Add [ RealWorldTime = require("RealWorldTime") ] to the top of server.lua

-- Find "config.timeSyncMode == 2 then" insert server.lua and insert:
-- hour = RealWorldTime.GetHour()
-- directly underneath it.

-- Find "config.timeSyncMode" inside config.lua and set it to 2.


Methods.GetHour = function()
    local hour = tonumber(os.date("%H"))
    local minute = tonumber(os.date("%M")) / 60 * 1

    return hour + minute
end


return Methods
