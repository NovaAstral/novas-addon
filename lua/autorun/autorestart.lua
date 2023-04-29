if SERVER then
    hook.Add("Initialize", "NRestartServerTimer", function()
        timer.Create("GetTime",1,1,function()
            local Timestamp = os.time()
            local TimeString = os.date("%X",Timestamp )
            --print("TimeString:", TimeString)
        end)
    end)
end