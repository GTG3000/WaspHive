function init()
  
  script.setUpdateDelta(5)
  self.item = config.getParameter("item","perfectlygenericitem")
  
end

function update(dt)
  if effect.duration() < 1 then
	world.sendEntityMessage(effect.sourceEntity(),"growItem",self.item)
	effect.expire()
  end
end

function uninit()
  
end
