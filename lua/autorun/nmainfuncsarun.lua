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

    hook.Add("PlayerSay","EntCount",function(ply,text)
        if(string.StartWith(string.lower(text),"/entcount")) then
            print("entcount")
            if(!ply:IsAdmin()) then return end

            local ents = ents.GetAll()
            
            for I = 1,#ents.GetAll() do
                if I == #ents.GetAll() then
                    ply:ChatPrint("Entity Amount: "..#ents.GetAll())
                end
            end

            
        end

        if(string.StartWith(string.lower(text),"/propcount")) then
            if(!ply:IsAdmin()) then return end

            local ents = ents.FindByClass("prop_physics")
            
            for I = 1,#ents do
                if I == #ents then
                    ply:ChatPrint("Prop Amount: "..#ents)
                end
            end
        end

        if(string.StartWith(string.lower(text),"/uptime")) then
            if(!ply:IsAdmin()) then return end

            local secs = math.Round(CurTime(),0)
            local mins = math.Round(secs / 60,0)
            local hrs = math.Round(mins / 60,2)

            ply:ChatPrint("Server uptime is: "..secs.." Seconds, or "..mins.." Minutes, or "..hrs.." Hours.")
        end
    end)
end

if(CLIENT) then
    hook.Add("OnPlayerChat","NVCmdHide",function(ply,text)
        if(string.StartWith(text,"/")) then
            return true
        end
    end)
end