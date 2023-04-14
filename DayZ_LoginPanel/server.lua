local licencja = fileCreate("License.txt")
if licencja then
    fileWrite(licencja, "Twórcą tego skryptu jest Johanez.")
    fileWrite(licencja, "Skrypt jest dla użytku serwera Dark DayZ")
    fileWrite(licencja, "Upublicznienie/używanie skryptu grozi karą!")
    fileClose(licencja)
end

addEvent( "onPlayerRequestToLogin", true )
addEventHandler( "onPlayerRequestToLogin", resourceRoot, function(player, lang, login, password)

    local acc =  getAccount(login, password)

    if not acc then exports.DayZ_notification:DrawNotification(GetTextLand(lang, "acc_doesnt_exist"), 212, 125, 125, player) return end
    if not (getAccountData(acc,'serial') == getPlayerSerial(player)) then exports.DayZ_notification:DrawNotification(GetTextLand(lang, "acc_error"), 212, 125, 125, player) return end

    logIn(player,acc,password)

    local player_acc = getPlayerAccount(player)


    if not isGuestAccount(player_acc) then
        setElementData(player, "logedin", login)
        triggerEvent("onPlayerDayZLogin", root, player);
        triggerClientEvent(player, "onPlayerDayZLogin", root, player)
        triggerClientEvent(player,'onPlayerHideLoginPanel',player, player)
        
        setTimer(function()
            if player then triggerClientEvent(player, "onClientLogin", root, player); end
        end, 650, 1)
    else
        exports.DayZ_notification:DrawNotification(GetTextLand(lang, "acc_error"), 212, 125, 125, player)
    end
end)

addEvent( "onPlayerRequestToRegisterAccount", true )
addEventHandler( "onPlayerRequestToRegisterAccount", resourceRoot, function(player, lang, login, password)

    if getAccount(login) then exports.DayZ_notification:DrawNotification(GetTextLand(lang, "acc_exist"), 212, 125, 125, player) return end

    if #getAccountsBySerial(getPlayerSerial(player)) >= 2 then exports.DayZ_notification:DrawNotification(GetTextLand(lang, "accs_max"), 212, 125, 125, player) return end

    local accountAdded = addAccount(login, password)

    if accountAdded then
        logIn(player,accountAdded,password)
        setElementData(player, "logedin", login)
        setAccountData(accountAdded,'Password',password)
        setAccountData(accountAdded,'serial',getPlayerSerial(player))
		exports["db-mysql"]:dbSet("INSERT INTO Konta (login,haslo,kille,zgony,headshoty,kdr,alivetime,gp,pp) VALUES (?,?,0,0,0,0,0,0,0)", login,md5(password),kille,dedy,hs,kdr,tot,gp,pp)
        local data = getRealTime()
        local pogers = (formatData(1900+data.year))..(formatData(data.month+1))..(formatData(data.monthday))
        triggerEvent("onPlayerDayZRegister", root, player);
        triggerClientEvent(player,'onPlayerHideLoginPanel',player, player)

        setTimer(function()
            if player then triggerClientEvent(player, "onClientLogin", root, player); end
        end, 650, 1)
    end

end)

function formatData(data)
	if tostring(data):len()==1 then
		return "0"..tostring(data)
	end
	return tostring(data)
end