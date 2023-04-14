-- Airplane Settings
local flyAltitude = 300 -- units
local flyRadius = 3400 -- units
local flyTime = 60000 -- ms
local planeModel = 1681
local planeScale = 3.5

-- Package Settings
local packageFloatTime = 25355 -- ms
local packageAliveTime = 120000 -- ms (time alive after landing)

-- Tables
local planes = {}
local package = {}
local availableKits = {}


function isElementWithinAColShape(element)
   if element or isElement(element)then
      for _,colshape in ipairs(getElementsByType("colshape"))do
	 if isElementWithinColShape(element,colshape) then
	    return colshape
	 end
      end
   end
   outputDebugString("isElementWithinAColShape - Invalid arguments or element does not exist",1)
   return false
end

function spawnAirplane(x, y, z)
if getElementData(source, "in_base") == false then
	-- Get plane fly path
	local X1, Y1, X2, Y2, zRot = getFlyPath(x, y, math.random(0,360), flyRadius)
	-- Create new table for plane
	local index = #planes+1
	planes[index] = {}
	local plane = planes[index]
	plane.index = index
	-- Create the plane object
	plane.obj =  createObject(planeModel, X1, Y1, z+flyAltitude, 0, 0, zRot)
	setObjectScale(plane.obj, planeScale)
	setElementCollisionsEnabled(plane.obj, false)
	-- Create the plane LOD and attach it
	plane.lod = createObject(planeModel, X1, Y1, z+flyAltitude, 0, 0, 0, true)
	setObjectScale(plane.lod, planeScale)
	setLowLODElement(plane.obj, plane.lod)
	attachElements(plane.lod, plane.obj)
	-- Move the plane object
	moveObject(plane.obj, flyTime, X2, Y2, z+flyAltitude)
	-- Attach blip to plane object
	plane.blip = createBlipAttachedTo(plane.obj, 5)
	-- Start timer to drop package half way
	plane.dropTimer = setTimer(function(player)dropPackage(player, index, plane)end, flyTime/2, 1, source)
	-- Call to set client-side plane properties
	triggerClientEvent("setPlaneProperties", resourceRoot, plane.obj, flyTime, zRot)
	triggerClientEvent(source, "stworz_notyfikacje", source, "sucess", "Wkrótce spadnie twój zrzut z samolotu!")
	-- Destroy the airplane and all of its attached elements
	setTimer(function()
		for _,v in pairs(plane) do
			if isElement(v) then
				destroyElement(v)
			end
		end
		planes[index] = nil
	end, flyTime, 1)
	else
	triggerClientEvent(source, "stworz_notyfikacje", source, "error", "W bazie nie mozesz przywolac zrzutu!")
end
end
addEvent("onSignalThrown", true)
addEventHandler("onSignalThrown", root, spawnAirplane)

function dropPackage(player, index, plane)
	--local x, y, z = getElementPosition(plane.obj)
	triggerClientEvent("setPackageProperties", resourceRoot, player, index, plane.obj)
end

addEvent("onPackageLeavePlane", true)
addEventHandler("onPackageLeavePlane", resourceRoot, function(player, index, x, y, z, zPos)
	if planes[index].zPos then
		return
	else
		planes[index].zPos = zPos
	end
	-- Create new table for package
	local index = #package+1
	package[index] = {}
	local Package = package[index]
	-- Create new package object
	Package.obj = createObject(3800, x, y, z)
	Package.colsprehe = createColSphere(x-5, y-10, z-0.5, 2.5);
	attachElements(Package.colsprehe, Package.obj,0,0,0);
	
	setElementData(Package.colsprehe, "parent", Package.obj)
	setElementData(Package.obj, "parent", Package.colsprehe)
	setElementData(Package.colsprehe, "AirDrop", true)
	setElementData(Package.colsprehe, "Pizza", math.random(15,30))
	setElementData(Package.colsprehe, "Kebab", math.random(15,30))
	setElementData(Package.colsprehe, "Burger", math.random(15,30))
	setElementData(Package.colsprehe, "Soda Bottle", math.random(15,30))
	setElementData(Package.colsprehe, "Medic Kit", math.random(10,20))
	setElementData(Package.colsprehe, "Medic Bag", math.random(5,15))
	setElementData(Package.colsprehe, "Bandage", math.random(5,15))
	setElementData(Package.colsprehe, "Morphine", math.random(5,15))
	setElementData(Package.colsprehe, "Painkiller", math.random(5,15))
	setElementData(Package.colsprehe, "Blood Bag", math.random(5,15))
	setElementData(Package.colsprehe, "M4A1-S", math.random(5,15))
	setElementData(Package.colsprehe, "M4A1-S Mag", math.random(15,35))
	setElementData(Package.colsprehe, "M4A1", math.random(5,15))
	setElementData(Package.colsprehe, "Scar-L", math.random(5,15))
	setElementData(Package.colsprehe, "Scar-L Mag", math.random(10,25))
	setElementData(Package.colsprehe, "Code card #"..math.random(1,6), 1)
	setElementData(Package.colsprehe, "AK-47", math.random(5,15))
	setElementData(Package.colsprehe, "AK-47 Mag", math.random(10,20))
	setElementData(Package.colsprehe, "AWP", math.random(10,20))
	setElementData(Package.colsprehe, "AWP Mag", math.random(10,20))
	setElementData(Package.colsprehe, "Military Backpack", math.random(5,15))
	setElementData(Package.colsprehe, "Coyote Backpack", math.random(5,15))
	setElementData(Package.colsprehe, "Czech Backpack", math.random(5,15))
	setElementData(Package.colsprehe, "Mountain Backpack", math.random(5,15))
	setElementData(Package.colsprehe, "Tire", math.random(5,15))
	setElementData(Package.colsprehe, "Engine", math.random(1,5))
	setElementData(Package.colsprehe, "Wrench", math.random(1,5))
	setElementData(Package.colsprehe, "Toolbox", math.random(1,5))
	setElementData(Package.colsprehe, "Infrared Goggles", math.random(15,35))
	setElementCollisionsEnabled(Package.obj, false)
	
	-- Create parachute and attach it
	Package.parachute = createObject(2903, x, y, z)
	attachElements(Package.parachute, Package.obj, 0, 0, 6.6)
	setElementCollisionsEnabled(Package.parachute, false)
	-- Get the package current position and landing pos
	local x, y = getElementPosition(Package.obj)
	local z = zPos
	Package.landPos = {x, y, z}
	-- Attach blip to package
	Package.blip = createBlipAttachedTo(Package.obj, 0)
	-- Move package object to the ground
	moveObject(Package.obj, packageFloatTime, x, y, z-0.2)
	-- Trigger event when the package has landed
	--==============setTimer(function()setPackageLootable(Package, index, true)end, packageFloatTime, 1)
	-- Destroy parachute on landing
	Package.parachuteTimer = setTimer(function()
		if Package.parachute then
			destroyElement(Package.parachute)
			triggerClientEvent(player, "stworz_notyfikacje", player, "sucess", "Za 10 minut zniknie twój zrzut!")
		end
	end, packageFloatTime+7500, 1) -- +1250
	if Package.parachute then
		setTimer(function() destroyElement(Package.obj) destroyElement(Package.colsprehe) destroyElement(Package.blip) end,600000+(26605/2),1) -- usunie sie po 10 mintach
	end
end)

function destroyPackageElements(index)
	if package[index] then
		for i,v in pairs(package[index]) do
			if isElement(v) then
				destroyElement(v)
			end
		end
		package[index] = nil
	end
end

function getTableCount(t)
	local count = 0
	for i in pairs(t) do
		count = count + 1
	end
	return count
end

function findRotation( x1, y1, x2, y2 ) 
	local t = -math.deg( math.atan2( x2 - x1, y2 - y1 ) )
	return t < 0 and t + 360 or t
end

function getFlyPath(x, y, angle, radius)
	local X = radius * math.cos(angle)
	local Y = radius * math.sin(angle)
	local X1, Y1 = x+X, y+Y
	local X2, Y2 = x-X, y-Y
	local zRot = findRotation(X1, Y1, X2, Y2)
	return X1, Y1, X2, Y2, zRot
end