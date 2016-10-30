
local myname, ns = ...


function ns.CreateButton(item_id)
  local butt = CreateFrame("Button", nil, UIParent, "SecureActionButtonTemplate")
  butt:SetAttribute("type*", "item")
  butt:SetAttribute("item*", "item:".. item_id)
  butt:SetSize(48, 48)
  butt:Hide()


  local icon = butt:CreateTexture()
  icon:SetAllPoints()
  icon:SetTexture(132161)


  local cooldown = ns.CreateCooldown(butt, item_id)
  -- cooldown:SetAllPoints()
  cooldown:ClearAllPoints()
  cooldown:SetPoint("TOPLEFT", 3, -3)
  cooldown:SetPoint("BOTTOMRIGHT", -3, 3)


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
  ns.RegisterCallback(butt, "_WHISTLE_BLOWN", Hide)
end
