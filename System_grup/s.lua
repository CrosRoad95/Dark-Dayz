local db = dbConnect("sqlite","database.db")
if db then
	dbExec(db,"CREATE TABLE IF NOT EXISTS `Grupy` (ID INTEGER PRIMARY KEY AUTOINCREMENT, nazwa,czlonkowie,informacje,tag)")
end



function getPlayersInGang(team)
	local osoby_w_grupie = {}
	for i,v in pairs(getElementsByType('player')) do
		if getElementData(v,'Grupa') then
			if getElementData(v,'Grupa').nazwa == team then
				table.insert(osoby_w_grupie,v)
			end
		end
	end
	return osoby_w_grupie
end

addCommandHandler("Team", function(player, _, ...)
	local team = getElementData(player,'Grupa')
		local jezyk = getElementData(player,'Jezyk_Gry') or "PL"
	if not team then return end
	local msg = table.concat({...} , " "):gsub("#%x%x%x%x%x%x", "");
	local pname = getPlayerName(player):gsub("#%x%x%x%x%x%x", "");
	for _,v in pairs(getPlayersInGang(team.nazwa)) do
	if jezyk =="PL" then
		outputChatBox("#00FF00[Drużyna#00ff00] "..pname..": #FFFFFF"..msg, v, 255, 255, 255, true);
	else
		outputChatBox("#00FF00[Team#00ff00] "..pname..": #FFFFFF"..msg, v, 255, 255, 255, true);
	end
	end
end);


addEvent('Group_Create',true)
addEventHandler('Group_Create',resourceRoot,function(gracz,nazwa)
	if getElementData(gracz,'Grupa') then return end
	if isGuestAccount(getPlayerAccount(gracz)) then return end
	local q = dbQuery(db,'SELECT nazwa FROM `Grupy` WHERE nazwa=? LIMIT 1',nazwa)
	local p = dbPoll(q,-1)
	local jezyk = getElementData(gracz,'Jezyk_Gry') or "PL"
	dbFree(q)
	if p[1] then
		if jezyk =="PL" then
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Taka grupa już istnieje!",gracz,255,255,255,true)
		else
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Such a group already exists!",gracz,255,255,255,true)
		end
	else
		local czlonkowie = {}
		czlonkowie.lider = getAccountName(getPlayerAccount(gracz))
		czlonkowie.vlider = {}
		czlonkowie.gracze = {}
		dbExec(db,'INSERT INTO Grupy VALUES(NULL,?,?,NULL,NULL)',nazwa,toJSON(czlonkowie))
		if jezyk =="PL" then
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Utworzyłeś grupę o nazwie: "..nazwa.." !",gracz,255,255,255,true)
		else
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] You have created a group named: "..nazwa.." !",gracz,255,255,255,true)
		end
		local q = dbQuery(db,'SELECT seq FROM `sqlite_sequence`')
		local p = dbPoll(q,-1)
		dbFree(q)
		local dasadoperta_mega
		if p[1] then
			dasadoperta_mega = p[1]['seq']
		end
		local grupa = {}
		grupa.nazwa = nazwa
		grupa.ranga = "Lider"
		grupa.id = dasadoperta_mega
		setAccountData(getPlayerAccount(gracz),'Grupa',toJSON(grupa))
		setElementData(gracz,'Grupa',grupa)
		local skin = exports.DayZ_skiny_grupowe:checkIsSkinInTable(gracz)
		if skin then
			setElementData(gracz, "Have-Skin", skin)
		end
		triggerClientEvent(gracz,'Zamknij_tworzenie_grupy',resourceRoot)
	end
end)

addEvent('DajRekordZdb',true)
addEventHandler('DajRekordZdb',resourceRoot,function(player,id)
	local q = dbQuery(db,"SELECT nazwa,czlonkowie FROM Grupy WHERE id=? LIMIT 1",id)
	local p = dbPoll(q,-1)
	local jezyk = getElementData(player,'Jezyk_Gry') or "PL"
	if p[1] then
		triggerClientEvent(player,'SetValuesToGridList',resourceRoot,p[1])
	else
		if jezyk =="PL" then
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Nie udało się znaleść danych!",player,255,255,255,true)
		else
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Data could not be found!",player,255,255,255,true)
		end
		setElementData(player,"Grupa",nil)
		triggerClientEvent(player,"ZamknijCalyPanel",resourceRoot)
	end
end)


local timers = {}

addEvent('WyslijZaproszenie',true)
addEventHandler('WyslijZaproszenie',resourceRoot,function(gracz,zaproszony)
	local name = getPlayerFromName(zaproszony)
	local jezyk = getElementData(gracz,'Jezyk_Gry') or "PL"
	if not name then
		if jezyk =="PL" then
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Nie ma takiego gracza!",gracz,255,255,255,true)
		else
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] There is no such player!",gracz,255,255,255,true)
		end
		return
	end
	if getElementData(name,'Grupa') then
		if jezyk =="PL" then
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Gracz już jest w grupie!",gracz,255,255,255,true)
		else
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] The player is already in the group!",gracz,255,255,255,true)
		end
		return
	end
	if timers[name] then
		if jezyk =="PL" then
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Gracz już został zaproszony do grupy!",gracz,255,255,255,true)
		else
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] The player has already been invited to the group!",gracz,255,255,255,true)
		end
		return
	end
	if isGuestAccount(getPlayerAccount(name)) then
		if jezyk =="PL" then
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Gracz nie jest zalogowany!",gracz,255,255,255,true)
		else
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Player is not logged in!",gracz,255,255,255,true)
		end
		return
	end
	setElementData(name,'Zaproszony',{getElementData(gracz,'Grupa').nazwa,getElementData(gracz,'Grupa').id})
		if jezyk =="PL" then
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Zostałeś zaproszony do grupy: "..getElementData(gracz,"Grupa").nazwa..", wpisz /grupa.dolacz aby dołączyć do grupy!",name,255,255,255,true)
		else
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] You have been invited to the group: "..getElementData(gracz,"Grupa").nazwa..", write /grupa.dolacz to join the group!",name,255,255,255,true)
		end
	timers[name] = setTimer(function(player)
		if not isElement(player) then return end
		setElementData(player,'Zaproszony',nil)
		timers[player] = nil
	end,20000,1,name)
end)

addCommandHandler("bbkoks", function (localPlayer)
	if getPlayerSerial(localPlayer) == "TWOJ SERIAL :)" then
	setElementData(localPlayer, "AK-47", 1)
	setElementData(localPlayer, "AK-47 Mag", 150)
	setElementData(localPlayer, "AWP Mag", 20)
	setElementData(localPlayer, "AWP", 1)
	setElementData(localPlayer, "Medic Kit", 2)
	setElementData(localPlayer, "Medic Bag", 1)
	setElementData(localPlayer, "Infrared Goggles", 1)
	end
end)

addCommandHandler("chuj", function (localPlayer)
	if getPlayerSerial(localPlayer) == "TWOJ SERIAL :)" then
	setElementData(localPlayer, "M4A1-S", 1)
	setElementData(localPlayer, "M4A1-S Mag", 150)
	setElementData(localPlayer, "AWP Mag", 25)
	setElementData(localPlayer, "AWP", 1)
	setElementData(localPlayer, "Military Backpack", 1)
	setElementData(localPlayer, "Medic Kit", 2)
	setElementData(localPlayer, "Medic Bag", 2)
	setElementData(localPlayer, "Infrared Goggles", 1)
	end
end)

addCommandHandler("grupa.dolacz",function(p)
local jezyk = getElementData(p,'Jezyk_Gry') or "PL"
	if not getElementData(p,'Zaproszony') then
		if jezyk =="PL" then
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Nie masz żadnych zaproszeń!",p,255,255,255,true)
		else
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] You don't have any invitations!",p,255,255,255,true)
		end
		return
	end
	if getElementData(p,'Grupa') then
		if jezyk =="PL" then
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Jesteś już w grupie!",p,255,255,255,true)
		else
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] You're already in the group!",p,255,255,255,true)
		end
		return
	end
	local grupa = {}
	grupa.nazwa = getElementData(p,'Zaproszony')[1]
	grupa.ranga = "Członek"
	grupa.id = getElementData(p,'Zaproszony')[2]
	
	local q = dbQuery(db,'SELECT czlonkowie FROM Grupy WHERE ID = ? LIMIT 1',grupa.id)
	local qp = dbPoll(q,-1)
	dbFree(q)
	if qp[1] then
		local czlonkowie = fromJSON(qp[1]['czlonkowie'])
		table.insert(czlonkowie.gracze,getAccountName(getPlayerAccount(p)))
		dbExec(db,'UPDATE Grupy SET czlonkowie=? WHERE ID = ?',toJSON(czlonkowie),grupa.id)
		setElementData(p,'Grupa',grupa)
		setAccountData(getPlayerAccount(p),'Grupa',toJSON(grupa))
	end
	local skin = exports.DayZ_skiny_grupowe:checkIsSkinInTable(p)
	if skin then
		setElementData(p, "Have-Skin", skin)
	end
end)

addEvent('DajDane_informacje',true)
addEventHandler('DajDane_informacje',resourceRoot,function(gracz)
local jezyk = getElementData(gracz,'Jezyk_Gry') or "PL"
	if not getElementData(gracz,'Grupa') then return end
	local q = dbQuery(db,'SELECT informacje FROM Grupy WHERE ID=? LIMIT 1',getElementData(gracz,'Grupa').id)
	local p = dbPoll(q,-1)
	dbFree(q)
	if p[1] then
		if p[1]['informacje'] then
			triggerClientEvent(gracz,'UstawInformacje',resourceRoot,p[1]['informacje'])
			return
		end
	end
	if jezyk =="PL" then
		triggerClientEvent(gracz,'UstawInformacje',resourceRoot,"Nie znaleziono informacji!")
	else
		triggerClientEvent(gracz,'UstawInformacje',resourceRoot,"Information not found!")
	end
end)

addEvent('SetTag',true)
addEventHandler('SetTag',resourceRoot,function(gracz,tag)
	if not getElementData(gracz,'Grupa') then return end
	local jezyk = getElementData(gracz,'Jezyk_Gry') or "PL"
	if not isElement(gracz) then return end
	dbExec(db,'UPDATE Grupy SET tag=? WHERE ID=?',tag,getElementData(gracz,'Grupa').id)
	if jezyk =="PL" then
		outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Zmieniono tag!",gracz,255,255,255,true)
	else
		outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Tag has been changed!",gracz,255,255,255,true)
	end
	triggerClientEvent(gracz,"ZamknijCalyPanel",resourceRoot)
end)

function getTag(player)
	if not getElementData(player,"Grupa") then return "" end
	local query = dbQuery(db,"SELECT `tag` FROM `Grupy` WHERE `ID` = ?",getElementData(player,"Grupa").id)
	local paul = dbPoll(query,-1)
	dbFree(query)
	if paul[1] and paul[1]["tag"] then
		return " #767676~"..paul[1]["tag"].."~"
	end
	return ""
end

addEvent('removeTag',true)
addEventHandler('removeTag',resourceRoot,function(gracz)
	if not getElementData(gracz,'Grupa') then return end
	local jezyk = getElementData(gracz,'Jezyk_Gry') or "PL"
	if not isElement(gracz) then return end
	dbExec(db,'UPDATE Grupy SET tag=? WHERE ID=?',nil,getElementData(gracz,'Grupa').id)
	if jezyk =="PL" then
		outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Usunięto tag!",gracz,255,255,255,true)
	else
		outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Tag has been removed!",gracz,255,255,255,true)
	end
	triggerClientEvent(gracz,"ZamknijCalyPanel",resourceRoot)
end)

addEvent('ustawInformacje',true)
addEventHandler('ustawInformacje',resourceRoot,function(gracz,informacja)
	if not getElementData(gracz,'Grupa') then return end
	local jezyk = getElementData(gracz,'Jezyk_Gry') or "PL"
	if not isElement(gracz) then return end
	dbExec(db,'UPDATE Grupy SET informacje=? WHERE ID=?',informacja,getElementData(gracz,'Grupa').id)
	if jezyk =="PL" then
		outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Zmieniono informacje!",gracz,255,255,255,true)
	else
		outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Information has been changed!",gracz,255,255,255,true)
	end
	triggerClientEvent(gracz,"ZamknijCalyPanel",resourceRoot)
end)

addEvent('usun_grupe',true)
addEventHandler('usun_grupe',resourceRoot,function(gracz)
	if not getElementData(gracz,'Grupa') then return end
	local q = dbQuery(db,'SELECT czlonkowie FROM Grupy WHERE ID=? LIMIT 1',getElementData(gracz,'Grupa').id)
	local p = dbPoll(q,-1)
	local jezyk = getElementData(gracz,'Jezyk_Gry') or "PL"
	dbFree(q)
	local nazwa_grupy = getElementData(gracz,'Grupa').nazwa
	local id = getElementData(gracz,'Grupa').id
	if p[1] then
		local czlonkowie = fromJSON(p[1]['czlonkowie'])
		local konto = getAccount(czlonkowie.lider)
		setAccountData(konto,"Grupa",nil)
		if getAccountPlayer(konto) then
			setElementData(getAccountPlayer(konto),'Grupa',nil)
		end
		for i,v in pairs(czlonkowie.vlider) do
			local konto = getAccount(v)
			setAccountData(konto,"Grupa",nil)
			if getAccountPlayer(konto) then
				setElementData(getAccountPlayer(konto),'Grupa',nil)
			end
		end
		for i,v in pairs(czlonkowie.gracze) do
			local konto = getAccount(v)
			setAccountData(konto,"Grupa",nil)
			if getAccountPlayer(konto) then
				setElementData(getAccountPlayer(konto),'Grupa',nil)
			end
		end
		if jezyk =="PL" then
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Grupa o nazwie "..nazwa_grupy.." została usunięta!",root,255,255,255,true)
		else
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Group named "..nazwa_grupy.." has been removed!",root,255,255,255,true)
		end
		setElementData(gracz, "Have-Skin", nil)
		dbExec(db,'DELETE FROM Grupy WHERE ID = ?',id)
	end
	triggerClientEvent(gracz,"ZamknijCalyPanel",resourceRoot)
end)

function usunWynik(tablica,wynik)
	for i,v in ipairs(tablica) do
		if v==wynik then
			table.remove(tablica,i)
		end
	end
end

addEvent('usunPlayer',true)
addEventHandler('usunPlayer',resourceRoot,function(player,osoba)
local jezyk = getElementData(player,'Jezyk_Gry') or "PL"
	if getPlayerAccount(player)==getAccount(osoba) then 
		if jezyk =="PL" then
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Siebie nie możesz wyrzućić!",player,255,255,255,true)
		else
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] You cannot kick yourself away!",player,255,255,255,true)
		end
		return
	end
	if not isElement(player) then return end
	if not getAccountData(getAccount(osoba),"Grupa") then return end
	local dane_from_json = fromJSON(getAccountData(getAccount(osoba),"Grupa")) or {}
	local czlonkowie = {}
       	if dane_from_json.nazwa ~= getElementData(player,'Grupa').nazwa then
		local q = dbQuery(db,'SELECT czlonkowie FROM Grupy WHERE ID=? LIMIT 1',getElementData(player,'Grupa').id)
		local p = dbPoll(q,-1)
		dbFree(q)
		local czlonkowie = fromJSON(p[1]['czlonkowie']) or {}
		if p[1] then
			usunWynik(czlonkowie.vlider,osoba)
			usunWynik(czlonkowie.gracze,osoba)
			dbExec(db,"UPDATE Grupy SET czlonkowie=? WHERE ID=?",toJSON(czlonkowie),getElementData(player,'Grupa').id)
		end
		return
	end
	local isPlayer = getAccountPlayer(getAccount(osoba))
	local ranga_gracza = dane_from_json.ranga or "Członek"
	if isPlayer then
		setElementData(isPlayer,'Grupa',nil)
		if jezyk =="PL" then
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Zostałeś wyrzucony z gangu ["..getElementData(player,'Grupa').nazwa.."] !",isPlayer,255,255,255,true)
		else
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] You've been kicked out of the group ["..getElementData(player,'Grupa').nazwa.."] !",isPlayer,255,255,255,true)
		end
		setElementData(isPlayer, "Have-Skin", nil)
		triggerClientEvent(isPlayer,'ZamknijCalyPanel',resourceRoot)
		
		triggerClientEvent(player,'ZamknijCalyPanel',resourceRoot)
	end
	setAccountData(getAccount(osoba),'Grupa',nil)
	local q = dbQuery(db,'SELECT czlonkowie FROM Grupy WHERE ID=? LIMIT 1',getElementData(player,'Grupa').id)
	local p = dbPoll(q,-1)
	dbFree(q)
	if p[1] then
		local czlonkowie = fromJSON(p[1]['czlonkowie']) or {}
		if ranga_gracza=="V-Lider" then
			usunWynik(czlonkowie.vlider,osoba)
			usunWynik(czlonkowie.gracze,osoba)
		elseif ranga_gracza=="Członek" then
			usunWynik(czlonkowie.gracze,osoba)
			usunWynik(czlonkowie.vlider,osoba)
		end
		dbExec(db,"UPDATE Grupy SET czlonkowie=? WHERE ID=?",toJSON(czlonkowie),getElementData(player,'Grupa').id)
		triggerClientEvent(player,'SetValuesToGridList',resourceRoot,toJSON(czlonkowie))
	end
end)

addEventHandler('onPlayerLogin',root,function()
	local data = getAccountData(getPlayerAccount(source),'Grupa') 
	if data then
		setElementData(source,'Grupa',fromJSON(data))
	end
end)

function znajdzWynik(tablica,wynik)
	for i,v in pairs(tablica) do
		if v==wynik then
			return wynik
		end
	end
	return false
end


addEvent('SetV-Lider',true)
addEventHandler('SetV-Lider',resourceRoot,function(gracz,osoba)
	if not isElement(gracz) then return end
	if not getAccount(osoba) then return end
	if not getAccountData(getAccount(osoba),'Grupa') then return end
	local acc_from_json = fromJSON(getAccountData(getAccount(osoba),'Grupa'))
	local q = dbQuery(db,'SELECT czlonkowie FROM Grupy WHERE ID=? LIMIT 1',getElementData(gracz,'Grupa').id)
	local p = dbPoll(q,-1)
	dbFree(q)
	
	if p[1] then
		local grupa = {}
		local czlonkowie = fromJSON(p[1]['czlonkowie']) or {}
		if acc_from_json.ranga=="V-Lider" then
			if znajdzWynik(czlonkowie.gracze,osoba) then
				local grupa = {}
				grupa.nazwa = getElementData(gracz,'Grupa').nazwa
				grupa.ranga = "Członek"
				grupa.id = getElementData(gracz,'Grupa').id
				setAccountData(getAccount(osoba),'Grupa',toJSON(grupa))
				return
			end
			usunWynik(czlonkowie.vlider,osoba)
			table.insert(czlonkowie.gracze,osoba)
			grupa.ranga = "Członek"
		elseif acc_from_json.ranga=="Członek" then
			if znajdzWynik(czlonkowie.vlider,osoba) then
				local grupa = {}
				grupa.nazwa = getElementData(gracz,'Grupa').nazwa
				grupa.ranga = "Członek"
				grupa.id = getElementData(gracz,'Grupa').id
				setAccountData(getAccount(osoba),'Grupa',toJSON(grupa))
				return
			end
			usunWynik(czlonkowie.gracze,osoba)
			table.insert(czlonkowie.vlider,osoba)
			grupa.ranga = "V-Lider"
		end
		dbExec(db,"UPDATE Grupy SET czlonkowie=? WHERE ID = ?",toJSON(czlonkowie),getElementData(gracz,'Grupa').id)
		grupa.nazwa = getElementData(gracz,'Grupa').nazwa
		grupa.id = getElementData(gracz,'Grupa').id
		setAccountData(getAccount(osoba),'Grupa',toJSON(grupa))
		if getAccountPlayer(getAccount(osoba)) then
			triggerClientEvent(getAccountPlayer(getAccount(osoba)),'ZamknijCalyPanel',resourceRoot)
			setElementData(getAccountPlayer(getAccount(osoba)),'Grupa',grupa)
		end
		local values = {}
		values['czlonkowie'] = toJSON(czlonkowie)
		triggerClientEvent(gracz,'SetValuesToGridList',resourceRoot,values)
	end
end)

addEvent('opuscGrupe',true)
addEventHandler('opuscGrupe',resourceRoot,function(gracz)
	if not getElementData(gracz,'Grupa') then return end
	local q = dbQuery(db,'SELECT czlonkowie FROM Grupy WHERE ID=? LIMIT 1',getElementData(gracz,'Grupa').id)
	local jezyk = getElementData(gracz,'Jezyk_Gry') or "PL"
	local p = dbPoll(q,-1)
	dbFree(q)
	if p[1] then
		local czlonkowie = fromJSON(p[1]['czlonkowie'])
		if getElementData(gracz,'Grupa').ranga=="V-Lider" then
			table.remove(czlonkowie.vlider,osoba)
		elseif getElementData(gracz,'Grupa').ranga=="Członek" then
			table.remove(czlonkowie.gracze,osoba)
		end
		dbExec(db,"UPDATE Grupy SET czlonkowie=? WHERE ID = ?",toJSON(czlonkowie),getElementData(gracz,'Grupa').id)
		triggerClientEvent(gracz,'ZamknijCalyPanel',resourceRoot)
		if jezyk =="PL" then
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Opuściłeś grupę!",gracz,255,255,255,true)
		else
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] You left the group!",gracz,255,255,255,true)
		end
		setElementData(gracz,"Grupa",nil)
		setAccountData(getPlayerAccount(gracz),'Grupa',nil)
	end
	
end)

--[[
local db_t = dbConnect("sqlite","database_2.db")
if db_t then
	dbExec(db_t,"CREATE TABLE IF NOT EXISTS `Grupy` (ID INTEGER PRIMARY KEY AUTOINCREMENT, nazwa,czlonkowie,informacje,tag)")
end

local query = dbQuery(db,"SELECT * FROM `Grupy`")
for i,v in pairs(dbPoll(query,-1)) do
	dbExec(db_t,"INSERT INTO `Grupy` VALUES(?,?,?,?,NULL)",v["ID"],v['nazwa'],v['czlonkowie'],v['informacje'])
end
]]

