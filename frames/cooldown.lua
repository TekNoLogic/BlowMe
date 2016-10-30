
local myname, ns = ...


local cooldowns = {}
local item_ids = {}
local function Update(self)
  local cooldown = cooldowns[self]
  local item_id = item_ids[self]
  local start, duration, enable = GetItemCooldown(item_id)
	if enable and enable ~= 0 and start > 0 and duration > 0 then
    cooldown:SetCooldown(start, duration)
    cooldown:Show()
	else
    cooldown:Clear()
    cooldown:Hide()
	end
end


function ns.CreateCooldown(parent, item_id)
  local cooldown = CreateFrame("Cooldown", nil, parent, "CooldownFrameTemplate")

  local frame = CreateFrame("Frame", nil, parent)
  frame:SetScript("OnShow", Update)

  cooldowns[frame] = cooldown
  item_ids[frame] = item_id

  return cooldown
end
