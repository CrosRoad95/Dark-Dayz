addCommandHandler("dobackup", function(p)
	if not getElementData(p, "Administrator-Open") then return end
	zrobZapis()
    outputChatBox("#d63838[!] #ffffffZrobiłeś zapis.", p, 255, 255, 255, true)
end)

local t_type = {["1"] = "D", ["2"] = "U"}

addCommandHandler("gr",function(player, cmd, target, name, type, dni)
	if not getElementData(player,"Administrator-Open") then return end
    if not target or not name or not type or not dni then exports.DayZ_AdminScript:TryAgainCommand(player, cmd, {"nick lub id", "nazwa pojazdu", "1 lub 2", "ilość dni"}) return end

    target = exports.DayZ_AdminScript:getDarkDayZPlayer(target) if not target then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Nie znaleziono gracza o tej nazwie lub id!",player, 255, 255, 255, true) return end

	if not (target or name or dni or tonumber(dni)) then return end
	local kupione = getElementData(target,"Kupione-Respy") or {}
	local car_name = name
	name = "Spawn "..name.." ["..dni..t_type[type].."]"
	outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Dałeś #9c9c9c"..name.."#ffffff graczowi #9c9c9c"..getPlayerName(target).."#ffffff!",player, 255, 255, 255, true)
	outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Otrzymałeś #9c9c9c"..name.."#ffffff od #9c9c9c"..getPlayerName(player).."#ffffff!",target, 255, 255, 255, true)
	kupione[name] = {(kupione[name] and kupione[name][1] + 1 or 1), car_name, tonumber(dni), tonumber(type)}
	setElementData(target,"Kupione-Respy",kupione)
end)

addCommandHandler("cvs",function(player, cmd, type, amount)
	if not getElementData(player,"Administrator-Open") then return end
    if (not type) or (not amount) then exports.DayZ_AdminScript:TryAgainCommand(player, cmd, {"1 lub 2", "ilość"}) return end
	
	local veh = getPedOccupiedVehicle(player) if not veh then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Nie siedzisz w żadnym pojeździe!",player, 255, 255, 255, true) return end
	local id = getElementData(veh, "Auto-ID") if not id then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Ten pojazd nie został kupiony!",player, 255, 255, 255, true) return end

	amount = tonumber(amount)
	type = tonumber(type)

	setElementData(veh, "Buyed-Days", amount)
	setElementData(veh, "car_type", type)

	local p = exports["db-mysql"]:dbGet("SELECT `pos_info` FROM `bought_vehicles` WHERE `id` = ?",id)
	if p and p[1] then
		local info = fromJSON(p[1]["pos_info"])
		info.dni = amount
		outputChatBox(toJSON(info))
		exports["db-mysql"]:dbSet("UPDATE bought_vehicles SET type=?, pos_info=? WHERE id=?",type, toJSON(info), id)
	end
end)

addCommandHandler("spawny.info",function(player)
	local kupione = getElementData(player,"Kupione-Respy") or {}
	if getIndexInTable(kupione) == 0 then triggerClientEvent(player, "stworz_notyfikacje", player, "error", "Nie posiadasz kupionych respów") return end
    outputChatBox("#d63838[!] #ffffff -------------------------------", p, 255, 255, 255, true)
	for i,v in pairs(kupione) do
		outputChatBox("- "..i.." x"..v[1],player,245, 245, 245, true)
	end
end)
