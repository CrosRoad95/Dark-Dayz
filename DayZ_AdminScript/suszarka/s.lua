

addEvent("moveObject",true)
addEventHandler("moveObject", resourceRoot, function(objekt)
	local pozycja = Vector3(getElementPosition(client))
	local rotacja = Vector3(getElementRotation(client))
	local offset = 0
	if getElementModel(objekt) == 3243 then
		offset = 1
	elseif getElementModel(objekt) == 964 then
		offset = 1.1
	end
	setElementPosition(objekt, pozycja.x, pozycja.y, pozycja.z - offset)
	setElementRotation(objekt, rotacja.x, rotacja.y, rotacja.z)
	setElementPosition(client, pozycja.x, pozycja.y, pozycja.z + 2)
end)

addEvent("moveTo",true)
addEventHandler("moveTo",resourceRoot,function(target)
	warpPedIntoVehicle(client, target)
end)



addEvent("deleteObj",true)
addEventHandler("deleteObj",resourceRoot,function(target, col)
	destroyElement(col)
	destroyElement(target)
end)

addEvent("zamontujCzesci",true)
addEventHandler("zamontujCzesci", resourceRoot, function(target, col)
	local tires,engine,parts,sloty = exports.DayZ_vehicle:getVehicleAddonInfos(getElementModel(target));
	local maxfuel = exports.DayZ_vehicle:getVehicleMaxFuel(getElementModel(target))
	setElementData(target, "maxfuel",maxfuel);
	setElementData(col, "Tire_inVehicle",tires);
	setElementData(col, "Engine_inVehicle",engine);
	setElementData(col, "Parts_inVehicle", parts);
	setElementData(col, "MAX_Slots", sloty);
	setElementData(col, "fuel", maxfuel);
end)

addEvent("flip",true)
addEventHandler("flip", resourceRoot, function(obj)
	local _,_,rz = getElementRotation(obj)
	setElementRotation(obj, 0,0,rz)
end)

addEvent("fix",true)
addEventHandler("fix", resourceRoot, function(obj)
	fixVehicle(obj)
end)

	