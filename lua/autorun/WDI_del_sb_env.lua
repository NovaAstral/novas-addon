if(game.GetMap() ~= "gm_what_destiny_intended") then return end

--This is supposed to delete all the environments from gm_what_destiny_intended because there are too many, CAF causes lag because of how many there are

--This doesn't actually work properly when you first start the map, you have to run it after Life Support gets enabled from CAF
--Also disabling CAF Life Support doesn't stop things from having no gravity >:(

local function DelEnv()
    for k, e in ipairs(ents.FindByClass("logic_case")) do
        if(e:GetName() ~= "sgc_alarm_case") then --dont delete the logic_case that controls the sgc lockdown
            --print(e)
            e:Remove()
        end
    end

    for k, e in ipairs(ents.FindByClass("base_sb_planet*")) do
        --print(e)
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

    timer.Create("GravEnable",1000,0,Grav())
end

local function Grav() --This is probably laggy
    for k, e in ipairs(ents.FindByClass("*")) do
        e:SetGravity(1)
        local phys = e:GetPhysicsObject()
        
        if phys:IsValid() then
            phys:EnableGravity(true)
        end
    end
end

hook.Add("Initialize", "DelEnv on Mapstart", function()
    timer.Create("DelEnv Wait",120,1,function()
        DelEnv()
        DelEnv() --run twice because it doesnt work properly if I dont and I don't know how to fix it
    end)
end)

hook.Add("PostCleanupMap","CleanupReset",function()
    DelEnv()
    DelEnv() --run twice because it doesnt work properly if I dont and I don't know how to fix it
end)
