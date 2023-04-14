local CommandsToOff = {"shutdown", "destroyvehicle", "givevhicle", "blowvehicle", "set", "setarmour","setcolor",
"jetpack","destroyteam", "setskin", "settime", "setweather", "setwelcome", "shout","unregister","repair"}

addEventHandler("onPlayerCommand", root, function(cmd)
    for k, v in pairs(CommandsToOff) do
	    if cmd == v then
		    cancelEvent();
        end
    end
end);

function TryAgainCommand(player, cmdName, args)
    local string = "#c22d2d[#6b6b6b!#c22d2d] #ffffffŹle użyłeś komendy, spróbuj tak: #9c9c9c /"..cmdName

    for k,v in pairs(args) do
        string = string.." #9c9c9c<#ffffff"..v.."#9c9c9c>"
    end

    outputChatBox(string,player, 255, 255, 255, true)
end

function id(player)
    return "#A6A7A8("..getElementData(player, "id")..")#ffffff"
end

function getDarkDayZPlayer(value)
    local player = false

    local idPlayer = exports.DayZ_Id:GetPlayerFromID(tonumber(value))
    local NamePlayer = getPlayerFromParticalName(value)
    
    if idPlayer then player = idPlayer
    elseif NamePlayer then player = NamePlayer end

    return player
end

function getPlayerFromParticalName(thePlayerName)

    if not thePlayerName then return false end

    local thePlayer = getPlayerFromName(thePlayerName)
    if thePlayer then
        return thePlayer
    end

    for _,thePlayer in ipairs(getElementsByType("player")) do
        if string.find(string.gsub(getPlayerName(thePlayer):lower(),"#%x%x%x%x%x%x", ""), thePlayerName:lower(), 1, true) then
            return thePlayer
        end
    end

    return false
end

function PermisionRankCheck(player, punished)
	if not player then return end
	if not punished then return end

	local RanksTable = {
        {1, "Console"}, 
        {2, "Admin"}, 
        {3, "Vice Admin"}, 
        {4, "Pomocnik",},
        {5, "Pomocnik2"}, 
        {5, "Moderator2"}, 
        {6, "ModChat"}, 
	}

	local playerPerm, punishedPerm = 10, 10

	local playerName = getAccountName (getPlayerAccount(player))
	local punishedName = getAccountName (getPlayerAccount(punished))

	for k, v in pairs(RanksTable) do
		if isObjectInACLGroup ("user."..playerName, aclGetGroup (v[2])) and (playerPerm == 10) then
			playerPerm = v[1]
		end
		if isObjectInACLGroup ("user."..punishedName, aclGetGroup (v[2])) and (punishedPerm == 10) then
			punishedPerm = v[1]
		end
	end

	if playerPerm < punishedPerm then
		return true
	end
	
	return false
end

setTimer(function()
    for k, v in pairs(getElementsByType("player")) do
        if getElementData(v, "duty") then
            local acc = getPlayerAccount(v)
            local time = getAccountData(acc, "dutyTime") or 0
            setAccountData(acc, "dutyTime", time+1)
        end
    end
end, 60000, 0)