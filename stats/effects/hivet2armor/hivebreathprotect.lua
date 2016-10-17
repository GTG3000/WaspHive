function init()
    -- So this is pretty straight forward we are checking for added stat values which are set by each part. If all parts are set then the character turns blue.
    --There is one important thing to note though, because this happens in init and not update. The order you put on clothes is important.
    --If you put helmet first then pants and chest you won't turn blue, because it is not constantly checking. If you put on helmet last you will turn blue. 
	--effect.setParentDirectives("fade="..config.getParameter("color").."=0.5")
  script.setUpdateDelta(10)
end

function update(dt)
  local statMin = math.min(status.stat("hiveHead"),status.stat("hiveChest"),status.stat("hiveLegs"))
  if statMin >=1 then
	effect.addStatModifierGroup({{stat = "breathProtection", amount = 1}})
    --sb.logInfo("BREATH PROTECTED")
	if statMin >= 2 then		
		effect.addStatModifierGroup({{stat = "biomeradiationImmunity", amount = 1}})
		--sb.logInfo("RADIATION PROTECTED")
	end
	if statMin >= 3 then		
		effect.addStatModifierGroup({{stat = "biomecoldImmunity", amount = 1}})
		--sb.logInfo("COLD PROTECTED")
	end
	if statMin >= 4 then		
		effect.addStatModifierGroup({{stat = "biomeheatImmunity", amount = 1}})
		--sb.logInfo("HEAT PROTECTED")
	end
  else
    --sb.logInfo("Not all parts detected")
  end
  --[[head = status.stat("thead")
  chest = status.stat("tchest")
  legs = status.stat("tlegs")
  sb.logInfo(head .. " Head")
  sb.logInfo(chest .. " Chest")
  sb.logInfo(legs .. " Legs")]]--
  
end

function uninit()
end