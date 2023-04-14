local cuboid = createColPolygon(1835.13, -1317.81, 1835.43, -1317.94, 1812.52, -1317.80, 1813.13, -1313.24,  1781.31, -1311.85, 1771.23, -1306.58, 1771.13, -1297.95, 1778.84, -1294.98, 1800.02, -1294.65, 1811.70, -1283.56,1812.04, -1274.59, 1820.62, -1270.13,1835.03, -1269.59)

local radio


addEventHandler ( "onClientColShapeHit", cuboid, function(player)
    if player ~= localPlayer then return end
    if getElementData(localPlayer, "aroom_status") then return end

    local x, y, z = getElementPosition(localPlayer)

    if z > 64 and z < 70 then
        radio = playSound( "http://stream.nonstopplay.co.uk/nsp-192k-mp3" )
        setSoundVolume( radio, 0.5 )
        setElementData(localPlayer, "aroom_status", true)
        setElementData(localPlayer, "god", true)
        outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Znajdujesz się na terenie #9c9c9cAdminRoom#ffffff! Otrzymałeś goda.", 255, 255, 255, true)
    end
end)

addEventHandler ( "onClientColShapeLeave", cuboid, function(player)
    if player ~= localPlayer then return end
    if not getElementData(localPlayer, "aroom_status") then return end

    if radio then destroyElement(radio) end
    setElementData(localPlayer, "god", false)
    setElementData(localPlayer, "aroom_status", false)
    outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Opuściłeś #9c9c9cAdminRoom#ffffff! God został zdjęty.", 255, 255, 255, true)
end)