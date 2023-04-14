npcs_missions = {} -- array with information about missions in npcs
players_missions = {} -- array with players missions and their current status
statistics = {} -- array with players missions statistics
statistics_groups = {} -- array with groups missions statistics
player_timer = {} -- array with players timer for missions

local npcs_timer -- timer to restart npcs missions
local time_restart_npc_mission = 24*60*60*1000 -- time to restart npcs missions (currently 24h)

local npc_missions_info = { -- array with npcs to spawn
  --{id, name, mission_type}        Mission types: "find", "kill_players", "kill_zombies"
    {1, "John", "find"},
    {2, "Mark", "kill_players"},
    {3, "Daniel", "kill_zombies"},
    {4, "Matheo", "advanced_find"},
}

local items_to_find = { -- array with items to missions and their rewords
  --{item_name, min_reword_to_rand, max_reword_to_rand}, 
    {"Alice Pack", 100, 150}, 
    {"First Aid Kit", 100, 200},
    {"Medic Kit", 100, 200}, 
    {"Large Tent", 200, 300}, 
    {"Medium Tent", 100, 200}, 
    {"Tent", 50, 150}, 
    {"Military Backpack", 150, 250}, 
    {"Coyote Backpack", 150, 250}, 
    {"Czech Backpack", 150, 250}, 
    {"Mountain Backpack", 150, 250}, 
    {"Alice Pack", 100, 150}, 
    {"Water Bottle", 100, 200}, 
    {"Milk", 100, 150}, 
    {"Tire", 150, 250}, 
    {"Engine", 150, 250}, 
}

function clearTable(array)
    for i, v in ipairs(array) do 
        table.remove(array, i ) 
    end
end

local kill_player_prize = {50, 100}
local kill_zombie_prize = {10, 25}
local advanced_find_prize = {
    --[id] = {min, max}, 
    [1] = {50, 150}, 
    [2] = {150, 250},
    [3] = {250, 350},
    [4] = {355, 450},
    [5] = {450, 550},
}
local advanced_find_timer = {
    --[id] = time,
    [1] = 5*60000,
    [2] = 10*60000,
    [3] = 15*60000,
    [4] = 20*60000,
    [5] = 25*60000,
}

local int;

-- Events

addEvent( "onPlayerCheckMission", true )
addEvent( "onPlayerTakeMission", true )

addEventHandler( "onPlayerCheckMission", root, function(mission)
    checkPlayerMission(source, mission)
end) 

addEventHandler( "onPlayerTakeMission", root, function(mission)
    setPlayerMission(source, mission)
end) 

--[[addEvent( "onPlayerRefreshStatistics", true)
addEventHandler( "onPlayerRefreshStatistics", root, function()
    triggerClientEvent(source, "onServerSendStatistics", source, statistics)
end)]]

-- Start and join section

addEventHandler ( "onResourceStart", resourceRoot, function()
    setTimer(function()
        onRefreshNpcMissions()

        for k,v in pairs(getElementsByType("player")) do
            local acc = getPlayerAccount(v)
            local acc_name = getAccountName(acc)

            loadPlayerMissionsMySql(acc_name)
            loadAdvancedFindMission(v)

            triggerClientEvent(v, "onRefreshPlayerMission", v, getPlayerMissions(acc_name))
            triggerClientEvent(v, "onRefreshPlayerTimer", v, time_restart_npc_mission)
        end

        triggerClientEvent(root, "onRefreshPlayerGui", root)

        refreshStatistics()
        triggerClientEvent(root, "onServerSendStatistics", root, statistics, statistics_groups)
    end, 100, 1)
end)

addEventHandler("onPlayerDayZLogin", root, function(player)
    local acc = getPlayerAccount(player)
    local acc_name = getAccountName(acc)

    loadPlayerMissionsMySql(acc_name)
    loadAdvancedFindMission(player)

    triggerClientEvent(player, "onRefreshNpcMissions", player, npcs_missions)
    triggerClientEvent(player, "onRefreshPlayerMission", player, getPlayerMissions(acc_name))
    triggerClientEvent(root, "onServerSendStatistics", player, statistics, statistics_groups)
    triggerClientEvent(player, "onRefreshPlayerGui", player)
    triggerClientEvent(player, "onRefreshPlayerTimer", player, getTimerDetails(npcs_timer))
end)

-- Stop and quit section

addEventHandler( "onResourceStop", resourceRoot, function()
    --outputChatBox("PROGRAM EXECUTED: PROGRAM STOP")

        for k,v in pairs(getElementsByType("player")) do
            local acc = getPlayerAccount(v)
            local acc_name = getAccountName(acc)

            savePlayerMissionsMySql(acc_name)
        end
end)

addEventHandler("onPlayerQuit", root, function()
    local acc = getPlayerAccount(source)
    local acc_name = getAccountName(acc)

    savePlayerMissionsMySql(acc_name)
end)

function createMissionForNpc(npc, mission_id, cat)

    if cat == "find" then
        local number_ar = math.random(1,#items_to_find)
        local item_name = items_to_find[number_ar][1]
        local amount = math.random(1,4)
        local prize = amount*math.random(items_to_find[number_ar][2], items_to_find[number_ar][3])

        table.insert(npcs_missions, {npc, mission_id, "find", item_name, amount, prize})
    elseif cat == "kill_players" then
        local amount = math.random(2,10)
        local prize =amount*math.random(kill_player_prize[1], kill_player_prize[2])

        table.insert(npcs_missions, {npc, mission_id, "kill_players", amount, prize})
    elseif cat == "kill_zombies" then
        local amount = math.random(20,40)
        local prize =amount*math.random(kill_zombie_prize[1], kill_zombie_prize[2])

        --exports.db_mysql:dbSet("INSERT INTO `npcs_database` (npc, type, item_name, amount, prize) VALUES(?, ?, ?, ?, ?)",npc, type, item_name, amount, prize)
        table.insert(npcs_missions, {npc, mission_id, "kill_zombies", amount, prize})
    elseif cat == "advanced_find" then
        local id = math.random(1,5)
        local xyz = math.random(1,5)
        local prize = math.random(advanced_find_prize[id][1], advanced_find_prize[id][2])
        --outputChatBox("----------------")
        --outputChatBox("ID: "..id)
        --outputChatBox("XYZ: "..xyz)
        --outputChatBox("Prize: "..prize)

        --exports.db_mysql:dbSet("INSERT INTO `npcs_database` (npc, type, item_name, amount, prize) VALUES(?, ?, ?, ?, ?)",npc, type, item_name, amount, prize)
        table.insert(npcs_missions, {npc, mission_id, "advanced_find", amount, prize, id, xyz, advanced_find_timer[id]})
    end

end

function onRefreshNpcMissions()

    for i, v in ipairs(npcs_missions) do
        for i=1, #v do
            table.remove(v, 1)
        end
    end

    local iterator = 1;

    for k, v in pairs(npc_missions_info) do
        for i=1,8 do
            createMissionForNpc(v[1], iterator, v[3])
            iterator = iterator + 1;
        end
    end

    triggerClientEvent(root, "onRefreshNpcMissions", root, npcs_missions)
end

function setPlayerMission(player, mission)
    --outputChatBox("Taked mission: "..mission)

    local acc = getPlayerAccount(player) if not acc then return end
    local acc_name = getAccountName(acc)

    local type = npcs_missions[mission][3]

    local find_m, kill_p, kill_z, adv_find_m = getPlayerMissionValue(acc_name)

    if (type == "find") and (find_m >= 3) then return end
    if (type == "kill_players") and (kill_p >= 1) then return end
    if (type == "kill_zombies") and (kill_z >= 1) then return end
    if (type == "advanced_find") and (adv_find_m >= 1) then return end

    local lang = getElementData(player, "Jezyk_Gry")
    local npc = npcs_missions[mission][1]
    local item_name = "/"
    local amount = 0
    local prize = 0

    if type == "find" then
        item_name = (npcs_missions[mission][4])
        amount = npcs_missions[mission][5]
        prize = npcs_missions[mission][6]
    elseif type == "advanced_find" then
        local id = npcs_missions[mission][6]
        local xyz = npcs_missions[mission][7]
        local time = npcs_missions[mission][8]
        item_name = toJSON({id, xyz, time})
        prize = npcs_missions[mission][5]
        triggerClientEvent(player, "onPlayerChangeProgress", player, item_name, 0)
        setTimer(function()
            exports.DayZ_notification:DrawNotification(getTextLang(lang, "mission_advanced_find"), 255, 255, 255, player)
        end, 3500, 1)
    else
        amount = npcs_missions[mission][4]
        prize = npcs_missions[mission][5]
    end

    npcs_missions[mission] = nil;

    --exports["db-mysql"]:dbSet("INSERT INTO players_missions (acc_name, type, npc, item_name, amount, prize, progress) VALUES(?, ?, ?, ? ,? ,?, ?)",acc_name, type, npc, item_name, amount, prize, 0)
    if not getPlayerMissions(acc_name) then players_missions[acc_name] = {} outputChatBox("PROGRAM EXECUTED: RECREATED TABLE") end

    table.insert(players_missions[acc_name], {type, npc, item_name, amount, prize, 0, 3})
    triggerClientEvent(root, "onRefreshNpcMissions", root, npcs_missions)
    triggerClientEvent(player, "onRefreshPlayerMission", player, getPlayerMissions(acc_name))
    triggerClientEvent(root, "onRefreshPlayerGui", root)

    exports.DayZ_notification:DrawNotification(getTextLang(lang, "undertook_mission"), 255, 255, 255, player)

    --outputChatBox("PROGRAM EXECUTED: SAVE NEW MISSION FOR PLAYER "..acc_name..": "..type)
end

function checkPlayerMission(player, mission)
    local lang = getElementData(source, "Jezyk_Gry")

    if mission[1] == "find" then
        if getElementData(player, mission[3]) >= mission[4] then
            local acc = getPlayerAccount(player)
            local acc_name = getAccountName(acc)

            addComplittedMissionToMySql(acc_name)

            --exports["db-mysql"]:dbSet("DELETE FROM players_missions WHERE acc_name = ? and type = ? and npc = ? and item_name = ? and amount = ? and prize = ?", acc_name, mission[1], mission[2], mission[3], mission[4], mission[5])
        
            if not getPlayerMissions(acc_name) then players_missions[acc_name] = {} end

            local removeMission = removeMissionFromMySql(acc_name, mission)

            if removeMission then
                addReward(source, mission[5])
                exports.DayZ_notification:DrawNotification(getTextLang(lang, "mission_completed").." "..mission[5].." GP/EXP", 255, 255, 255, source)
                local items = getElementData(player, mission[3])
                setElementData(player, mission[3], (items-mission[4]))

                triggerClientEvent(source, "onRefreshPlayerMission", source, getPlayerMissions(acc_name))
                triggerClientEvent(source, "onRefreshPlayerGui", source)
            end
        else
            exports.DayZ_notification:DrawNotification(getTextLang(lang, "mission_not_completed"), 255, 255, 255, source)
        end
    elseif (mission[1] == "kill_players") or (mission[1] == "kill_zombies") then
        local acc = getPlayerAccount(player)
        local acc_name = getAccountName(acc)

        if mission[6] >= mission[4] then
            addComplittedMissionToMySql(acc_name)

            --exports["db-mysql"]:dbSet("DELETE FROM players_missions WHERE acc_name = ? and type = ? and npc = ? and item_name = ? and amount = ? and prize = ?", acc_name, mission[1], mission[2], mission[3], mission[4], mission[5])
            
            if not getPlayerMissions(acc_name) then players_missions[acc_name] = {} end

            local removeMission = removeMissionFromMySql(acc_name, mission)

            if removeMission then
                addReward(source, mission[5])
                exports.DayZ_notification:DrawNotification(getTextLang(lang, "mission_completed").." "..mission[5].." GP/EXP", 255, 255, 255, source)

                triggerClientEvent(source, "onRefreshPlayerMission", source, getPlayerMissions(acc_name))
                triggerClientEvent(source, "onRefreshPlayerGui", source)
            end
        else
            exports.DayZ_notification:DrawNotification(getTextLang(lang, "mission_not_completed"), 255, 255, 255, source)
        end
    elseif (mission[1] == "advanced_find") then
        if getElementData(player, "Mission Bag") <= 1 then
            local acc = getPlayerAccount(player)
            local acc_name = getAccountName(acc)

            addComplittedMissionToMySql(acc_name)

            --exports["db-mysql"]:dbSet("DELETE FROM players_missions WHERE acc_name = ? and type = ? and npc = ? and item_name = ? and amount = ? and prize = ?", acc_name, mission[1], mission[2], mission[3], mission[4], mission[5])
        
            if not getPlayerMissions(acc_name) then players_missions[acc_name] = {} end

            local removeMission = removeMissionFromMySql(acc_name, mission)

            if removeMission then
                addReward(source, mission[5])
                exports.DayZ_notification:DrawNotification(getTextLang(lang, "mission_completed").." "..mission[5].." GP/EXP", 255, 255, 255, source)
                setElementData(player,"Mission Bag", 0)
                triggerClientEvent(source, "onRefreshPlayerMission", source, getPlayerMissions(acc_name))
                triggerClientEvent(source, "onRefreshPlayerGui", source)
            end
        else
            exports.DayZ_notification:DrawNotification(getTextLang(lang, "mission_not_completed"), 255, 255, 255, source)
        end
    end
end

function refreshStatistics()

    local temp_table = {}
    local temp_table2 = {}

    local number = 1;
    
    local result = exports["db-mysql"]:dbGet("SELECT * FROM players_missions_stats");
    for i,row in ipairs (result) do
        table.insert(temp_table, {row["acc_name"], row["missions_complited"]})

        local acc = getAccount(row["acc_name"])

        if acc then 
            local group_json = getAccountData(acc,"Grupa")

            if group_json then
                local group = fromJSON(group_json) or {}

                local check = false
                for k, v in pairs(temp_table2) do if v[1] == group.nazwa then check = true; end end

                if not check then
                    table.insert(temp_table2, {group.nazwa, 0})
                end

                for k, v in pairs(temp_table2) do
                    if v[1] == group.nazwa then
                        v[2] = v[2] + row["missions_complited"];
                        --outputChatBox(v[2])
                        break
                    end
                end

            end
        end

        number = number + 1;
    end


    table.sort(temp_table, function(a, b) return a[2] > b[2] end)
    table.sort(temp_table2, function(a, b) return a[2] > b[2] end)

    statistics = temp_table
    statistics_groups = temp_table2
end

setTimer(function()
    refreshStatistics()
    triggerClientEvent(root, "onServerSendStatistics", root, statistics, statistics_groups)
end, 15*60*1000, 0)

npcs_timer = setTimer(function()
    onRefreshNpcMissions()
    triggerClientEvent(root, "onRefreshPlayerGui", root)
end, time_restart_npc_mission, 0)