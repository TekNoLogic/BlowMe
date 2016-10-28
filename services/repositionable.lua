
local myname, ns = ...


local function OnDragStop(self)
  self:StopMovingOrSizing()
  ns.db.point = "BOTTOMLEFT"
  ns.db.x = self:GetLeft()
  ns.db.y = self:GetBottom()
end


local function OnLoad(self)
  self:SetPoint(ns.db.point, ns.db.x, ns.db.y)
end


function ns.MakeRepositionable(frame)
  frame:RegisterForDrag("LeftButton")
  frame:SetMovable(true)

  frame:SetScript("OnDragStart", frame.StartMoving)
  frame:SetScript("OnDragStop", OnDragStop)
  ns.RegisterCallback(frame, "_THIS_ADDON_LOADED", OnLoad)
end
