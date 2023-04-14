npcs = {} -- array with npcc peds
npcs_missions = {} -- array with information about missions in npcs
players_missions = {} -- array with players missions and their current status
statistics = {} -- array with players missions statistics
statistics_groups = {} -- array with groups missions statistics
npcs_timer = nil -- timer to restart npcs missions

local colshape_size = 1 -- colshape size to decet interaction players with npcs

npc_general_info = { -- array with npcs to spawn
--  {id, name, skin_id, x, y, z, rotz}
    {1, "John", 142, 698.6220703125,-544.8935546875,16.181587219238,90},
    {2, "Mark", 158, -1430.8664550781,-1173.1826171875,104.92812347412,180},
    {3, "Daniel", 170, -2706.4189453125,376.1611328125,4.5621466636658,270},
    {4, "Matheo", 247, -231.109375,1152.5673828125,19.322757720947,360},
}

advanced_find_location = {
    --[id] = "location name",
    [1] = "Fort Carson",
    [2] = "Las Venturas",
    [3] = "Las Venturas",
    [4] = "Palomino Creek",
    [5] = "Los Santos",
}

addEvent( "onRefreshNpcMissions", true)
addEvent( "onRefreshPlayerMission", true)
addEvent( "onRefreshPlayerTimer", true)
addEvent( "onServerSendStatistics", true)
addEvent( "onRefreshPlayerGui", true)

addEventHandler( "onRefreshNpcMissions", localPlayer, function(array)
    npcs_missions = array
    --outputChatBox("PROGRAM EXECUTED: NPCS TABLE RESET")
end)

addEventHandler( "onRefreshPlayerMission", localPlayer, function(array)
    players_missions = array
end)

addEventHandler( "onRefreshPlayerTimer", localPlayer, function(time)
    npcs_timer = setTimer(function()
    end, time, 0)
end)

addEventHandler( "onServerSendStatistics", localPlayer, function(array, array2)
    statistics = array
    statistics_groups = array2
    if getNpcFromActConv() then refreshStats() end
end)

addEventHandler( "onRefreshPlayerGui", localPlayer, function(array)
    refreshMissionsList()
    --outputChatBox("PROGRAM EXECUTED: CLIENT TABLE RESET")
end)


addEventHandler ( "onClientResourceStart", resourceRoot, function()

    for k, v in pairs(npc_general_info) do
        local ped = createPed(v[3], v[4], v[5], v[6], v[7])
        local colshape = createColSphere(v[4], v[5], v[6], colshape_size)
        setElementFrozen(ped, true)
        table.insert(npcs, {k, ped, colshape}) 
        createBlip(v[4], v[5], v[6], 58, 0, 0, 0, 255 )
    end

end)

function onClientColShapeHit(theElement, matchingDimension)
    if ( theElement == localPlayer ) then
        local lang = getElementData(localPlayer, "Jezyk_Gry") or "ENG"
        local npc = getNpcFromCol(source) if not npc then return end
        local id = getNpcId(npc)
        local name = getNpcName(npc)

        npc_act_conv = npc
        createConversation(name, lang, getConv(lang, 1), getConv(lang, 2), getConv(lang, 3))
    end
end
addEventHandler("onClientColShapeHit", resourceRoot, onClientColShapeHit)

function onClientColShapeLeave(theElement, matchingDimension)
    if ( theElement == localPlayer ) then
        npc_act_conv = false
        deleteConversation()
    end
end
addEventHandler("onClientColShapeLeave", resourceRoot, onClientColShapeLeave)


addEventHandler ( "onClientPedDamage", resourceRoot, function() cancelEvent() end)

function checkMission()
    local lang = getElementData(localPlayer, "Jezyk_Gry")
    local find_m, kill_p, kill_z, adv_find_m = getPlayerMissionValue()

    outputChatBox("#d63838[!] #ffffff"..getTextLang(lang, "mission_limits").." #d63838[!]", 255, 255, 255, true)
    outputChatBox("   #dedede"..getTextLang(lang, "kill_players").."#ffffff: (#cccccc"..kill_p.."/1#ffffff)", 255, 255, 255, true)
    outputChatBox("   #dedede"..getTextLang(lang, "kill_zombies").."#ffffff: (#cccccc"..kill_z.."/1#ffffff)", 255, 255, 255, true)
    outputChatBox("   #dedede"..getTextLang(lang, "find").."#ffffff: (#cccccc"..find_m.."/3#ffffff)", 255, 255, 255, true)
    outputChatBox("   #dedede"..getTextLang(lang, "advanced_find").."#ffffff: (#cccccc"..adv_find_m.."/1#ffffff)", 255, 255, 255, true)

    if (find_m == 0) and (kill_p == 0) and (kill_z == 0) and (adv_find_m == 0) then return end

    outputChatBox("\n#d63838[!] #ffffff"..getTextLang(lang, "mission_list").." #d63838[!]", 255, 255, 255, true)

    for i,v in ipairs (players_missions) do
        if v[1] == "find" then outputChatBox("   #dedede"..getTextLang(lang, v[1]).."#ffffff,  "..getTextLang(lang, "item")..": #cccccc"..getItemsName(lang, v[3]).."#ffffff, "..getTextLang(lang, "amount")..": (#cccccc"..getElementData(localPlayer, v[3]).."/"..v[4].."#ffffff), "..getTextLang(lang, "prize")..": #cccccc"..v[5].." GP/EXP", 255, 255, 255, true)
        elseif v[1] == "advanced_find" then outputChatBox("   #dedede"..getTextLang(lang, v[1]).."#ffffff,  "..getTextLang(lang, "amount")..": (#cccccc"..(getElementData(localPlayer, "Mission Bag") or 0).."/1#ffffff), "..getTextLang(lang, "prize")..": #cccccc"..v[5].." GP/EXP", 255, 255, 255, true)
        else outputChatBox("   #dedede"..getTextLang(lang, v[1]).."#ffffff,  "..getTextLang(lang, "amount")..": (#cccccc"..v[6].."/"..v[4].."#ffffff), "..getTextLang(lang, "prize")..": #cccccc"..v[5].." GP/EXP", 255, 255, 255, true) end
    end
end

addCommandHandler("checkm", checkMission);
addCommandHandler("sprawdzm", checkMission);