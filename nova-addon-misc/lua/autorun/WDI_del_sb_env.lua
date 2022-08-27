if(game.GetMap() ~= "gm_what_destiny_intended") then return end

local function DelEnv()
    for k, e in ipairs(ents.FindByClass("logic_case")) do
        if(e:GetName() ~= "sgc_alarm_case") then --dont delete the logic_case that controls the sgc lockdown
            print(e)
            e:Remove()
        end
    end

    for k, e in ipairs(ents.FindByClass("base_sb_planet*")) do
        print(e)
        e:Remove()
    end

    for k, e in ipairs(ents.FindByClass("*")) do
        e:SetGravity(1)
        local phys = e:GetPhysicsObject()
        
        if phys:IsValid() then
            phys:EnableGravity(true)
        end
    end

    RunConsoleCommand("CAF_Addon_Destruct", "Life Support")
end

hook.Add("Initialize", "DelEnv on Mapstart", function()
    timer.Create("DelEnv Wait", 5, 1, function()
        DelEnv()
        DelEnv() --run twice because it doesnt work properly if I dont and im too lazy rn to fix it
    end)
end)

hook.Add("PostCleanupMap", "CleanupReset", function()
    DelEnv()
    DelEnv() --run twice because it doesnt work properly if I dont and im too lazy rn to fix it
end)