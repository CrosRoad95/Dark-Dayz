wylaczone = false

--exports["db-mysql"]:dbSet("CREATE TABLE IF NOT EXISTS `bought_vehicles` (id, pos_info, base, owner)")


addEvent("Server-KupResp",true)
addEventHandler("Server-KupResp",root,function(cosik)
if wylaczone == true then outputChatBox("Kupno basespawnów jest wyłączone!",source,255,0,0) return end
	local kupione = getElementData(source,"Kupione-Respy") or {}
	if not kupione then return end
	if (getElementData(source,"PP") or 0) < cosik.cena then
		outputChatBox("* Posiadasz za mało PP",source,255,255,255)
		return
	end
	kupione[cosik.nejm] = {(kupione[cosik.nejm] and kupione[cosik.nejm][1] + 1 or 1),cosik.car,cosik.dni,cosik.use_type}
	setElementData(source,"PP",getElementData(source,"PP") - cosik.cena)
	triggerClientEvent(source, "stworz_notyfikacje", source, "sucess", "Kupiłeś "..cosik.nejm.."!")
	--outputChatBox("* Użycie: /spawn "..cosik.nejm,source,255,255,255)
	setElementData(source,"Kupione-Respy",kupione)
end)

function getLastCarId()
	local xml = xmlLoadFile("meta.xml")
	local atrybut = xmlNodeGetAttribute(xml,"last_id")
	local cos = tonumber(atrybut) + 1
	xmlNodeSetAttribute(xml,"last_id",cos)
	xmlSaveFile(xml)
	return cos
end

--[[function dbGetResult(e)
	local q = e
	local p = dbPoll(q,-1)
	dbFree(e)
	return p
end]]

function checkRespInBase(id)
	local e = exports["db-mysql"]:dbGet("SELECT * FROM bought_vehicles WHERE base = ?",id)
	return #e
end

function stworzPojazd(player, dane, kordy, rotacja, base_id)
	local cuboid,grupa = unpack(getElementData(player,'Moze-Otwierac'))
	if checkRespInBase(grupa) >= 3 then triggerClientEvent(player, "stworz_notyfikacje", player, "error", "Baza osiągneła limit spawnów!") return false end
	local id_pojazdu = getVehicleModelFromName(dane[2])
	local x, y, z = unpack(kordy)
	local vehicle = createVehicle(id_pojazdu,x,y,z)
	local vehCol = createColSphere(x,y,z, 2.5);
	local identyfikator = getLastCarId()
	local tires,engine,parts,sloty = exports.DayZ_vehicle:getVehicleAddonInfos(id_pojazdu);
	local maxfuel = exports.DayZ_vehicle:getVehicleMaxFuel(id_pojazdu)
	setElementRotation(vehicle, rotacja[1], rotacja[2], rotacja[3])
	setElementData(vehicle, "maxfuel",maxfuel);
	attachElements(vehCol, vehicle);
	setElementData(vehCol, "parent", vehicle);
	setElementData(vehicle, "parent", vehCol);
	setElementData(vehCol, "vehicle", true);
	setElementData(vehicle, "dayzvehicle", 0);
	setElementData(vehicle,"Buyed-Days",dane[3])
	local pjzdy = getElementData(player, "Car-Owned")
	if pjzdy then
		pjzdy[identyfikator] = true
	end
	triggerClientEvent(client, "stworz_notyfikacje", client, "sucess", "Pomyślnie stworzono pojazd!")
	setElementData(player, "Car-Owned", pjzdy)
	setElementData(vehCol, "spawn", {id_pojazdu, x,y,z, rotacja[1], rotacja[2], rotacja[3]});
	setElementData(vehCol, "Tire_inVehicle",tires);
	setElementData(vehicle, "Auto-ID", tonumber(identyfikator));
	setElementData(vehicle, "base_id", grupa);
	setElementData(vehCol, "Engine_inVehicle",engine);
	setElementData(vehCol, "Parts_inVehicle", parts);
	setElementData(vehCol, "MAX_Slots", sloty);
	setElementData(vehCol, "fuel", maxfuel);
	setElementData(vehCol, "car_type", dane[4]);
	setElementData(vehicle, "car_type", dane[4]);
	local info = {
		--["type"] = {x,y,z},
		["kordy"] = {x,y,z},
		["rotacja"] = rotacja,
		["spawn"] = {id_pojazdu, x,y,z, rotacja[1], rotacja[2], rotacja[3]},
		["dni"] = dane[3],
	}
	exports["db-mysql"]:dbSet("INSERT INTO `bought_vehicles` VALUES(?,?,?,?,?)",identyfikator,toJSON(info),tostring(grupa),getElementData(player,"logedin"), dane[4])
	return true
end
--stworzPojazd()

function zrobZapis()
	for i,v in pairs(getElementsByType("vehicle", resourceRoot)) do
		local id = getElementData(v, "Auto-ID")
		if id then
			local p = exports["db-mysql"]:dbGet("SELECT `pos_info` FROM `bought_vehicles` WHERE `id` = ?",id)
			if p and p[1] then
				local info = fromJSON(p[1]["pos_info"])
				info["kordy"] = {getElementPosition(v)}
				info["rotacja"] = {getElementRotation(v)}
				exports["db-mysql"]:dbSet("UPDATE `bought_vehicles` SET `pos_info` = ? WHERE `id` = ?", toJSON(info), id)
			end
		end
	end
end

setTimer(zrobZapis, 600000 * 1.5, 0)

function tryBaseSpawn(data, kordy, rotacja)
	if client and not getElementData(client,"in_base") then 
		triggerClientEvent(client, "stworz_notyfikacje", client, "error", "Musisz być w bazie aby postawić Base Spawn!")
		return
	end
	local spawny = getElementData(client, "Kupione-Respy")
	local info = spawny[data[1]]

	if info and info[1] > 0 then
		if stworzPojazd(client, info, kordy, rotacja) then
			spawny[data[1]][1] = spawny[data[1]][1] - 1
			setElementData(client, "Kupione-Respy", spawny)
		end
	end
end
addEvent("tryBaseSpawn", true)
addEventHandler("tryBaseSpawn", root, tryBaseSpawn)

--[[
addCommandHandler("spawn",function(player,cmd,...)
	local tekst = table.concat ( { ... }, " " )
	local kupione = getElementData(player,"Kupione-Respy") or {}
	if getElementDimension(player) > 0 then
		triggerClientEvent(player, "stworz_notyfikacje", player, "error", "W tej bazie nie możesz postawić spawnu!")
		return
	end
	if player and not getElementData(player,"Moze-Otwierac") then 
		--outputChatBox("* Spawn możesz postawić tylko i wyłącznie w bazie! Upewnij się że masz dostęp do namiotów",player,255,0,0)
		triggerClientEvent(player, "stworz_notyfikacje", player, "error", "Sprawdz czy masz kupionego spawna /spawny.info!")
		return
	end
	for i,v in pairs(kupione) do
		if tekst == i and v[1] > 0 then
			if stworzPojazd(player,v) then
				kupione[i][1] = kupione[i][1] - 1
				setElementData(player,"Kupione-Respy",kupione)
			end
		elseif tekst == i and v[1] == 0 then
			triggerClientEvent(player, "stworz_notyfikacje", player, "error", "Nie masz tego spawna!")
		end
	end
end)]]


addEventHandler("onPlayerQuit",root,function()
	if not getElementData(source,"logedin") then return end
	setAccountData(getPlayerAccount(source),"Kupione-Respy",toJSON((getElementData(source,"Kupione-Respy") or {})))
end)


addEventHandler("onPlayerLogin",root,function(_, curr)
	setElementData(source,"Kupione-Respy",fromJSON((getAccountData(getPlayerAccount(source),"Kupione-Respy") or toJSON({}))))
	setTimer(function(source)
		local result = exports["db-mysql"]:dbGet("SELECT `id` FROM `bought_vehicles` WHERE `owner` = ?", getElementData(source, "logedin"))
		local pojazdy = {}
		for i, v in pairs(result) do
			pojazdy[v["id"]] = true
		end
		setElementData(source, "Car-Owned", pojazdy)
	end, 3000, 1, source)
end)

local cooldown = {}

setTimer(function()
	for k, _ in pairs(cooldown) do
		for i, v in pairs(cooldown[k]) do
			if v < getTickCount() then
				cooldown[k][i] = nil
			end
		end
	end
end, 60000, 0)

function isAnyoneInVehicle(veh)
	local r = 0
	for i, v in pairs(getVehicleOccupants(veh)) do
		r = r + 1
	end
	return r
end

function formatCzas(value)
	if value then
		local hours = math.floor(value/60)
		local minutes = math.modf(((value/60) - math.floor(value/60))*100/(100/60))
		if minutes < 10 then minutes = "0"..minutes end
		value = hours..":"..minutes
		return value
	end
	return false
end

addEvent("PrzywrocPojazd", true)
addEventHandler("PrzywrocPojazd", root, function(car)
	local lang = getElementData(client, "Jezyk_Gry") or "ENG"

if wylaczone == true then exports.DayZ_notification:DrawNotification(getTextLang(lang, "base_spawns_limits"), 255, 255, 255, client) return end
	if getElementData(car, "inBase") and tonumber(getElementData(car, "inBase")) == tonumber(getElementData(car, "base_id")) then exports.DayZ_notification:DrawNotification(getTextLang(lang, "vehicle_is_in_base"), 255, 255, 255, client) return
	elseif (not getElementData(car, "inBase") and (isVehicleBlown(car) or isElementInWater(car))) or (getElementData(car, "inBase") and tonumber(getElementData(car, "inBase")) ~= tonumber(getElementData(car, "base_id"))) then 
	elseif not getElementData(car, "inBase") then exports.DayZ_notification:DrawNotification(getTextLang(lang, "vehicle_is_not_in_base"), 255, 255, 255, client) return end

	if getElementData(car, "car_type") == 2 then
		if getElementData(car, "Buyed-Days") < 1 then
			exports.DayZ_notification:DrawNotification(getTextLang(lang, "vehicle_has_not_respawns"), 255, 255, 255, client)
			return
		end
	end

	if isAnyoneInVehicle(car) > 0 then
		for s, p in pairs(getVehicleOccupants(car)) do
			removePedFromVehicle(p)
		end
	end

	local car_id = getElementData(car, "Auto-ID")
	if cooldown[getElementData(client, "logedin")] and cooldown[getElementData(client, "logedin")][car_id] then
		-- nie mozna postawic cara tak o
		local t = formatCzas( ( cooldown[getElementData(client, "logedin")][car_id] - getTickCount() ) / 60000 )
		triggerClientEvent(client, "stworz_notyfikacje", client, "error", "Ponowne użycie za: "..t.." h!")
		return
	end
	local players_on_glue = exports["DayZ_glue"]:getPlayersOnGlue(car)
	if #players_on_glue > 0 then
		triggerClientEvent(client, "stworz_notyfikacje", client, "error", "Ktoś jest przyklejony do tego pojazdu!")
		return
	end
	if not getElementData(client, "Moze-Otwierac") then
		triggerClientEvent(client, "stworz_notyfikacje", client, "error", "Musisz być w bazie!")
		return
	end

	if RespawnVehicle(car) then
	
		exports.DayZ_notification:DrawNotification(getTextLang(lang, "restore_vehicle"), 255, 255, 255, client)
		if not cooldown[getElementData(client, "logedin")] then
			cooldown[getElementData(client, "logedin")] = {}
		end
		cooldown[getElementData(client, "logedin")][car_id] = getTickCount() + 3600000 * 12
	end
end)

function RespawnVehicle(car)
	local car_id = getElementData(car, "Auto-ID")

	local result = exports["db-mysql"]:dbGet("SELECT * FROM `bought_vehicles` WHERE id = ?", car_id)
	for i,v in pairs(result) do
		local dane = fromJSON(v["pos_info"])

		if getElementData(car, "car_type") == 2 then
			if getElementData(car, "Buyed-Days") > 0 then
				removeOneUse(car, car_id, dane)
			else return
			end
		end

		local x,y,z = dane.spawn[2],dane.spawn[3],dane.spawn[4]
		local rx,ry,rz = (dane.spawn[5] or 0), (dane.spawn[6] or 0), (dane.spawn[7] or 0)

		setElementPosition(car, x, y, z)
		setElementRotation(car, rx, ry, rz)
		fixVehicle(car);
		setElementFrozen(car, true);
		return true;
	end
end

function loadCars()
	local result = exports["db-mysql"]:dbGet("SELECT * FROM `bought_vehicles`")
	for i,v in pairs(result) do
		local dane = fromJSON(v["pos_info"])
		local id_pojazdu = dane.spawn[1]
		local x,y,z = dane.kordy[1],dane.kordy[2],dane.kordy[3]
		local vehicle = createVehicle(id_pojazdu,x,y,z)
		local vehCol = createColSphere(x,y,z, 2.5);
		local tires,engine,parts,sloty = exports.DayZ_vehicle:getVehicleAddonInfos(id_pojazdu);
		local maxfuel = exports.DayZ_vehicle:getVehicleMaxFuel(id_pojazdu)
		local base_id = v["base"];
		setElementRotation(vehicle, dane.rotacja[1], dane.rotacja[2], dane.rotacja[3])
		setElementData(vehicle, "maxfuel",maxfuel);
		attachElements(vehCol, vehicle);
		setElementData(vehCol, "parent", vehicle);
		setElementData(vehicle, "parent", vehCol);
		setElementData(vehCol, "vehicle", true);
		setElementData(vehicle, "dayzvehicle", 0);
		setElementData(vehicle, "Buyed-Days", dane.dni);
		setElementData(vehicle, "Auto-ID",tonumber(v["id"]));
		setElementData(vehicle, "base_id", base_id);
		setElementData(vehCol, "spawn", {id_pojazdu, dane.spawn[2],dane.spawn[3],dane.spawn[4]});
		setElementData(vehCol, "Tire_inVehicle",tires);
		setElementData(vehCol, "Engine_inVehicle",engine);
		setElementData(vehCol, "Parts_inVehicle", parts);
		setElementData(vehCol, "MAX_Slots", sloty);
		setElementData(vehCol, "fuel", maxfuel);
		setElementData(vehCol, "car_type", v["type"]);
		setElementData(vehicle, "car_type", v["type"]);
	end
end
loadCars()

local bylo = false

function getCarById(id)
	for i, v in pairs(getElementsByType("vehicle", resourceRoot)) do
		local c_id = getElementData(v, "Auto-ID")
		if id == tonumber(c_id) then
			return v
		end
	end
	return false
end

function removeOneDay()
	--[[for i,v in pairs(getElementsByType("vehicle", resourceRoot)) do
		local result = dbQuery(db,"SELECT info FROM `Respy` WHERE id = ?",getElementData(v,"Auto-ID"))
		local p = dbPoll(result, -1)
		dbFree(result)
		if p[1] then
			local t = fromJSON(p[1].info)
			setElementData(v, "Buyed-Days", t.dni)
		end
	end]]
	local result = exports["db-mysql"]:dbGet("SELECT * FROM `bought_vehicles` WHERE type = ? ", 1)
	local cars = {}
	local status = false
	for i,v in pairs(result) do
		local info = fromJSON(v["pos_info"])
		info.dni = info.dni - 1
		if info.dni < 0 then
			cars[v["id"]] = true;
			status = true;
			exports["db-mysql"]:dbSet("DELETE FROM `bought_vehicles` WHERE id = ?",v["id"])
		else
			exports["db-mysql"]:dbSet("UPDATE `bought_vehicles` SET pos_info = ? WHERE id = ?",toJSON(info),v["id"])
		end
		local pojazd = getCarById(tonumber(v["id"]))
		if pojazd then
			setElementData(pojazd, "Buyed-Days", info.dni)
		end
	end

	if status then
		for k, v in pairs(getElementsByType("vehicle")) do
			if cars[getElementData(v, "Auto-ID")] then
				cars[getElementData(v, "Auto-ID")] = nil;
				triggerClientEvent("onRemovalBlipRequest", root, getElementData(v,"Auto-ID"))
				destroyElement(getElementData(v, "parent"));
				destroyElement(v);
			end
		end
	end
end

function removeOneUse(vehicle, id, info)
	local amount = getElementData(vehicle, "Buyed-Days") or 0;

	info.dni = amount - 1

	if info.dni < 0 then return end
	
	setElementData(vehicle, "Buyed-Days", info.dni)
	exports["db-mysql"]:dbSet("UPDATE `bought_vehicles` SET pos_info = ? WHERE id = ?",toJSON(info),id)
end

setTimer(function()
	local time = getRealTime().hour
	if time == 0 then
		if not bylo then
			removeOneDay()
			bylo = true
		end
	else
		bylo = false
	end
end,60000,0)


local respawn_timers = {}

addEventHandler("onVehicleExplode",resourceRoot,function()
	if isTimer(respawn_timers[source]) then
		return
	end
	respawn_timers[source] = setTimer(function(source)
		if not isElement(source) then return end
		if isVehicleBlown(source) or isElementInWater(source) then
			if getElementData(source, "car_type") == 2 and getElementData(source, "Buyed-Days") < 1 then 
				exports["db-mysql"]:dbSet("DELETE FROM `bought_vehicles` WHERE id = ?",getElementData(source,"Auto-ID"))

				
				if getElementData(source,"parent") then
					if isElement(getElementData(source,"parent")) then
						destroyElement(getElementData(source,"parent"))
					end
				end
				triggerClientEvent("onRemovalBlipRequest", root, getElementData(source,"Auto-ID"))
				destroyElement(source)
				return
			end

			local result = exports["db-mysql"]:dbGet("SELECT `pos_info` FROM `bought_vehicles` WHERE `id` = ?", getElementData(source,"Auto-ID"))
			if result[1] then
				RespawnVehicle(source);
			else
				if getElementData(source,"parent") then
					if isElement(getElementData(source,"parent")) then
						destroyElement(getElementData(source,"parent"))
					end
				end
				triggerClientEvent("onRemovalBlipRequest", root, getElementData(source,"Auto-ID"))
				destroyElement(source)
			end
			--
		end
	end, 60000 * 120, 1, source)
end)

function getIndexInTable(t)
	local n = 0
	for i,v in pairs(t) do
		n = n + 1
	end
	return n
end

--[[setTimer(function()
	for i,v in pairs(getElementsByType("vehicle",resourceRoot)) do
		if isElementInWater(v) or isVehicleBlown(v) then
			if isTimer(respawn_timers[v]) then
				return
			end
			local result = exports["db-mysql"]:dbGet("SELECT `pos_info` FROM `bought_vehicles` WHERE `id` = ?", getElementData(source,"Auto-ID"))
			if result[1] then
				deletePojazd(v,result[1],getElementData(v,"Auto-ID"), getElementData(source,"base_id"))
			else
				if getElementData(v,"parent") then
					if isElement(getElementData(v,"parent")) then
						destroyElement(getElementData(v,"parent"))
						destroyElement(v)
						destroyElement(getElementData(v,"blip"))
					end
				end
			end
			--
		end
	end
end,60000*120,0)]]