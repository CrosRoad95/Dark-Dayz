addEvent("devMode", true)
addEventHandler("devMode", localPlayer, function()
    if getDevelopmentMode() then
        setDevelopmentMode(false)
        outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF devMode - #7c2020OFF", 255, 255, 255, true)
    else
        setDevelopmentMode(true)
        outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF devMode - #56b769ON", 255, 255, 255, true)
    end
end)


local screenW, screenH = guiGetScreenSize()
local time = 0

local StatusTable = {
    [true] = "#45a845ON",
    [false] = "#ab341fOFF"
}

function DutyAdmin()
    if getElementData(localPlayer, "duty") then
        dxDrawText("Duty #45a845ON#ffffff\n\nGod "..StatusTable[getElementData(localPlayer, "god")].."#ffffff\nFly "..StatusTable[getElementData(localPlayer, "Ryjek")].."#ffffff\n\nStatystyki:\nNowy czas duty: "..(getElementData(localPlayer, "dutyTime")-time).."min\n#ffffffCałkowity czas na duty: "..getElementData(localPlayer, "dutyTime").."min", screenW * 0.8444, screenH * 0.4789, screenW * 0.9938, screenH * 0.7344, tocolor(255, 255, 255, 255), 1.00, "default", "right", "top", false, false, false, true, false)
    end
end


addEvent("onPlayerDutyChange", true)
addEventHandler("onPlayerDutyChange", root, function(player)
    if localPlayer ~= player then return end
    if getElementData(localPlayer, "duty") then
        if getElementData(localPlayer, "duty") == "Developer" or getElementData(localPlayer, "duty") == "Zasłużony" then return end
        time = getElementData(localPlayer, "dutyTime")
        addEventHandler("onClientRender", root, DutyAdmin)
    else
        if getElementData(localPlayer, "duty") == "Developer" or getElementData(localPlayer, "duty") == "Zasłużony" then return end
        removeEventHandler("onClientRender", root, DutyAdmin)
    end
end)

addEvent( "notificationsServer", true )
addEventHandler( "notificationsServer", localPlayer, function(value1, value2, value3)
	exports.ProveNotifications:notifications ( value1, value2, value3)
end)

--[[addEvent( "startRollMessageServer", true )
addEventHandler( "startRollMessageServer", localPlayer, function(message, r, g, b)
	exports.proveCore:startRollMessage(message, r, g, b)
end)]]

local AdminsTable = {"Console", "Admin", "Pomocnik", "Moderator2", "ModChat"}


function adminsOnline()
    local lang = getElementData(localPlayer, "Jezyk_Gry")
    local statusAdminsOnline = {}
    outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF ------ "..getTextLang(lang, "admins_on_duty").." ------", 255, 255, 255, true)
    for k, v in pairs(AdminsTable) do
        outputChatBox("#6b6b6b● "..exports.DayZ_ranks:getRankFullName(v, lang, 2), 255, 255, 255, true)
        local string = "  -   "
        statusAdminsOnline[v] = false
        local number = true
        for c, g in pairs(getElementsByType("player")) do
            if getElementData(g, "duty") == v then
                statusAdminsOnline[v] = true
                if number then
                    string = string.." "..getPlayerName(g)
                    number = false
                else
                    string = string..", "..getPlayerName(g)
                end
            end
        end
        if statusAdminsOnline[v] then
            outputChatBox(string, 255, 255, 255, true)
        else
            outputChatBox("   - Brak - ", 255, 255, 255, true)
        end
    end
    outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF ---------------------------------------------------------", 255, 255, 255, true)
end



addCommandHandler('admins', adminsOnline)

addEvent("onAdminStartSpectating", true)
addEventHandler("onAdminStartSpectating", root, function(player, player2)
    if localPlayer ~= player then return end

    local spectate = getElementData(localPlayer, "spectate")

 
    if spectate then
        setElementFrozen(localPlayer, false)
        setCameraTarget(localPlayer)
        setElementData(localPlayer, "spectate", false)
    elseif player2 then
        setElementFrozen(localPlayer, true)
        setCameraTarget(player2)
        setElementData(localPlayer, "spectate", true)
        outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Spectujesz: #9c9c9c"..getPlayerName(player2), 255, 255, 255, true)
        outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Aby wyjść ze spectowania użyj ponownie komendy: #9c9c9c /spec", 255, 255, 255, true)
    end

end)

function onQuitGame()
    local spectate = getElementData(localPlayer, "spectate")

    if not spectate then return end

    if source == spectate then
        outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Gracz którego spectowałeś opuścił grę!", 255, 255, 255, true)
        setElementFrozen(localPlayer, false)
        setCameraTarget(localPlayer)
        setElementData(localPlayer, "spectate", false)
    end
end
addEventHandler( "onClientPlayerQuit", getRootElement(), onQuitGame )

local xr, yr, zr
local ar_status = false;

local CordTable = {
    [1] = {1780.0322265625, -1303.6708984375, 65.805473327637},
    [2] = {1797.267578125, -1298.3896484375, 65.805473327637},
    [3] = {1814.7783203125, -1284.1015625, 65.8125},
    [4] = {1826.021484375, -1302.1630859375, 65.8125},
    [5] = {1815.0390625, -1310.8818359375, 65.8125},
}

addEvent("onPlayerUseAdminRoom", true)
addEventHandler("onPlayerUseAdminRoom", root, function(player)
    if localPlayer ~= player then return end

    if ar_status then
        if xr then
            setElementPosition(player, xr, yr, zr)
        else
            setElementPosition(localPlayer, 0, 0, 0)
        end
        ar_status = false;
    else
        xr, yr, zr = getElementPosition(localPlayer)

        local n = math.random(1,5)

        setElementPosition(localPlayer, CordTable[n][1], CordTable[n][2], CordTable[n][3])
        ar_status = true;
    end

end)

local NPCTable = {
    {85, 1791.27, -1302.44, 66.32, 357.98, "STRIP", "STR_C2"},
    {178, 1793.05, -1307.08, 66.32, 257.70, "STRIP", "strip_E"},
    {246, 1797.19, -1301.12, 66.23, 123.46, "STRIP", "strip_B"},
    {257, 1799.29, -1300.57, 66.22, 315.20, "STRIP", "STR_A2B"},
    {12, 1774.31, -1300.76, 65.81, 303.92, "FOOD", "FF_Sit_Eat3"},
    {12, 1775.26, -1304.37, 65.81, 245.98, "FOOD", "FF_Sit_Eat3"},
    {12, 1773.57, -1301.79, 65.81, 257.70, "STRIP", "strip_E"},
}

for k,v in pairs(NPCTable) do
    local ped = createPed(v[1], v[2], v[3], v[4], v[5], false)
    setElementFrozen(ped, true)
    setTimer(function()
        setPedAnimation(ped, v[6], v[7], -1, true, false)
    end, 0, 1)
end

function getPlayerRank(player, table)
    local rank = getElementData(player, "duty") if not rank then return false end
    for k, v in pairs(table) do
        if (v == rank) then return rank end
    end
end