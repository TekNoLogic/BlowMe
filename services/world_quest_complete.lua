
local myname, ns = ...


local function IsWorldQuest(quest_id)
	local _, _, world_quest_type = GetQuestTagInfo(quest_id)
	return world_quest_type ~= nil
end


local function OnQuestTurnin(self, event, quest_id)
  if not IsWorldQuest(quest_id) then return end
  ns.SendMessage("_WORLD_QUEST_COMPLETED")
end


ns.RegisterCallback("QUEST_TURNED_IN", OnQuestTurnin)
