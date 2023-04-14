function adminchat ( thePlayer, _, ... )
    local message = table.concat ( { ... }, " " )
    if ( isPlayerOnGroup ( thePlayer ) ) then
        for _, player in ipairs ( getElementsByType ( "player" ) ) do
            if ( isPlayerOnGroup ( player ) ) then
                outputChatBox ( "#FFFFFF[#ff0000Czat_Administracji#FFFFFF] #0099cc".. getPlayerName ( thePlayer ) ..": #FFFFFF".. message, player, 255, 255, 255, true )
            end
        end
    else
        outputChatBox ("ⓘ#E6D7AFNie masz uprawnień do tej komendy.", thePlayer, 50, 150, 205, true)	
    end
end
addCommandHandler ( "e", adminchat )
 
function isPlayerOnGroup ( thePlayer )
    local account = getPlayerAccount ( thePlayer )
    local inGroup = false
    for _, group in ipairs ( { "Console", "Admin", "ModChat", "Pomocnik", "Pomocnik2" } ) do  
        if isObjectInACLGroup ( "user.".. getAccountName ( account ), aclGetGroup ( group ) )   then
            inGroup = true
            break
        end
    end
 
    return inGroup
end