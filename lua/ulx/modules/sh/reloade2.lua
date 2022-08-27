local category = "e2"

local reloade2 = ulx.command(category, "ulx reloade2", function(ply)
	if SERVER then
		RunConsoleCommand("wire_expression2_reload")
	end
    
	ulx.fancyLogAdmin(ply, "#A Reloaded Expression2.")
end, {"!reloade2", "!restarte2"}, true)

reloade2:defaultAccess(ULib.ACCESS_SUPERADMIN)
reloade2:help("Reloads all E2 functions")