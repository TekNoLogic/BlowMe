
local myname, ns = ...


-- "Flight Master's Whistle"
local SPELL_ID = 227334


local function OnSpellcast(self, event, unit, spell, rank, uuid, spell_id)
  if unit ~= "player" then return end
  if spell_id == SPELL_ID then ns.SendMessage("_WHISTLE_BLOWN") end
end


ns.RegisterCallback("UNIT_SPELLCAST_SUCCEEDED", OnSpellcast)
