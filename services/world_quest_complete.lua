
local myname, ns = ...



local function IsWorldQuest(quest_id)
	local _, _, world_quest_type = GetQuestTagInfo(quest_id)
	return world_quest_type ~= nil
end


local function OnQuestTurnin(self, event, quest_id)
  if not IsWorldQuest(quest_id) then return end
  print("Turned in a world quest", quest_id)
end
