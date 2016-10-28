
local myname, ns = ...


local butt = CreateFrame("Button", nil, UIParent, "SecureActionButtonTemplate")
butt:SetAttribute("type*", "item")
butt:SetAttribute("item*", "item:141605")
butt:SetSize(48, 48)


local icon = butt:CreateTexture()
icon:SetAllPoints()
icon:SetTexture(132161)


local function OnEnter(self)
  GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
  GameTooltip:SetText("Blow me")
  GameTooltip:Show()
end


ns.MakeRepositionable(butt)

butt:SetScript("OnEnter", OnEnter)
butt:SetScript("OnLeave", GameTooltip_Hide)
