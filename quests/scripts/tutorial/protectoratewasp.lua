require("/quests/scripts/portraits.lua")
require("/quests/scripts/questutil.lua")

function init()
end

function questStart()
  player.giveItem("waspwings")
  storage.starterBack = player.equippedItem("back")
end

function questComplete()
  questutil.questCompleteActions()
end

function update(dt)
	if player.equippedItem("back").name == "waspwings" then
          quest.complete()
	end
end

function uninit()
end
