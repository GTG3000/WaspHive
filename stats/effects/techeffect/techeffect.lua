function init()
  local bounds = mcontroller.boundBox()
  effect.addStatModifierGroup({
    {stat = "jumpModifier", amount = 0.5}
  })
  self.activeflag = true
end

function update(dt)
	if self.activeflag then
		world.sendEntityMessage(effect.sourceEntity(),"techChangeOn","waspwingjump")
		self.activeflag = false
	end
	mcontroller.controlModifiers({
		airJumpModifier = 1.5
    })
end

function uninit()
  --world.sendEntityMessage(effect.sourceEntity(),"techChangeOff")
end
