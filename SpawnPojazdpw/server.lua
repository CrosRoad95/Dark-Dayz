local vehsInfo = {
	--Name, ID, Tires, Engines, TankParts, Slots, MaxFuel;
	{"bmx", 481, 0, 0, 0, 0, 10},
	{"quad", 471, 4, 1, 1, 40, 30},
	{"nevada", 553, 3, 4, 8, 400, 300},
	{"buffalo", 402, 4, 1, 1, 40, 60},
	{"bobcat", 422, 4, 1, 1, 25, 80},
	{"mesa", 500, 4, 1, 1, 25, 80},
	{"patriot", 470, 4, 1, 1, 46, 100},
	{"sanchez", 468, 2, 1, 1, 10, 30},
	{"barracks", 433, 6, 1, 1, 1000, 100},
	{"coach", 437, 6, 1, 1, 60, 140},
	{"taxi", 438, 6, 1, 1, 60, 140},
	{"bike", 509, 0, 0, 0, 0, 0},
	{"maverick", 487, 0, 1, 1, 20, 60},
	{"pmaverick", 497, 0, 1, 1, 20, 60},
	{"reefer", 453, 0, 1, 1, 35, 60},
	{"dodo", 593, 3, 1, 1, 35, 60},	
	{"nrg", 522, 2, 1, 1, 35, 60},
	{"free", 463, 2, 1, 1, 35, 60},	
	{"inf", 411, 4, 1, 1, 35, 60},
	{"sand", 495, 4, 1, 1, 80, 60},	
	{"premier", 426, 4, 1, 1, 200, 200},	
	{"hot", 494, 4, 1, 1, 35, 60},
	{"clover", 542, 4, 1, 1, 35, 60},
	{"shamal", 519, 3, 2, 1, 90, 120},
	{"police", 597, 4, 1, 1, 50, 60},
	{"bullet", 541, 4, 1, 1, 65, 60},
	{"sultan", 560, 4, 1, 1, 65, 60},
	{"land", 400, 4, 1, 1, 65, 60},
	{"hotknife", 434, 4, 1, 1, 45, 60},
	{"cheetah", 415, 4, 1, 1, 45, 60},
	{"merit", 551, 4, 1, 1, 45, 60},
	{"sabre", 475, 4, 1, 1, 45, 60},
	{"rcgoblin", 501, 4, 1, 1, 45, 60},
	{"blista", 496, 4, 1, 1, 45, 60},
	{"huntley", 579, 4, 1, 1, 45, 60},
	{"elegant", 507, 4, 1, 1, 45, 60},
	{"hotring", 494, 4, 1, 1, 45, 60},
	{"hotring2", 502, 4, 1, 1, 45, 60},
	{"hotring3", 503, 4, 1, 1, 45, 60},
	{"pcj", 461, 2, 1, 1, 45, 60},
	{"jester", 559, 4, 1, 1, 45, 60},
	{"rdt", 515, 6, 1, 1, 450, 350},
	{"uran", 558, 4, 1, 1, 450, 350},
	{"rancher", 489, 4, 1, 1, 450, 350},
	{"ambulance", 416, 4, 1, 1, 450, 350},
	
	{"sea", 447, 0, 1, 1, 45, 60},
	{"sun", 550, 4, 1, 1, 45, 60},
	{"admi", 445, 4, 1, 1, 45, 60},
	{"towt", 525, 4, 1, 1, 45, 60},
	{"swat", 601, 4, 1, 1, 45, 60},
	{"sparr", 469, 4, 1, 1, 45, 60},
	{"lev", 417, 3, 2, 1, 45, 60},
	{"supergt", 506, 4, 1, 1, 45, 60},
	{"elegy", 562, 4, 1, 1, 45, 60},
	{"fbitruck", 528, 4, 1, 1, 45, 60},
	{"camper", 483, 4, 1, 1, 45, 60},
	{"flash", 565, 4, 1, 1, 45, 60},
	{"dft", 578, 4, 1, 1, 45, 60},
	{"turismo", 451, 4, 1, 1, 45, 60},
	{"policels", 596, 4, 1, 1, 45, 60},
	{"comet", 480, 4, 1, 1, 45, 60}, 
        {"banshee", 429, 4, 1, 1, 45, 60},  
        {"bandito", 568, 4, 1, 1, 45, 60}, 

};

addCommandHandler("spawn", function(player, _, vType) --Ex: /spawn bobcat
	if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup("Admin")) or isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup("Pomocnik")) or getPlayerSerial(player) == "TWOJ SERIAL :)" then
		for _,v in ipairs(vehsInfo) do
			if (type(vType) == "string" and vType:lower() == v[1]) then
				local x,y,z = getElementPosition(player);
				local veh = createVehicle(v[2], x, y, z);
				setElementPosition(player, x, y, (z+3));
				local vehCol = createColSphere(x, y, z, 4);
				local dim = getElementDimension(player)
				setElementDimension(veh,dim)
				setElementDimension(vehCol,dim)
				attachElements(vehCol, veh);
				setElementData(vehCol, "parent", veh);
				setElementData(veh, "parent", vehCol);
				setElementData(vehCol, "vehicle", true);
				setElementData(veh, "dayzvehicle", 0); --Change this to '1' if you want to be respawned after explode!
				setElementData(vehCol, "spawn", {v[2], x, y, z});
				setElementData(vehCol, "Tire_inVehicle", tonumber(v[3]));
				setElementData(vehCol, "Engine_inVehicle", tonumber(v[4]));
				setElementData(vehCol, "Parts_inVehicle", tonumber(v[5]));
				setElementData(vehCol, "MAX_Slots", tonumber(v[6]));
				setElementData(vehCol, "fuel", tonumber(v[7]));
				outputChatBox("You ceated "..getVehicleName(veh), player, 50, 255, 50);
			end
		end
	end
end);

addCommandHandler("delete2", function(player) --Ex: /delete (While you are in a vehicle!)
	if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup("Admin")) or isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup("Pomocnik")) or getPlayerSerial(player) == "TWOJ SERIAL :)" then
		if isPedInVehicle(player) then
			local veh = getPedOccupiedVehicle(player);
			local col = getElementData(veh, "parent");
			if (getElementData(veh, "dayzvehicle") == 2) then
				removePedFromVehicle(player);
				local id,x,y,z = getElementData(col, "spawn")[1], getElementData(col, "spawn")[2], getElementData(col, "spawn")[3], getElementData(col, "spawn")[4];
				setTimer(triggerEvent, (5*60000), 1, "respawnDayZVehicle", player, id, x, y, z);
				destroyElement(col);
				destroyElement(veh);
			else
				destroyElement(col);
				destroyElement(veh);
			end
		end
	end
end);

addCommandHandler("fix", function(player) --Ex: /fix (While you are in a vehicle!)
	if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup("Admin")) or isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup("Pomocnik")) or getPlayerSerial(player) == "TWOJ SERIAL :)" then
		if isPedInVehicle(player) then
			local veh = getPedOccupiedVehicle(player);
			fixVehicle(veh);
			outputChatBox("You fixed "..getVehicleName(veh), player, 50, 255, 50);
		end
	end
end);

addCommandHandler("godveh", function(player)
	if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup("Admin")) or isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup("Pomocnik")) or isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup("Pomocnik2")) then
		if isPedInVehicle(player) then
			local veh = getPedOccupiedVehicle(player)
			setVehicleDamageProof(getPedOccupiedVehicle(player),true) 
			outputChatBox("VEHICLE: Godmode ON ("..getVehicleName(veh)..")", player, 50, 255, 50)
		end
	end
end)

addCommandHandler("ungodveh", function(player)
	if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup("Admin")) or isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup("Pomocnik")) or isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup("Pomocnik2")) then
		if isPedInVehicle(player) then
			local veh = getPedOccupiedVehicle(player)
			setVehicleDamageProof(getPedOccupiedVehicle(player),false) 
			outputChatBox("VEHICLE: Godmode OFF ("..getVehicleName(veh)..")", player, 255, 0, 0)
		end
	end
end)

addCommandHandler("god", function(player)
	if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup("Admin")) or isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup("Pomocnik")) then
		setElementData(player, "blood", getElementData(player,"blood")+999999999)
		setElementData(player,"anty-headshot",true)
		outputChatBox("JESTEŚ NIEZNISZCZALNY!", player, 255, 0, 0)
	end
end)

addCommandHandler("ungod", function(player)
	if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup("Admin")) or isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup("Pomocnik")) then
		setElementData(player, "blood", 12000)
		outputChatBox("JESTEŚ ZNISZCZALNY", player, 50, 255, 50)
	end
end)
