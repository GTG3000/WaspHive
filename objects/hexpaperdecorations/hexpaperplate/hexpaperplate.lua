require "/scripts/util.lua"
require "/scripts/versioningutils.lua"
require "/scripts/staticrandom.lua"

function init(args)
	storage.heldItem = storage.heldItem or false
	storage.iconString = storage.iconString or ""
	storage.defaultIcon = config.getParameter("defaultIcon" , "default.png")
end

function containerCallback()
	local item = world.containerItems(entity.id())[1]
	
	if type(item) ~= "table" or not item.name then --not an item
		storage.iconString = "default.png"
		refresh()
		return nil
	end
	
	if item == storage.heldItem then return false end
	
	storage.heldItem = item
	
	itemRoot = root.itemConfig(item.name)
	
	if type(item.parameters.inventoryIcon) == "string" then
		storage.iconString = item.parameters.inventoryIcon
	else
		storage.iconString = itemRoot.config.inventoryIcon or itemRoot.config.image or itemRoot.config.codexIcon or "/objects/generic/sapling/saplingicon.png"
	end
	
	if string.sub(storage.iconString,1,1) ~= "/" then
		storage.iconString = itemRoot.directory..storage.iconString
	end
	
	storage.iconString = storage.iconString.."?replace;000000=00000000"
	
	if itemRoot.config.colorOptions then
		--storage.iconString = storage.iconString.."?replace"
		for c1, c2 in pairs(itemRoot.config.colorOptions[(item.parameters.colorIndex or 0) + 1] or {["ffffff"]="ffffff"}) do
			storage.iconString = storage.iconString..";"..c1.."="..c2
		end
	end
		
	if item.parameters.directives and type(item.parameters.directives) == "string" then
		storage.iconString = storage.iconString..item.parameters.directives
	end
	
	if string.find(storage.iconString, '[:][{<(]frame[}>)]') then
		storage.iconString = string.gsub(storage.iconString, '[:][{<(]frame[}>)]', ":0")
	end
	
	local iconSize = root.imageSize(storage.iconString)
	
	if iconSize[1] > 16 or iconSize[2] > 16 then
		storage.iconString = storage.defaultIcon
	end
	
	refresh()
	
end

function refresh()
	if (storage.iconString == "default.png" or type(storage.iconString)~= "string") then
		animator.setAnimationState("plateState","empty")
	else
		animator.setAnimationState("plateState","full")
		animator.setGlobalTag("foodIcon",storage.iconString)
	end
end