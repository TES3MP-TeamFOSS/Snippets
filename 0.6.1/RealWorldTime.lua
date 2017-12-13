-- RealWorldTime.lua -*-lua-*-


Methods = {}


-- Add [ RealWorldTime = require("RealWorldTime") ] to the top of server.lua

-- Find "elseif config.timeSyncMode == 2 then" inside server.lua and insert:
-- hour = RealWorldTime.GetHour()
-- directly underneath it.

-- Find "config.timeSyncMode" inside config.lua and set it to 2.


local counter = 0


Methods.GetHour = function()
    local hour = os.date("%H")

    counter = counter + 0.00027777778
    if counter >= 1 then
        counter = 0
    end

    return hour + counter
end


return Methods
