-- needs configurable blip colors, and team support
root = getRootElement ()
color = { 196, 196, 196 }
color2 = { 200, 0, 0 }
vehicles = {0, 200, 0}
resourceRoot = getResourceRootElement ( getThisResource () )
 
function onResourceStart ( resource )
    for id, vehicle in ipairs( getElementsByType ( "vehicle" ) ) do
        if ( vehicles[vehicle] ) then
            createBlipAttachedTo ( vehicle, 0, 2, vehicles[source][1], vehicles[source][2], vehicles[source][3] )
        else
            if getElementData(vehicle,"vehicle_temp") then
                createBlipAttachedTo ( vehicle, 0, 2, color2[1], color2[2], color2[3] )
		    else
                createBlipAttachedTo ( vehicle, 0, 2, color[1], color[2], color[3] )
		    end
        end
    end
end
 
function onVehicleSpawn ( spawnpoint )
    if ( vehicles[source] ) then
        createBlipAttachedTo ( source, 0, 2, vehicles[source][1], vehicles[source][2], vehicles[source][3] )
    else
	    if getElementData(source,"vehicle_temp") then
            createBlipAttachedTo ( source, 0, 2, color2[1], color2[2], color2[3] )
	    else
	        createBlipAttachedTo ( source, 0, 2, color[1], color[2], color[3] )
	    end
    end
end
 
function onVehicleDestroy ()
    destroyBlipsAttachedTo ( source )
end
 
function setBlipsColor ( source, commandName, r, g, b )
    if ( tonumber ( b ) ) then
        color = { tonumber ( r ), tonumber ( g ), tonumber ( b ) }
        for id, vehicle in ipairs( getElementsByType ( "vehicle" ) ) do
            destroyBlipsAttachedTo ( vehicle )
            if ( vehicles[vehicle] ) then
                createBlipAttachedTo ( vehicle, 0, 2, vehicles[source][1], vehicles[source][2], vehicles[source][3] )
            else
			    if getElementData(vehicle,"vehicle_temp") then
                    createBlipAttachedTo ( vehicle, 0, 2, color2[1], color2[2], color2[3] )
			    else
                    createBlipAttachedTo ( vehicle, 0, 2, color[1], color[2], color[3] )
			    end
            end
        end
    end
end
 
function setBlipColor ( source, commandName, r, g, b )
    if ( tonumber ( b ) ) then
        destroyBlipsAttachedTo ( source )
        vehicles[source] = { tonumber ( r ), tonumber ( g ), tonumber ( b ) }
        createBlipAttachedTo ( source, 0, 2, vehicles[source][1], vehicles[source][2], vehicles[source][3] )
    end
end
 
addCommandHandler ( "setblipscolor", setBlipsColor )
addCommandHandler ( "setblipcolor", setBlipColor )
addEventHandler ( "onResourceStart", resourceRoot, onResourceStart )
addEventHandler ( "onVehicleSpawn", root, onVehicleSpawn )
addEventHandler ( "onVehicleDestroy", root, onVehicleDestroy )
 
function destroyBlipsAttachedTo(vehicle)
    local attached = getAttachedElements ( vehicle )
    if ( attached ) then
        for k,element in ipairs(attached) do
            if getElementType ( element ) == "blip" then
                destroyElement ( element )
            end
        end
    end
end