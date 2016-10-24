function init()
  
  script.setUpdateDelta(5)
  local TEST = config.getParameter("item","none")
  sb.logInfo(TEST)
  
end

function update(dt)
  if effect.duration() < 1 then
	world.sendEntityMessage(effect.sourceEntity(),"growItem","waspwingsspeed")
	effect.expire()
  end
end

function uninit()
  
end
