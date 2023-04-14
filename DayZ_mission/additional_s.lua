function getPlayerMissionValue(login)
    local find_m = 0
    local kill_p = 0
    local kill_z = 0
    local adv_find_m = 0

    --[[local result = exports["db-mysql"]:dbGet("SELECT * FROM `players_missions` WHERE `acc_name` = ?", login);
        for i,row in ipairs (result) do
            if row["type"] == "find" then find_m = find_m+1
            elseif row["type"] == "kill_players" then kill_p = 1
            elseif row["type"] == "kill_zombies" then kill_z = 1
            end
        end]]
    
        for k,v in pairs(players_missions[login]) do
            if v[7] ~= 0 then
                if v[1] == "find" then find_m = find_m+1
                elseif v[1] == "kill_players" then kill_p = 1
                elseif v[1] == "kill_zombies" then kill_z = 1
                elseif v[1] == "advanced_find" then adv_find_m = 1
                end
            end
        end
    
    return find_m, kill_p, kill_z, adv_find_m;
end

function getPlayerMissions(login)
    --[[local player_missions = {}

    local result = exports["db-mysql"]:dbGet("SELECT * FROM `players_missions` WHERE `acc_name` = ?", login);
    for i,row in ipairs (result) do
        table.insert(player_missions, {row["type"], row["npc"], row["item_name"], row["amount"], row["prize"], row["progress"]})
    end]]

    if not players_missions[login] then return false end

    local temp_table = {}

    for k,v in pairs(players_missions[login]) do
        if v[7] ~= 0 then
            table.insert(temp_table, {v[1], v[2], v[3], v[4], v[5], v[6]})
        end
    end

    return temp_table;
end

-- 0 do usuniecia
-- 1 bez zmian
-- 2 ze zmianami
-- 3 nowe

function loadPlayerMissionsMySql(login)
    players_missions[login] = {}

    local result = exports["db-mysql"]:dbGet("SELECT * FROM `players_missions` WHERE `acc_name` = ?", login);
    for i,row in ipairs (result) do
        table.insert(players_missions[login], {row["type"], row["npc"], row["item_name"], row["amount"], row["prize"], row["progress"], 1})
        if row["type"] == "advanced_find" then
            local table = fromJSON(row["item_name"])
        end
    end
end

function savePlayerMissionsMySql(login)
    if not players_missions[login] then return end

    for k,v in pairs(players_missions[login]) do
        --outputChatBox("PROGRAM EXECUTED: SAVE DATA "..v[7])
        if v[1] == ("advanced_find") and (v[6] == 0) and (v[7] ~= 0) then
            local table = fromJSON(v[3])
            v[3] = toJSON({table[1], table[2], getTimerDetails(player_timer[login])})
            killTimer(player_timer[login])
            exports["db-mysql"]:dbSet("UPDATE `players_missions` SET item_name = ? WHERE acc_name = ? and type = ?", v[3], login, v[1])
        end
        if v[7] == 3 then
            exports["db-mysql"]:dbSet("INSERT INTO players_missions (acc_name, type, npc, item_name, amount, prize, progress) VALUES(?, ?, ?, ? ,? ,?, ?)", login, v[1], v[2], v[3], v[4], v[5], v[6])
        elseif v[7] == 2 then
            exports["db-mysql"]:dbSet("UPDATE `players_missions` SET progress = ? WHERE acc_name = ? and type = ?", v[6], login, v[1])
        elseif v[7] == 0 then
            exports["db-mysql"]:dbSet("DELETE FROM players_missions WHERE acc_name = ? and type = ? and npc = ? and item_name = ? and amount = ? and prize = ?", login, v[1], v[2], v[3], v[4], v[5])
        end
    end

    for i, v in ipairs(players_missions[login]) do 
        table.remove(players_missions[login], i ) 
    end
end

function GetPlayerMissionsComplited(acc_name)
    local amm = false;

    local result = exports["db-mysql"]:dbGet("SELECT * FROM players_missions_stats WHERE acc_name = ?", acc_name);
    for i,row in ipairs (result) do
        amm = row["missions_complited"];
    end

    return amm;
end

function clearTable(array)
    for k, v in ipairs(array) do 
        for index, value in ipairs(v) do
            value = nil;
        end
    end
end

function addMissionProgress(player, type)
    local acc = getPlayerAccount(player) if not acc then return end
    local acc_name = getAccountName(acc)

  
    --[[outputChatBox("testy2")
    if not GetPlayerMissionsStatus(acc_name, type) then return end
    outputChatBox("testy3")


    local progress = 0;

    local result = exports["db-mysql"]:dbGet("SELECT * FROM players_missions WHERE acc_name = ? and type = ?", acc_name, type);
    for i,row in ipairs (result) do progress = row["progress"] end

    exports["db-mysql"]:dbSet("UPDATE `players_missions` SET `progress`=? WHERE `acc_name` = ? and type = ?", (progress+1), acc_name, type);
    triggerClientEvent(player, "onRefreshPlayerMission", player, getPlayerMissions(acc_name))]]

    if not getPlayerMissions(acc_name) then players_missions[acc_name] = {} end

    for k, v in pairs(players_missions[acc_name]) do
        if (v[1] == type) and (v[7] ~= 0) and (v[4] >= (v[6]+1)) then
            local progress = v[6]

            v[6] = progress + 1;
            v[7] = 2
        elseif (v[1] == type) and (v[7] ~= 0) then
            local progress = v[6]

            v[6] = progress + 1;
            v[7] = 2
        end
    end

    triggerClientEvent(player, "onRefreshPlayerMission", player, getPlayerMissions(acc_name))
end

--[[function GetPlayerMissionsStatus(acc_name, type)
    local test = false

    local result = exports["db-mysql"]:dbGet("SELECT * FROM players_missions WHERE acc_name = ? and type = ?", acc_name, type);
    for i,row in ipairs (result) do
        outputChatBox("to ja")
        test = true;
    end

    for k, v in pairs(players_missions[acc_name]) do
        if v[1] then test = true break end
    end

    return test;
end]]

function addComplittedMissionToMySql(acc_name)
    local amount = GetPlayerMissionsComplited(acc_name);

    if amount then
        exports["db-mysql"]:dbSet("UPDATE `players_missions_stats` SET `missions_complited`=? WHERE `acc_name` = ?", (amount+1), acc_name);
    else
        exports["db-mysql"]:dbSet("INSERT INTO players_missions_stats (acc_name, missions_complited) VALUES(?, ?)", acc_name, 1);
    end
end

function addReward(player, value)
    triggerEvent("giveEXP", player, value/17)
    local act_amount = getElementData(player, "GP") or 0
    setElementData(player, "GP", act_amount+value)
end

--[[addCommandHandler("testy4321", function(player, cmd, value)
    for i=1, (value or 1) do
        addMissionProgress(player, "kill_players")
    end
end)]]

function removeMissionFromMySql(acc_name, mission)
    for k, v in pairs(players_missions[acc_name]) do
        if v[1] == mission[1] and v[2] == mission[2] and v[3] == mission[3] and v[4] == mission[4] and v[5] == mission[5] and (v[7] ~= 0) then
            v[7] = 0
            return true
        end
    end

    return false
end

function loadAdvancedFindMission(player)
    local acc = getPlayerAccount(player)
    local acc_name = getAccountName(acc)

    for g, c in pairs(players_missions[acc_name]) do
        if c[1] == "advanced_find" then
            triggerClientEvent(player, "onPlayerChangeProgress", player, c[3], c[6])
            return
        end
    end
end

-- Useful functions

function table.empty( a )
    if type( a ) ~= "table" then
        return false
    end
    
    return next(a) == nil
end

function table.empty( a )
    if type( a ) ~= "table" then
        return false
    end
    
    return next(a) == nil
end
