/* This is just a joke but I thought I might turn it into an aimbot someday so eh
-- It doesn't actually work, seteyeangles doesnt do anything (it might be clientside only)
-- the trace doesnt work the way I wanted it to either because its checking what the player is looking at and then making them look at it

local function AimShark()
    local Shark = ents.FindByName("Ember")
    local User = self.Owner
    local SharkIsGood = true

    if(IsValid(Shark) and SharkIsGood) then
        if(Shark:Team() == User:Team()) then
            return
        else
            local tr = User:GetEyeTraceNoCursor()
            if(IsValid(tr.Entity) and tr.Entity:IsPlayer() and Shark:Health() > 0) then
                User:SetEyeAngles((Shark:GetPos() - User:GetShootPos()):Angle())
            end            
        end
    end
end