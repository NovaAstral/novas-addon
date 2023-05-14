hook.Add("OnPlayerChat","NVCmdHide",function(ply,text)
    if(string.StartWith(text,"/")) then
        return true
    end
end)