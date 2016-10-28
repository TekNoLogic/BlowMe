
local myname, ns = ...


local butt = CreateFrame("Button", nil, UIParent, "SecureActionButtonTemplate")
butt:SetAttribute("type*", "item")
butt:SetAttribute("item*", "item:141605")
butt:SetSize(48, 48)


local icon = butt:CreateTexture()
icon:SetAllPoints()
icon:SetTexture(132161)


local function OnDragStop(self)
  self:StopMovingOrSizing()
  ns.db.point = "BOTTOMLEFT"
  ns.db.x = self:GetLeft()
  ns.db.y = self:GetBottom()
end


local function OnEnter(self)
  GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
  GameTooltip:SetText("Blow me")
  GameTooltip:Show()
end


local function OnLoad(self)
  self:SetPoint(ns.db.point, ns.db.x, ns.db.y)
end


butt:RegisterForDrag("LeftButton")
butt:SetMovable(true)

butt:SetScript("OnDragStart", butt.StartMoving)
butt:SetScript("OnDragStop", OnDragStop)
butt:SetScript("OnEnter", OnEnter)
butt:SetScript("OnLeave", GameTooltip_Hide)
ns.RegisterCallback(butt, "_THIS_ADDON_LOADED", OnLoad)
