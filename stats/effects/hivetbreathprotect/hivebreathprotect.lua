function init()
		-- So this is pretty straight forward we are checking for added stat values which are set by each part. If all parts are set then the character turns blue.
		--There is one important thing to note though, because this happens in init and not update. The order you put on clothes is important.
		--If you put helmet first then pants and chest you won't turn blue, because it is not constantly checking. If you put on helmet last you will turn blue. 
	--effect.setParentDirectives("fade="..config.getParameter("color").."=0.5")
	script.setUpdateDelta(10)
	self.statMin = 0
	self.groupID = effect.addStatModifierGroup({})
	apply()
end

function apply()
	local newStatMin = math.min(status.stat("hiveHead"),status.stat("hiveChest"),status.stat("hiveLegs"))
	if self.statMin ~= newStatMin then
		self.statMin = newStatMin
		local protections = {}
		if self.statMin >=1 then
			table.insert(protections,{stat = "breathProtection", amount = 1})
			sb.logInfo("BREATH PROTECTED")
		end
		if self.statMin >= 2 then
			table.insert(protections,{stat = "biomeradiationImmunity", amount = 1})	
			table.insert(protections,{stat = "ffextremeradiationImmunity", amount = 1})	
			table.insert(protections,{stat = "radiationburnImmunity", amount = 1})
			sb.logInfo("RADIATION PROTECTED")
		end
		if self.statMin >= 3 then
			table.insert(protections,{stat = "biomecoldImmunity", amount = 1})	
			table.insert(protections,{stat = "ffextremecoldImmunity", amount = 1})	
			table.insert(protections,{stat = "weaknessIceImmunity", amount = 1})	
			table.insert(protections,{stat = "iceResistance", amount = 0.25})	
			sb.logInfo("COLD PROTECTED")
		end
		if self.statMin >= 4 then
			table.insert(protections,{stat = "biomeheatImmunity", amount = 1})	
			table.insert(protections,{stat = "ffextremeheatImmunity", amount = 1})	
			table.insert(protections,{stat = "weaknessFireImmunity", amount = 1})	
			table.insert(protections,{stat = "fireResistance", amount = 0.25})	
			sb.logInfo("HEAT PROTECTED")
		end
		effect.setStatModifierGroup(self.groupID,protections)
	end
end

function update(dt)
	apply()
end

function uninit()
end