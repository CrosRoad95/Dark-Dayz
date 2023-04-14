

local respy = {
	{-2842.58984375,-295.1376953125,10,up = 70, down = 17,attach_z = -7},
	{1525.9716796875,104.837890625,30,up = 70, down = 37,attach_z = -7},
	{2664,-188,37,up = 70, down = 37,attach_z = -7},
	{-2422,1111,56,up = 70, down = 37,attach_z = -7},
	{-2110,2672,160,up = 70, down = 37,attach_z = -7},
	{-1176,1994,139,up = 70, down = 37,attach_z = -7},
	{791,2784,81,up = 70, down = 37,attach_z = -7},
	{1522,1797,11,up = 70, down = 37,attach_z = -7},
	{2866,1121,11,up = 70, down = 37,attach_z = -7},
	{1956,196,33,up = 70, down = 37,attach_z = -7},
	{-606,-75,64,up = 70, down = 37,attach_z = -7},
	{-1117,-985,130,up = 70, down = 37,attach_z = -7},
	{-1892,-1720,22,up = 70, down = 37,attach_z = -7},
	{-1246,-403,15,up = 70, down = 37,attach_z = -7},
	{-2438,732,36,up = 70, down = 37,attach_z = -7},
	{-2081,1336,8,up = 70, down = 37,attach_z = -7},
	{-939,1472,34,up = 70, down = 37,attach_z = -7},
	{1150,-2053,70,up = 70, down = 37,attach_z = -7},
	{1850,-2547,14,up = 70, down = 37,attach_z = -7},
	{2761,-2465,14,up = 70, down = 37,attach_z = -7},
}


local object
local vehicle
local blip
local radar
local object_attached
local enterned = false

local autka = {}

function math_radarPosition(x,y,z)
	x = x - 100
	y = y - 100
	return x,y
end


local auta = {
	{"Elegy"},
	{"Sandking"},
	{"Bullet"},
	{"Buffalo"},
	{"Elegy"},
	--{"Bobcat"},
	--{"Barracks"},
	{"Dodo"},
}

local repeatt


function carResp()
	if isTimer(repeatt) then
		killTimer(repeatt)
	end
	if isElement(blip) then
		repeatt = setTimer(carResp,3600000 * 1.5,1)
		return
	end
	if getPlayerCount() < 10 then
		repeatt = setTimer(carResp,3600000 * 1.5,1)
		return
	end
	local resp = respy[math.random(#respy)]
	outputChatBox("#FFFFFF[#33D1BCDark-DayZ#FFFFFF] Nowe auto pojawiło się na mapie! Podczas wchodzenia do pojazdu znacznik zniknie!",root,255,255,255,true)
	local id_pojazdu = getVehicleModelFromName(auta[math.random(#auta)][1])
	vehicle = createVehicle(id_pojazdu,resp[1],resp[2],resp[3] + resp.up)
	object = createObject(2903,resp[1],resp[2],resp[3] + resp.up)
	local vehCol = createColSphere(resp[1],resp[2],resp[3], 2.5);
	local tires,engine,parts,sloty = exports.DayZ_vehicle:getVehicleAddonInfos(id_pojazdu);
	local maxfuel = exports.DayZ_vehicle:getVehicleMaxFuel(id_pojazdu)
	setElementData(vehicle, "maxfuel",maxfuel);
	attachElements(vehCol, vehicle);
	setElementData(vehCol, "parent", vehicle);
	setElementData(vehicle, "parent", vehCol);
	setElementData(vehCol, "vehicle", true);
	setElementData(vehicle, "dayzvehicle", 0);
	setElementData(vehCol, "spawn", {id_pojazdu, resp[1],resp[2],resp.down});
	setElementData(vehCol, "Tire_inVehicle",0);
	setElementData(vehCol, "Engine_inVehicle",0);
	setElementData(vehCol, "Parts_inVehicle", 0);
	setElementData(vehCol, "MAX_Slots", sloty);
	setElementData(vehCol, "fuel", maxfuel);
	setElementFrozen(vehicle,true)
	setElementFrozen(object,true)
	local x,y = math_radarPosition(resp[1],resp[2])
	radar = createRadarArea(x,y,200,200,51,209,188,200)
	setRadarAreaFlashing(radar,true)
	blip = createBlipAttachedTo(vehicle,55)
	autka[vehicle] = {radar,blip}
	attachElements(vehicle,object,0,0,resp.attach_z)
	moveObject(object,30000,resp[1],resp[2],resp[3] + 7.5)
	setTimer(function()
		setElementFrozen(vehicle,false)
		detachElements(vehicle,object)
		destroyElement(object)
	end,30000,1)
	enterned = false
	repeatt = setTimer(carResp,3600000 * 1.5,1)
end
carResp()

addEventHandler('onVehicleEnter',resourceRoot,function()
	if autka[source] then
		destroyElement(autka[source][1])
		destroyElement(autka[source][2])
		enterned = source
		--setTimer(carResp,3600000,1)
		autka[source] = nil
	end
end)

addEventHandler('onVehicleExplode',resourceRoot,function()
	if getElementData(source,'parent') then
		destroyElement(getElementData(source,'parent'))
	end
	if enterned == source or not enterned then
		--setTimer(carResp,3600000,1)
	end
	if autka[source] then
		destroyElement(autka[source][1])
		destroyElement(autka[source][2])
		autka[source] = nil
	end
	destroyElement(source)
end)

function dobackup()
	if fileExists("Zapis.xml") then
		fileDelete("Zapis.xml")
	end
	local xml = xmlCreateFile("Zapis.xml","Auta")
	for i,v in pairs(getElementsByType("vehicle",resourceRoot)) do
		local child = xmlCreateChild(xml,"Auto")
		xmlNodeSetAttribute(child,"model",getElementModel(v))
		xmlNodeSetAttribute(child,"pozycja",toJSON({getElementPosition(v)}))
		local czesci = {
			{"Szyba-Kuloodporna",getElementData(getElementData(v,"parent"),"Szyba-Kuloodporna")},
			{"Tire_inVehicle",getElementData(getElementData(v,"parent"),"Tire_inVehicle")},
			{"Engine_inVehicle",getElementData(getElementData(v,"parent"),"Engine_inVehicle")},
			{"Parts_inVehicle",getElementData(getElementData(v,"parent"),"Parts_inVehicle")},
		}
		xmlNodeSetAttribute(child,"czesci",toJSON(czesci))
	end
	xmlSaveFile(xml)
	xmlUnloadFile(xml)
end


function loadBackup()
	if not fileExists("Zapis.xml") then return end
	local xml = xmlLoadFile("Zapis.xml")
	for i,v in pairs(xmlNodeGetChildren(xml)) do
		local model = xmlNodeGetAttribute(v,"model")
		local pozycja = fromJSON(xmlNodeGetAttribute(v,"pozycja"))
		local czesci = fromJSON(xmlNodeGetAttribute(v,"czesci"))
		local vehicle = createVehicle(tonumber(model),pozycja[1],pozycja[2],pozycja[3])
		local vehCol = createColSphere(pozycja[1],pozycja[2],pozycja[3], 2.5);
		local tires,engine,parts,sloty = exports.DayZ_vehicle:getVehicleAddonInfos(model);
		local maxfuel = exports.DayZ_vehicle:getVehicleMaxFuel(model)
		setElementData(vehicle, "maxfuel",maxfuel);
		attachElements(vehCol, vehicle);
		setElementData(vehCol, "parent", vehicle);
		setElementData(vehicle, "parent", vehCol);
		setElementData(vehCol, "vehicle", true);
		setElementData(vehicle, "dayzvehicle", 0);
		setElementData(vehCol, "spawn", {model, pozycja[1],pozycja[2],pozycja[3]});
		setElementData(vehCol, "MAX_Slots", sloty);
		setElementData(vehCol, "fuel", maxfuel);
		for i,v in pairs(czesci) do
			setElementData(vehCol,v[1],v[2])
		end
	end
end
loadBackup()

addCommandHandler("dobackup",function()
	dobackup();
end)
