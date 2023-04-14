



local glue_limit = {
	["Dodo"] = 3,
	["Sparrow"] = 1,
	["Seasparrow"] = 1,
	["Police Maverick"] = 1,
	["Maverick"] = 1,
	["BF-400"] = 1,
	["Bike"] = 1,
	["BMX"] = 1,
	["FCR-900"] = 1,
	["NRG-500"] = 1,
	["Sanchez"] = 1,
}

function isCanGlue(vehicle)
	local ilosc = 0
	for i,v in pairs(getAttachedElements(vehicle)) do
		if getElementType(v) == "player" then
			ilosc = ilosc + 1
		end
	end
	if glue_limit[getVehicleName(vehicle)] and ilosc >= glue_limit[getVehicleName(vehicle)] then
		return false
	end
	return true
end

function getPlayersOnGlue(vehicle)
	local t = {}
	for i,v in pairs(getAttachedElements(vehicle)) do
		if getElementType(v) == "player" then
			table.insert(t, v)
		end
	end
	return t
end

function detachAttachedFromElement(vehicle)
	for i,v in pairs(getAttachedElements(vehicle)) do
		if getElementType(v) == "player" then
			triggerEvent("ungluePlayer", v)
		end
	end
end
addEvent("detachAttachedFromElement", true)
addEventHandler("detachAttachedFromElement", root, detachAttachedFromElement)

function gluePlayer(slot, vehicle, x, y, z, rotX, rotY, rotZ)
	if not isCanGlue(vehicle) then
		triggerClientEvent(source, "stworz_notyfikacje", source, "error", "Osiągnięto limit przyklejeń dla tego pojazdu!")
		return
	end
	if getElementData(vehicle, "Pojazd-Tymczasowy") then
		triggerClientEvent(source, "stworz_notyfikacje", source, "error", "Nie możesz kleić się do pojazdu tymczasowego!")
		return
	end
	attachElementToElement(source, vehicle, x, y, z, rotX, rotY, rotZ)
	setPedAnimation(source)
	setPlayerWeaponSlot(source, slot)
	triggerClientEvent(source, "successGlue", resourceRoot)
end
addEvent("gluePlayer",true)
addEventHandler("gluePlayer",getRootElement(),gluePlayer)

function ungluePlayer()
	detachElementFromElement(source)
end
addEvent("ungluePlayer",true)
addEventHandler("ungluePlayer",getRootElement(),ungluePlayer)