local category = "NovaCore"

local disablefire = ulx.command(category, "ulx disablefire", function(ply)
	if SERVER then
		NULX_DisableFire = true
	end
    
	ulx.fancyLogAdmin(ply, "#A Disabled Fire.")
end, {"!disablefire", "!nofire"}, true)

disablefire:defaultAccess(ULib.ACCESS_SUPERADMIN)
disablefire:help("Disables all Fire")

local enablefire = ulx.command(category, "ulx enablefire", function(ply)
	if SERVER then
		NULX_DisableFire = false
	end
    
	ulx.fancyLogAdmin(ply, "#A Enabled Fire.")
end, {"!enablefire", "!yesfire"}, true)

enablefire:defaultAccess(ULib.ACCESS_SUPERADMIN)
enablefire:help("Enables all Fire")