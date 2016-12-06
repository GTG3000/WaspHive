require("/scripts/vec2.lua")

local wholdInit = init
local wholdUpdate = update
local wholdUninit = uninit

function update(dt)
	wholdUpdate(dt)
	if world.entitySpecies(entity.id()) == "wasphive" then
		status.addEphemeralEffect("hiveprotect",math.huge)
		status.addEphemeralEffect("poisonblock",math.huge)
	end
end
