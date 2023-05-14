--[[
if SERVER then
    hook.Add("Initialize", "NVRestartServerTimer", function()
        timer.Create("GetTime",1,0,function()
            local Timestamp = os.time()
            local TimeString = os.date("%X",Timestamp)
            --print("TimeString:", TimeString)
        end)
    end)
end