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
end