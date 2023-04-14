local spawny = {
    {1334.25, 286.16, 19.12, 0.0, 0.0, 336.4},
    {766.24, 355.53, 19.59, 0.3, 359.1, 119.1},
    {-80.08, 71.70, 2.71, 358.9, 360.0, 67.9},
    {-931.90, -508.76, 25.55, 359.3, 359.6, 324.3},
    {-1975.52, -533.37, 34.93, 358.9, 360.0, 360.0},
    {-2085.84, 62.61, 34.09, 3.1, 359.8, 91.8},
    {-2664.80, 912.43, 79.26, 358.8, 359.8, 182.2},
    {-2585.82, 322.32, 4.45, 358.9, 0.2, 85.7},
    {2645.68, 739.11, 10.28, 0.4, 360.0, 359.8},
    {2804.92, 1335.69, 10.22, 0.2, 360.0, 271.9},
    {994.44, 1076.93, 10.28, 0.3, 360.0, 0.0},
    {-171.60, 1016.08, 19.20, 0.3, 0.0, 87.7},
    {-881.72, 1520.87, 25.36, 0.3, 0.0, 86.5},
    {-904.57, 1989.07, 60.37, 0.3, 0.0, 360.0},
    {-237.51, 2771.46, 61.76, 2.5, 359.9, 180.1},
    {-2774.60, -281.99, 6.51, 0.5, 360.0, 181.4},
    {-2396.63, -2205.33, 32.75, 0.4, 360.0, 291.6},
    {-1539.84, -2744.86, 48.00, 0.3, 0.0, 172.6},
    {-16.78, -2520.90, 36.12, 0.4, 360.0, 31.5},
    {784.95, -1636.58, 12.85, 0.4, 0.0, 0.0},
    {995.86, -1302.02, 12.85, 0.3, 0.1, 182.5},
    {1026.21, -927.68, 41.64, 0.4, 360.0, 97.8},
    {2859.22, -1891.28, 10.38, 0.3, 359.9, 360.0},
}

local modele = {
	"Bobcat",
	"Mesa",
        "Admiral",
        "Camper",
        "QuadBike",
        "Bike",
}


function spawnVehicle(model, x, y, z, rx, ry, rz)
	local vehicle = createVehicle(model, x, y, z, rx, ry, rz)
	local vehCol = createColSphere(x, y, z, 2.5);
	local tires,engine,parts,sloty = exports.DayZ_vehicle:getVehicleAddonInfos(model);
	local maxfuel = exports.DayZ_vehicle:getVehicleMaxFuel(model)
	setElementData(vehicle, "maxfuel", maxfuel);
	attachElements(vehCol, vehicle);
	setElementData(vehCol, "parent", vehicle);
	setElementData(vehicle, "parent", vehCol);
	setElementData(vehCol, "vehicle", true);
	setElementData(vehicle, "dayzvehicle", 0);
	--setElementData(vehCol, "spawn", {model, resp[1],resp[2],resp.down});
	setElementData(vehCol, "Tire_inVehicle", tires);
	setElementData(vehCol, "Engine_inVehicle",engine);
	setElementData(vehCol, "Parts_inVehicle", parts);
	setElementData(vehCol, "MAX_Slots", sloty);
	setElementData(vehCol, "spawn", {model, x, y, z, rx, ry, rz}, false);
	setElementData(vehCol, "fuel", maxfuel);
	setElementData(vehicle, "Pojazd-Tymczasowy", true)
end

for i,v in pairs(spawny) do
	spawnVehicle(getVehicleModelFromName(modele[math.random(#modele)]), v[1], v[2], v[3], v[4], v[5], v[6])
	triggerClientEvent(root, "dxPickupsText", root, "Auta tymczasowe zostały przeładowane!", 255,255,255)
end

function isPedInVehicle(veh)
	local counter = 0
	for seat, player in pairs(getVehicleOccupants(veh)) do
		counter = counter + 1
	end
	return counter > 0 and true or false
end

setTimer(function()
	for i, v in pairs(getElementsByType("vehicle", resourceRoot)) do
		if not isPedInVehicle(v) then
			local col = getElementData(v, "parent")
			local dane = getElementData(col, "spawn")
			destroyElement(col)
			destroyElement(v)
			spawnVehicle(getVehicleModelFromName(modele[math.random(#modele)]), dane[2], dane[3], dane[4])
		end
	end
	triggerClientEvent(root, "dxPickupsText", root, "Auta tymczasowe zostały przeładowane!", 255,255,255)
end, 3600000 * 1.5, 0)


--[[
addEventHandler("onVehicleStartEnter", root, function(player, seat)
	if seat ~= 0 and getElementData(source, "Pojazd-Tymczasowy") then
		cancelEvent()
		triggerClientEvent(player, "stworz_notyfikacje", player, "error", "Nie możesz wsiąść jako pasażer!")
	end
end)]]--