hook.Add("PlayerSay","NVCmdHide",function(ply,text)
	if(string.StartWith(text,"/")) then
		return ""
	end
end)