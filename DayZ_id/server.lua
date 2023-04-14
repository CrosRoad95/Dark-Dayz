local PlayerTable = {}
local slots = getMaxPlayers()

addEventHandler("onResourceStart", resourceRoot, function()
	for i=1,slots do
		table.insert(PlayerTable,i,{i, nil})
	end
	local Players = getElementsByType("player")
	for c, g in ipairs(Players) do
		for k, v in ipairs(PlayerTable) do
			if v[2] == nil then
				v[2] = g
				setElementData(g, "id", v[1])
				break	
			end
		end
	end
    setTimer(function()
        triggerEvent("onIdsTableChange", root)
    end, 100, 1)
end)

addEventHandler("onPlayerJoin", root, function()
	for k, v in ipairs(PlayerTable) do
		if v[2] == nil then
			v[2] = source
            setElementData(source, "id", v[1])
            triggerEvent("onIdsTableChange", root)
			break	
		end
    end
end)

addEventHandler("onPlayerQuit", root, function()
	for k, v in pairs(PlayerTable) do
		if v[2] == source then
			v[2] = nil
            triggerEvent("onIdsTableChange", root)
			break
		end
	end
end)

function GetPlayerFromID(id)
    for k,v in pairs(PlayerTable) do
        if v[1] == id then return v[2] end
    end
    return false
end

function GetPlayersSortID()
    local data = {}
	local number = 0
	for k, v in pairs(PlayerTable) do
		if v[2] then
			number = number + 1
			data[number] = v[2]
		end
	end
    return data;
end

addEvent("onIdsTableChange", true)
addEventHandler("onIdsTableChange", root, function()
	triggerClientEvent("onServerSendIdsTableToClient", root, PlayerTable)
end)

addEvent("OnClientRequestPlayerTable", true)
addEventHandler("OnClientRequestPlayerTable", root, function()

	triggerClientEvent("onServerSendIdsTableToClient", client, PlayerTable)
end)