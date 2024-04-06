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
        if(!ply:IsAdmin()) then return end

        local SE = string.Explode(" ",text)

        if(SE[1] == "/n") then
            if(SE[2] == "count") then
                if(SE[3] == "ents" or SE[3] == "ent") then
                    local ents = ents.GetAll()
                    
                    ply:ChatPrint("Entity Amount: "..#ents)
                end

                if(SE[3] == "props" or SE[3] == "prop") then
                    local ents = ents.FindByClass("prop_physics")

                    ply:ChatPrint("Prop Amount: "..#ents)
                end
            end

            if(SE[2] == "uptime") then
                if(!ply:IsAdmin()) then return end

                local secs = math.Round(CurTime(),0)
                local mins = math.Round(secs / 60,0)
                local hrs = math.Round(mins / 60,2)

                ply:ChatPrint("Server uptime is: "..secs.." Seconds, or "..mins.." Minutes, or "..hrs.." Hours.")
            end

            if(SE[2] == "setmodel") then
                if(!util.IsValidModel(SE[3])) then
                    ply:ChatPrint(SE[3].." Is not a valid model!")
                else
                    ply:SetModel(SE[3])
                    ply:ChatPrint("Model set to: "..SE[3])
                end
            end
        end
    end)
end
/*
hook.Add("PostCleanupMap","CleanupReset",function()
    local ents = ents.GetAll()
    for I = 1,#ents do
        print(ents[I])
    end
end)
*/
if(CLIENT) then
    hook.Add("OnPlayerChat","NVCmdHide",function(ply,text)
        if(string.StartWith(text,"/")) then
            return true
        end
    end)
end