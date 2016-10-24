function init()
  
  script.setUpdateDelta(5)
  
end

function update(dt)
  if effect.duration() < 1 then
	world.sendEntityMessage(effect.sourceEntity(),"growItem","waspwings")
	effect.expire()
  end
end

function uninit()
  
end
