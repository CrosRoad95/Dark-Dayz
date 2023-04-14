-- LastZ ADMIN - ZAPISYWANIE POZYCJI KOMENDĄ

local eof = nil
licznik = 0

function saveCoords( x, y, z, rot, comment )
    local fhnd = nil
    if fileOpen( "lastz_kordy.txt" ) then
        fhnd = fileOpen( "lastz_kordy.txt" )
        eof = fileGetSize( fhnd )
        fileSetPos( fhnd, eof )
    else
        fhnd = fileCreate( "lastz_kordy.txt" )
    end
    local str = "{" .. (('%.3f'):format(tostring( x ))) .. "," .. (('%.3f'):format(tostring( y ))) .. "," .. (('%.3f'):format(tostring( z ))) .. "},";
    str = str .. "\r"
    eof = fileWrite( fhnd, str )
    fileSetPos( fhnd, eof )
    fileClose( fhnd )
end

function savePos( player, command, ... )
    local _x, _y, _z = getElementPosition( player )
    local _rot = getPedRotation( player )
    local comment = table.concat( arg, " " )
    saveCoords( _x, _y, _z, comment )
	licznik = licznik + 1
	outputChatBox( "[LastZ-Position] Gracz "..getPlayerName(player).." zapisał pozycje! ("..licznik..")" )
end
addCommandHandler( "savepos", savePos )

function consoleCreateMarker ( thePlayer, commandName )
   if ( thePlayer ) then
      local x, y, z = getElementPosition ( thePlayer )
      local theMarker = createMarker ( x, y, z+1.5, "arrow", 0.5, 255,0,0, 100 )
   end
end
addCommandHandler ( "savepos", consoleCreateMarker )