local dane = {}

function getAccountDane(data)
	dane[data] = {}
	for i,v in pairs(getAccounts()) do
		--if i<=100 then
			 
			local zabojstwa
			local gracz = getAccountPlayer(v)
			local last_name
			local obecny = false
			if gracz then
				zabojstwa = getElementData(gracz,data) or 0
				last_name = getPlayerName(gracz):gsub("#%x%x%x%x%x%x","")
				obecny = true
			else
				zabojstwa = getAccountData(v,data) or 0
				last_name = getAccountData(v,'last_name') or getAccountName(v)
			end
			table.insert(dane[data],{last_name,zabojstwa,obecny,getAccountName(v)})
		--end
	end
end

getAccountDane('TotalMurders')
local tickes = {}


addEvent("DajRanking_Graczy",true)
addEventHandler("DajRanking_Graczy",resourceRoot,function(player,data)
	if not tickes[data] then
		tickes[data] = getTickCount() + 20000
		getAccountDane(data)
	elseif getTickCount()>tickes[data] then
		tickes[data] = getTickCount() + 20000
		getAccountDane(data)
	end
	
	local new_dane = dane[data]
	triggerClientEvent(player,'UstawRankingKilli',resourceRoot,dane[data])
end)

addEvent('html:setCrosshair', true)
addEventHandler('html:setCrosshair', resourceRoot, function(player, ch)
	setAccountData(getPlayerAccount(player), 'celownik', ch) 
end)

addEvent('Set_GPS',true)
addEventHandler('Set_GPS',resourceRoot,function(player,gps)
	if getElementData(player,'GPSchannel') and getElementData(player,'GPSchannel')==gps then return end
	setElementData(player,'GPSchannel',gps)
	if gps=="" then return end
	if not gps then return end
	for i,v in pairs(getElementsByType('player')) do
		if getElementData(v,'GPSchannel')==gps then
			outputChatBox("#36F3E7"..getPlayerName(player):gsub("#%x%x%x%x%x%x","").." dołączył do kanału gps!",v,255,255,255,true)
		end
	end
end)


addEvent('opusc_gps',true)
addEventHandler('opusc_gps',resourceRoot,function(player,gps)
	if not getElementData(player,'GPSchannel') then return end
	setElementData(player,'GPSchannel',false)
	if gps=="" then return end
	if not gps then return end
	outputChatBox("#36F3E7Opuściłeś kanał GPS!",player,255,255,255,true)
	for i,v in pairs(getElementsByType('player')) do
		if getElementData(v,'GPSchannel')==gps then
			outputChatBox("#36F3E7"..getPlayerName(player):gsub("#%x%x%x%x%x%x","").." opuścił kanał gps!",v,255,255,255,true)
		end
	end
	triggerClientEvent(player,'ustaw-inject-na-zero',resourceRoot)
end)


function math.round(number)
    return tonumber(string.format("%.0f", tostring(number)))
end

local promocja = false

function result(responseData, errno, playerToReceive)
	if string.find(responseData, '"error":"bad_code"') then
		outputChatBox('* Wprowadzony kod jest nieprawidłowy lub został wykorzystany.', playerToReceive)
		return
	end

	if string.find(responseData, '"status":"fail"') then
		outputChatBox('* Wystąpił nieznany błąd podczas zakupu usługi.', playerToReceive)
		return
	end

	--
	--		Zabezpieczenie które zabrania graczowi zakupu usługi na 30 dni z otrzymanym kodem usługi na 3 dni.
	--		Gdy kwoty po stronie Clienta ulegną zmianie, należy je uzupełnić także tutaj.
	--

	local otrzymane_pp = 0
	if string.find(responseData, '"amount":"2"') then otrzymane_pp = 1 end
	if string.find(responseData, '"amount":"4"') then otrzymane_pp = 3 end
	if string.find(responseData, '"amount":"6"') then otrzymane_pp = 6 end
	if string.find(responseData, '"amount":"19"') then otrzymane_pp = 15 end
	if string.find(responseData, '"amount":"25"') then otrzymane_pp = 20 end
	
	if not otrzymane_pp then return end
	if promocja then
		otrzymane_pp = otrzymane_pp + math.round(otrzymane_pp/2)
	end
	--
	--		Koniec zabezpieczenia
	--

	--
	--		Od tego momentu można ustawić co ma się wykonywać po prawidłowym wprowadzeniu kodu.
	--		Jeżeli chcemy pobrać ilość dni zakupionej usługi należy wprowadzić w danym miejscu 'days'.
	--		Przykład użycia znajduje się poniżej.
	--
	local pp = getElementData(playerToReceive,"PP") or 0
	setElementData(playerToReceive,"PP",pp + otrzymane_pp)
	outputChatBox('* Kod prawidłowy, zakupiłeś punkty PP.', playerToReceive,0,255,0)
end

addEvent("DoladujPP",true)
addEventHandler("DoladujPP",resourceRoot,function(player,kod,koszt)
	if not getElementData(player,"logedin") then outputChatBox("* Błąd spróbuj ponownie się zalogować",player,255,0,0) return end
	local string = string.format('https://admin.serverproject.eu/api/smsapi.php?key=%s&amount=%d&code=%s&desc=%s', "wAsiS4K4pN66AawtLr8VReWjW", tostring(koszt), kod,getElementData(player,"logedin"))
	fetchRemote(string, result, "", false, player)
end)

addCommandHandler("GPSchannel", function(player, _, ...)
	local msg = table.concat({...} , " "):gsub("#%x%x%x%x%x%x", "")
	local pname = getPlayerName(player):gsub("#%x%x%x%x%x%x", "")
	if not getElementData(player,'GPSchannel') then return end
	for i,v in pairs(getElementsByType('player')) do
		if getElementData(v,'GPSchannel')==getElementData(player,'GPSchannel') then
			outputChatBox("[GPSchannel] "..pname..": "..msg, v, 0, 222, 252, true)
		end
	end
end)

