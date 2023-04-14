-- PRO DayZ ADMIN - TEPANIE SIĘ NA KORDY

function fgAdminMoveMyself( playerSource, cmd, pX, pY, pZ )

     local administratoropen = getElementData( playerSource, "Administrator-Open" )

     if not administratoropen then
        return
    end

    local pX, pY, pZ = tonumber( pX ), tonumber( pY ), tonumber( pZ )
    if pX and pY and pZ then
        setElementPosition( playerSource, pX, pY, pZ )
    else
        outputChatBox( "Syntax: /tp X Y Z", playerSource, 0, 255, 255 )
    end
end
addCommandHandler( "tp", fgAdminMoveMyself )

-- PRO DayZ ADMIN - POBRANIE SWOICH KORDÓW

function fgAdminCheckPositionPlayer( playerSource )

    local x,y,z = getElementPosition( playerSource )
    local rx,ry,rz = getElementRotation( playerSource )
    local x,y,z = (('%.2f'):format( x )),(('%.2f'):format( y )),(('%.2f'):format( z ))
    local rz = (('%.2f'):format( rz ))

    outputChatBox( "[ COORD-CHECKER ] Twoje koordynaty zostały wysłane do konsoli (F8)!", playerSource, 0, 255, 255 )
    outputConsole( "[ COORD-CHECKER ] Twoje koordy: "..x.." "..y.." "..z.." "..rz, playerSource )

end
addCommandHandler( "playerposition", fgAdminCheckPositionPlayer )