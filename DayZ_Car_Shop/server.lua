local markery = {
	pojazdy = {
		{
			spawn = {-1609.41015625,130.1123046875,-10.995909690857,0.4449462890625,359.40124511719,134.70886230469},
			ped = {-1716.1875,18.22265625,3.2,-90},
		},
		{
			spawn = {1045.9482421875,2073.951171875,11.00018119812,0.4998779296875,0.4339599609375,0},
			ped = {1093.2509765625,2093.01953125,15.350400924683,90},
		},
	},
	bronie = {
		{1824.59375,-1277.9794921875,131.734375,180},
		{1273.8837890625,294.068359375,19.5546875,-110},
		{-1485.06640625,2619.53515625,58.787948608398,-90},
		{-2078,1423,7,180},
	},
	typy = {},
}
createBlip(1092,2093.0498046875,15.350400924683, 62)
local marker_ped = {}

for i,v in pairs(markery.pojazdy) do
	local marker = createMarker(Vector3(unpack(v.ped)),'cylinder',1.5,200,200,0,0)
	local ped = createPed(50,Vector3(unpack(v.ped)),v.ped[4])
	marker_ped[marker] = ped
	markery.typy[marker] = "Car-Shop"
	setElementData(marker,'Pozycja_Respienia',v.spawn)
	if i ~= #markery.pojazdy then
		setBlipVisibleDistance(createBlipAttachedTo(marker,62),250)
	end
	setElementFrozen(ped,true)
	
end

for i,v in pairs(markery.bronie) do
	local marker = createMarker(v[1],v[2],v[3],"cylinder",1.5,0,0,0,0)
	local ped = createPed(50,v[1],v[2],v[3],v[4])
	marker_ped[marker] = ped
	setElementFrozen(ped,true)
	markery.typy[marker] = "Gun-Shop"
	setBlipVisibleDistance(createBlipAttachedTo(marker,60),250)
end

addEventHandler('onMarkerHit',resourceRoot,function(p)
	if p and getElementType(p)~='player' then return end
	if getPedOccupiedVehicle(p) then return end
	setPedAnimation( marker_ped[source], "PED", "IDLE_CHAT", -1, true, false, true, false ) 
	if markery.typy[source] == "Car-Shop" then
		triggerClientEvent(p,'showGui',resourceRoot,true)
		setElementData(p,'marker-edit',getElementData(source,'Pozycja_Respienia'))
	elseif markery.typy[source] == "Gun-Shop" then
		triggerClientEvent(p,"DayZ_Shop:showMeGunMenu",p)
	end
end)

addEventHandler('onMarkerLeave',resourceRoot,function(p)
	if p and getElementType(p)~='player' then return end
	if #getElementsWithinColShape(getElementColShape(source),"player") == 0 then
		setPedAnimation( marker_ped[source] ) 
	end
	if markery.typy[source] == "Car-Shop" then
		triggerClientEvent(p,'showGui',resourceRoot,false)
		setElementData(p,'marker-edit',nil)
	elseif markery.typy[source] == "Gun-Shop" then
		triggerClientEvent(p,"DayZ_Shop:hideGunMenu",p)
	end
end)

local language = {
	['PL'] = {
		['Malo Hajsu'] = "Nie posiadasz wystarczająco GP!",
	},
	['ENG'] = {
		['Malo Hajsu'] = "You don't have enought GP!",
	},
}


addEvent('kupPojazd',true)
addEventHandler('kupPojazd',resourceRoot,function(gracz,pojazd,cena)
	local jezyk = getElementData(gracz,'Jezyk_Gry') or "PL"
	if (getElementData(gracz,"GP") or 0)<cena then 
		outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] "..language[jezyk]['Malo Hajsu'],gracz,255,255,255,true)
		return
	end
	local data = getElementData(gracz,'marker-edit')
	if not data then
		outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] Wykryto problem! Wyjdz i wejdz do markera!",gracz,255,255,255,true)
		return
	end
	local id_pojazdu = getVehicleModelFromName(pojazd)
	if not id_pojazdu then return end
	setElementData(gracz,"GP",(getElementData(gracz,"GP") or 0)-cena)
	triggerClientEvent(gracz,'UkryjKupnoCara',resourceRoot)
	local veh = createVehicle(id_pojazdu, data[1], data[2], data[3],data[4],data[5],data[6]);
	--setElementPosition(player, data[1], data[2], (data[3]+3));
	local vehCol = createColSphere(data[1], data[2], data[3], 2.5);
	setElementData(gracz,'marker-edit',nil)
	local tires,engine,parts,sloty = exports.DayZ_vehicle:getVehicleAddonInfos(id_pojazdu);
	local maxfuel = exports.DayZ_vehicle:getVehicleMaxFuel(id_pojazdu)
	setElementData(veh, "maxfuel",maxfuel);
	attachElements(vehCol, veh);
	setElementData(vehCol, "parent", veh);
	setElementData(veh, "parent", vehCol);
	setElementData(vehCol, "vehicle", true);
	setElementData(veh, "dayzvehicle", 0); --Change this to '1' if you want to be respawned after explode!
	setElementData(vehCol, "spawn", {id_pojazdu, data[1], data[2], data[3]});
	setElementData(vehCol, "Tire_inVehicle",tires);
	setElementData(vehCol, "Engine_inVehicle",engine);
	setElementData(vehCol, "Parts_inVehicle", parts);
	setElementData(vehCol, "MAX_Slots", sloty);
	setElementData(vehCol, "fuel", maxfuel);
	warpPedIntoVehicle(gracz,veh,0)
end)


addEventHandler('onVehicleExplode',resourceRoot,function()
	if getElementData(source,'dayzvehicle')==0 then
		setTimer(function(car)
			if not isVehicleBlown(car) then return end
			local data = getElementData(car,'parent')
			if isElement(data) then
				destroyElement(data)
			end
			destroyElement(car)
		end,60000,1,source)
	end
end)

setTimer(function()
	for i,v in pairs(getElementsByType('vehicle',resourceRoot)) do
		if isElementInWater(v) and (getElementData(v,'dayzvehicle') or 0)==0 then
			local data = getElementData(v,'parent')
			if isElement(data) then
				destroyElement(data)
			end
			destroyElement(v)
		end
	end
end,60000*2,0)


local db = dbConnect("sqlite", "auta.db");
dbExec(db, "CREATE TABLE IF NOT EXISTS `vehicles` (model, x, y, z, rX, rY, rZ, slots, fuel, engines, moving, parts, items, health, dayz, sx, sy, sz, id,friz,dimension)");

local backupItemsTable = {
	{"M4A1-S", 3},
	{"M4A1", 3},
	{"M60", 3},
	{"AK-47", 3},
	{"M16A4", 3},
	{"Winchester 1866", 3},
	{"SPAZ-12 Combat Shotgun", 3},
	{"Sawn-Off Shotgun", 3},
	{"Lee Enfield", 3},
	{"Cheytac M200", 3},
	{"CZ550", 3},
	{"M1911", 2},
	{"M9 SD", 2},
	{"PDW", 2},
	{"MP5A5", 2},
	{"Desert Eagle", 2},
	{"Hunting Knife", 1,_,'Nóż Myśliwski'},
	{"Hatchet", 2,_,'Sikierka'},
	{"Parachute \n",0,_,"Spadochron"},
	{'Parachute',1,_,"Spadochron"},
	{"Baseball Bat", 1,_,"Kij Bejzbolowy"},
	{"Shovel", 1,_,"Łopata",},
	{"Golf Club", 1,_,'Kij Golfowy'},
	{"Chainsaw", 2,_,"Piła Mechaniczna"},
	{"Tear Gas \n", 0},
	{"Grenade \n", 0,_,"Granat"},
	{"Binoculars \n", 0,_,"Lornetka"},
	{"Tear Gas", 1},
	{"Grenade", 1,_,"Granat"},
	{"Binoculars", 1,_,"Lornetka"},
	{"M1911 Mag", 0.085},
	{"M9 SD Mag", 0.085},
	{"Desert Eagle Mag", 0.085},
	{"PDW Mag", 0.025},
	{"MP5A5 Mag", 0.025},
	{"1866 Slug", 0.067},
	{"2Rnd. Slug", 0.067},
	{"SPAZ-12 Pellet", 0.067},
	{"M4A1-S Mag", 0.035},
	{"M60 Mag", 0.035},
	{"AK-47 Mag", 0.035},
	{"M16A4 Mag", 0.035},
	{"CZ550 Mag", 0.1},
	{"Cheytac M200 Mag", 0.1},
	{"Lee Enfield Mag", 0.1},
	{"Water Bottle", 1,_,"Butelka Wody"},
	{"Pasta Can", 1,_,"Makaron"},
	{"Beans Can", 1,_,"Fasolka"},
	{"Kebab",1},
	{"Coca Cola",1},
	{"Burger", 1,_,"Burger"},
	{"Pizza", 1,_,"Pizza"},
	{"Soda Bottle", 1,_,"Napój Gazowany"},
	{"Milk", 1,_,"Mleko"},
	{"Cooked Meat", 1,_,"Upieczone mięso"},
	{"Assault Pack (ACU)", 1, "Equip Backpack","Plecak ACU"},
	{"Bag", 2, "Equip Backpack",'Torba'},
	{"Alice Pack", 3, "Equip Backpack",'Plecak Alice'},
	{"Mountain Backpack", 4, "Equip Backpack",'Plecak Górski'},
	{"Czech Backpack", 4, "Equip Backpack","Plecak Czech"},
	{"Coyote Backpack", 4, "Equip Backpack","Plecak Kojot"},
	{"Military Backpack", 5, "Equip Backpack","Plecak Militarny"},
	{"Camouflage Clothing", 1, "Put clothes on","Przebranie Kamuflujące"},
	{"Civilian Clothing", 1, "Put clothes on","Przebranie Cywila"},
	{"Survivor Clothing", 1, "Put clothes on","Przebranie Ocalałego"},
	{"Ghillie Suit", 1, "Put clothes on","Kombinezon Ghillie"},
	{"Reabel Clothing", 1, "Put clothes on",'Przebranie Rebelianta'},
	{"Woman Clothing", 1, "Put clothes on",'Przebranie Ocalałego [F]'},
	{"Military Clothing [F]",1,"Put clothes on","Przebranie Wojskowe [F]"},
	{"Ghillie Suit [F]",1,"Put clothes on","Kombinezon Ghillie [F]"},
	{"Kombinezon X",1,"Put clothes on","Kombinezon X"},
	{"Wood Pile", 2,_,"Stos Drewna"},
	{"Trap",2,'Put a trap',"Pułapka"},
	{"Metal",2},
	{"Lista Metalu",4},
	{"Weapon parts",1},
	{"Bandage", 1, "Bandage yourself","Bandaż"},
	{"Empty Gas Canister", 2,_,"Pusty Karnister"},
	{"Full Gas Canister", 2,_,"Pełny Karnister"},
	{"Medic Kit", 2, "Use","Apteczka Medyczna"},
	{"First Aid Kit",1,"Use","Apteczka Pierwszej Pomocy"},
	{"Medic Bag",3,"Use","Torba Medyczna"},
	{"Heat Pack", 1, "Use"},
	{"Painkiller", 1, "Use","Środki Przeciwbólowe"},
	{"Morphine", 1, "Use","Morfina"},
	{"Blood Bag", 1,_,"Torebka Krwi"},
	{"Wire Fence", 1, "Build a wire fence","Kolczatka"},
	{"Sandbag",2,"Build a sandbag","Worki z Piastkiem"},
	{"Raw Meat", 1,_,"Surowe Mięso"},
	{"Tire", 2,_,"Koło"},
	{"Tank Parts", 2,_,"Zbiornik Paliwa"},
	{"Engine", 5,_,"Silnik"},
	{"Tent", 2, "Pitch a tent","Namiot"},
	{"Medium Tent", 3, "Pitch a tent","Namiot Średni"},
	{"Large Tent", 4, "Pitch a tent","Namiot Duży"},
	{"Empty Water Bottle", 1, "Fill bottle up","Pusta butelka wody"}, 
	{"Empty Soda Cans", 1},
	{"Scruffy Burgers", 1,_,"Stare burgery"},
	{"Rope",2,'Pull down rope',"Lina"},
	{"Night Vision Goggles", 0,_,"Google Noktowizyjne"},
	{"Infrared Goggles", 0,_,"Google Podczerwieni"},
	{"Map", 0,_,'Mapa'},
	{"Box of Matches", 0, "Make a Fire","Zapalniczka"},
	{"Watch", 0,_,"Zegarek"},
	{"GPS", 0},
	{"Toolbox", 0,_,"Zestaw Naprawczy"},
	{"PKP Pecheneg",3},
}



function backup()
	dbExec(db, "DELETE FROM `vehicles`");
	local vc,tc = 0, 0;
	for _,veh in ipairs(getElementsByType("vehicle",resourceRoot)) do
		local col = getElementData(veh, "parent");
		if col then
		if (getElementData(veh,'dayzvehicle') or 0)==0 then
			local x,y,z = getElementPosition(veh);
			local rX,rY,rZ = getElementRotation(veh);
			local health = getElementHealth(veh);
			local dimension = getElementDimension(veh)
			if (health < 500) then health = 500; end
			local _,sx,sy,sz = 0,0,0
			local items = {};
			vc = vc+1;
			for _,item in ipairs(backupItemsTable) do
				local quantity = getElementData(col, item[1]) or 0;
				if (quantity > 0) then
					table.insert(items, {item[1], quantity});
				end
			end
			local frized = isElementFrozen(veh) 
			if frized then
				MaxFriz = 'Jest'
			else
				MaxFriz = 'Nie ma'
			end
				dbExec(db, "INSERT INTO `vehicles` (model, x, y, z, rX, rY, rZ, slots, fuel, engines, moving, parts, items, dayz, health, sx, sy, sz, id,friz,dimension) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", 
				getElementModel(veh), x, y, z, rX, rY, rZ, getElementData(col, "MAX_Slots") or 20, getElementData(col, "fuel") or 0, getElementData(col, "Engine_inVehicle") or 0, 
				getElementData(col, "Tire_inVehicle") or 0, getElementData(col, "Parts_inVehicle") or 0, toJSON(items), getElementData(veh, "dayzvehicle") or 0, health, sx, sy, sz, vc,MaxFriz,dimension);
			end
		end
	end
	print("Kupione auta: "..vc)
end


function createDayzVeh(model, x, y, z, rX, rY, rZ, slots, fuel, engines, moving, parts, items, dayz, health, sx, sy, sz,friz,dimension)
	local veh = createVehicle(model, x, y, z);
	local vehCol = createColSphere((x-5), y, z, 3);
	local tires,engine,parts,_ = exports.DayZ_vehicle:getVehicleAddonInfos(model);
	if friz=='Nie ma' then
	setElementFrozen(veh,false)
	else
	setElementFrozen(veh,true)
	end
	setElementDimension(veh,dimension)
	setElementDimension(vehCol,dimension)
	setElementData(veh, "maxfuel", exports.DayZ_vehicle:getVehicleMaxFuel(model));
	setElementData(veh, "needtires", tires);
	setElementData(veh, "needparts", parts);
	setElementData(veh, "needengines", engine);
	setElementRotation(veh, rX, rY, rZ);
	setElementData(veh, "parent", vehCol);
	setElementData(veh, "dayzvehicle", 0);
	attachElements(vehCol, veh);
	setElementData(vehCol, "parent", veh);
	setElementData(vehCol, "vehicle", true);
	setElementData(vehCol, "MAX_Slots", tonumber(slots));
	setElementData(vehCol, "Tire_inVehicle", tonumber(moving));
	setElementData(vehCol, "Engine_inVehicle", tonumber(engines));
	setElementData(vehCol, "Parts_inVehicle", tonumber(parts));
	setElementData(vehCol, "spawn", {model, sx, sy, sz});
	setElementData(vehCol, "fuel", tonumber(fuel));
	for _,v in ipairs(fromJSON(items)) do
		setElementData(vehCol, v[1], v[2]);
	end
	if (health > 250) then
		setElementHealth(veh, tonumber(health));
	else
		blowVehicle(veh, true);
	end
end

function loBackup()
	for _,v in pairs(getElementsByType("vehicle",resourceRoot)) do
		local col = getElementData(v, "parent");
		if col then
			destroyElement(col);
		end
		destroyElement(v);
	end
	local p = dbPoll(dbQuery(db, "SELECT * FROM `vehicles`"), -1);
	if (#p > 0) then
		for _,d in pairs(p) do
			createDayzVeh(d["model"], d["x"], d["y"], d["z"], d["rX"], d["rY"], d["rZ"], d["slots"], d["fuel"], d["engines"], d["moving"], d["parts"], d["items"], d["dayz"], d["health"], d["sx"], d["sy"], d["sz"],d['friz'],d['dimension']);
		end
	end
end

loBackup()
setTimer(function()
	backup()
end,60000*5,0)


