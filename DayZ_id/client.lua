local PlayerTable = {}

addEvent("onServerSendIdsTableToClient", true)
addEventHandler("onServerSendIdsTableToClient", localPlayer, function(data)
    PlayerTable = data
    triggerEvent("ChangePlayers", root, GetPlayersSortID())
end)

function GetPlayerFromID(id)
    for k,v in pairs(PlayerTable) do
        if v[1] == id then return v[2] end
    end
    return false
end

function GetPlayersSortID()
    if not PlayerTable[1] then triggerServerEvent("OnClientRequestPlayerTable", localPlayer) end
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