addEvent("onPlayerStartTimer", true)


function playerTakeMissionBag()
	setElementData(client, "Mission Bag", 1)
    triggerClientEvent(client, "onPlayerTakedMissionBag", root)
    addMissionProgress(client, "advanced_find")
end

function endAdvancedMission(player)
    if not player then return end
    local acc = getPlayerAccount(player) if not acc then return end
    local acc_name = getAccountName(acc)

    if not players_missions[acc_name] then return outputChatBox("ERROR: LoadingDataMission - Zgłoś to do administratora!", player) end

    for k,v in pairs(players_missions[acc_name]) do
        if v[7] ~= 0 then
            if v[1] == "advanced_find" then
                removeMissionFromMySql(acc_name, {v[1], v[2], v[3], v[4], v[5]})
                triggerClientEvent(player, "onRefreshPlayerMission", player, getPlayerMissions(acc_name))
                triggerClientEvent(player, "onPlayerEndedMissionByDeath", player)
            end
        end
    end
end

function playerStartTimer(player, time)
    local acc = getPlayerAccount(player)
    local acc_name = getAccountName(acc)

    player_timer[acc_name] = setTimer(function() endAdvancedMission(player) end,time, 1)
end

addEventHandler("onPlayerTakeMissionBag",root, playerTakeMissionBag)
addEventHandler("kilLDayZPlayer",root, endAdvancedMission, player)
addEventHandler("onPlayerStartTimer",root, playerStartTimer, player, time)