local id_mission
local mission_xyz
local timer

local mission_level = {}
local box = {}
local area

local find_box_info = {
    --{id, x, y, widht, height},
    {1, -337.50, 951.65, 150, 150},
    {2, 1578.40, 884.43, 150, 150},
    {3, 2165.15, 644.03, 110, 150},
    {4, 2454.28, -2.49, 110, 150},
    {5, 1813.37, -2043.07, 145, 67},
}


local find_box_xyz = {
    --[[[id] = {
        {x, y, z},
        {x, y, z},
        {x, y, z},
        {x, y, z},
        {x, y, z},
    },]]
    [1] = {
        {-253.31, 1069.09, 20.27},
        {-216.94, 1037.77, 19.74},
        {-241.44, 986.57, 19.74},
        {-309.93, 1041.12, 19.73},
        {-330.83, 1048.36, 19.74},
    },
    [2] = {
        {1603.11, 955.13, 10.74},
        {1689.89, 1013.86, 11.20},
        {1645.00, 1013.80, 11.20},
        {1662.62, 972.84, 11.19},
        {1621.78, 1003.00, 10.82},
    },
    [3] = {
        {2205.71, 691.54, 11.46},
        {2207.10, 748.76, 11.47},
        {2180.39, 776.76, 11.46},
        {2259.49, 748.43, 11.46},
        {2262.56, 668.33, 11.45},
    },
    [4] = {
        {2498.31, 9.67, 27.76},
        {2559.74, 17.04, 27.08},
        {2555.59, 73.68, 26.48},
        {2494.13, 82.55, 26.53},
        {2479.22, 134.34, 27.68},
    },
    [5] = {
        {1940.63, -2030.10, 13.55},
        {1919.72, -1990.30, 13.55},
        {1857.21, -2036.99, 13.55},
        {1828.38, -1978.55, 13.55},
        {1869.05, -1979.65, 13.55},
    },
}

addEvent("onPlayerTakedMissionBag", true)
addEvent("onPlayerEndedMissionByDeath", true)
addEvent( "onPlayerChangeProgress", true )


function createMission(act_mission, act_xyz, time)
    for k, v in pairs(find_box_info) do
        if k == act_mission then
            id_mission = act_mission
            mission_xyz = act_xyz

            area = createRadarArea(v[2], v[3], v[4], v[5], 255, 255, 0)
            setRadarAreaFlashing(area, true)

            local x, y, z = find_box_xyz[k][act_xyz][1], find_box_xyz[k][act_xyz][2], find_box_xyz[k][act_xyz][3]

            box[1] = createObject(2040, x, y, z-0.85)
            box[2] = createColSphere(x, y, z-0.85, 1)
            setElementData(box[2], "findbox", true)

            --createBlip( x, y, z, 58, 0, 0, 0, 255 )

            attachElements(box[2], box[1])

            timer = setTimer(function() end, time, 1)
            triggerServerEvent("onPlayerStartTimer", localPlayer, localPlayer, time)
        end
    end
end

addEventHandler("onPlayerTakedMissionBag", root, function()
    destroyElements()
    local lang = getElementData(localPlayer, "Jezyk_Gry")
    exports.DayZ_notification:DrawNotification(getTextLang(lang, "player_take_mission_bag"), 255, 255, 255)
end)

addEventHandler("onPlayerEndedMissionByDeath", root, function()
    destroyElements()
    local lang = getElementData(localPlayer, "Jezyk_Gry")
    exports.DayZ_notification:DrawNotification(getTextLang(lang, "mission_canceled"), 255, 255, 255)
end)

function destroyElements()
    removeEventHandler ( "onClientRender", root, createText)
    if box[1] then destroyElement(box[1]) end
    if box[2] then destroyElement(box[2]) end
    if area then destroyElement(area) end
    if isTimer(timer) then killTimer(timer) end
end

addEventHandler( "onPlayerChangeProgress", localPlayer, function(json, progress)
    local lang = (getElementData(localPlayer, "Jezyk_Gry") or "ENG")
    
    if progress == 0 then
        local t_table = fromJSON(json)
        createMission(t_table[1], t_table[2], t_table[3])
        exports.DayZ_notification:DrawNotification(getTextLang(lang, "mission_advanced_find"), 255, 255, 255)
        addEventHandler ( "onClientRender", root, createText)
    elseif progress == 1 then
        exports.DayZ_notification:DrawNotification(getTextLang(lang, "player_taked_mission_bag"), 255, 255, 255)
    end
end)

local x, y = guiGetScreenSize ( )
local font = exports.DayZ_font:GetFont("Roboto-Light", 14 * (x/1920))

function createText ()
    if not isTimer(timer) then return end
    local lang = getElementData(localPlayer, "Jezyk_Gry")
    local text = "#ffffff"..getTextLang(lang, "time_to_find")..": #91e396"..getTimeFormat(timer, "m+s format")
    dxDrawText(text, x * 0.8456, y * 0.7311, x * 0.9938, y * 0.7622, tocolor(0, 255, 0, 255), 1.0, font, "center", "center", false, false, false, true, false)
    dxDrawRectangle(x * 0.8456, y * (0.9556-0.2250), x * 0.1481, y * 0.0333, tocolor(0, 0, 0, 50), false)
end
