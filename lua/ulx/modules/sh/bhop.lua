/*

--this doesn't work because I haven't finished it
--The most of the current function is actually for clientside lua

local bhop = false

function ulx.restart()
    game.ConsoleCommand("bhop_toggle")
end
local bhop = ulx.command("Rcon", "ulx restart", ulx.restart,"!restart")
bhop:defaultAccess( ULib.ACCESS_SUPERADMIN )
bhop:help("Toggles Bunny hopping")

hook.Add("Think", "bhop", function()
    if bhop then
        if (input.IsKeyDown( KEY_SPACE ) ) then
            if LocalPlayer():IsOnGround() then
                RunConsoleCommand("+jump")
                HasJumped = 1
            else
                RunConsoleCommand("-jump")
                HasJumped = 0
            end
        elseif bhop and LocalPlayer():IsOnGround() then
            if HasJumped == 1 then
                RunConsoleCommand("-jump")
                HasJumped = 0
            end
        end
    end
end)

concommand.Add("bhop_toggle", function()
    if bhop then
        bhop = !bhop
        LocalPlayer():ChatPrint("BunnyHop [OFF]")
    else
        bhop = !bhop
        LocalPlayer():ChatPrint("BunnyHop [ON]")
    end
end