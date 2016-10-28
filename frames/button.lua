
local myname, ns = ...


local butt = CreateFrame("Button", nil, UIParent, "SecureActionButtonTemplate")
butt:SetAttribute("type*", "item")
butt:SetAttribute("item*", "item:141605")
butt:SetSize(48, 48)
butt:Hide()


local icon = butt:CreateTexture()
icon:SetAllPoints()
icon:SetTexture(132161)


local function OnEnter(self)
  GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
  GameTooltip:SetText("Blow me")
  GameTooltip:Show()
end


local function Show()
  if InCombatLockdown() then return C_Timer.After(1, Show) end
  butt:Show()
end


local function Hide()
  if InCombatLockdown() then return C_Timer.After(1, Hide) end
  butt:Hide()
end


local function OnShow(self)
  C_Timer.After(3*60, Hide)
end

ns.MakeRepositionable(butt)

butt:SetScript("OnEnter", OnEnter)
butt:SetScript("OnLeave", GameTooltip_Hide)
butt:SetScript("OnShow", OnShow)
ns.RegisterCallback(butt, "_WORLD_QUEST_COMPLETED", Show)
