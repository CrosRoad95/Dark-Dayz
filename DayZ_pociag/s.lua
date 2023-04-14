

local object = createVehicle(537,-919,1014,35)
createBlipAttachedTo(object,30,3,255,255,255,255,0,350)
local secret_object = createObject(1337,0,0,0)
setElementCollisionsEnabled(secret_object,false)
setElementAlpha(secret_object,0)



setTrainPosition(object, 0)
setElementPosition(secret_object, getElementPosition(object))
setTrainSpeed(object, 1)

setTimer(function()
	local x,y,z = getElementPosition(object)
	for i,v in pairs(getElementsByType("player")) do
		triggerClientEvent(v,"setStreamble",resourceRoot,object,getTrainPosition(object))
	end
end,1000,1)

addEventHandler("onPlayerLogin",root,function()
	local x,y,z = getElementPosition(object)
	triggerClientEvent(source,"setStreamble",resourceRoot,object,getTrainPosition(object))
end)

setTimer(function()
	setTrainSpeed(object, 1)
end,3000,0)

local refresh_to_all = 0

addEvent("sendPosition",true)
addEventHandler("sendPosition", resourceRoot, function(trasa, kordy)
	
	if refresh_to_all >= 2 * getPlayerCount() then
		setElementPosition(secret_object,kordy[1],kordy[2],kordy[3])
		setTrainPosition(object,trasa)
		triggerClientEvent("setTrainPos", resourceRoot, trasa)
		refresh_to_all = 1
	else
		refresh_to_all = refresh_to_all + 1
	end
	
end)

function createBox()
	outputChatBox("=== Wypadła paczka z pociągu miejsce zostało zaznaczone na mapie! ===",root,255,255,255)
	outputChatBox("=== W paczce znajduje się dużo przedmiotów! ===",root,255,255,255)
	outputChatBox("=== Następna paczka: 1-1.5H ! ===",root,255,255,255)
	local x,y,z = getElementPosition(secret_object)
	local obiect = createObject(964,x,y,z)
	local blip = createBlipAttachedTo(obiect,48)
	setElementData(blip,"Pociag_info","Pociąg")
	local tentCol = createColSphere(x,y,z,3)
	setTimer(function(tentCol,obiect,blip)
		destroyElement(tentCol)
		destroyElement(obiect)
		destroyElement(blip)
	end,60000*30,1,tentCol,obiect,blip)
	attachElements(tentCol,obiect,0,0,0)
	setElementData(tentCol, "parent", obiect)
	setElementData(obiect, "parent", tentCol)
	setElementData(tentCol,"itemloot",true)
	setElementData(tentCol,"lootname","Armybox")
	setElementData(tentCol,"ItemDoLutowania",true)
	setElementData(tentCol, "Coyote Backpack", math.random(1,5))
	setElementData(tentCol, "Alice Pack", math.random(3,7))
	setElementData(tentCol, "Toolbox", 10)
	setElementData(tentCol, "Ghillie Suit", 10)
	setElementData(tentCol, "Tent", 5)
	setElementData(tentCol, "GPS", 15)
	setElementData(tentCol, "Map", 15)
	setElementData(tentCol, "Tire", 5)
	setElementData(tentCol, "Engine", 3)
	setElementData(tentCol, "Civilian Clothing", 10)
	setElementData(tentCol, "Camouflage Clothing", 7)
	setElementData(tentCol, "Ghillie Suit [F]", 7)
	setElementData(tentCol, "Milk", 15)
	setElementData(tentCol, "Pizza", 15)
	setElementData(tentCol, "Burger", 15)
	setElementData(tentCol, "Soda Bottle", 15)
	setElementData(tentCol, "M4A1-S", 10)
	setElementData(tentCol, "G36C", 10)
	setElementData(tentCol, "AK-47", 10)
	setElementData(tentCol, "AWP", math.random(5,5))
	setElementData(tentCol, "M4A1-S Mag", math.random(8,10))
	setElementData(tentCol, "G36C Mag", math.random(8,15))
	setElementData(tentCol, "AWP Mag",math.random(5,8))
	setElementData(tentCol, "AK-47 Mag", math.random(10,12))
	setElementData(tentCol, "Ghillie Suit [F]", 15)
	setElementData(tentCol, "Military Backpack", math.random(1,2))
	setElementData(tentCol, "Painkiller", 10)
	setElementData(tentCol, "Night Vision Goggles", 10)
	setElementData(tentCol, "Morphine", 10)
	setElementData(tentCol, "Infrared Goggles", 10)
	setElementData(tentCol, "Medic Kit", 5)
	setElementData(tentCol, "Medic Bag", 5)
	setElementData(tentCol, "Bandage", 15)
	setTimer(createBox,3600000 + math.random(0,3600000/2),1)
end

addCommandHandler("ustaw_trase", function(player, cmd, nr)
	triggerClientEvent("setTrainPos", resourceRoot, tonumber(nr))
	setTrainPosition(object, tonumber(nr))
end)

setTimer(function()
	createBox()
end,30000 * math.random(1,3),1) -- 60000 * math.random(1,3)
