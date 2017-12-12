-- ProgressSync.lua -*-lua-*-
-- https://www.reddit.com/r/tes3mp/comments/7jb7rm/wish_for_christmas/


Methods = {}


-- Add [ ProgressSync = require("ProgressSync") ] to the top of server.lua

-- Find "myMod.OnPlayerAttribute(pid)" and replace it with:
-- ProgressSync.Attributes()

-- Find "myMod.OnPlayerSkill(pid)" and replace it with:
-- ProgressSync.Skill()

-- Fine "myMod.OnPlayerLevel(pid)" and replace it with:
-- ProgressSync.Level()


local attributes = {}
local skills = {}
local level = 0


Methods.Attributes = function()
    for pid, player in pairs(Players) do
        if Players[pid] ~= nil and Players[pid]:IsLoggedIn() then
            for index = 0, 7 do
                local value = tes3mp.GetAttributeBase(pid, index)

                if attributes[index + 1] == nil then
                    attributes[index + 1] = 0
                end

                if value > attributes[index + 1] then
                    attributes[index + 1] = value
                end

                tes3mp.SetAttributeBase(pid, index, attributes[index + 1])
                Players[pid]:SaveAttributes()
            end

            tes3mp.SendAttributes(pid)
        end
    end
end


Methods.Skills = function()
    for pid, player in pairs(Players) do
        if Players[pid] ~= nil and Players[pid]:IsLoggedIn() then
            for index = 0, 26 do
                local value = tes3mp.GetSkillBase(pid, index)

                if skills[index + 1] == nil then
                    skills[index + 1] = 0
                end

                if value > skills[index + 1] then
                    skills[index + 1] = value
                end

                tes3mp.SetSkillBase(pid, index, skills[index + 1])
                Players[pid]:SaveSkills()
            end

            tes3mp.SendSkills(pid)
        end
    end
end


Methods.Level = function()
    for pid, player in pairs(Players) do
        if Players[pid] ~= nil and Players[pid]:IsLoggedIn() then
            local value = tes3mp.GetLevel(pid)

            if value > level then
                level = value
            end

            tes3mp.SetLevel(pid, level)
            Players[pid]:SaveLevel()
            Players[pid]:SaveStatsDynamic()
        end

        tes3mp.SendLevel(pid)
        tes3mp.SendStatsDynamic(pid)
    end
end


return Methods
