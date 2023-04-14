local CommandsToOff = {"shutdown", "destroyvehicle", "givevhicle", "blowvehicle", "set", "setarmour","setcolor",
"jetpack","destroyteam", "setskin", "settime", "setweather", "setwelcome", "shout","unregister","repair"}

addEventHandler("onPlayerCommand", root, function(cmd)
    for k, v in pairs(CommandsToOff) do
	    if cmd == v then
		    cancelEvent();
        end
    end
end);

addEventHandler ( "onChatMessage", root, function ( msg )  
    if ( tostring ( msg ) : lower ( ) == "login: you successfully logged in" ) then 
        cancelEvent ( ) 
    end  
end ) 

function TryCommand(plr, cmdName, arg1, arg2, arg3, arg4)
    local base = "#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Źle użyłeś komendy, spróbuj tak: #9c9c9c /"..cmdName
    if arg1 then
        base = base.." #9c9c9c<#ffffff"..arg1.."#9c9c9c>"
    end
    if arg2 then
        base = base.." #9c9c9c<#ffffff"..arg2.."#9c9c9c>"
    end
    if arg3 then
        base = base.." #9c9c9c<#ffffff"..arg3.."#9c9c9c>"
    end
    if arg4 then
        base = base.." #9c9c9c<#ffffff"..arg4.."#9c9c9c>"
    end

    outputChatBox(base,plr, 255, 255, 255, true)
end


function id(player)
    if getElementData(player, "premium") then
        return "#c9cc68("..getElementData(player, "id")..")#ffffff"
    else
        return "#A6A7A8("..getElementData(player, "id")..")#ffffff"
    end
end

addEventHandler("onPlayerLogin", getRootElement(),
function()
	local account = getPlayerAccount(source)
    if account then
        if accountDutyCheck(account) then
            local dutyTimes = getAccountData(account, "dutyTime") or 0
            setElementData(source, "dutyTime", dutyTimes)
        end
	end
end)

addEventHandler("onPlayerQuit", getRootElement(),
function()
	local account = getPlayerAccount(source)
    if account then
        if accountDutyCheck(account) then
            local dutyTimes = getElementData(source, "dutyTime") or 0
            setAccountData(account, "dutyTime", dutyTimes)
        end
	end
end)

function accountDutyCheck(acc)
	local RanksTable = {
		{"Admin"},
		{"Administrator"},
		{"Moderator"},
		{"Support"},
		{"ChatMod"},
    }
    
	local accName = getAccountName (acc)

	for k, v in pairs(RanksTable) do
		if isObjectInACLGroup ("user."..accName, aclGetGroup (v[1])) then
			return true
		end
	end

	return false
end

setTimer(function()
    for k, v in pairs(getElementsByType("player")) do
        if getElementData(v, "duty") then
            if not getElementData(v, "afk") then
                local time = getElementData(v, "dutyTime") or 0
                setElementData(v, "dutyTime", time+1)
            end
        end
    end
end, 60000, 0)

function PermisionRankCheck(player, punished)
	if not player then return end
	if not punished then return end

	local RanksTable = {
		{1, "Admin"},
		{2, "Administrator"},
		{3, "Moderator"},
		{4, "Support"},
		{5, "ChatMod"},
	}

	local playerPerm, punishedPerm = 10, 10

	local playerName = getAccountName (getPlayerAccount(player))
	local punishedName = getAccountName (getPlayerAccount(punished))

	for k, v in pairs(RanksTable) do
		if isObjectInACLGroup ("user."..playerName, aclGetGroup (v[2])) then
			playerPerm = v[1]
		end
		if isObjectInACLGroup ("user."..punishedName, aclGetGroup (v[2])) then
			punishedPerm = v[1]
		end
	end

	if playerPerm < punishedPerm then
		return true
	end
	
	return false
end
