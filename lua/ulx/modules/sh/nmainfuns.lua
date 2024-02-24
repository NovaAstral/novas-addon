local category = "NovaCore"

local disablefire = ulx.command(category, "ulx disablefire", function(call_ply)
	if SERVER then
		NULX_DisableFire = true
	end
    
	ulx.fancyLogAdmin(call_ply, "#A Disabled Fire.")
end, {"!disablefire", "!nofire"}, true)

disablefire:defaultAccess(ULib.ACCESS_SUPERADMIN)
disablefire:help("Disables all Fire")

local enablefire = ulx.command(category, "ulx enablefire", function(call_ply)
	if SERVER then
		NULX_DisableFire = false
	end
    
	ulx.fancyLogAdmin(call_ply, "#A Enabled Fire.")
end, {"!enablefire", "!yesfire"}, true)

enablefire:defaultAccess(ULib.ACCESS_SUPERADMIN)
enablefire:help("Enables all Fire")

local friction = ulx.command(category,"ulx friction",function(call_ply,tar_ply,friction)
	for k, v in ipairs(tar_ply) do
		v:SetFriction(friction)
		ulx.fancyLogAdmin(call_ply,"#A set #T's friction to #s",tar_ply,friction)
	end
end,"!friction",true)

friction:addParam{type = ULib.cmds.PlayersArg}
friction:addParam{type = ULib.cmds.NumArg, default = 1, hint = "Number Friction", min = 0, max = 10}
friction:defaultAccess(ULib.ACCESS_SUPERADMIN)
friction:help("Sets targets friction multiplier")