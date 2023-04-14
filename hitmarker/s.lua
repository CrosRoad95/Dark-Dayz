function hitmarker_server( attacker )
    triggerClientEvent( attacker, "fgFuncHitMarker", attacker )
end
addEvent( "hitmarker_server", true )
addEventHandler( "hitmarker_server", root, hitmarker_server )