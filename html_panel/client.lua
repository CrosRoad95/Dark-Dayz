
local r = {guiGetScreenSize()}
local webBrowser = guiCreateBrowser(0.26,0.20,0.50,0.50, true, false,true)
gett = guiGetBrowser(webBrowser)
guiSetVisible(webBrowser,false)

local stworzone
local pojazdy = false

bindKey("u", "down", "chatbox", "GPSchannel")
local aktualizacje = {
	{"Został dodany nowy system baz.","07.08.2019"},
	{"Została dodany nowy przedmiot - lina.","09.08.2019"},
	{"Został dodany nowy panel grup.","12.08.2019"},
	{"Nowy system odswieżanie łupów, który trwa 2 sekundy.","17.08.2019"},
	{"Została dodana nowa broń - Piła.","19.08.2019"},
	{"Została dodana możliwość wyboru respu po śmierci.","19.08.2019"},
	{"Nowy scoreboard został dodany.","20.08.2019"},
	{"Został zmieniony wygląd panelu logowania.","20.08.2019"},
	{"Na serwer został zaproszony Wielki Brat, który będzie pilnował chat.","22.08.2019"},
	{"Została dodana możliwość zmiany języka [PL/ENG] .","23.08.2019"},
	{"System drabiny zawitał na serwer.","25.08.2019"},
	{"Została dodana strefa z radiacją.","26.08.2019"},
	{"Został dodany anty-relog.","28.08.2019"},
	{"Zostały dodane notyfikacje nad głową.","28.08.2019"},
	{"Stamina została wyłączona.","29.08.2019"},
	{"Zostały dodane informacje o zabójstwie.","29.08.2019"},
	{"Makro została włączone.","29.08.2019"},
	{"Teamkilling został wyłączony. Kolega z grupy już Cie nie zabije.","29.08.2019"},
	{"Został dodany radar w sierodku 51.","29.08.2019"},
	{"Do taba zostały dodane kolumny: wszystkie zabójstwa, cały przeżyty czas.","29.08.2019"},
	{"Zostały dodane rangi za morderstwa.","29.08.2019"},
	{"Zombie zostały dodane.","29.08.2019"},
	{"Nowa podmianka na serwer.","30.08.2019"},
	{"Nowe informacje o pojeździe.","30.08.2019"},
	{"Sklep z GP został dodany na serwer, znajduje się on pod klawiszem F2.","30.08.2019"},
	{"Bug z dodatkowymi slotami naprawiony.","31.08.2019"},
	{"Została dodana możliwość kupna pojazdu, aktualnie można kupić: Infernus, Bobcat, Elegy, Sandking.","31.08.2019"},
	{"Została dodana możliwość craftingu pod J.","05.09.2019"},
	{"Został zmieniony debugmonitor (F5).","05.09.2019"},
	{"Została dodana integracja discord-serwer.","05.09.2019"},
	{"Nowa podmianka wraku.","06.09.2019"},
	{"Zostały naprawione bugi mapy.","06.09.2019"},
	{"Nowe detale tekstur.","06.09.2019"},
	{"Liczba zombie została zwiększona do 467.","06.09.2019"},
	{"Liczba FPS oraz ping zostały przeniesione na prawy górny róg ekranu.","06.09.2019"},
	{"Nowa podmianka piły.","06.09.2019"},
	{"Nowa podmianka spadochroun.","06.09.2019"},
	{"Przedmioty zapisane w pasku szybkiego wyboru będą się zapisywać po ponownym wejściu na serwer.","06.09.2019"},
	{"Na serwer zawitały worki z piachem.","06.09.2019"},
	{"Został dodany panel pod F3, w którym znajdują się zakładki: Informacje, Przedmioty, Ranking, Pojazd..","07.09.2019"},
	{"Do panelu F3 została dodana zakładka Aktualizacje.","07.09.2019"},
}


function allCars()
	local pojazdy = {}
	for i,v in pairs(getElementsByType('vehicle')) do
		if not pojazdy[getVehicleName(v)] then
			pojazdy[getVehicleName(v)] = 1
		else
			pojazdy[getVehicleName(v)] = pojazdy[getVehicleName(v)] + 1
		end
	end
	local new_pojazdy = {test = "<tr><th>Pojazd</th><th>Ilość</th></tr>"}
	for i,v in pairs(pojazdy) do
		--new_pojazdy = new_pojazdy.." <h3 class='with_border'>'"..i..": "..v.."'</h3> <br>"
		--new_pojazdy = new_pojazdy..i..": "..v.." <br> "
		--new_pojazdy = new_pojazdy.." <h3 class=\"with_border\">"..i..": "..v.. "</h3> <br>"
		new_pojazdy.test = new_pojazdy.test.." <tr id = \"ranking_test\"> <td>"..i.."</td> <td>"..v.."</td> </tr>"
	end
	return new_pojazdy.test
end

	
function getAllUpdates()
	local new_pojazdy = ""
	for i,v in pairs(aktualizacje) do
		--new_pojazdy = new_pojazdy.." <h3 class='with_border'>'"..i..": "..v.."'</h3> <br>"
		--new_pojazdy = new_pojazdy..i..": "..v.." <br> "
		--new_pojazdy = new_pojazdy.." <h3 class=\"with_border\">"..i..": "..v.. "</h3> <br>"
		new_pojazdy = new_pojazdy.."<center> <h4>#"..i.." "..v[1].." "..v[2].." </h4> </center>"
		--document.getElementById("mySelect").document.write(new_pojazdy)
	end
	new_pojazdy = new_pojazdy
	executeBrowserJavascript(gett, "document.getElementById('Aktualizacje_Tabela').innerHTML = '" .. new_pojazdy .. "'")  
	--executeBrowserJavascript(gett,"document.getElementById(\"Aktualizacje_Tabela\").document.write("..new_pojazdy..")")
	return new_pojazdy
end

local fogScroll
local objectScroll
bindKey('f3','down',function()
	if not getElementData(localPlayer,'logedin') then return end
	local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	local funkcja = exports.DayZ_Inventory:zwrocCalaTablice()
	executeBrowserJavascript(gett, "document.getElementById('lista_przedmiotow').innerHTML = '" .. funkcja .. "'")  
	local funkcja = getElementData(localPlayer,'GPSchannel') or ""
	executeBrowserJavascript(gett, "document.getElementById('GPS_text').value = '" .. funkcja .. "'")  
	if jezyk =="PL" then
		loadBrowserURL(gett, "http://mta/local/Pliczus.html")
	else
		loadBrowserURL(gett, "http://mta/local/Pliczus2.html")
	end
	if not pojazdy then
		pojazdy = true
		local funkcja = allCars()
		executeBrowserJavascript(gett, "document.getElementById('Pojazdy_table').innerHTML = '" .. funkcja .. "'")  
		funkcja = getAllUpdates()
		--executeBrowserJavascript(gett, "document.getElementById('Aktualizacje_Tabela').innerHTML = '" .. funkcja .. "'")  
	end
	guiSetVisible(webBrowser,not guiGetVisible(webBrowser))  
	if guiGetVisible(webBrowser) then
		showCursor(true)
	else
		showCursor(false)
		if isElement(fogScroll) then
			destroyElement(fogScroll)
			destroyElement(objectScroll)
		end
	end
end)

function OnScroll(Scrolled)
	if guiGetVisible(fogScroll) or guiGetVisible(objectScroll) then
		if source == fogScroll then
			local pos = guiScrollBarGetScrollPosition(fogScroll)
			pos = pos * 1500 / 100
			if pos == 0 then
				pos = 300
			end
			setFogDistance( pos )
			setElementData(localPlayer, 'player:renderFog', pos)
		elseif source == objectScroll then
			local pos = guiScrollBarGetScrollPosition(objectScroll)
			pos = pos * 1500 / 100
			if pos == 0 then
				pos = 300
			end
			setFarClipDistance( pos )
			setElementData(localPlayer, 'player:renderObject', pos)
		end
	end
end
addEventHandler("onClientGUIScroll", resourceRoot, OnScroll)

function posortuj_ranking(tablica)
	table.sort(tablica,function(a,b)
		return a[2]>b[2]
	end)
	local nazwa = "<tr><th>Miejsce</th><th>Nazwa gracza</th><th>Liczba</th></tr>"
	local TwojeMiejsce = 0
	for i,v in pairs(tablica) do
		if i<=100 then
		--new_pojazdy = new_pojazdy.." <h3 class='with_border'>'"..i..": "..v.."'</h3> <br>"
		--new_pojazdy = new_pojazdy..i..": "..v.." <br> "
		--nazwa = nazwa.." <h3 class=\"with_border\" > <span style=\"opacity:0;\">x..</span> #"..i.." <span style=\"opacity:0;\">MMMMMMMMMMMM.</span> "..v[1]..": "..v[2].. "</h3> <br>"
		--nazwa = nazwa.."<h3 id='tekst_glowny' class=\"with_border\">#"..i..""..v[1]..": "..v[2].. "</h3> <br> "
			local player = getPlayerFromName(v[1])
			if getElementData(localPlayer,'logedin') == v[4] then
				nazwa = nazwa.." <tr style=\"background-color:#1CBAA0;\" id = \"ranking_test\"> <td>#"..i.."</td> <td>"..(v[1]:gsub("'","-")):gsub("\"","-").."</td><td>"..v[2].."</td> </tr>"
				TwojeMiejsce = i
			elseif player and localPlayer ~= player then
				nazwa = nazwa.." <tr style=\"background-color:#65d837;\" id = \"ranking_test\"> <td>#"..i.."</td> <td>"..(v[1]:gsub("'","-")):gsub("\"","-").."</td><td>"..v[2].."</td> </tr>"
			else
				nazwa = nazwa.." <tr id = \"ranking_test\"> <td>#"..i.."</td> <td>"..(v[1]:gsub("'","-")):gsub("\"","-").."</td><td>"..v[2].."</td> </tr>"
			end
		else
			if getElementData(localPlayer,'logedin') == v[4] then
				TwojeMiejsce = i
			end
		end
	end
	return nazwa,TwojeMiejsce
end

addEvent('UstawRankingKilli',true)
addEventHandler('UstawRankingKilli',resourceRoot,function(gggg)
	local funkcja,TwojeMiejsce = posortuj_ranking(gggg)
	executeBrowserJavascript(gett, "document.getElementById('321312').innerHTML = '" .. funkcja .. "'")  
	executeBrowserJavascript(gett, "document.getElementById('Twoje_miejsce').innerHTML = 'Twoje miejsce: " .. TwojeMiejsce .. " !'")  
end)


addEvent('Ustaw-Se-Ranking',true)
addEventHandler('Ustaw-Se-Ranking',resourceRoot,function(ranking)
	triggerServerEvent('DajRanking_Graczy',resourceRoot,localPlayer,ranking)
end)

addEvent('html_Ustaw_GPS',true)
addEventHandler("html_Ustaw_GPS",resourceRoot,function(gps)
	triggerServerEvent('Set_GPS',resourceRoot,localPlayer,gps)
end)

addEvent("opusc-gps",true)
addEventHandler("opusc-gps",resourceRoot,function()
	
	local gps = getElementData(localPlayer,'GPSchannel') or false
	if not gps then return end
	triggerServerEvent('opusc_gps',resourceRoot,localPlayer,gps)
end)

addEvent("ustaw-inject-na-zero",true)
addEventHandler("ustaw-inject-na-zero",resourceRoot,function()
	local funkcja = getElementData(localPlayer,'GPSchannel') or ""
	executeBrowserJavascript(gett, "document.getElementById('GPS_text').value = '" .. funkcja .. "'")  
end)

addEvent("TryCode",false)
addEventHandler("TryCode",resourceRoot,function(text,cost)
	if text == "" then
		outputChatBox("* Niepoprawny kod",255,0,0)
		return
	elseif text == "Wpisz_kod" then
		outputChatBox("* Niepoprawny kod",255,0,0)
		return
	end
	triggerServerEvent("DoladujPP",resourceRoot,localPlayer,text,cost)
end)

addEvent("Client_BuyArmybox",true)
addEventHandler("Client_BuyArmybox",resourceRoot,function(typ,cena)
	triggerServerEvent("BuyArmybox",localPlayer,typ,tonumber(cena))
end)

local shader = dxCreateShader("texreplace.fx")

local xml = xmlLoadFile("Celownik.xml")
if not xml then
	xml = xmlCreateFile("Celownik.xml","root")
	xmlNodeSetAttribute(xml,"id","default")
	xmlSaveFile(xml)
else
	local node = xmlNodeGetAttribute(xml,"id")
	if node ~= "default" then
		local texture = dxCreateTexture("celowniki/"..node..".png")
		engineApplyShaderToWorldTexture(shader, "siteM16")
		dxSetShaderValue(shader, "gTexture", texture)
		destroyElement(texture)
		xmlNodeSetAttribute(xml,"id",node)
		xmlSaveFile(xml)
	end
end

addEvent("setCelownik",true)
addEventHandler("setCelownik",resourceRoot,function(nr)
	if nr == "default" then
	local xml = xmlLoadFile('Celownik.xml')
		engineRemoveShaderFromWorldTexture(shader,"siteM16")
		xmlNodeSetAttribute(xml, 'id', nr)
		xmlSaveFile(xml)
		xmlUnloadFile(xml)
	else
		if xml then
			local texture = dxCreateTexture("celowniki/"..nr..".png")
			engineApplyShaderToWorldTexture(shader, "siteM16")
			dxSetShaderValue(shader, "gTexture", texture)
			destroyElement(texture)
			xmlNodeSetAttribute(xml, 'id', nr)
			xmlSaveFile(xml)
			xmlUnloadFile(xml)
		end
	end
	outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] Wybrałeś celownik!",255,255,255,true)
end)

--[[
local nazwa_respu = {
	["Spawn Bullet [1D]"] = {
		dni = 1,
		cena = 5,
		car = "Bullet",
	},
	["Spawn Bullet [3D]"] = {
		dni = 3,
		cena = 15,
		car = "Bullet",
	},
	["Spawn Bullet [7D]"] = {
		dni = 7,
		cena = 25,
		car = "Bullet",
	},
	["Spawn Bullet [30D]"] = {
		dni = 30,
		cena = 60,
		car = "Bullet",
	},
	["Spawn Dodo [1D]"] = {
		dni = 1,
		cena = 8,
		car = "Dodo",
	},
	["Spawn Dodo [3D]"] = {
		dni = 3,
		cena = 20,
		car = "Dodo",
	},
	["Spawn Dodo [7D]"] = {
		dni = 7,
		cena = 50,
		car = "Dodo",
	},
	["Spawn Dodo [30D]"] = {
		dni = 30,
		cena = 70,
		car = "Dodo",
	},
	["Spawn Infernus [1D]"] = {
		dni = 1,
		cena = 15,
		car = "Infernus",
	},
	["Spawn Infernus [3D]"] = {
		dni = 3,
		cena = 30,
		car = "Infernus",
	},
	["Spawn Infernus [7D]"] = {
		dni = 7,
		cena = 60,
		car = "Infernus",
	},
	["Spawn Infernus [30D]"] = {
		dni = 30,
		cena = 120,
		car = "Infernus",
	},
}
]]

local nazwa_respu = {
	["Spawn Bullet [1D]"] = {
		dni = 1,
		cena = 5 - 5 * 0.3,
		car = "Bullet",
		use_type = 1,
	},
	["Spawn Bullet [3D]"] = {
		dni = 3,
		cena = 15 - 15 * 0.3,
		car = "Bullet",
		use_type = 1,
	},
	["Spawn Bullet [7D]"] = {
		dni = 7,
		cena = 25 - 25 * 0.3,
		car = "Bullet",
		use_type = 1,
	},
	["Spawn Bullet [30D]"] = {
		dni = 30,
		cena = 60 - 60 * 0.3,
		car = "Bullet",
		use_type = 1,
	},
	["Spawn Dodo [1D]"] = {
		dni = 1,
		cena = 8 - 8 * 0.3,
		car = "Dodo",
		use_type = 1,
	},
	["Spawn Dodo [3D]"] = {
		dni = 3,
		cena = 20 - 20 * 0.3,
		car = "Dodo",
		use_type = 1,
	},
	["Spawn Dodo [7D]"] = {
		dni = 7,
		cena = 50 - 50 * 0.3,
		car = "Dodo",
		use_type = 1,
	},
	["Spawn Dodo [30D]"] = {
		dni = 30,
		cena = 70 - 70 * 0.3,
		car = "Dodo",
		use_type = 1,
	},
	["Spawn Infernus [1D]"] = {
		dni = 1,
		cena = 15 - 15 * 0.3,
		car = "Infernus",
		use_type = 1,
	},
	["Spawn Infernus [3D]"] = {
		dni = 3,
		cena = 30 - 30 * 0.3,
		car = "Infernus",
		use_type = 1,
	},
	["Spawn Infernus [7D]"] = {
		dni = 7,
		cena = 60 - 60 * 0.3,
		car = "Infernus",
		use_type = 1,
	},
	["Spawn Infernus [30D]"] = {
		dni = 30,
		cena = 120 - 120 * 0.3,
		car = "Infernus",
		use_type = 1,
	},
	["Spawn Bullet [2U]"] = {
		dni = 2,
		cena = 5,
		car = "Bullet",
		use_type = 2,
	},
}

addEvent("Buy-RespPojazdu",true)
addEventHandler("Buy-RespPojazdu",resourceRoot,function(value)
	local nazwa = nazwa_respu[value]
	if not nazwa then return end
	nazwa.nejm = value
	triggerServerEvent("Server-KupResp",localPlayer,nazwa)
end)

