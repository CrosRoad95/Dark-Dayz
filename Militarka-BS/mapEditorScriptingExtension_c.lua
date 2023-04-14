-- FILE: 	mapEditorScriptingExtension_c.lua
-- PURPOSE:	Prevent the map editor feature set being limited by what MTA can load from a map file by adding a script file to maps
-- VERSION:	RemoveWorldObjects (v1) AutoLOD (v1) BreakableObjects (v1)

function requestLODsClient()
	triggerServerEvent("requestLODsClient", resourceRoot)
end
addEventHandler("onClientResourceStart", resourceRoot, requestLODsClient)

function setLODsClient(lodTbl)
	for i, model in ipairs(lodTbl) do
		engineSetModelLODDistance(model, 300)
	end
end
addEvent("setLODsClient", true)
addEventHandler("setLODsClient", resourceRoot, setLODsClient)

function applyBreakableState()
	for k, obj in pairs(getElementsByType("object", resourceRoot)) do
		local breakable = getElementData(obj, "breakable")
		if breakable then
			setObjectBreakable(obj, breakable == "true")
		end
	end
end
addEventHandler("onClientResourceStart", resourceRoot, applyBreakableState)
--[[local subTrackOnSoundDown = 0.1	-- The volume that goes down, when the player clicks "Volume -"
local subTrackOnSoundUp = 0.1	-- The volume that goes up, when the player clicks "Volume +"


function print ( message, r, g, b )
	outputChatBox ( message, r, g, b )
end

local rx, ry = guiGetScreenSize ( )
button = { }
window = guiCreateWindow( ( rx - 295 ), ( ry / 2 - 253 / 2 ), 293, 253, "JBL EXTREME", false)
guiWindowSetSizable(window, false)
guiSetVisible ( window, false )
CurrentSpeaker = guiCreateLabel(8, 33, 254, 17, "Czy masz glosnik: Nie", false, window)
volume = guiCreateLabel(10, 50, 252, 17, "Obecna glosnosc: 100%", false, window)
pos = guiCreateLabel(10, 66, 252, 15, "X: 0 | Y: 0 | Z: 0", false, window)
guiCreateLabel(11, 81, 251, 15, "URL:", false, window)
--url = guiCreateEdit(11, 96, 272, 23, "", false, window)  
url = guiCreateEdit(11, 96, 272, 23, "http://www.rmfon.pl/n/rmfmaxxx.pls", false, window)  
button["place"] = guiCreateButton(9, 129, 274, 20, "Stworz", false, window)
button["remove"] = guiCreateButton(9, 159, 274, 20, "Usun", false, window)
button["v-"] = guiCreateButton(9, 189, 128, 20, "Glosnosc -", false, window)
button["v+"] = guiCreateButton(155, 189, 128, 20, "Glosnosc +", false, window)
button["close"] = guiCreateButton(9, 219, 274, 20, "Wyjscie", false, window)  

local isSound = false
addEvent ( "onPlayerViewSpeakerManagment", true )
addEventHandler ( "onPlayerViewSpeakerManagment", root, function ( current )
	local toState = not guiGetVisible ( window ) 
	guiSetVisible ( window, toState )
	showCursor ( toState ) 
	if ( toState == true ) then
		guiSetInputMode ( "no_binds_when_editing" )
		local x, y, z = getElementPosition ( localPlayer )
		guiSetText ( pos, "X: "..math.floor ( x ).." | Y: "..math.floor ( y ).." | Z: "..math.floor ( z ) )
		if ( current ) then guiSetText ( CurrentSpeaker, "Czy masz glosnik: Tak" ) isSound = true
		else guiSetText ( CurrentSpeaker, "Czy masz glosnik: Nie" ) end
	end
end )

addEventHandler ( "onClientGUIClick", root, function ( )
	if ( source == button["close"] ) then
		guiSetVisible ( window, false ) 
		showCursor ( false )
	elseif ( source == button["place"] ) then
		if ( isURL ( ) ) then
			triggerServerEvent ( "onPlayerPlaceSpeakerBox", localPlayer, guiGetText ( url ), isPedInVehicle ( localPlayer ) )
			guiSetText ( CurrentSpeaker, "Czy masz glosnik: Tak" )
			isSound = true
			guiSetText ( volume, "Obecna glosnosc: 100%" )
		else
		end
	elseif ( source == button["remove"] ) then
		triggerServerEvent ( "onPlayerDestroySpeakerBox", localPlayer )
		guiSetText ( CurrentSpeaker, "Czy masz glosnik: Nie" )
		isSound = false
		guiSetText ( volume, "Obecna glosnosc: 100%" )
	elseif ( source == button["v-"] ) then
		if ( isSound ) then
			local toVol = math.round ( getSoundVolume ( speakerSound [ localPlayer ] ) - subTrackOnSoundDown, 2 )
			if ( toVol > -0.1 ) then
				triggerServerEvent ( "onPlayerChangeSpeakerBoxVolume", localPlayer, toVol )
				guiSetText ( volume, "Current Volume: "..math.floor ( toVol * 100 ).."%" )
			else
			end
		end
	elseif ( source == button["v+"] ) then
		if ( isSound ) then
			local toVol = math.round ( getSoundVolume ( speakerSound [ localPlayer ] ) + subTrackOnSoundUp, 2 )
			if ( toVol < 2.6 ) then
				triggerServerEvent ( "onPlayerChangeSpeakerBoxVolume", localPlayer, toVol )
				guiSetText ( volume, "Current Volume: "..math.floor ( toVol * 100 ).."%" )
			else
			end
		end
	end
end )

speakerSound = { }
addEvent ( "onPlayerStartSpeakerBoxSound", true )
addEventHandler ( "onPlayerStartSpeakerBoxSound", root, function ( who, url, isCar )
	if ( isElement ( speakerSound [ who ] ) ) then destroyElement ( speakerSound [ who ] ) end
	local x, y, z = getElementPosition ( who )
	speakerSound [ who ] = playSound3D ( url, x, y, z, true )
	setSoundVolume ( speakerSound [ who ], 2.6 )
	setSoundMinDistance ( speakerSound [ who ], 53 )
	setSoundMaxDistance ( speakerSound [ who ], 53 )
	if ( isCar ) then
		local car = getPedOccupiedVehicle ( who )
		attachElements ( speakerSound [ who ], car, 0, 5, 1 )
	end
end )

addEvent ( "onPlayerDestroySpeakerBox", true )
addEventHandler ( "onPlayerDestroySpeakerBox", root, function ( who ) 
	if ( isElement ( speakerSound [ who ] ) ) then 
		destroyElement ( speakerSound [ who ] ) 
	end
end )

addEvent ( "onPlayerChangeSpeakerBoxVolumeC", true )
addEventHandler ( "onPlayerChangeSpeakerBoxVolumeC", root, function ( who, vol ) 
	if ( isElement ( speakerSound [ who ] ) ) then
		setSoundVolume ( speakerSound [ who ], tonumber ( vol ) )
	end
end )

function isURL ( )
	if ( guiGetText ( url ) ~= "" ) then
		return true
	else
		return false
	end
end

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

]]


modelX, modelY, modelZ = -2800.0119628906,2830.1713867188,223.8 -- minimap location


showLegend = createColSphere ( modelX, modelY, modelZ, 13 ) --colshape for activating nametags

function makeMapMarker (player)
    local r, g, b = getPlayerNametagColor ( player )
    local themarker = createMarker ( modelX, modelY, modelZ, "cylinder", .05, r, g, b, 255 )
    setElementData ( player, "Radar_marker", themarker, false )
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
    destroyElement( getElementData ( source, "Radar_marker" ) )
end
addEventHandler( "onClientPlayerQuit", getRootElement(), PlayerQuit)

addCommandHandler("pozycja",function()
	local x,y,z = getElementPosition(localPlayer)
	outputChatBox(x..","..y..","..z)
end)

function Radar_check()
    Radar_items = getElementsByType( "player" )
    for k,v in ipairs(Radar_items) do
        if isElement(v) then
            x,y,z = getElementPosition ( v )
            x = x / 1642.935378
            y = y / 1642.935378
            z = z / 1642.935378
            local themarker = getElementData ( v, "Radar_marker" )
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
            local r, g, b, a = getMarkerColor ( getElementData ( v, "Radar_marker" ) )
            local x, y, z = getElementPosition ( getElementData ( v, "Radar_marker" ) )
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
        local r, g, b, a = getMarkerColor ( getElementData ( trackedplayer, "Radar_marker" ) )
        local x, y, z = getElementPosition ( getElementData ( trackedplayer, "Radar_marker" ) )
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




trackerMarker = createMarker (modelX-7.5596, modelY+.022, modelZ-10.019, "cylinder", 1.5, 255, 255, 255, 40 )
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



