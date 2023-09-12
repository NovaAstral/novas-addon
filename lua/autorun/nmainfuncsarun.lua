if(SERVER) then
    hook.Add("Think","NovaULXThink",function()
        if(NULX_DisableFire == true) then
            for _, ent in pairs(ents.GetAll()) do
                if(IsValid(ent) and ent:IsOnFire()) then
                    ent:Extinguish()
                end
            end
        end
    end)
    --[[
    hook.Add("Initialize", "NovaInitHook", function()
        
        timer.Create("GetTime",1,0,function()
            local Timestamp = os.time()
            local TimeString = os.date("%X",Timestamp)
            --print("TimeString:", TimeString)
        end)
        
    end)--]]
end

if(CLIENT) then
    hook.Add("OnPlayerChat","NVCmdHide",function(ply,text)
        if(string.StartWith(text,"/")) then
            return true
        end
    end)
end