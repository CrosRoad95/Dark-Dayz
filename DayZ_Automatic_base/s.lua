local bazy = 17;

--local db = dbConnect("sqlite","uzytkowanie")
--dbExec ( db, "CREATE TABLE IF NOT EXISTS Bazy (lider,owner,)")

local bazy_marker = {}


local blipy = {}

local baza_auto = {}

local col_to_marker = {}

local col_shapy = createElement("col_shapy_baz","col_shapy_baz")

local text=createElement('text')
setElementPosition(text,286.8310546875,1337.138671875,10.5859375)
setElementData(text,"name","• 1 pietro •")

local text=createElement('text')
setElementPosition(text,283.9775390625,1337.15234375,10.5859375)
setElementData(text,"name","• Dach •")

local text=createElement('text')
setElementPosition(text,146.5283203125,1338.947265625,10.68413066864)
setElementData(text,"name","• Dom memo •")

function getVehicle(typ,cuboid)
	local cars = {}
	for i,v in pairs(getElementsWithinColShape(cuboid,'vehicle')) do
		if typ==1 then
			if getVehicleType(v) =="Automobile" or getVehicleType(v)=="Quad" or getVehicleType(v)=="Bike" then
				table.insert(cars,v)
			end
		else
			if getVehicleType(v)=="Helicopter" or getVehicleType(v)=="Plane" then
				table.insert(cars,v)
			end
		end
	end
	return cars
end

local blocked_bases = {
	--[42] = true,
	[46] = true,
	[43] = true,
	[64] = true,
	--[34] = true,
	[81] = true,
}

-- bazy_marker[marker]["lider"]

function getBaseOwners(who)
	local ilosc_baz = 0
	for i, v in pairs(getElementsByType("marker", resourceRoot)) do
		if bazy_marker[v] and bazy_marker[v]["lider"] == who then
			ilosc_baz = ilosc_baz + 1
		end
	end
	return ilosc_baz
end

local ilosc_zarobku = 0
local ilosc_zarobku_max = 0

local sprawdz = {
	".Mlody",
	"GuupekMalyy",
	"Blueee",
	"Tabu",
	"hammerr",
	"Klaudiuszek2001",
	"Linux",
	"DjEpitet",
	"Szwagier0",
	"neffo",
}

addEventHandler("onResourceStart",resourceRoot,function()
	local i = 0
	while (i<9999) do
		i = i + 1
		
		if not fileExists("bazy/baza_"..i..".xml") then break end
		local file = xmlLoadFile("bazy/baza_"..i..".xml")
		if file then
			local atrybut = xmlFindChild(file,"informacje",0)
			if atrybut and not blocked_bases[i] then
				local pozycje = {}
				local lider = xmlNodeGetAttribute(atrybut,"lider")
				local grupa = xmlNodeGetAttribute(atrybut,"grupa")
				local id = xmlNodeGetAttribute(atrybut,"id_bazy")
				local gracze =  xmlNodeGetAttribute(atrybut,"gracze")
				local dni = xmlNodeGetAttribute(atrybut,"dni")
				local kupione = xmlNodeGetAttribute(atrybut,"kupione")
				local cena = xmlNodeGetAttribute(atrybut,"cena")
				local typ = xmlNodeGetAttribute(atrybut,"typ")
				local limity_naziemne = xmlNodeGetAttribute(atrybut,"limit_naziemnych")
				local limity_lotne = xmlNodeGetAttribute(atrybut,"limit_lotne")
				local bramy = {xmlNodeGetAttribute(atrybut,"brama_1"),xmlNodeGetAttribute(atrybut,"brama_2"),xmlNodeGetAttribute(atrybut,"brama_3")}
				pozycje["marker"] = split(xmlNodeGetAttribute(atrybut,"marker_dane"),",")
				local alpha
				if kupione == "Tak" then 
					alpha = {255,0,0,0}
				else
					alpha = {0,255,0,0}
				end
				local marker = createMarker(pozycje["marker"][1],pozycje["marker"][2],pozycje["marker"][3],'cylinder',1.5,alpha[1],alpha[2],alpha[3],alpha[4])
				setElementID(marker,"baza_marker_"..id)
				setElementData(marker,"base_id",id)
				local col_dane = split(xmlNodeGetAttribute(atrybut,"col_dane"),",")
				
				local col = createColCuboid(col_dane[1],col_dane[2],col_dane[3],col_dane[4],col_dane[5],col_dane[6])
				setElementParent(col,col_shapy)
				--[[for i,v in pairs(getElementsWithinColShape(col,"vehicle")) do
					baza_auto[v] = col
				end]]
				setElementData(col,'back_pos',split(xmlNodeGetAttribute(atrybut,"back_pos"),","))
				col_to_marker[col] = marker
				if kupione == "Tak" then
					setElementData(marker,"Blip_id",32)
					if xmlNodeGetAttribute(atrybut,"platnosc") == "PP" then
						ilosc_zarobku = ilosc_zarobku + tonumber(cena)
					end
				else
					setElementData(marker,"Blip_id",31)
				end
				if xmlNodeGetAttribute(atrybut,"platnosc") == "PP" then
					ilosc_zarobku_max = ilosc_zarobku_max + tonumber(cena)
				end
				
				
				bazy_marker[marker] = {}
				
				--[[if (xmlNodeGetAttribute(atrybut,"platnosc") == "PP" and tonumber(cena) >= 70) or (xmlNodeGetAttribute(atrybut,"platnosc") == "GP" and tonumber(cena) >= 120 * 450) then --  or (tonumber(id) == 82) or (tonumber(id) == 8)
					local idbramy = 1
					pozycje["radio"] = split(xmlNodeGetAttribute(atrybut,"brama_"..idbramy.."_dane"),",")
					bazy_marker[marker]["music_box"] = createObject(2226,pozycje['radio'][2],pozycje['radio'][3],pozycje['radio'][4],pozycje['radio'][5],pozycje['radio'][6],pozycje['radio'][7])
					setElementData(bazy_marker[marker]["music_box"], "Muza-Radio", "https://radioparty.pl/play/energy2000kat.m3u")
					setElementData(marker, "Muza-Radio", "https://radioparty.pl/play/energy2000kat.m3u")
					setElementData(bazy_marker[marker]["music_box"], "Muza-glosnosc", 1)
					setElementAlpha(bazy_marker[marker]["music_box"],0)
					setElementCollisionsEnabled(bazy_marker[marker]["music_box"],false)
				end]]--
				
				bazy_marker[marker]["lider"] = lider
				bazy_marker[marker]['col'] = col
				bazy_marker[marker]['platnosc'] = xmlNodeGetAttribute(atrybut,"platnosc")
				bazy_marker[marker]['limity'] = {tonumber(limity_naziemne),tonumber(limity_lotne)}
				bazy_marker[marker]['baza_ulepszenie'] = tonumber(xmlNodeGetAttribute(atrybut,"baza_ulepszenie"))
				if alpha[1] == 255 then
					bazy_marker[marker]['Pickup'] = createPickup(pozycje["marker"][1],pozycje["marker"][2],pozycje["marker"][3] + 0.7,3,1272,5000,0)
				else
					bazy_marker[marker]['Pickup'] = createPickup(pozycje["marker"][1],pozycje["marker"][2],pozycje["marker"][3] + 0.7,3,1273,5000,0)
				end
				local get_id_base
				if tonumber(id) < 10 then
					get_id_base = "0"..id
				else
					get_id_base = id
				end
				for i=1,3 do
					if bramy[i] == "1" then
						pozycje["brama"] = split(xmlNodeGetAttribute(atrybut,"brama_"..i.."_dane"),",")
						local brama = createObject(pozycje['brama'][1],pozycje['brama'][2],pozycje['brama'][3],pozycje['brama'][4],pozycje['brama'][5],pozycje['brama'][6],pozycje['brama'][7])
						setElementID(brama,"brama_"..get_id_base.."_0"..tostring(i))
						setElementData(brama,'Status',"Zamknięta")
						setElementData(brama,'Default-pos',{pozycje['brama'][2],pozycje['brama'][3],pozycje['brama'][4]},false)
						bazy_marker[marker]["brama_"..i] = true
					end
				end
				bazy_marker[marker]["id"] = id
				bazy_marker[marker]["grupa"] = grupa
				bazy_marker[marker]['gracze'] = gracze
				bazy_marker[marker]["dni"] = dni
				bazy_marker[marker]["kupione"] = kupione
				local added_cena = 0
				if bazy_marker[marker]["baza_ulepszenie"] > 0 then
					if bazy_marker[marker]["platnosc"] == "PP" then
						added_cena = bazy_marker[marker]["baza_ulepszenie"] * 15
					else
						added_cena = bazy_marker[marker]["baza_ulepszenie"] * 10000
					end
				end
				bazy_marker[marker]["cena"] = cena + added_cena
				setElementData(marker,"Marker-Opis",cena + added_cena.." "..xmlNodeGetAttribute(atrybut,"platnosc"))
				bazy_marker[marker]["typ"] = typ
		exports["db-mysql"]:dbSet("UPDATE Bazy SET cena=?,platnosc=?, kupione=?,grupa=?,limit_auta=?, limit_samoloty=?,dni=?,x=?,y=?,z=?,blip=?,lider=? WHERE id=?",cena,bazy_marker[marker]["platnosc"],kupione,grupa, limity_naziemne,limity_lotne,dni,id,pozycje["marker"][1],pozycje["marker"][2],pozycje["marker"][3],getElementData(marker, "Blip_id"),lider,id) -- wpisuje do STWORZONYCH tabeli informacje
		--exports["db-mysql"]:dbSet("INSERT INTO Bazy (cena, platnosc,kupione,grupa,limit_auta, limit_samoloty,dni,id,x,y,z,blip,lider) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)", cena,bazy_marker[marker]["platnosc"],kupione,grupa, limity_naziemne,limity_lotne,dni,id,pozycje["marker"][1],pozycje["marker"][2],pozycje["marker"][3],getElementData(marker, "Blip_id"),lider) -- wpisuje do tabeli mysql oraz za kazdym resetem tworzy nowe tabele
		
			for i,v in pairs(getElementsWithinColShape(col,"ped")) do
				killPed(v)
			end
			for i,v in pairs(getElementsWithinColShape(col,"player")) do
				onColShapeHitFunction(col, v)
			end
			for i,v in pairs(getElementsWithinColShape(col,"vehicle")) do
				onColShapeHitFunction(col, v)
				setElementFrozen(v,true)
				fixVehicle(v)
				setElementData(v, "inBase", id)
			end
	
		end	
			xmlUnloadFile(file);			
		end
	end
		print("* Zarobione pieniązki z baz: "..ilosc_zarobku.."/"..ilosc_zarobku_max)
end)

local isMessage = {}
local timer = {}

--[[
setTimer(function()
	for i,v in pairs(sprawdz) do
		for _,marker in pairs(getElementsByType("marker",resourceRoot)) do
			local lider = bazy_marker[marker]["lider"]
			local dni = tonumber(bazy_marker[marker]["dni"])
			if lider == v and dni > 0 then
				outputChatBox(bazy_marker[marker]["id"].." : "..dni)
			end
		end
	end
end,50,1)
]]
function zajebSkurwysyna(player)
	if not player then return end
	setElementData(player,'blood',-49)
	if isTimer(timer[player]) then
		killTimer(timer[player])
	end
end

local players_in_col = {}

addEvent("UsunWynikFromBaza",true)
addEventHandler("UsunWynikFromBaza",resourceRoot,function(plr,dane,typ)
	local id = dane[1]
	local xml = xmlLoadFile("bazy/baza_"..id..".xml")
	local marker = getElementByID("baza_marker_"..id)
	if xml then
		if typ == 0 then
			local atrybut = xmlFindChild(xml,"informacje",0)
			if atrybut then
				local gracze = fromJSON(xmlNodeGetAttribute(atrybut,'gracze'))
				gracze[dane[2]] = nil
				local konto = getAccount(dane[2])
				local ides = fromJSON((getAccountData(konto,"Global_Base_Id") or toJSON({})))
				ides[id] = nil
				setAccountData(konto,"Global_Base_Id",toJSON(ides))
				if getAccountPlayer(konto) then
					setElementData(getAccountPlayer(konto),"Global_Base_Id",toJSON(ides))
				end
				xmlNodeSetAttribute(atrybut,"gracze",toJSON(gracze))
				bazy_marker[marker]['gracze'] = toJSON(gracze)
			end
		elseif typ == 1 then
			local atrybut = xmlFindChild(xml,"informacje",0)
			if atrybut then
				local grupa = fromJSON(xmlNodeGetAttribute(atrybut,'grupa'))
				grupa[dane[2]] = nil
				xmlNodeSetAttribute(atrybut,"grupa",toJSON(grupa))
				bazy_marker[marker]['grupa'] = toJSON(grupa)
				exports["db-mysql"]:dbSet("UPDATE Bazy SET grupa=? WHERE id=? ",toJSON(grupa),id)
			end
		end
		xmlSaveFile(xml)
		xmlUnloadFile(xml)
		triggerClientEvent(plr,"chujcyckichujcycki",resourceRoot)
	end
end)





function isVehicleInBase(player,veh)
	if baza_auto[veh] then
		local id_marker = col_to_marker[baza_auto[veh]]
		if not id_marker then return false end
		local gracze = fromJSON(bazy_marker[id_marker]["gracze"])
		local grupa = fromJSON(bazy_marker[id_marker]['grupa'])
		if gracze and not gracze[getElementData(player,'logedin')] or not gracze then
			return true
		elseif getElementData(player,'Grupa') and grupa and grupa[getElementData(player,"Grupa").nazwa] or not grupa then
			return true
		else
			return false
		end
	end
	return false
end

function onColShapeHitFunction(source, hit)
	--outputChatBox(tostring(getElementModel(hit)))
	local id_marker = col_to_marker[source]
	if not id_marker then return end
	local naziemne = #getVehicle(1,source)
	local limit_naziemnych = bazy_marker[id_marker]['limity'][1]
	local lotne = #getVehicle(2,source)
	local limit_lotne = bazy_marker[id_marker]['limity'][2]
	local ulepszenie = bazy_marker[id_marker]["baza_ulepszenie"]
	if ulepszenie > 0 then
		limit_naziemnych = limit_naziemnych + ulepszenie * 2
		limit_lotne = limit_lotne + ulepszenie
	end
	local gracze = fromJSON(bazy_marker[id_marker]["gracze"])
	local grupa = fromJSON(bazy_marker[id_marker]['grupa'])
	if hit and getElementType(hit) == "player" then
		players_in_col[hit] = source
	end
	if hit and getElementType(hit)=='player' then
	if getElementData(hit,"Administrator-Open") or getElementData(hit,"gokupomocnik") then setElementData(hit, "in_base", true) return end
		if gracze and  gracze[getElementData(hit,'logedin')] then
			outputChatBox("#d63838[#6b6b6b!#d63838] #8A8A8AWitamy! Posiadasz pojazdów latających: #32c732"..lotne.."#8A8A8A/#c73e32"..limit_lotne.."#8A8A8A, pojazdów naziemnych: #32c732"..naziemne.."#8A8A8A/#c73e32"..limit_naziemnych,hit,255,255,255,true)
			setElementData(hit, "in_base", true)
			if isPedInVehicle(hit) == true then
				setElementData(hit, "id_bazy", bazy_marker[id_marker]["id"])
			end
			if gracze[getElementData(hit,"logedin")]['tenty'] == "TAK" then 
				setElementData(hit,'Moze-Otwierac',{source,bazy_marker[id_marker]["id"]})
			else
				if not isMessage[hit] then
					isMessage[hit] = true
					outputChatBox("#d63838[#6b6b6b!#d63838] #8A8A8ANie masz uprawnień do otwierania namiotów, gdy rozłożysz namiot każdy będzie go mógł otwierać",hit,255,255,255,true)
				end
			end
			return
		elseif getElementData(hit,'Grupa') and grupa and grupa[getElementData(hit,"Grupa").nazwa] then
		outputChatBox("#d63838[#6b6b6b!#d63838] #8A8A8AWitamy! Posiadasz pojazdów latających: #32c732"..lotne.."#8A8A8A/#c73e32"..limit_lotne.."#8A8A8A, pojazdów naziemnych: #32c732"..naziemne.."#8A8A8A/#c73e32"..limit_naziemnych,hit,255,255,255,true)			return
		else
			outputChatBox("#d63838[!] #ddddddMasz 3 sekundy, aby opuścić tą strefę!",hit,255,0,0,true)
			if isTimer(timer[hit]) then return end
			timer[hit] = setTimer(zajebSkurwysyna,3000,1,hit)
		end
	elseif hit and getElementType(hit)=='vehicle' then
		setElementData(hit, "inBase", bazy_marker[id_marker]["id"])
		local kierowca = getVehicleOccupant(hit,0)
		if getVehicleType(hit)=="Automobile" or getVehicleType(hit)=="Quad" or getVehicleType(hit)=="Bike" then
			if naziemne>limit_naziemnych then
				if kierowca then
					outputChatBox("#d63838[!] #800000Przekroczyłeś limit pojazdów naziemnych!",kierowca,255,0,0,true)
				end
				setElementFrozen(hit,false)
				setVehicleDamageProof(hit,false)
				local back_pos = getElementData(source,'back_pos')
				local rx,ry,rz = getElementRotation(hit)
				setElementRotation(hit,0,0,rz)
				setElementPosition(hit,unpack(back_pos))
				return
			else
				baza_auto[hit] = source
				setVehicleDamageProof(hit,true)
			end
		elseif getVehicleType(hit)=="Helicopter" or getVehicleType(hit)=="Plane" then
			if lotne>limit_lotne then
				if kierowca then
					outputChatBox("#d63838[!] #8A8A8APrzekroczyłeś limit pojazdów lotnych!",kierowca,255,0,0,true)
 		end
				setVehicleDamageProof(hit,false)
				setElementFrozen(hit,false)
				local back_pos = getElementData(source,'back_pos')
				setElementPosition(hit,unpack(back_pos))
				local rx,ry,rz = getElementRotation(hit)
				setElementRotation(hit,0,0,rz)
				return
			else
				setVehicleDamageProof(hit,true)
				baza_auto[hit] = source
			end
		end
	elseif hit and getElementType(hit) == "ped" then
		killPed(hit)
	end
end

addEventHandler('onColShapeHit',col_shapy,function(hit)
	onColShapeHitFunction(source, hit)
end)

addEventHandler('onPlayerVehicleExit',root,function(veh,seat)
	if not getElementData(veh, "inBase") then return end
	if players_in_col[source] then
		if checkIsCanDo(source,players_in_col[source]) then
			if seat == 0 then
				setElementFrozen(veh,true)
				fixVehicle(veh)
			end
		else
			zajebSkurwysyna(source)
		end
	end
end)

function checkIsCanDo(player,col)
	local id_marker = col_to_marker[col]
	if not id_marker then return end
	local gracze = fromJSON(bazy_marker[id_marker]["gracze"])
	local grupa = fromJSON(bazy_marker[id_marker]['grupa'])
	if getElementData(player,"Administrator-Open") or getElementData(player,"gokupomocnik") then return true end
	if getElementData(player,'Grupa') and grupa and grupa[getElementData(player,"Grupa").nazwa] then
		return true
	elseif gracze and gracze[getElementData(player,'logedin')] then
		return true
	end
	return false
end

addEventHandler('onPlayerVehicleEnter',root,function(veh,seat)
	setTimer(function(source)
		if players_in_col[source] then
			if checkIsCanDo(source,players_in_col[source]) then
				if seat == 0 then
					setElementFrozen(veh,false)
				end
			else
				zajebSkurwysyna(source)
				removePedFromVehicle(source)
			end
		end
	end,50,1,source)
end)

addEventHandler('onColShapeLeave',col_shapy,function(hit)
	if hit and getElementType(hit)=='player' then
		if getElementData(hit,"Administrator-Open") or getElementData(hit,"gokupomocnik") then setElementData(hit, "inBase", false) setElementData(hit, "in_base", false) return end
		players_in_col[hit] = nil
		setElementData(hit, "in_base", false)
		if getPedOccupiedVehicle(hit) and getPedOccupiedVehicleSeat(hit)==0 then
			if getVehicleType(getPedOccupiedVehicle(hit))=="Automobile" or getVehicleType(getPedOccupiedVehicle(hit))=="Quad" or getVehicleType(getPedOccupiedVehicle(hit))=="Bike" then
				setElementData(source,"pojazdy_naziemne",#getVehicle(1,source))
			elseif getVehicleType(getPedOccupiedVehicle(hit))=="Helicopter" or getVehicleType(getPedOccupiedVehicle(hit))=="Plane" then
				setElementData(source,"pojazdy_lotne",#getVehicle(2,source))
			end
			setVehicleDamageProof(getPedOccupiedVehicle(hit),false)
			baza_auto[getPedOccupiedVehicle(hit)] = nil
		end
		setElementData(hit,'Moze-Otwierac',nil)
		if isTimer(timer[hit]) then
			killTimer(timer[hit])
		end
	elseif hit and getElementType(hit)=='vehicle' then
		setElementData(hit, "inBase", false)
		if getVehicleOccupant(hit,0) then return end
		for i,player in pairs(getVehicleOccupants(hit)) do
			players_in_col[player] = nil
			if not isTimer(timer[player]) then return end
			killTimer(timer[player])
		end
		if getVehicleType(hit)=="Automobile" or getVehicleType(hit)=="Quad" or getVehicleType(hit)=="Bike" then
			setElementData(source,"pojazdy_naziemne",#getVehicle(1,source) - 1)
		elseif getVehicleType(hit)=="Helicopter" or getVehicleType(hit)=="Plane" then
			setElementData(source,"pojazdy_lotne",#getVehicle(2,source) - 1)
		end
		setVehicleDamageProof(hit,false)
		baza_auto[hit] = nil
	end
end)


addEvent("Base_SetDostep",true)
addEventHandler("Base_SetDostep",resourceRoot,function(player,konto,typ,tabela,id_bazy)
	local file = xmlLoadFile("bazy/baza_"..id_bazy..".xml")
	local marker = getElementByID("baza_marker_"..id_bazy)
	if file then
		local atrybut = xmlFindChild(file,'informacje',0)
		if atrybut then
			local gracze = fromJSON(xmlNodeGetAttribute(atrybut,'gracze'))
			if not gracze[konto] then
				xmlUnloadFile(file)
				outputChatBox("* Wystąpił problem skontaktuj się z administracją!",player,255,255,255)
				return
			end
			gracze[konto][tabela] = typ
			xmlNodeSetAttribute(atrybut,"gracze",toJSON(gracze))
			bazy_marker[marker]["gracze"] = toJSON(gracze)
		end
		triggerClientEvent(player,"chujcyckichujcycki",resourceRoot)
		outputChatBox("#d63838[#6b6b6b!#d63838] #8A8A8APomyślnie zmieniłeś ustawienia!",player,255,255,255,true)
		xmlSaveFile(file)
		xmlUnloadFile(file) 
	end
end)
   
addEvent("KupBaze",true)
addEventHandler("KupBaze",resourceRoot,function(plr)
	if not getElementData(plr,'Dane_bazy') then outputChatBox("#d63838[#6b6b6b!#d63838] #8A8A8AWystąpił problem spróbuj ponownie za 1 minute!",plr,255,255,255,true) return end
	if not getPlayerAccount(plr) then outputChatBox("#d63838[#6b6b6b!#d63838] #8A8A8AWystąpił problem spróbuj ponownie za 1 minute!",plr,255,255,255,true) return end
	if getBaseOwners(getElementData(plr, "logedin")) >= 1 then outputChatBox("#d63838[#6b6b6b!#d63838] #8A8A8APosiadasz już bazę!",plr,255,255,255,true) return end
	local tablica = getElementData(plr,'Dane_bazy')
	if (getElementData(plr,tablica['platnosc']) or 0)<tonumber(tablica['cena']) then
		outputChatBox("#d63838[#6b6b6b!#d63838] #8A8A8ANie posiadasz wystarczająco #32c732"..tablica['platnosc'],plr,255,255,255,true)
		return
	end
	local file = xmlLoadFile("bazy/baza_"..tablica["id"]..".xml")
	if file then
		local atrybut = xmlFindChild(file,"informacje",0)
		if atrybut then
			if xmlNodeGetAttribute(atrybut,"kupione") ~= "Tak" then
				local konto = getAccountName(getPlayerAccount(plr)) 
				local JSON = {}
				JSON[konto] = {}
				for i=1,3 do
					if tablica['brama_'..i] then
						JSON[konto]["brama_"..i] = "TAK"
					end
				end
				JSON[konto]['tenty'] = "TAK"
				local bases_id = fromJSON(getElementData(plr,"Global_Base_Id"))
				bases_id[tablica["id"]] = true
				setElementData(plr,"Global_Base_Id",toJSON(bases_id))
				xmlNodeSetAttribute(atrybut,'lider',konto)
				xmlNodeSetAttribute(atrybut,'kupione',"Tak")
				xmlNodeSetAttribute(atrybut,'dni',"30")
				xmlNodeSetAttribute(atrybut,'gracze',toJSON(JSON))
				xmlNodeSetAttribute(atrybut,'grupa',toJSON({}))
				bazy_marker[tablica["marker"]]["lider"] = konto
				bazy_marker[tablica["marker"]]["kupione"] = "Tak"
				bazy_marker[tablica["marker"]]["dni"] = "30"
				bazy_marker[tablica["marker"]]["grupa"] = toJSON({})
				bazy_marker[tablica["marker"]]["gracze"] = toJSON(JSON)
				setElementData(tablica["marker"],"Blip_id",32)
				exports["db-mysql"]:dbSet("UPDATE Bazy SET dni=?, lider=?, kupione=?, blip=? WHERE id=? ","30",konto,"Tak",getElementData(tablica["marker"],"Blip_id"),tablica["id"])
				setMarkerColor(tablica["marker"],255,0,0,0)
				setPickupType(bazy_marker[tablica["marker"]]["Pickup"],3,1272,0)
				setElementData(plr,tablica['platnosc'],(getElementData(plr,tablica['platnosc']) or 0)-tablica["cena"])
                                outputChatBox("#d63838[#6b6b6b!#d63838] #ffffffZakupiłeś bazę! Automatycznie została opłacona na #32c73230 #ffffffdni!", plr, 255, 255, 255, true)
				triggerClientEvent(plr,"PokazGUI",resourceRoot,false)
				setElementData(plr,"Dane_bazy",nil)
			end
		end
		xmlSaveFile(file)
		xmlUnloadFile(file)
	end
end)

function math.round(number)
    return tonumber(string.format("%.0f", tostring(number)))
end

addEvent("SellBaze",true)
addEventHandler("SellBaze",resourceRoot,function(plr)
	if not getElementData(plr,'Dane_bazy') then outputChatBox("#d63838[#6b6b6b!#d63838] #8A8A8AWystąpił problem spróbuj ponownie za 1 minute!",plr,255,255,255,true) return end
	if not getPlayerAccount(plr) then outputChatBox("#d63838[#6b6b6b!#d63838] #8A8A8AWystąpił problem spróbuj ponownie za 1 minute!",plr,255,255,255,true) return end
	local tablica = getElementData(plr,'Dane_bazy')
	local file = xmlLoadFile("bazy/baza_"..tablica["id"]..".xml")
	if file then
		local atrybut = xmlFindChild(file,"informacje",0)
		if atrybut then
			if xmlNodeGetAttribute(atrybut,"kupione") ~= "Nie" then
				local konto = getAccountName(getPlayerAccount(plr)) 
				if konto == tablica['lider'] then
					local bases_id = fromJSON((getElementData(plr,"Global_Base_Id") or {}))
					bases_id[tablica["id"]] = nil
					local di3n31 = tonumber(xmlNodeGetAttribute(atrybut,'dni'))
					local cena = tonumber(xmlNodeGetAttribute(atrybut,'cena'))
					setElementData(plr,"Global_Base_Id",toJSON(bases_id))
					xmlNodeSetAttribute(atrybut,'lider',"-")
					xmlNodeSetAttribute(atrybut,'kupione',"Nie")
					xmlNodeSetAttribute(atrybut,'dni',"-")
					xmlNodeSetAttribute(atrybut,'grupa',"")
					xmlNodeSetAttribute(atrybut,'baza_ulepszenie', 0)
					xmlNodeSetAttribute(atrybut,'gracze',"")
					removeAllVehicles(bazy_marker[tablica["marker"]]["col"], tonumber(tablica["id"]))
					local punkty_otrzymane = math.round(((cena/2)/30) * di3n31)
					for i,v in pairs(fromJSON(bazy_marker[tablica["marker"]]["gracze"])) do
						local konto = getAccount(i)
						if getAccountData(konto,"Global_Base_Id") then
							local ides = fromJSON(getAccountData(konto,"Global_Base_Id")) or {}
							ides[bazy_marker[tablica["marker"]]["id"]] = nil
							setAccountData(konto,"Global_Base_Id",toJSON(ides))
						end
					end
					bazy_marker[tablica["marker"]]["lider"] = "-"
					bazy_marker[tablica["marker"]]["kupione"] = "Nie"
					bazy_marker[tablica["marker"]]["dni"] = "-"
					bazy_marker[tablica["marker"]]["grupa"] = ""
					bazy_marker[tablica["marker"]]["cena"] = cena
					bazy_marker[tablica["marker"]]["baza_ulepszenie"] = 0
					bazy_marker[tablica["marker"]]["gracze"] = ""
					setElementData(tablica["marker"], "Marker-Opis",cena.." "..bazy_marker[tablica["marker"]]["platnosc"])
					setElementData(plr,tablica["platnosc"],(getElementData(plr,tablica["platnosc"]) or 0) + punkty_otrzymane)
					outputChatBox("#d63838[#6b6b6b!#d63838] #ffffffSprzedałeś bazę! Otrzymałeś: #32c732"..punkty_otrzymane.." "..tablica["platnosc"],plr,255,255,255,true)

					setElementData(tablica["marker"],"Blip_id",31)
					exports["db-mysql"]:dbSet("UPDATE Bazy SET dni=?, lider=?, kupione=?, grupa=?, cena=?, blip=? WHERE id=? ",'-','-','Nie',bazy_marker[tablica["marker"]]["grupa"],cena,getElementData(tablica["marker"],"Blip_id"),tablica["id"])
					setMarkerColor(tablica["marker"],0,255,0,0)
					setPickupType(bazy_marker[tablica["marker"]]["Pickup"],3,1273,0)
					triggerClientEvent(plr,"PokazGUI",resourceRoot,false)
					setElementData(plr,"Dane_bazy",nil)
					local get_id_base
					if tonumber(tablica["id"]) < 10 then
						get_id_base = "0"..tablica["id"]
					else
						get_id_base = tablica["id"]
					end
					for i=1,3 do
						if tablica["brama_"..i] then
							local brama = getElementByID("brama_"..get_id_base.."_0"..i)
							local data = getElementData(brama,'Status')
							local pos = getElementData(brama,"Default-pos",false)
							setElementData(brama,'Status',"Zamknięta")
							moveObject(brama,500,pos[1],pos[2],pos[3])
						end
					end
				else
					outputChatBox("#d63838[#6b6b6b!#d63838] #8A8A8ANie jesteś właścicielem tej bazy!",plr,255,255,255,true)
				end
			end
		end
		xmlSaveFile(file)
		xmlUnloadFile(file)
	end 
end)

addEvent("OplacBaze",true)
addEventHandler("OplacBaze",resourceRoot,function(plr)
	if not getElementData(plr,'Dane_bazy') then outputChatBox("#d63838[#6b6b6b!#d63838] #8A8A8AWystąpił problem spróbuj ponownie za 1 minute!",plr,255,255,255,true) return end
	if not getPlayerAccount(plr) then outputChatBox("#d63838[#6b6b6b!#d63838] #8A8A8AWystąpił problem spróbuj ponownie za 1 minute!",plr,255,255,255,true) return end
	local tablica = getElementData(plr,'Dane_bazy')
	if (getElementData(plr,tablica["platnosc"]) or 0)< (tonumber(tablica['cena'])/2) then
		outputChatBox("#d63838[#6b6b6b!#d63838] #8A8A8ANie posiadasz wystarczająco #32c732"..tablica["platnosc"],plr,255,255,255,true)
		return
	end
	local file = xmlLoadFile("bazy/baza_"..tablica["id"]..".xml")
	if file then
		local atrybut = xmlFindChild(file,"informacje",0)
		if atrybut then
			if xmlNodeGetAttribute(atrybut,"kupione") ~= "Nie" then
				local konto = getAccountName(getPlayerAccount(plr)) 
				if konto == tablica['lider'] then
					xmlNodeSetAttribute(atrybut,'dni',tostring(tonumber(bazy_marker[tablica["marker"]]["dni"]) + 30))
					setElementData(plr,tablica["platnosc"],(getElementData(plr,tablica["platnosc"]) or 0) - tonumber(tablica['cena'])/2)
					bazy_marker[tablica["marker"]]["dni"] = tostring(tonumber(bazy_marker[tablica["marker"]]["dni"]) + 30)
					outputChatBox("#d63838[#6b6b6b!#d63838] #ffffffOpłaciłeś bazę! Straciłeś: #32c732"..(tonumber(tablica['cena'])/2).." "..tablica["platnosc"],plr,255,255,255,true)
					exports["db-mysql"]:dbSet("UPDATE Bazy SET dni=? WHERE id=? ",tostring(tonumber(bazy_marker[tablica["marker"]]["dni"]) + 30),tablica["id"])
					triggerClientEvent(plr,"PokazGUI",resourceRoot,false)
					setElementData(plr,"Dane_bazy",nil)
				else
					outputChatBox("#d63838[#6b6b6b!#d63838] #8A8A8ANie jesteś właścicielem tej bazy!",plr,255,255,255,true)
				end
			end
		end
		xmlSaveFile(file)
		xmlUnloadFile(file)
	end
end)


addEventHandler("onMarkerHit",resourceRoot,function(hit)
	if hit and getElementType(hit) == "player" then
		if isPedInVehicle(hit) then return end
		if not bazy_marker[source] then return end
		local konto = getPlayerAccount(hit)
		if not konto then return end
		local lider = bazy_marker[source]["lider"]
		local admin = getElementData(hit,"Administrator-Open")
		if not admin and bazy_marker[source]['kupione'] == "Tak" and lider ~= getAccountName(konto) then
			outputChatBox("#d63838[#6b6b6b!#d63838] #8A8A8ABaza została już kupiona!",hit,255,255,255,true)
			return
		end
		local zgodnosc = false
		if bazy_marker[source]['kupione'] == "Tak" and lider == getAccountName(konto) then
			zgodnosc = true
		end
		bazy_marker[source]["marker"] = source
		triggerClientEvent(hit,"PokazGUI",resourceRoot,true,bazy_marker[source],zgodnosc)
		setElementData(hit,"Dane_bazy",bazy_marker[source])
	end
end)

addEventHandler("onMarkerLeave",resourceRoot,function(hit)
	if hit and getElementType(hit) == "player" then
		if not bazy_marker[source] then return end
		triggerClientEvent(hit,"PokazGUI",resourceRoot,false)
		setElementData(hit,"Dane_bazy",nil)
	end
end)

local tickers = {}
local last_base_id = {}
local last_data = {}

addEventHandler("onPlayerLogin",root,function()
	local data = getAccountData(getPlayerAccount(source),"Global_Base_Id")
	if not data then
		setElementData(source,"Global_Base_Id",toJSON({}))
	else
		setElementData(source,"Global_Base_Id",data)
	end
end)

addEventHandler("onPlayerQuit",root,function()
	if not getElementData(source,'logedin') then return end
	local data = getElementData(source,"Global_Base_Id")
	if data then
		setAccountData(getPlayerAccount(source),"Global_Base_Id",data)
	else
		setAccountData(getPlayerAccount(source),"Global_Base_Id",toJSON({}))
	end
	if isPedInVehicle(source) then
		removePedFromVehicle(source)
	end
end)

function checkIsAdded(t,konto)
	t = fromJSON(t)
	if t[konto] then
		return true
	end
	return false
end

function openPanel (player) 
	if not getElementData(player,'logedin') then return end

	local baza = fromJSON((getElementData(player,"Global_Base_Id") or {}))
	if last_base_id[player] and last_base_id[player] ~= baza then
		tickers[player] = nil
	end
	last_base_id[player] = baza
	local refreshed_table = {}
	local are_lider = false
	if not tickers[player] or getTickCount()-tickers[player] > 1 then
		local konto = getAccountName(getPlayerAccount(player))
		for i,v in pairs(baza) do
			local file = xmlLoadFile("bazy/baza_"..i..".xml")
			if file then
				local atrybut = xmlFindChild(file,'informacje',0)
				if atrybut then
					local baza_kupiona = xmlNodeGetAttribute(atrybut,'kupione')
					local players = xmlNodeGetAttribute(atrybut,'gracze')
					if players == "" then
						players = toJSON({})
					end
					if not checkIsAdded(players,getElementData(player,"logedin")) then
						baza[i] = nil
						setElementData(player,"Global_Base_Id",toJSON(baza))
					end
					if baza_kupiona == "Tak" and checkIsAdded(players,getElementData(player,"logedin")) then
						table.insert(refreshed_table,{
						id = xmlNodeGetAttribute(atrybut,'id_bazy'),
						dni = xmlNodeGetAttribute(atrybut,'dni'),
						lider = xmlNodeGetAttribute(atrybut,'lider'),
						gracze = players,
						grupa = xmlNodeGetAttribute(atrybut,'grupa') or toJSON({}),
						bramy = {xmlNodeGetAttribute(atrybut,'brama_1'),xmlNodeGetAttribute(atrybut,'brama_2'),xmlNodeGetAttribute(atrybut,'brama_3')},
						player_lider = xmlNodeGetAttribute(atrybut,'lider')
						})
					elseif baza_kupiona == "Nie" and checkIsAdded(players,getElementData(player,"logedin")) then
						baza[i] = nil
						setElementData(player,"Global_Base_Id",toJSON(baza))
					end
				end
				xmlUnloadFile(file)
			end
		end
		tickers[player] = getTickCount() + 10000
	else
		triggerClientEvent(player,"openBasePanel",resourceRoot,last_data[player][1])
		return
	end
	last_data[player] = {refreshed_table}
	triggerClientEvent(player,"openBasePanel",resourceRoot,last_data[player][1])
end


addEvent("Base_add_elements",true)
addEventHandler("Base_add_elements",resourceRoot,function(player,data,element)
	--outputChatBox("testy1")
	if not data then return end
	if not element[1] then return end
	--outputChatBox("testy2")
	local marker = getElementByID("baza_marker_"..data[1],0)
	local xml = xmlLoadFile("bazy/baza_"..data[1]..".xml")
	if xml then
		local atrybut = xmlFindChild(xml,"informacje",0)
		if atrybut then
			if data[2] == "gracze" then
				--outputChatBox("testy3")
				local find_player = getPlayerFromName(element[1])
				if not find_player then
					outputChatBox("#d63838[#6b6b6b!#d63838] #8A8A8ANie ma takiego gracza",player,255,255,255,true)
					xmlUnloadFile(xml)
					return
				end
				if not getElementData(find_player,'logedin') then
					outputChatBox("#d63838[#6b6b6b!#d63838] #8A8A8AGracz nie jest zalogowany!",player,255,255,255,true)
					xmlUnloadFile(xml)
					return
				end
				local wartosc = fromJSON(xmlNodeGetAttribute(atrybut,"gracze"))
				wartosc[getElementData(find_player,'logedin')] = {}
				for i=1,3 do
					if xmlNodeGetAttribute(atrybut,'brama_'..i) then
						wartosc[getElementData(find_player,'logedin')]["brama_"..i] = "NIE"
					end
				end
				wartosc[getElementData(find_player,'logedin')]["tenty"] = "NIE"
				bazy_marker[marker]["gracze"] = toJSON(wartosc)
				xmlNodeSetAttribute(atrybut,'gracze',toJSON(wartosc))
				local bases_id = fromJSON((getElementData(find_player,"Global_Base_Id") or {}))
				bases_id[bazy_marker[marker]["id"]] = true
				setElementData(find_player,"Global_Base_Id",toJSON(bases_id))
				--outputChatBox("testy4")
			elseif data[2] == "grupa" then
				local grupa = element[1]
				local grupy = fromJSON(xmlNodeGetAttribute(atrybut,"grupa"))
				bazy_marker[marker]["grupa"] = toJSON(grupy)
				grupy[grupa] = true
				xmlNodeSetAttribute(atrybut,"grupa",toJSON(grupy))
				exports["db-mysql"]:dbSet("UPDATE Bazy SET grupa=? WHERE id=? ",toJSON(grupy),data[1])
			end
		end
		xmlSaveFile(xml)
		xmlUnloadFile(xml)
		triggerClientEvent(player,"chujcyckichujcycki",resourceRoot)
	else
		outputChatBox("* Wystąpił problem skontaktuj się z administracja!",player,255,255,255)
	end
end)

addEvent("Base_add_elements1",true)
addEventHandler("Base_add_elements1",resourceRoot,function(player,data,element)
	--outputChatBox("testy1")
	if not data then return end
	if not element[1] then return end
	--outputChatBox("testy2")
	local marker = getElementByID("baza_marker_"..data[1],0)
	local xml = xmlLoadFile("bazy/baza_"..data[1]..".xml")
	if xml then
		local atrybut = xmlFindChild(xml,"informacje",0)
		if atrybut then
			if data[2] == "gracze" then
			--	outputChatBox("testy3")
				local find_player = getPlayerFromName(element[1])
				if not find_player then
					outputChatBox("#d63838[#6b6b6b!#d63838] #8A8A8ANie ma takiego gracza",player,255,255,255,true)
					xmlUnloadFile(xml)
					return
				end
				if not getElementData(find_player,'logedin') then
					outputChatBox("#d63838[#6b6b6b!#d63838] #8A8A8AGracz nie jest zalogowany!",player,255,255,255,true)
					xmlUnloadFile(xml)
					return
				end
				local wartosc = fromJSON(xmlNodeGetAttribute(atrybut,"gracze"))
				wartosc[getElementData(find_player,'logedin')] = {}
				for i=1,3 do
					if xmlNodeGetAttribute(atrybut,'brama_'..i) then
						wartosc[getElementData(find_player,'logedin')]["brama_"..i] = "TAK"
					end
				end
				wartosc[getElementData(find_player,'logedin')]["tenty"] = "TAK"
				bazy_marker[marker]["gracze"] = toJSON(wartosc)
				xmlNodeSetAttribute(atrybut,'gracze',toJSON(wartosc))
				local bases_id = fromJSON((getElementData(find_player,"Global_Base_Id") or {}))
				bases_id[bazy_marker[marker]["id"]] = true
				setElementData(find_player,"Global_Base_Id",toJSON(bases_id))
				--outputChatBox("testy4")
			elseif data[2] == "grupa" then
				local grupa = element[1]
				local grupy = fromJSON(xmlNodeGetAttribute(atrybut,"grupa"))
				bazy_marker[marker]["grupa"] = toJSON(grupy)
				grupy[grupa] = true
				xmlNodeSetAttribute(atrybut,"grupa",toJSON(grupy))
				exports["db-mysql"]:dbSet("UPDATE Bazy SET grupa=? WHERE id=? ",toJSON(grupy),data[1])
			end
		end
		xmlSaveFile(xml)
		xmlUnloadFile(xml)
		triggerClientEvent(player,"chujcyckichujcycki",resourceRoot)
	else
		outputChatBox("* Wystąpił problem skontaktuj się z administracja!",player,255,255,255)
	end
end)

local anty_cpu = {}

addEvent("Base_OpenGate",true)
addEventHandler("Base_OpenGate",resourceRoot,function(player,data,id_bramy)
	if not data or not data[1] then return end
	if anty_cpu[player] and getTickCount()-anty_cpu[player]<1 then
		return
	end
	local gracze = fromJSON(data[2])
	local konto = getElementData(player,'logedin')
	if not gracze[konto] then return end
	if not gracze[konto]["brama_"..id_bramy] or gracze[konto]["brama_"..id_bramy] ~= "TAK" then
		outputChatBox("#d63838[#6b6b6b!#d63838] #8A8A8ANie posiadasz  uprawnień, aby otwierać tą bramę!",player,255,255,255,true)
		return
	end
	anty_cpu[player] = getTickCount() + 500
	local get_id_base
	if tonumber(data[1]) < 10 then
		get_id_base = "0"..data[1]
	else
		get_id_base = data[1]
	end
	local brama = getElementByID("brama_"..get_id_base.."_0"..id_bramy)
	local id_Bazy = data[1]
	local data = getElementData(brama,'Status')
	local pos = getElementData(brama,"Default-pos",false)
	if data == "Otwarta" then
		setElementData(brama,'Status',"Zamknięta")
		if getElementModel(brama) == 10828 or getElementModel(brama) == 971 then
			local rotacja,_,_ = getElementRotation(brama)
			if rotacja > 88 and rotacja < 92 then
				rotacja = 90
			end
			if rotacja == 90 then
				moveObject(brama,5000,pos[1],pos[2],pos[3])
			else
				moveObject(brama,500,pos[1],pos[2],pos[3])
			end
		else
			moveObject(brama,500,pos[1],pos[2],pos[3])
		end
		data = "Zamknięta"
	else
		data = "Otwarta"
		setElementData(brama,'Status',"Otwarta")
		if getElementModel(brama) == 10828 or getElementModel(brama) == 971 then
			local rotacja,_,_ = getElementRotation(brama)
			if rotacja > 88 and rotacja < 92 then
				rotacja = 90
			end
			if rotacja == 90 then
				moveObject(brama,9000,pos[1],pos[2],pos[3]-35)
			else
				moveObject(brama,500,pos[1],pos[2],pos[3]-15)
			end
		else
			moveObject(brama,500,pos[1],pos[2],pos[3]-10)
		end
	end
        local colorTable = {["Otwarta"] = "#5aad5aOtwarta", ["Zamknięta"] = "#a63a3aZamknięta"}
	outputChatBox("#d63838[#6b6b6b!#d63838] #8A8A8AObecny status bramy: "..colorTable[data],player,255,255,255,true)
end)

addCommandHandler("baza.open",function(player,cmd,id_bazy,ktora_brama)
	if not id_bazy or not tonumber(id_bazy) then return end
	if not ktora_brama or not tonumber(ktora_brama) then return end
	ktora_brama = tonumber(ktora_brama)
	local file = xmlLoadFile("bazy/baza_"..id_bazy..".xml")
	if file then
		local atrybut = xmlFindChild(file,"informacje",0)
		if atrybut then
			local brama = xmlNodeGetAttribute(atrybut,"brama_"..ktora_brama)
			if brama == "1" then
				local gracze = fromJSON(xmlNodeGetAttribute(atrybut,"gracze")) or {}
				if gracze == "" then
					gracze = {}
				end
				local lider = xmlNodeGetAttribute(atrybut,"lider")
				if (gracze[getElementData(player,"logedin")] and gracze[getElementData(player,"logedin")]["brama_"..ktora_brama] == "TAK") or lider == getElementData(player,"logedin") then
					triggerEvent("Base_OpenGate",resourceRoot,player,{tonumber(id_bazy),toJSON(gracze)},tonumber(ktora_brama))
				end
				xmlUnloadFile(file)
			else
				xmlUnloadFile(file)
			end
		end
	end
end)
--[[
addCommandHandler("radio", function(player, cmd, baza, url)
	if not url then return end
	if not baza or not tonumber(baza) then return end
	if not getElementData(player, "logedin") then return end
	local file = xmlLoadFile("bazy/baza_"..baza..".xml")
	if file then
		local atrybut = xmlFindChild(file,"informacje",0)
		if atrybut then
			local lider = xmlNodeGetAttribute(atrybut,"lider")
			if lider == getElementData(player, "logedin") then
				local marker = getElementByID("baza_marker_"..baza,0)
				outputChatBox(tostring(bazy_marker[marker]["music_box"]))
				if marker and bazy_marker[marker]["music_box"] then
					setElementData(bazy_marker[marker]["music_box"], "Muza-Radio", url)
					outputChatBox("* Zmieniono muzykę!", player, 255, 0, 0)
				end
			end
			xmlUnloadFile(file)
		end
	end
end)]]

addEvent("setBazaRadio", true)
addEventHandler("setBazaRadio", resourceRoot, function(baza, url, glosnosc)
	local marker = getElementByID("baza_marker_"..baza,0)
	if marker and bazy_marker[marker]["music_box"] then
		setElementData(bazy_marker[marker]["music_box"], "Muza-Radio", url)
		setElementData(marker, "Muza-Radio", url)
		setElementData(bazy_marker[marker]["music_box"], "Muza-glosnosc", glosnosc)
		triggerClientEvent(client, "stworz_notyfikacje", client, "sucess", "Zmieniono radio!")
	end
end)

local tp_veh = {-3609.5712890625,68.0576171875,-0.55000001192093}


function removeAllVehicles(cuboid, id)
	local back_pos = getElementData(cuboid,'back_pos')
	local x, y, z = getElementPosition(cuboid)
	local size = Vector3(getColShapeSize(cuboid))
	local new_col = createColCuboid(x, y, z, size.x, size.y, size.z)
	for i,v in pairs(getElementsWithinColShape(new_col)) do
		if getElementType(v) == "player" then
			setElementPosition(v,unpack(back_pos))
		elseif getElementType(v) == "vehicle" then
			setElementFrozen(v,false)
			setVehicleDamageProof(v,true)
			setElementPosition(v,unpack(tp_veh))
		elseif getElementType(v) == "object" then
			if getElementData(v, "parent") then
				destroyElement(getElementData(v, "parent"))
				destroyElement(v)
			end
		end
	end
	for i, v in pairs(getElementsByType("colshape")) do
		if getElementData(v, "Tent-Otwieranie") == tonumber(id) or getElementData(v, "Tent-Otwieranie") == tostring(id) then
			if getElementData(v, "parent") then
				destroyElement(getElementData(v, "parent"))
				destroyElement(v)
			end
		end
	end
	destroyElement(new_col)
end


function removeBaseOwner(marker,atrybut)
	local lider = bazy_marker[marker]['lider']
	local machinKurwa = getAccountPlayer(getAccount(lider))
	local global_id = getAccountData(getAccount(lider),"Global_Base_Id") or {}
	if machinKurwa then
		outputChatBox("* Nie opłaciłeś bazy, została ona usunięta!",machinKurwa,255,255,255)
		local bases_id = fromJSON((getElementData(machinKurwa,"Global_Base_Id") or {}))
		bases_id[bazy_marker[marker]["id"]] = nil
		setElementData(machinKurwa,"Global_Base_Id",toJSON(bases_id))
		setPickupType(bazy_marker[marker]["Pickup"],3,1273,0)
	else
		local bases_id = fromJSON(global_id) or {}
		bases_id[bazy_marker[marker]["id"]] = nil
		setAccountData(getAccount(lider),"Global_Base_Id",toJSON(bases_id))
		setPickupType(bazy_marker[marker]["Pickup"],3,1273,0)
	end
	setElementData(marker,"Blip_id",31)
	setMarkerColor(marker,0,255,0,0)
	
	for i,v in pairs(fromJSON(bazy_marker[marker]["gracze"])) do
		local konto = getAccount(i)
		if konto then
			local ides = fromJSON((getAccountData(konto,"Global_Base_Id") or {}))
			ides[bazy_marker[marker]["id"]] = nil
			setAccountData(konto,"Global_Base_Id",toJSON(ides))
		end
	end
	bazy_marker[marker]["lider"] = "-"
	bazy_marker[marker]["kupione"] = "Nie"
	bazy_marker[marker]["dni"] = "-"
	bazy_marker[marker]["grupa"] = ""
	bazy_marker[marker]["cena"] = xmlNodeGetAttribute(atrybut, "cena")
	bazy_marker[marker]["gracze"] = ""
	bazy_marker[marker]["baza_ulepszenie"] = 0
	xmlNodeSetAttribute(atrybut,'lider',"-")
	xmlNodeSetAttribute(atrybut,'kupione',"Nie")
	xmlNodeSetAttribute(atrybut,'baza_ulepszenie', 0)
	setElementData(marker,"Marker-Opis", xmlNodeGetAttribute(atrybut, "cena").." "..bazy_marker[marker]["platnosc"])
	xmlNodeSetAttribute(atrybut,'dni',"-")
	xmlNodeSetAttribute(atrybut,'grupa',"")
	xmlNodeSetAttribute(atrybut,'gracze',"")
	exports["db-mysql"]:dbSet("UPDATE Bazy SET cena=?, kupione=?,grupa=?,dni=?,blip=?,lider=? WHERE id=?",bazy_marker[marker]["cena"],bazy_marker[marker]["kupione"],bazy_marker[marker]["grupa"],bazy_marker[marker]["dni"],getElementData(marker, "Blip_id"),bazy_marker[marker]["lider"],bazy_marker[marker]["id"])
end

function removeOneDay()
	for i=1,99999 do
		if not fileExists("bazy/baza_"..i..".xml") then break end
		local file = xmlLoadFile("bazy/baza_"..i..".xml")
		if file then
			local atrybut = xmlFindChild(file,'informacje',0)
			if atrybut then
				local id = xmlNodeGetAttribute(atrybut,'id_bazy')
				local marker = getElementByID("baza_marker_"..id,0)
				if marker and bazy_marker[marker]['kupione'] == "Tak" then
					bazy_marker[marker]["dni"] = tonumber(bazy_marker[marker]["dni"]) - 1
					if tonumber(bazy_marker[marker]["dni"]) <= 0 then
						removeAllVehicles(bazy_marker[marker]['col'], id)
						removeBaseOwner(marker,atrybut)
					end
					xmlNodeSetAttribute(atrybut,'dni',bazy_marker[marker]["dni"])
					exports["db-mysql"]:dbSet("UPDATE Bazy SET dni=? WHERE id=?",bazy_marker[marker]["dni"],id)
				end
			end
			xmlSaveFile(file)
			xmlUnloadFile(file)
		end
	end
end
--addCommandHandler("removeOneDay",removeOneDay)

local time_checked = false


setTimer(function()
	local time = getRealTime().hour
	if time == 0 then
		if not time_checked then
			time_checked = true
			removeOneDay()
		end
	else
		time_checked = false
	end
end,60000,0)

for i,v in pairs(getElementsByType("player")) do
	bindKey(v,"F2","down",openPanel)
end

addEventHandler('onPlayerJoin',root,function()
	bindKey(source,"F2","down",openPanel)
end)
--[[
setTimer(function()
	for _,marker in pairs(getElementsByType("marker",resourceRoot)) do
		if bazy_marker[marker]['platnosc'] == "GP" then
			local id = bazy_marker[marker]['id']
			local xml = xmlLoadFile("bazy/baza_"..id..".xml")
			local child = xmlFindChild(xml,"informacje",0)
			local cena = xmlNodeGetAttribute(child,"cena")
			xmlNodeSetAttribute(child,"cena",tonumber(cena) * 3.5)
			xmlSaveFile(xml)
			xmlUnloadFile(xml)
		end
	end
end,50,1)]]

--[[
setTimer(function()
	for _,marker in pairs(getElementsByType("marker",resourceRoot)) do
			local id = bazy_marker[marker]['id']
			local xml = xmlLoadFile("bazy/baza_"..id..".xml")
			local child = xmlFindChild(xml,"informacje",0)
			xmlNodeSetAttribute(child, "baza_ulepszenie", 0)
			xmlSaveFile(xml)
			xmlUnloadFile(xml)
	end
end,50,1)]]

--[[
setTimer(function()
	for _,marker in pairs(getElementsByType("marker",resourceRoot)) do
		local id = bazy_marker[marker]['id']
		local xml = xmlLoadFile("bazy/baza_"..id..".xml")
		local child = xmlFindChild(xml,"informacje",0)
		local cena = tonumber( xmlNodeGetAttribute(child,"cena") )
		local naziemne = 1
		local lotne = 0
		if bazy_marker[marker]['platnosc'] == "GP" then
			naziemne = math.ceil(cena / 7000)
			naziemne = naziemne * 2
			lotne = math.ceil(cena / 7000)
		else
			lotne = math.ceil(cena / 10)
			naziemne = math.ceil(cena / 10)
			naziemne = naziemne * 2
		end
		if bazy_marker[marker]['platnosc'] == "GP" and cena <= 4500 then
			naziemne = 1
			lotne = 0
		end
		xmlNodeSetAttribute(child, "limit_lotne", lotne)
		xmlNodeSetAttribute(child, "limit_naziemnych", naziemne)
		xmlSaveFile(xml)
		xmlUnloadFile(xml)
	end
end,50,1)]]

-- zwiekszona cena baz o 1.7 jak cos





function Bases_GetAllBases()
	local tabela = {}
	for i,v in pairs(getElementsByType('marker',resourceRoot)) do
		if bazy_marker[v] then
			local x,y = getElementPosition(v)
			local lider =  bazy_marker[v] and bazy_marker[v]["lider"] or "Brak"
			local cena = bazy_marker[v]["cena"] or 9999999
			local blip = (bazy_marker[v]["kupione"] == "Tak" and 32)
			if bazy_marker[v]['kupione'] == "Nie" then
				lider = "Brak"
				blip = 31
			end
			table.insert(tabela,{x,y,blip,lider,cena,bazy_marker[v]["platnosc"]})
		end
	end
	if #tabela>0 then
		return tabela
	end
	return false
end
--[[
for i,v in pairs(getElementsByType("object",resourceRoot)) do
	createBlipAttachedTo(v,34)
end
]]

function doBaseBackup()
	local tajm = getRealTime()
	local text = (1900 + tajm.year).."-"..(tajm.month + 1).."-"..(tajm.monthday).."-"..tajm.hour
	for i=1,9999 do
		if fileExists("bazy/baza_"..i..".xml") then
			fileCopy("bazy/baza_"..i..".xml","backupy/"..text.."/".."/baza_"..i..".xml",true)
		else
			break
		end
	end
end
-- doBaseBackup()
setTimer(doBaseBackup,3600000 * 24,0)
--[[
setTimer(function()
	for i,v in pairs(bazy_marker) do
		local konto = getAccount(v["lider"])
		if getAccountData(konto,"Grupa") then
			local grupa = fromJSON(getAccountData(konto,"Grupa"))
			if grupa.nazwa == "undead" then
				outputChatBox(v["id"])
			end
		end
	end
end,500,1)]]

addEvent("UlepszBaze", true)
addEventHandler("UlepszBaze", resourceRoot, function(id)
	local marker = getElementByID("baza_marker_"..id, 0)
	if bazy_marker[marker]["kupione"] == "Nie" then 
		triggerClientEvent(client, "stworz_notyfikacje", client, "error", "Baza nie została kupiona!")
		return
	end
	local rodzaj = bazy_marker[marker]["platnosc"]
	local ulepszenie = bazy_marker[marker]["baza_ulepszenie"]
	if ulepszenie >= 3 then
		triggerClientEvent(client, "stworz_notyfikacje", client, "error", "Osiągnięto limit ulepszeń!")
		return
	end
	if rodzaj == "PP" then
		if (getElementData(client, "PP") or 0) < 15 then
			triggerClientEvent(client, "stworz_notyfikacje", client, "error", "Nie stać Cię na ulepszenie!")
			return
		end
	elseif rodzaj == "GP" then
		if (getElementData(client, "GP") or 0) < 10000 then
			triggerClientEvent(client, "stworz_notyfikacje", client, "error", "Nie stać Cię na ulepszenie!")
			return
		end
	end
	if marker then
		local connect = xmlLoadFile("bazy/baza_"..id..".xml")
		local child = xmlFindChild(connect, "informacje", 0)
		if connect then
			if rodzaj == "PP" then
				setElementData(client, "PP", getElementData(client, "PP") - 15)
				bazy_marker[marker]["cena"] = bazy_marker[marker]["cena"] + 15
				setElementData(marker,"Marker-Opis", bazy_marker[marker]["cena"].." PP")
			else
				setElementData(client, "GP", getElementData(client, "GP") - 10000)
				bazy_marker[marker]["cena"] = bazy_marker[marker]["cena"] + 10000
				setElementData(marker,"Marker-Opis", bazy_marker[marker]["cena"].." GP")
			end
			
			bazy_marker[marker]["baza_ulepszenie"] = ulepszenie + 1
			
			xmlNodeSetAttribute(child, "baza_ulepszenie", ulepszenie + 1)
			xmlSaveFile(connect)
			xmlUnloadFile(connect)
			triggerClientEvent(client, "stworz_notyfikacje", client, "sucess", "Kupiłeś ulepszenie!")
			triggerClientEvent(client, "PokazGUI", resourceRoot, true, bazy_marker[marker], true, true)
		end
	end
end)


function seachDelTarget(id)
	for i,v in pairs(bazy_marker) do
		if v["id"] == id then
			return v
		end
	end
	return false
end

function usunBaze(p,cmd,id)
	local acc = getElementData(p,"logedin")
	if not acc then return end
	if not id then return end
	if isObjectInACLGroup("user."..acc,aclGetGroup("Admin")) then
		local v = seachDelTarget(id)
		if v then
			local connect = xmlLoadFile("bazy/baza_"..v["id"]..".xml")
			local marker = getElementByID("baza_marker_"..v["id"],0)
			if connect and marker then
				local atrybut = xmlFindChild(connect,"informacje",0)
				removeAllVehicles(v['col'], tonumber(v["id"]))
				removeBaseOwner(marker,atrybut)
				xmlSaveFile(connect)
				xmlUnloadFile(connect)
				outputChatBox("* Usunięto baze o id: #FF0000"..v["id"].."#FFFFFF, której właścicielem był: #FF0000"..v["lider"],p,255,255,255,true)
			end
		else
			outputChatBox("* Niepoprawne id",p,255,255,255)
		end
	end
end
addCommandHandler("baza.usun",usunBaze)



addCommandHandler("flip",function(player)
	if players_in_col[player] then
		if not getPedOccupiedVehicle(player) then return end
		local rotacja = {getElementRotation(player)}
		setElementRotation(getPedOccupiedVehicle(player),0,0,rotacja[3])
	end
end)


local element_markery = createElement("Baza-Markery-Specjalne")

 
local markery = {
    {
        id_bazy = 56,
        wejscie_pozycja = Vector3(-2111, 364, 42 - 1),
        wyjscie_pozycja = Vector3(-2122,374,68 - 1.5),
    },
 {
        id_bazy = 10,
        wejscie_pozycja = Vector3(-1950,-1088,31 - 1),
        wyjscie_pozycja = Vector3(-1954,-1041,54 - 1.5),
    },
 {
	id_bazy = 71,
        wejscie_pozycja = Vector3(-1706,1018,18 - 1),
        wyjscie_pozycja = Vector3(-1745,1003,96 - 0.9),
    },
 {

        id_bazy = 97,
        wejscie_pozycja = Vector3(-288.00079345703,1510.3908691406,76.372232055664),         
        wyjscie_pozycja = Vector3(-360.10879516602,1555.9658203125,99.98468902588),
   },
 {
        id_bazy = 57,
        wejscie_pozycja = Vector3(2547,2133,11 - 0.9),
        wyjscie_pozycja = Vector3(2548,2163,42 - 0.9),
      },
{
        id_bazy = 23,
        wejscie_pozycja = Vector3(1512,-1458,10 - 0.9),
        wyjscie_pozycja = Vector3(1512,-1458,64 - 0.5),
      },
{
        id_bazy = 3,
        wejscie_pozycja = Vector3(-2171,243,36 - 1.4),
        wyjscie_pozycja = Vector3(-2171,270,53 - 1.6),
      },
{
        id_bazy = 1,
        wejscie_pozycja = Vector3(-2751,210,7 - 1.2),
        wyjscie_pozycja = Vector3(-2751,210,16 - 1.2),
      },
{
        id_bazy = 66,
        wejscie_pozycja = Vector3(1316,2643,11 - 0.8),
        wyjscie_pozycja = Vector3(1266,2645,23 - 0.8),
      },
{
        id_bazy = 19,
        wejscie_pozycja = Vector3(1033,1300,21 - 0.8),
        wyjscie_pozycja = Vector3(1042,1290,36 - 0.8),
      },
{
        id_bazy = 24,
        wejscie_pozycja = Vector3(2028,-1307,21 - 0.8),
        wyjscie_pozycja = Vector3(2036,-1310,31 - 1.4),
      },
{
        id_bazy = 90,
        wejscie_pozycja = Vector3(286.8193359375,1337.1630859375,10.5859375 - 0.6),
        wyjscie_pozycja = Vector3(285.333984375,1338.1943359375,34.504688262939 - 0.6),
      },
{
        id_bazy = 90,
        wejscie_pozycja = Vector3(284.0048828125,1337.2275390625,10.5859375 - 0.6),
        wyjscie_pozycja = Vector3(213.26522827148,1430.7585449219,69.604690551758 - 0.6),
      },
{
        id_bazy = 31,
        wejscie_pozycja = Vector3(2153,1472,11 - 0.8),
        wyjscie_pozycja = Vector3(2141,1461,32 - 1.5),
      },
{
        id_bazy = 25,
        wejscie_pozycja = Vector3(1930,1231,19 - 1.3),
        wyjscie_pozycja = Vector3(1958,1231,43 - 0.8),
      },
{
        id_bazy = 41,
        wejscie_pozycja = Vector3(1980,1808,24 - 1.5),
        wyjscie_pozycja = Vector3(1979,1833,36 - 1.5),
      },
{
        id_bazy = 77,
        wejscie_pozycja = Vector3(1029,-1105,24 - 1.4),
        wyjscie_pozycja = Vector3(1027,-1106,36 - 1.2),
      },
{
        id_bazy = 89,
        wejscie_pozycja = Vector3(-1485,1188,8 - 1.6),
        wyjscie_pozycja = Vector3(-1485,1188,17 - 0.8),
      },
{
        id_bazy = 32,
        wejscie_pozycja = Vector3(-2272,6,40 - 1.6),
        wyjscie_pozycja = Vector3(-2285,-17,46 - 0.8),
      },
{
        id_bazy = 30,
        wejscie_pozycja = Vector3(2858.5947265625,1623.1142578125,10.2203125),
        wyjscie_pozycja = Vector3(2858.5947265625,1623.1142578125,17.923425674438),
      },
{
        id_bazy = 35,
        wejscie_pozycja = Vector3(479.0751953125,-1476.427734375,19.039335632324),
        wyjscie_pozycja = Vector3(479.39608764648,-1476.3460693359,29.2046875),
      },
{
        id_bazy = 47,
        wejscie_pozycja = Vector3(1785.23828125,-2296.205078125,-3.0130577087402),
        wyjscie_pozycja = Vector3(1781.4970703125,-2299.580078125,26.296022415161),
      },
{
        id_bazy = 29,
        wejscie_pozycja = Vector3(2094.5244140625,2185.6728515625,10.3203125),
        wyjscie_pozycja = Vector3(2072.0883789062,2185.3579101562,22.40468788147),
      },
	{
        id_bazy = 13,
        wejscie_pozycja = Vector3(2358.4619140625,1682.3056640625,10.6234375),
        wyjscie_pozycja = Vector3(2360.1477050781,1679.7980957031,18.75468788147),
      },
	{
        id_bazy = 22,
        wejscie_pozycja = Vector3(1560.9267578125,-1884.53125,13.157594299316),
        wyjscie_pozycja = Vector3(1559.3181152344,-1897.4410400391,23.2890625),
      },	
	 {
        id_bazy = 85,
        wejscie_pozycja = Vector3(1899.763671875,2412.416015625,10.3203125),
        wyjscie_pozycja = Vector3(1899.7633056641,2412.4162597656,22.284687042236),
      },
	{
        id_bazy = 39,
        wejscie_pozycja = Vector3(2766.7890625,-1603.4296875,10.421875),
        wyjscie_pozycja = Vector3(2769.8459472656,-1604.0793457031,21.40468788147),
      },
	  {
        id_bazy = 60,
        wejscie_pozycja = Vector3(1155.49500, 2209.03027, 10.32031),
        wyjscie_pozycja = Vector3(1126.6494140625,2189.0361328125,16.633213043213),
      },
	  {
        id_bazy = 73,
        wejscie_pozycja = Vector3(-2121.83203125,648.4599609375,52.370384216309),
        wyjscie_pozycja = Vector3(-2121.763671875,649,62.389060974121),
      },
	  {
        id_bazy = 36,
        wejscie_pozycja = Vector3(-2665.2109375,1367.8179931641,21.13906211853),
        wyjscie_pozycja = Vector3(-2665.5454101562,1367.8763427734,40.854685974121),
      },
 }


local wejscie_tick = {}


for i, v in pairs(markery) do
	local marker_wejscie = createMarker(v.wejscie_pozycja, "cylinder", 2.0, 0, 255, 0, 100)
	local marker_wyjscie = createMarker(v.wyjscie_pozycja, "cylinder", 2.0, 255, 0, 0, 100)
	
	setElementData(marker_wejscie, "marker-back", marker_wyjscie, false)
	setElementData(marker_wyjscie, "marker-back", marker_wejscie, false)
	setElementData(marker_wyjscie, "marker-base", v.id_bazy, false)
	setElementData(marker_wejscie, "marker-base", v.id_bazy, false)
	
	setElementParent(marker_wejscie, element_markery)
	setElementParent(marker_wyjscie, element_markery)
end


addEventHandler("onMarkerHit", element_markery, function(player)
	if getElementType(player) ~= "player" then return end
	if isPedInVehicle(player) then return end
	if (wejscie_tick[player] or 0) > getTickCount() then return end
	local id = getElementData(source, "marker-base")
	local marker = getElementByID("baza_marker_"..id, 0)
	if marker then
		local baza_gracze = fromJSON(bazy_marker[marker]["gracze"]) or {}
		local baza_grupa = fromJSON(bazy_marker[marker]['grupa']) or {}
		
		local konto = getElementData(player, "logedin")
		local grupa = getElementData(player, "Grupa") and getElementData(player, "Grupa").nazwa or ""
		
		if baza_gracze[getElementData(player,"logedin")] or baza_gracze[grupa] or getElementData(player, "Administrator-Open") or getElementData(player,"gokupomocnik") then
			local pos = Vector3(getElementPosition(getElementData(source, "marker-back")))
			wejscie_tick[player] = getTickCount() + 300
			setElementPosition(player, pos.x, pos.y, pos.z, false)
		end
	end
end)

-- [Johanez Section] --

-- Admin Command --

function addPlayerToBase(player, cmd, ToPlayer, id)
if isObjectInACLGroup("user."..getElementData(player,"logedin"),aclGetGroup("Admin")) then 
	local FromID = exports.DayZ_Id:GetPlayerFromID(tonumber(ToPlayer))
	local FromNick = getPlayerFromName(ToPlayer)

	local target_2

	if FromID then
		target_2 = getPlayerName(FromID)
	elseif FromNick then
		target_2 = ToPlayer
	end

	id = math.floor(tonumber(id))


	if not target_2 then
		outputChatBox("* Nie znaleziono gracza",player,255,255,255,true)
		return
	end
	if not id then
		outputChatBox("* Baza nie zostałą podana!",player,255,0,0)
		return
	end
	outputChatBox("* Dodałeś "..target_2.." do bazy o id "..id..".",player,255,255,255,true)

	local element, data = {}, {};

	element[1] = target_2;
	data[1] = id;
	data[2] = "gracze";

	triggerEvent("Base_add_elements", resourceRoot, player, data, element)
	end
end
addCommandHandler("dajdostep", addPlayerToBase)

function addPlayerToBase2(player, cmd, ToPlayer, id)
if isObjectInACLGroup("user."..getElementData(player,"logedin"),aclGetGroup("Admin")) then 
	local FromID = exports.DayZ_Id:GetPlayerFromID(tonumber(ToPlayer))
	local FromNick = getPlayerFromName(ToPlayer)

	local target_2

	if FromID then
		target_2 = getPlayerName(FromID)
	elseif FromNick then
		target_2 = ToPlayer
	end

	id = math.floor(tonumber(id))


	if not target_2 then
		outputChatBox("* Nie znaleziono gracza",player,255,255,255,true)
		return
	end
	if not id then
		outputChatBox("* Baza nie zostałą podana!",player,255,0,0)
		return
	end
	outputChatBox("* Dodałeś "..target_2.." do bazy o id "..id..".",player,255,255,255,true)

	local element, data = {}, {};

	element[1] = target_2;
	data[1] = id;
	data[2] = "gracze";

	triggerEvent("Base_add_elements1", resourceRoot, player, data, element)
	end
end
addCommandHandler("dajlidera", addPlayerToBase2)

function removePlayerFromBase(player, cmd, ToPlayer, id)
if isObjectInACLGroup("user."..getElementData(player,"logedin"),aclGetGroup("Admin")) then 
	local FromID = exports.DayZ_Id:GetPlayerFromID(tonumber(ToPlayer))
	local FromNick = getPlayerFromName(ToPlayer)

	local target_2

	if FromID then
		target_2 = FromID
	elseif FromNick then
		target_2 = FromNick
	end

	id = math.floor(tonumber(id))


	if not target_2 then
		outputChatBox("* Nie znaleziono gracza",player,255,255,255,true)
		return
	end
	if not id then
		outputChatBox("* Baza nie zostałą podana!",player,255,0,0)
		return
	end
	outputChatBox("* Usunąłeś "..getPlayerName(target_2).." z bazy o id "..id..".",player,255,255,255,true)

	local data = {}, {};

	data[1] = id;
	data[2] = getAccountName(getPlayerAccount(target_2));

	triggerEvent("UsunWynikFromBaza", resourceRoot, player, data, 0)
	end
end
addCommandHandler("usundostep", removePlayerFromBase)

function checkPlayerBases(player, cmd, ToPlayer)
if isObjectInACLGroup("user."..getElementData(player,"logedin"),aclGetGroup("Admin")) then 
	local FromID = exports.DayZ_Id:GetPlayerFromID(tonumber(ToPlayer))
	local FromNick = getPlayerFromName(ToPlayer)

	local target_2

	if FromID then
		target_2 = FromID
	elseif FromNick then
		target_2 = FromNick
	end

	if not target_2 then
		outputChatBox("* Nie znaleziono gracza",player,255,255,255,true)
		return
	end
	outputChatBox("* Lista baz gracza "..getPlayerName(target_2)..":",player,255,255,255,true)

	local bases = getElementData(target_2,"Global_Base_Id") or false

	if not table then outputChatBox(" - Brak - ",player,255,255,255,true) return end
	
	outputChatBox(bases,player,255,255,255,true)
	end
end
addCommandHandler("sprawdzdostep", checkPlayerBases)



-------------------------------------------------------
------------ Sell base section by Johanez -------------
-------------------------------------------------------

--addCommandHandler("sellBase")