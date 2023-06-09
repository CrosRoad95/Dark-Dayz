
modelX, modelY, modelZ = 219.9765, 1822.8145, 6.533 -- minimap location

showLegend = createColSphere ( modelX, modelY, modelZ, 13 ) --colshape for activating nametags

function makeMapMarker (player)
    local r, g, b = getPlayerNametagColor ( player )
    local themarker = createMarker ( modelX, modelY, modelZ, "cylinder", .05, r, g, b, 255 )
    setElementData ( player, "Radar_marker0", themarker, false )
end

function ResourceStart(startedresource)
    if startedresource == getThisResource() then
        Radar_items = getElementsByType( "player" ) 
        for k,v in ipairs(Radar_items) do
            makeMapMarker (v)
        end
        setTimer(Radar_check, 10000, 0)
    end
end
addEventHandler( "onClientResourceStart", getRootElement(), ResourceStart )

function PlayerJoin ( )
    makeMapMarker (source)
end
addEventHandler( "onClientPlayerJoin", getRootElement(), PlayerJoin)

function PlayerQuit ( )
    destroyElement( getElementData ( source, "Radar_marker0" ) )
end
addEventHandler( "onClientPlayerQuit", getRootElement(), PlayerQuit)

function Radar_check()
    Radar_items = getElementsByType( "player" )
    for k,v in ipairs(Radar_items) do
        if isElement(v) then
            x,y,z = getElementPosition ( v )
            x = x / 1642.935378
            y = y / 1642.935378
            z = z / 1642.935378
            local themarker = getElementData ( v, "Radar_marker0" )
            setElementPosition ( themarker, modelX-y, modelY+x, modelZ+z ) --Whack math is because west is north on 3d model
        end
    end
end

function ColShapeHit ( theElement, matchingDimension )
    if theElement == getLocalPlayer() then
        if not mapNamesHandler then
            mapNamesHandler = addEventHandler ( "onClientRender", root, ClientRender )
        end
    end
end
addEventHandler("onClientColShapeHit",showLegend,ColShapeHit)

function ColShapeLeave ( theElement, matchingDimension )
    if theElement == getLocalPlayer() then
        if mapNamesHandler then
            removeEventHandler ( "onClientRender", root, ClientRender )
            mapNamesHandler = nil
        end
    end
end
addEventHandler("onClientColShapeLeave", showLegend, ColShapeLeave )

function ClientRender ()
    if trackmode == 1 then
        local Radar_items = getElementsByType( "player" )
        for k,v in pairs(Radar_items) do
            local r, g, b, a = getMarkerColor ( getElementData ( v, "Radar_marker0" ) )
            local x, y, z = getElementPosition ( getElementData ( v, "Radar_marker0" ) )
            local zOffset = (k/20)+.3
            
            local screenX, screenY = getScreenFromWorldPosition ( x, y, z + zOffset )
            local screenXX, screenYY = getScreenFromWorldPosition ( x, y, z ) --For the marker 
            
            if screenX ~= false and screenXX ~= false then
                local name = getPlayerName ( v )
                dxDrawText ( name, screenX, screenY, screenX, screenY, tocolor(r, g, b),1,"arial","center","center",false,false,false,true,false )          
                dxDrawLine ( screenX, screenY+13, screenXX, screenYY, tocolor(r,g,b), 1 )
            end
        end
    elseif trackmode == 2 then 
        local randomalpha = math.random( 70, 200 )
        setElementAlpha(holoped, randomalpha)
        local r, g, b, a = getMarkerColor ( getElementData ( trackedplayer, "Radar_marker0" ) )
        local x, y, z = getElementPosition ( getElementData ( trackedplayer, "Radar_marker0" ) )
        local zOffset = .3
        local screenX, screenY = getScreenFromWorldPosition ( modelX, modelY, modelZ+.4 )
        local screenXX, screenYY = getScreenFromWorldPosition ( x, y, z ) --For the marker      
        if screenX ~= false and screenXX ~= false then
            local screenXXX, screenYYY = getScreenFromWorldPosition ( modelX, modelY, modelZ+1.5 )
            if screenXXX ~= false then
                local name = getPlayerName (trackedplayer)
                dxDrawText ( name, screenXXX+40, screenYYY-15, screenX, screenY, tocolor(r, g, b),1,"default-bold","left","top",false,false,false,true,false )          
                local hp = getElementHealth ( trackedplayer)
                
level = getElementData ( trackedplayer, "murders")
zk = getElementData ( trackedplayer, "blood")
clan = getElementData ( trackedplayer, "headshots")
dn = getElementData ( trackedplayer, "zombieskilled")
pais = getElementData ( trackedplayer, "humanity")
time = getElementData ( trackedplayer, "banditskilled")
alive = getElementData(getLocalPlayer(),"alivetime")
fps = getElementData(getLocalPlayer(), "fps2")
ping = getPlayerPing ( getLocalPlayer(), "Ping")
nivel = getElementData(getLocalPlayer(), "level")
experience = getElementData(getLocalPlayer(), "exp")

                roundedhp = math.round(hp)
        
            end
            dxDrawLine ( screenX, screenY, screenXX, screenYY, tocolor(r,g,b), 1 )
        end
    end
end


trackedvehicle = nil




trackerMarker = createMarker (modelX-7.5596, modelY+.022, modelZ-4.019, "cylinder", 1.5, 255, 255, 255, 40 )
tracker_Window = {}
tracker_Button = {}
tracker_Grid = {}
tracker_Window[1] = guiCreateWindow(123,142,223,228,"Jugadores Legend Z",false)
guiWindowSetSizable(tracker_Window[1],false)
tracker_Player = guiCreateButton(0.0942,0.8114,0.3901,0.136,"Escanear Jugador",true,tracker_Window[1])
tracker_All = guiCreateButton(0.5022,0.8158,0.3901,0.1316,"Escanera Todos",true,tracker_Window[1])
tracker_Grid = guiCreateGridList(0.0852,0.136,0.8072,0.6491,true,tracker_Window[1])
guiGridListSetSelectionMode(tracker_Grid,2)
column = guiGridListAddColumn( tracker_Grid, "Jugadores", 0.85 )
guiSetVisible ( tracker_Window[1], false )
trackmode = 1
trackedplayer = nil
trackedarmor = nil
trackedlocation = nil
trackedcity = nil
trackedweapon = nil
trackedvehicle = nil

function showPlayerButton()
    guiSetVisible ( tracker_Player, true )
end
addEventHandler ( "onClientGUIClick", tracker_Grid, showPlayerButton)

holoped = createPed ( 0, modelX, modelY, modelZ+1.4 )
setElementAlpha(holoped, 0)
setElementFrozen(holoped, true)
setElementCollisionsEnabled(holoped, false)
setPedVoice(holoped, "PED_TYPE_DISABLED")

function showTrackerGui ( hitPlayer, matchingDimension )
    if (hitPlayer == getLocalPlayer()) and (isPedOnGround ( getLocalPlayer())) then
        guiGridListClear(tracker_Grid)
        guiSetVisible ( tracker_Window[1], true )
        guiBringToFront ( tracker_Window[1] )
        guiSetVisible ( tracker_Player, false )
        showCursor ( true )
        for id, playeritem in ipairs(getElementsByType("player")) do 
            local row = guiGridListAddRow ( tracker_Grid )
            guiGridListSetItemText ( tracker_Grid, row, column, getPlayerName(playeritem), false, false )
        end
    end
end
--addEventHandler ( "onClientMarkerHit", trackerMarker, showTrackerGui )

function trackerMarkerLeave ( hitPlayer, matchingDimension )
    if (hitPlayer == getLocalPlayer()) then
        guiSetVisible ( tracker_Window[1], false )
        showCursor ( false )
    end
end
addEventHandler ( "onClientMarkerLeave", trackerMarker, trackerMarkerLeave )

function trackplayer()
    local itemrow,itemcolumn = guiGridListGetSelectedItem(tracker_Grid )
    if itemrow ~= -1 then
        local playerName = guiGridListGetItemText (tracker_Grid, guiGridListGetSelectedItem(tracker_Grid ), 1 )
        trackedplayer = getPlayerFromName(playerName)
        if trackedplayer ~= false then
            setElementModel(holoped,getElementModel(trackedplayer))
            trackmode = 2
            triggerServerEvent ("onTrackModeChange", getLocalPlayer(), trackmode, trackedplayer )
        end
    else
        trackmode = 1
        triggerServerEvent ("onTrackModeChange", getLocalPlayer(), trackmode )
    end
    guiSetVisible ( tracker_Window[1], false )
    showCursor ( false )
end
addEventHandler ( "onClientGUIClick", tracker_Player, trackplayer)

function trackall()
    guiSetVisible ( tracker_Window[1], false )
    showCursor ( false )
    trackmode = 1
    triggerServerEvent ("onTrackModeChange", getLocalPlayer(), trackmode )
    setElementAlpha(holoped, 0)
end
addEventHandler ( "onClientGUIClick", tracker_All, trackall)

addEvent( "onTrackerUpdated", true )
function syncTrackMode ( newtrackmode, newtrackedplayer )
    if newtrackmode == 1 then
        trackmode = 1
        setElementAlpha(holoped, 0)
        trackedarmor = nil
    elseif newtrackmode == 2 then
        trackmode = 2
        trackedplayer = newtrackedplayer
        setElementModel(holoped,getElementModel(trackedplayer))
        trackedarmor = nil
    end
end
addEventHandler( "onTrackerUpdated", getRootElement(), syncTrackMode )

function didTrackedplayerQuit()
    if source == trackedplayer then
        trackmode = 1
        setElementAlpha(holoped, 0)
        trackedarmor = nil
    end
end
addEventHandler( "onClientPlayerQuit", getRootElement(), didTrackedplayerQuit )

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

addEvent( "onTrackerInfoUpdate", true )
function syncTrackMode(vehicle, location, city, weapon, armor)
    if vehicle then trackedvehicle = vehicle end
    if location then trackedlocation = location end
    if city then trackedcity = city end
    if weapon then trackedweapon = weapon end
    if armor then trackedarmor = armor end
end
addEventHandler( "onTrackerInfoUpdate", getRootElement(), syncTrackMode )

