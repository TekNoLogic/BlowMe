
local myname, ns = ...


ns.dbname = "BlowMeDB"
ns.dbdefaults = {
  point = "TOP",
  x = 0,
  y = -175,
}


ns.CreateButton(141605)


local function OnLogin()
  for i,v in pairs(ns) do
    if i:match("^Create") then ns[i] = nil end
  end
  ns.MakeRepositionable = nil
end


ns.RegisterCallback("PLAYER_LOGIN", OnLogin)
