--[Script by Nesty for Fragujjemy.com]

-- CHATS PLAYERS

addEventHandler( "onPlayerChat", root, function ( _msg, _type )

    if isPlayerMuted ( source ) then
        return
    end

    local _acc = getAccountName( getPlayerAccount ( source ) ) or " "
    local _prefix

    if ( isObjectInACLGroup( "user.".._acc, aclGetGroup ( "Admin" ) ) ) then
        _prefix = "[ADMIN]"
    elseif ( isObjectInACLGroup( "user.".._acc, aclGetGroup ( "Pomocnik" ) ) ) then
        _prefix = "[Pomocnik]"
    elseif ( isObjectInACLGroup( "user.".._acc, aclGetGroup ( "ModChat" ) ) ) then
        _prefix = "[ModChat]" 
	elseif ( isObjectInACLGroup( "user.".._acc, aclGetGroup ( "Zasluzony" ) ) ) then
        _prefix = "[Zasluzony]"
    else
        _prefix = "[GRACZ]"    
    end

    if _type == 0 then
        _text = _prefix.." Czat lokalny: " .. skipColorCode(source) .. ": " .. _msg
    elseif _type == 1 then
        _text = _prefix.." Czat lokalny: * " .. skipColorCode(source) .. " " .. _msg
    elseif _type == 2 then
        local gTeam = getElementData(source,'Grupa').nazwa
        local gPlayerTeam = getPlayerTeam ( source )

        if gPlayerTeam and gTeam then
            _text = _prefix.." Czat grupy (" .. gTeam .. "): " .. skipColorCode( source ) .. ": " .. _msg
        end
    end
	
    exports["frag_system_logs"]:saveLogServer( _text, "players", "logs_chats" )
	
end

)

addEventHandler( "onPlayerPrivateMessage", root, function ( _message, _recipient )

    if ( getElementData( source, "isRestrictSerialHigh" ) == true ) then
        outputChatBox( "[ MSG ] You have a perm mute!", source, 255, 0, 0, true )
		cancelEvent( )
        return
    end
	
    exports["frag_system_logs"]:saveLogServer( "MSG: " .. getPlayerName( source ) .. " do " .. getPlayerName ( _recipient ) .. ": " .. _message, "players", "logs_privateChats" )
	
end
)

-- COMMANDS PLAYERS

addEventHandler( "onPlayerCommand", root, function ( _action )

    local _acc = getAccountName( getPlayerAccount ( source ) ) or " "
    local _name = skipColorCode( source )
    local _serial = getPlayerSerial( source ) or " "
    local _gTeam = getElementData ( source, "Grupa" ) and getElementData ( source, "Grupa" ).nazwa or ""
    local _prefix
    if ( isObjectInACLGroup( "user.".._acc, aclGetGroup ( "Admin" ) ) ) then
        _prefix = "[ADMIN]"
    elseif ( isObjectInACLGroup( "user.".._acc, aclGetGroup ( "Pomocnik" ) ) ) then
        _prefix = "[Pomocnik]"
    elseif ( isObjectInACLGroup( "user.".._acc, aclGetGroup ( "ModChat" ) ) ) then
        _prefix = "[ModChat]"
	elseif ( isObjectInACLGroup( "user.".._acc, aclGetGroup ( "Zasluzony" ) ) ) then
        _prefix = "[Zasluzony]"
    else
        _prefix = "[GRACZ]"    
    end

    if not ( _action == "GlobalChat" or _action == "ChannelChat" or _action == "say" or _action == "Team" or _action == "grab" or _action == "Reload" or _action == "kill" or _action == "glue" ) then
        if not ( _prefix == "[ADMIN]" or _prefix == "[Pomocnik]" ) then
            exports["frag_system_logs"]:saveLogServer( "[ CommandChecker ] ".._prefix.." (Nick: " .. _name .. ") (Login: ".. _acc .. ") (Grupa: ".. _gTeam ..") (Serial: ".. _serial ..") uzyl komendy '" .. _action .. "'", "players", "logs_commands" )
        else
            exports["frag_system_logs"]:saveLogServer( "[ CommandChecker ] ".._prefix.." (Nick: " .. _name .. ") (Login: ".. _acc .. ") (Grupa: ".. _gTeam ..") (Serial: ".. _serial ..") uzyl komendy '" .. _action .. "'", "admins", "logs_commands" )
        end
    end
	
end
)

-- BINDS PLAYERS

function onPlayerBinds( player, key, keyState )
    if ( keyState == "down" ) then
        state = "nacisnal"
    end
        exports["frag_system_logs"]:saveLogServer( "[ BindChecker ] "..skipColorCode( player ) .. " " .. state .. " klawisz " .. key .. "!!!", "players", "logs_binds" )
end

function checkBind( player, commandName )
    bindKey( source, "insert", "down", onPlayerBinds )
    bindKey( source, "F12", "down", onPlayerBinds )
	bindKey( source, "F10", "down", onPlayerBinds )
    bindKey( source, "home", "down", onPlayerBinds )
    bindKey( source, "num_6", "down", onPlayerBinds )
end
addEventHandler( "onPlayerLogin", root, checkBind )

-- OTHER

function skipColorCode ( s )
    if type ( s ) == "string" then
        return string.gsub ( s, "(#%x%x%x%x%x%x)", "" )
    elseif type ( s ) == "userdata" and getElementType ( s ) == "player" then
        return string.gsub ( getPlayerName ( s ), "(#%x%x%x%x%x%x)", "" )
    end
end