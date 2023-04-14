local gui_tworzenie = {}


-- Tworzenie Grupy
gui_tworzenie['Window'] = guiCreateWindow(0.33, 0.44, 0.34, 0.12, "Tworzenie grupy", true)
guiWindowSetMovable(gui_tworzenie['Window'], false)
guiWindowSetSizable(gui_tworzenie['Window'], false)
gui_tworzenie['Stworz'] = guiCreateButton(0.02, 0.74, 0.21, 0.16, "Stwórz", true, gui_tworzenie['Window'])
gui_tworzenie['Wyjdz'] = guiCreateButton(0.77, 0.74, 0.21, 0.16, "Wyjdz", true, gui_tworzenie['Window'])
gui_tworzenie['Nazwa'] = guiCreateEdit(0.20, 0.42, 0.60, 0.26, "", true, gui_tworzenie['Window'])
gui_tworzenie['Label'] = guiCreateLabel(0.32, 0.22, 0.35, 0.16, "Podaj nazwe grupy:", true, gui_tworzenie['Window'])
guiLabelSetHorizontalAlign(gui_tworzenie['Label'], "center", false)
guiLabelSetVerticalAlign(gui_tworzenie['Label'], "center")
guiSetVisible(gui_tworzenie['Window'],false)
guiEditSetMaxLength(gui_tworzenie['Nazwa'],32)
-- Zamykam posiedzeznie

-- SYSTEM GRUP
local gui_grupy = {}

bindKey("y", "down", "chatbox", "Team");

gui_grupy['Window'] = guiCreateWindow(0.32, 0.27, 0.36, 0.47, "Panel Grupy", true)
guiWindowSetMovable(gui_grupy['Window'], false)
guiWindowSetSizable(gui_grupy['Window'], false)

gui_grupy['Gridlist'] = guiCreateGridList(0.02, 0.06, 0.43, 0.91, true, gui_grupy['Window'])
guiGridListAddColumn(gui_grupy['Gridlist'], "", 0.9)
gui_grupy['Wyjdz'] = guiCreateButton(0.78, 0.87, 0.20, 0.10, "Wyjdz", true, gui_grupy['Window'])
gui_grupy['Add_player'] = guiCreateButton(0.57, 0.31, 0.30, 0.08, "Dodaj gracza", true, gui_grupy['Window'])
gui_grupy['Opusc_grupe'] = guiCreateButton(0.57, 0.21, 0.30, 0.08, "Opuść grupę", true, gui_grupy['Window'])
gui_grupy['Remove_player'] = guiCreateButton(0.57, 0.42, 0.30, 0.08, "Wyrzuć gracza", true, gui_grupy['Window'])
gui_grupy['Set_vlider'] = guiCreateButton(0.57, 0.53, 0.30, 0.08, "Ustaw V-lidera", true, gui_grupy['Window'])
gui_grupy['Delete_group'] = guiCreateButton(0.57, 0.63, 0.30, 0.08, "Usuń grupę", true, gui_grupy['Window'])    
gui_grupy['Notatnik'] = guiCreateButton(0.57, 0.73, 0.30, 0.08, "Informacje", true, gui_grupy['Window'])    
gui_grupy['Zmien_Informacje'] = guiCreateButton(0.57, 0.11, 0.30, 0.08, "Zmien informacje", true, gui_grupy['Window'])    
gui_grupy['Tag_grupy'] = guiCreateButton(0.5, 0.87, 0.2, 0.097, "Tag", true, gui_grupy['Window'])    

guiSetEnabled(gui_grupy['Add_player'],false)
guiSetEnabled(gui_grupy['Remove_player'],false)
guiSetEnabled(gui_grupy['Set_vlider'],false)
guiSetEnabled(gui_grupy['Delete_group'],false)
guiSetEnabled(gui_grupy['Notatnik'],false)
guiSetEnabled(gui_grupy['Tag_grupy'],false)
guiSetVisible(gui_grupy['Window'],false)
-- ZAMYKAM POSIEDZENIE
-- ZAPRASZANIE
local gui_zapraszanie = {}

gui_zapraszanie['Window'] = guiCreateWindow(0.39, 0.29, 0.27, 0.42, "", true)
guiWindowSetMovable(gui_zapraszanie['Window'], false)
guiWindowSetSizable(gui_zapraszanie['Window'], false)

gui_zapraszanie['Gridlist'] = guiCreateGridList(0.02, 0.06, 0.56, 0.91, true, gui_zapraszanie['Window'])
guiGridListAddColumn(gui_zapraszanie['Gridlist'], "Gracze", 0.9)
gui_zapraszanie['Zapros'] = guiCreateButton(0.60, 0.78, 0.38, 0.07, "Wyślij zaproszenie", true, gui_zapraszanie['Window'])
gui_zapraszanie['Wyjdz'] = guiCreateButton(0.60, 0.89, 0.38, 0.07, "Wyjdz", true, gui_zapraszanie['Window'])    
guiSetVisible(gui_zapraszanie['Window'],false)
-- ZAMYKAM POSIEDZENIE
-- POTWIERDZENIE
local gui_potwierdzenie = {}


gui_potwierdzenie['Window'] = guiCreateWindow(0.40, 0.45, 0.21, 0.10, "Potwierdz", true)
guiWindowSetMovable(gui_potwierdzenie['Window'], false)
guiWindowSetSizable(gui_potwierdzenie['Window'], false)

gui_potwierdzenie['Potwierdz_Tak'] = guiCreateButton(0.04, 0.26, 0.25, 0.61, "TAK", true, gui_potwierdzenie['Window'])
gui_potwierdzenie['Potwierdz_Nie'] = guiCreateButton(0.71, 0.26, 0.25, 0.61, "NIE", true, gui_potwierdzenie['Window'])    
guiSetVisible(gui_potwierdzenie['Window'],false)
--ZAKONCZ POSIEDZENIE
--INFORMACJE
local gui_informacje_read = {}

gui_informacje_read['Window'] = guiCreateWindow(0.33, 0.27, 0.34, 0.47, "Informacje", true)
guiWindowSetMovable(gui_informacje_read['Window'], false)
guiWindowSetSizable(gui_informacje_read['Window'], false)

gui_informacje_read['Tekst'] = guiCreateMemo(0.02, 0.06, 0.96, 0.87, "", true, gui_informacje_read['Window'])
guiMemoSetReadOnly(gui_informacje_read['Tekst'], true)
gui_informacje_read['Wyjdz'] = guiCreateButton(0.77, 0.93, 0.18, 0.04, "Zamknij", true, gui_informacje_read['Window'])    
guiSetVisible(gui_informacje_read['Window'],false)
--ZAMYKAM POSIEDZENIE
-- INFORMACJE_EDYCJA
local gui_informacje_edit = {}

gui_informacje_edit['Window'] = guiCreateWindow(0.33, 0.27, 0.34, 0.47, "Informacje", true)
guiWindowSetMovable(gui_informacje_edit['Window'], false)
guiWindowSetSizable(gui_informacje_edit['Window'], false)

gui_informacje_edit['Tekst'] = guiCreateMemo(0.02, 0.06, 0.96, 0.87, "", true, gui_informacje_edit['Window'])
guiMemoSetReadOnly(gui_informacje_edit['Tekst'], false)
gui_informacje_edit['Wyjdz'] = guiCreateButton(0.77, 0.93, 0.18, 0.04, "Zamknij", true, gui_informacje_edit['Window'])    

gui_informacje_edit['Zmien_Informacje'] = guiCreateButton(0.2, 0.93, 0.18, 0.04, "Zmień", true, gui_informacje_edit['Window'])    
guiSetVisible(gui_informacje_edit['Window'],false)


local gui_tag_grupy = {}
gui_tag_grupy["window"] = guiCreateWindow(0.36, 0.35, 0.20, 0.25, "Ustaw tag grupy", true)
guiWindowSetMovable(gui_tag_grupy["window"], false)
guiWindowSetSizable(gui_tag_grupy["window"], false)

gui_tag_grupy["SET TAG"] = guiCreateButton(0.04, 0.78, 0.34, 0.16, "Ustaw tag", true, gui_tag_grupy["window"])
gui_tag_grupy["Remove tag"] = guiCreateButton(0.395, 0.78, 0.34, 0.16, "Usun tag", true, gui_tag_grupy["window"])
gui_tag_grupy["Close"] = guiCreateButton(0.75, 0.78, 0.22, 0.16, "Zamknij", true, gui_tag_grupy["window"])
gui_tag_grupy["Tag"] = guiCreateEdit(0.14, 0.47, 0.72, 0.16, "", true, gui_tag_grupy["window"])
guiEditSetMaxLength(gui_tag_grupy["Tag"],4)
gui_tag_grupy["Label"] = guiCreateLabel(0.27, 0.36, 0.46, 0.08, "Tag grupy:", true, gui_tag_grupy["window"])
guiLabelSetHorizontalAlign(gui_tag_grupy["Label"], "center", false)    
guiSetVisible(gui_tag_grupy["window"],false)

local niedozwolone_slowa = {
	["chuj"] = true,
	["cipa"] = true,
	["siur"] = true,
	["cyce"] = true,
	["fuck"] = true,
	["sex"] = true,
	["sexx"] = true,
}

addEventHandler("onClientGUIClick",gui_tag_grupy["Close"],function(state)
	if state ~= "left" then return end
	guiSetVisible(gui_tag_grupy["window"],false)
end,false)

addEventHandler("onClientGUIClick",gui_tag_grupy["Remove tag"],function(state)
	if state ~= "left" then return end
	triggerServerEvent("removeTag",resourceRoot,localPlayer)
end,false)

addEventHandler("onClientGUIClick",gui_tag_grupy["SET TAG"],function(state)
	if state ~= "left" then return end
	local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	local text = string.gsub(guiGetText(gui_tag_grupy["Tag"]),"%s","")
	if text == "" then
		if jezyk =="PL" then
			outputChatBox("* Nieprawidłowy tag!",255,0,0)
		else
			outputChatBox("* Wrong tag!",255,0,0)
		end
		return
	elseif niedozwolone_slowa[text] then
		if jezyk =="PL" then
			outputChatBox("* Niedozwolony tag!",255,0,0)
		else
			outputChatBox("* Tag not allowed!",255,0,0)
		end
		return
	end
	triggerServerEvent("SetTag",resourceRoot,localPlayer,text)
end,false)



-- ZAMYKAM

local language = {
	['PL'] = {
		['tworzenie'] = "Tworzenie grupy",
		['stworz'] = "Stwórz",
		['zamknij'] = "Zamknij",
		['nazwagrupy'] = "Podaj nazwe grupy:",
		['wyjdz'] = "Zamknij",
		['add'] = "Dodaj gracza",
		['leave'] = "Opuść",
		['removeplayer'] = "Wyrzuć gracza",
		['setlider'] = "Ustaw V-Lider",
		['usungrupe'] = "Usuń grupe",
		['notki'] = "Informacje",
		['zmien'] = "Zmień informacje",
		['potwiedz'] = "Potwierdzenie",
		['takk'] = "Tak",
		['nein'] = "Nie",
		['zmiana'] = "Zmień",
		['gracz'] = "Gracze",
		['send'] = "Wyślij zaproszenie",
		['taggrup'] = "Ustaw Tag grupy",
		['send'] = "Wyślij zaproszenie",
		['settag'] = "Ustaw Tag",
		['removetag'] = "Usuń Tag",
		['taggrupy'] = "Tag grupy",
	},
	['ENG'] = {
		['tworzenie'] = "Group creator",
		['stworz'] = "Create",
		['zamknij'] = "Close",
		['nazwagrupy'] = "Set your group name:",
		['wyjdz'] = "Close",
		['add'] = "Add player",
		['leave'] = "Leave",
		['removeplayer'] = "Kick player",
		['setlider'] = "Set V-Lider",
		['usungrupe'] = "Remove group",
		['notki'] = "Information",
		['zmien'] = "Change information",
		['potwiedz'] = "Confirmation",
		['takk'] = "Yes",
		['zmiana'] = "Change",
		['nein'] = "No",
		['gracz'] = "Players",
		['taggrup'] = "Set group Tag",
		['send'] = "Send invite",
		['settag'] = "Set Tag",
		['removetag'] = "Remove Tag",
		['taggrupy'] = "Group Tag",
	},
}

function refresz()
local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	 guiGridListSetColumnTitle(gui_zapraszanie['Gridlist'],1, language[jezyk]['gracz'])
	 guiSetText(gui_tworzenie['Window'], language[jezyk]['tworzenie'])
	 guiSetText(gui_tworzenie['Stworz'], language[jezyk]['stworz'])
	 guiSetText(gui_tworzenie['Wyjdz'], language[jezyk]['zamknij'])
	 guiSetText(gui_tworzenie['Label'], language[jezyk]['nazwagrupy'])
	 guiSetText(gui_grupy['Wyjdz'], language[jezyk]['wyjdz'])
	 guiSetText(gui_grupy['Add_player'], language[jezyk]['add'])
	 guiSetText(gui_grupy['Opusc_grupe'], language[jezyk]['leave'])
	 guiSetText(gui_grupy['Remove_player'], language[jezyk]['removeplayer'])
	 guiSetText(gui_grupy['Set_vlider'], language[jezyk]['setlider'])
	 guiSetText(gui_grupy['Delete_group'], language[jezyk]['usungrupe'])
	 guiSetText(gui_grupy['Notatnik'], language[jezyk]['notki'])
	 guiSetText(gui_grupy['Zmien_Informacje'], language[jezyk]['zmien'])
	 guiSetText(gui_potwierdzenie['Window'] , language[jezyk]['potwiedz'])
	 guiSetText(gui_informacje_read['Window'] , language[jezyk]['notki'])
	 guiSetText(gui_potwierdzenie['Potwierdz_Tak'] , language[jezyk]['takk'])
	 guiSetText(gui_potwierdzenie['Potwierdz_Nie'] , language[jezyk]['nein'])
	 guiSetText(gui_informacje_edit['Zmien_Informacje'] , language[jezyk]['zmiana'])
	 guiSetText(gui_informacje_edit['Wyjdz'] , language[jezyk]['zamknij'])
	 guiSetText(gui_informacje_read['Wyjdz'] , language[jezyk]['zamknij'])
	 guiSetText(gui_zapraszanie['Zapros'] , language[jezyk]['send'])
	 guiSetText(gui_zapraszanie['Wyjdz'] , language[jezyk]['zamknij'])
	 guiSetText(gui_tag_grupy["window"] , language[jezyk]['taggrup'])
	 guiSetText(gui_tag_grupy["SET TAG"] , language[jezyk]['settag'])
	 guiSetText(gui_tag_grupy["Remove tag"] , language[jezyk]['removetag'])
	 guiSetText(gui_tag_grupy["Close"] , language[jezyk]['zamknij'])
	 guiSetText(gui_tag_grupy["Label"] , language[jezyk]['taggrupy'])
end

local tick = getTickCount()
local TypPotwierdzenia = nil

function zapraszanie_refreshGridList()
	guiGridListClear(gui_zapraszanie['Gridlist'])
	for i,v in pairs(getElementsByType('player')) do
		if not getElementData(v,'Grupa') then
			local row = guiGridListAddRow(gui_zapraszanie['Gridlist'])
			guiGridListSetItemText(gui_zapraszanie['Gridlist'],row,1,getPlayerName(v):gsub("#%x%x%x%x%x%x",""),false,false)
			guiGridListSetItemData(gui_zapraszanie['Gridlist'],row,1,getPlayerName(v))
		end
	end
end

addEventHandler('onClientGUIClick',gui_informacje_read['Wyjdz'],function(state)
	if state~='left' then return end
	guiSetVisible(gui_informacje_read['Window'],false)
end,false)


addEventHandler('onClientGUIClick',gui_informacje_edit['Wyjdz'],function(state)
	if state~='left' then return end
	guiSetVisible(gui_informacje_edit['Window'],false)
end,false)

local tick_informacje = getTickCount()

addEventHandler('onClientGUIClick',gui_grupy['Notatnik'],function(state)
	if state ~= 'left' then return end
	local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	guiSetVisible(gui_informacje_read['Window'],not guiGetVisible(gui_informacje_read['Window']))
	guiBringToFront(gui_informacje_read['Window'])
	if tick_informacje then
		if tick_informacje>getTickCount() then return end
	end
	if jezyk =="PL" then
		guiSetText(gui_informacje_read['Tekst'],'TRWA ŁADOWANIE DANYCH!')
	else
		guiSetText(gui_informacje_read['Tekst'],'DATA LOADING!')
	end
	triggerServerEvent("DajDane_informacje",resourceRoot,localPlayer)
	tick_informacje = getTickCount() + 5000
end,false)

addEventHandler('onClientGUIClick',gui_informacje_edit['Zmien_Informacje'],function(state)
	if state~='left' then return end
	local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	local text = guiGetText(gui_informacje_edit['Tekst'])
	if text:len()>3000 then
	if jezyk =="PL" then
		outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Maksymalnie może być 3000 znaków w informacjach!",255,255,255,true)
	else
		outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] There can be a maximum of 3000 characters in the information!",255,255,255,true)
	end
		return
	end
	guiSetVisible(gui_informacje_edit['Window'],false)
	triggerServerEvent("ustawInformacje",resourceRoot,localPlayer,text)
end,false)


addEventHandler('onClientGUIClick',gui_grupy['Zmien_Informacje'],function(state)
	if state ~= 'left' then return end
	guiSetVisible(gui_informacje_edit['Window'],not guiGetVisible(gui_informacje_edit['Window']))
	guiBringToFront(gui_informacje_edit['Window'])
end,false)


addEvent('UstawInformacje',true)
addEventHandler('UstawInformacje',resourceRoot,function(informacje)
	guiSetText(gui_informacje_read['Tekst'],informacje)
end)

addEventHandler('onClientGUIClick',gui_grupy['Opusc_grupe'],function(state)
	if state~='left' then return end
	local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	if getElementData(localPlayer,'Grupa').ranga == "Lider" then
	if jezyk =="PL" then
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Jako lider nie możesz opuścić grupy!",255,255,255,true)
		else
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] As a leader, you cannot leave the group!",255,255,255,true)
	end	
		return
	end
	triggerServerEvent("opuscGrupe",resourceRoot,localPlayer)
end,false)

addEventHandler('onClientGUIClick',gui_grupy['Set_vlider'],function(state)
	if state~='left' then return end
	local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	local itemName = guiGridListGetItemText(gui_grupy['Gridlist'],guiGridListGetSelectedItem(gui_grupy['Gridlist']),1)
	if itemName=="" then
		if jezyk =="PL" then
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Wybierz osobę!",255,255,255,true)
		else
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Select one player!",255,255,255,true)
		end	
		return
	end
	local itemData = guiGridListGetItemData(gui_grupy['Gridlist'],guiGridListGetSelectedItem(gui_grupy['Gridlist']),1)
	if itemData=="Lider" then
		if jezyk =="PL" then
			outputChatBox("#FFFFFF[#ed7600The-DayZ#FFFFFF] Posiadasz już wyższą rangę!",255,255,255,true)
		else
			outputChatBox("#FFFFFF[#ed7600The-DayZ#FFFFFF] You already have a higher rank!",255,255,255,true)
		end	
		return
	end
	triggerServerEvent("SetV-Lider",resourceRoot,localPlayer,itemName)
end,false)

addEventHandler('onClientGUIClick',gui_grupy['Add_player'],function(state)
	if state ~= 'left' then return end
	zapraszanie_refreshGridList()
	guiSetVisible(gui_zapraszanie['Window'],not guiGetVisible(gui_zapraszanie['Window']))
	guiBringToFront(gui_zapraszanie['Window'])
end,false)

addEventHandler('onClientGUIClick',gui_grupy['Gridlist'],function()
	local itemData = guiGridListGetItemData(gui_grupy['Gridlist'],guiGridListGetSelectedItem(gui_grupy['Gridlist']),1)
	local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	if itemData=="V-Lider" then
		if jezyk =="PL" then
			guiSetText(gui_grupy['Set_vlider'],"Zdegraduj na członka")
		else
			guiSetText(gui_grupy['Set_vlider'],"Degrad player")
		end
	else
		if jezyk =="PL" then
			guiSetText(gui_grupy['Set_vlider'],"Ustaw V-lidera")
		else
			guiSetText(gui_grupy['Set_vlider'],"Set V-lider")
		end
	end
end,false)

addEventHandler('onClientGUIClick',gui_grupy['Remove_player'],function(state)
	if state~='left' then return end
	local itemName = guiGridListGetItemText(gui_grupy['Gridlist'],guiGridListGetSelectedItem(gui_grupy['Gridlist']),1)
	local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	if itemName == "" then
		if jezyk =="PL" then
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Wybierz osobę którą chcesz wyrzucić!",255,255,255,true)
		else
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Choose the person you want to kick out!",255,255,255,true)
		end
		return
	end
	local itemData = guiGridListGetItemData(gui_grupy['Gridlist'],guiGridListGetSelectedItem(gui_grupy['Gridlist']),1)
	if itemData == "Lider" then
		if jezyk =="PL" then
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Nie możesz wyrzucić lidera!",255,255,255,true)
		else
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] You cannot kick the leader!",255,255,255,true)
		end
		return
	end
	if itemData == getElementData(localPlayer,'Grupa').ranga then
		if jezyk =="PL" then
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Ta osoba ma taką samą range jak Ty, nie możesz Jej wyrzucić!",255,255,255,true)
		else
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] This person has the same rank as you, you cannot kick them out!",255,255,255,true)
		end
		return
	end
	
	triggerServerEvent("usunPlayer",resourceRoot,localPlayer,itemName)
end,false)

addEventHandler('onClientGUIClick',gui_grupy['Delete_group'],function(state)
	if state~='left' then return end
	TypPotwierdzenia = "Usun Grupe"
	guiSetVisible(gui_potwierdzenie['Window'],not guiGetVisible(gui_potwierdzenie['Window']))
	guiBringToFront(gui_potwierdzenie['Window'])
end,false)

addEventHandler('onClientGUIClick',gui_grupy['Tag_grupy'],function(state)
	if state~='left' then return end
	guiSetVisible(gui_tag_grupy['window'],not guiGetVisible(gui_tag_grupy['window']))
	guiBringToFront(gui_tag_grupy['window'])
	guiSetInputMode('no_binds_when_editing')
end,false)

addEventHandler('onClientGUIClick',gui_potwierdzenie['Potwierdz_Nie'],function(state)
	if state~='left' then return end
	guiSetVisible(gui_potwierdzenie['Window'],false)
end,false)

addEventHandler('onClientGUIClick',gui_potwierdzenie['Potwierdz_Tak'],function(state)
	if state~='left' then return end
	local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	if getElementData(localPlayer,'Grupa').ranga ~= "Lider" then
		if jezyk =="PL" then
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Nie jesteś liderem aby usunąć grupę!",255,255,255,true)
		else
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] You are not the leader to delete the group!",255,255,255,true)
		end
		return
	end
	triggerServerEvent("usun_grupe",resourceRoot,localPlayer)
	guiSetVisible(gui_zapraszanie['Window'],false)
	guiSetVisible(gui_potwierdzenie['Window'],false)
	guiSetVisible(gui_grupy['Window'],not guiGetVisible(gui_grupy['Window']))
	showCursor(false)
end,false)

addEventHandler('onClientGUIClick',gui_zapraszanie['Zapros'],function(state)
	if state~='left' then return end
	local itemName = guiGridListGetItemData(gui_zapraszanie['Gridlist'],guiGridListGetSelectedItem(gui_zapraszanie['Gridlist']),1)
	local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	if not itemName then
		if jezyk =="PL" then
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Wybierz osobę którą chcesz dodać do grupy!",255,255,255,true)
		else
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Select the person you want to add to the group!",255,255,255,true)
		end
		return
	end
	triggerServerEvent("WyslijZaproszenie",resourceRoot,localPlayer,itemName)
end,false)

function getRanga()
	guiSetEnabled(gui_grupy['Add_player'],false)
	guiSetEnabled(gui_grupy['Remove_player'],false)
	guiSetEnabled(gui_grupy['Set_vlider'],false)
	guiSetEnabled(gui_grupy['Delete_group'],false)
	guiSetEnabled(gui_grupy['Notatnik'],true)
	guiSetEnabled(gui_grupy['Zmien_Informacje'],false)
	guiSetEnabled(gui_grupy['Tag_grupy'],false)
	if getElementData(localPlayer,'Grupa').ranga == "Lider" then
		guiSetEnabled(gui_grupy['Add_player'],true)
		guiSetEnabled(gui_grupy['Remove_player'],true)
		guiSetEnabled(gui_grupy['Set_vlider'],true)
		guiSetEnabled(gui_grupy['Delete_group'],true)
		guiSetEnabled(gui_grupy['Zmien_Informacje'],true)
		guiSetEnabled(gui_grupy['Tag_grupy'],true)
	elseif getElementData(localPlayer,'Grupa').ranga == "V-Lider" then
		guiSetEnabled(gui_grupy['Add_player'],true)
		guiSetEnabled(gui_grupy['Remove_player'],true)
	end
end

bindKey('F1','down',function()
refresz()
	if not getElementData(localPlayer,'logedin') then return end
	local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	guiSetVisible(gui_zapraszanie['Window'],false)
	guiSetVisible(gui_potwierdzenie['Window'],false)
	guiSetVisible(gui_informacje_read['Window'],false)
	guiSetVisible(gui_informacje_edit['Window'],false)
	guiSetVisible(gui_tag_grupy["window"],false)
	if not getElementData(localPlayer,'Grupa') then
		guiSetVisible(gui_tworzenie['Window'],not guiGetVisible(gui_tworzenie['Window']))
		showCursor(guiGetVisible(gui_tworzenie['Window']))
		guiSetText(gui_tworzenie['Nazwa'],"")
		guiSetInputMode('no_binds_when_editing')
	else
		if jezyk =="PL" then
			guiSetText(gui_grupy['Window'],"Panel Grupy | "..getElementData(localPlayer,'Grupa').nazwa)
		else
			guiSetText(gui_grupy['Window'],"Group Panel | "..getElementData(localPlayer,'Grupa').nazwa)
		end	
		guiSetVisible(gui_grupy['Window'],not guiGetVisible(gui_grupy['Window']))
		showCursor(guiGetVisible(gui_grupy['Window']))
		getRanga()
		if not tick then
			tick = getTickCount() + 1000
		elseif getTickCount()<tick then
			return
		end
		triggerServerEvent("DajRekordZdb",resourceRoot,localPlayer,getElementData(localPlayer,'Grupa').id)
	end
end)


addEventHandler('onClientGUIClick',gui_tworzenie['Wyjdz'],function()
	guiSetVisible(gui_tworzenie['Window'],false)
	guiSetText(gui_tworzenie['Nazwa'],"")
	guiSetVisible(gui_tworzenie['Window'],false)
	showCursor(false)	
end,false)

addEventHandler('onClientGUIClick',gui_zapraszanie['Wyjdz'],function()
	guiSetVisible(gui_zapraszanie['Window'],false)
end,false)

addEventHandler('onClientGUIClick',gui_grupy['Wyjdz'],function()
	guiSetVisible(gui_grupy['Window'],false)
	guiSetVisible(gui_grupy['Window'],false)
	showCursor(false)	
end,false)

addEventHandler('onClientGUIClick',gui_tworzenie['Stworz'],function()
	local text = guiGetText(gui_tworzenie['Nazwa'])
	local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	if text:len()<4 then
		if jezyk =="PL" then
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] Nazwa grupy muśi mieć więcej niż 3 litery",255,255,255,true)
		else
			outputChatBox("#FFFFFF[#ed7600DarkDayz#FFFFFF] The group name must be more than 3 letters long",255,255,255,true)
		end	
		return
	end
	triggerServerEvent("Group_Create",resourceRoot,localPlayer,text)
end,false)

addEvent('Zamknij_tworzenie_grupy',true)
addEventHandler('Zamknij_tworzenie_grupy',resourceRoot,function()
	guiSetVisible(gui_tworzenie['Window'],false)
	guiSetText(gui_tworzenie['Nazwa'],"")
	guiSetVisible(gui_tworzenie['Window'],false)
	showCursor(false)	
end)

addEvent('ZamknijCalyPanel',true)
addEventHandler('ZamknijCalyPanel',resourceRoot,function()
	guiSetVisible(gui_zapraszanie['Window'],false)
	guiSetVisible(gui_potwierdzenie['Window'],false)
	guiSetVisible(gui_grupy['Window'],false)
	guiSetVisible(gui_tag_grupy['window'],false)
	showCursor(false)
end)

function sprawdzCzyJestGracz(g)
	for i,v in pairs(getElementsByType("player")) do
		if getElementData(v,"logedin") == g then
			return true
		end
	end
	return false
end

addEvent('SetValuesToGridList',true)
addEventHandler('SetValuesToGridList',resourceRoot,function(values)
	local czlonkowie = fromJSON(values['czlonkowie'])
	local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	guiGridListClear(gui_grupy['Gridlist'])
	local row = guiGridListAddRow(gui_grupy['Gridlist'])
	guiGridListSetItemText(gui_grupy['Gridlist'],row,1,"- Lider",true,false)
	local row = guiGridListAddRow(gui_grupy['Gridlist'])
	guiGridListSetItemText(gui_grupy['Gridlist'],row,1,czlonkowie.lider,false,false)
	if sprawdzCzyJestGracz(czlonkowie.lider) then
		guiGridListSetItemColor(gui_grupy["Gridlist"],row,1,0,255,0,255)
	else
		guiGridListSetItemColor(gui_grupy["Gridlist"],row,1,255,0,0,255)
	end
	guiGridListSetItemData(gui_grupy['Gridlist'],row,1,"Lider")
	local row = guiGridListAddRow(gui_grupy['Gridlist'])
	guiGridListSetItemText(gui_grupy['Gridlist'],row,1,"- Vice Lider",true,false)
	for i,v in pairs(czlonkowie.vlider) do
		local row = guiGridListAddRow(gui_grupy['Gridlist'])
		guiGridListSetItemText(gui_grupy['Gridlist'],row,1,v,false,false)
		guiGridListSetItemData(gui_grupy['Gridlist'],row,1,"V-Lider")
		if sprawdzCzyJestGracz(v) then
			guiGridListSetItemColor(gui_grupy["Gridlist"],row,1,0,255,0,255)
		else
			guiGridListSetItemColor(gui_grupy["Gridlist"],row,1,255,0,0,255)
		end
	end
	local row = guiGridListAddRow(gui_grupy['Gridlist'])
	if jezyk =="PL" then
			guiGridListSetItemText(gui_grupy['Gridlist'],row,1,"- Członkowie",true,false)
		else
			guiGridListSetItemText(gui_grupy['Gridlist'],row,1,"- Members",true,false)
	end	
	for i,v in pairs(czlonkowie.gracze) do
		local row = guiGridListAddRow(gui_grupy['Gridlist'])
		guiGridListSetItemText(gui_grupy['Gridlist'],row,1,v,false,false)
		if sprawdzCzyJestGracz(v) then
			guiGridListSetItemColor(gui_grupy["Gridlist"],row,1,0,255,0,255)
		else
			guiGridListSetItemColor(gui_grupy["Gridlist"],row,1,255,0,0,255)
		end
	end
end)

local element = createElement("Blipy_Graczy")

local textFont      = "default-bold"         -- The font of the tag text
local textScale      = 1                  -- The scale of the tag text
local heightPadding  = 1                  -- The amount of pixels the tag should be extended on either side of the vertical axis
local widthPadding  = 1                  -- The amount of pixels the tag should be extended on either side of the horizontal axis
local xOffset        = 8                  -- Distance between the player blip and the tag
local minAlpha      = 10                  -- If blip alpha falls below this, the tag won't the shown
local textAlpha      = 255
local rectangleColor = tocolor(0,0,0,230)

-- Other variables
local floor          = math.floor
local w,h            = guiGetScreenSize()

local blipy_to_opis = {
	[55] = "Resp pojazdu",
	[30] = "Pociąg",
	[7] = "Prywatne namioty",
}

--[[
function drawMapStuff()
   if isPlayerMapVisible() then
      if not isElement(element) then return end
      local sx,sy,ex,ey    = getPlayerMapBoundingBox()                     -- Map positions
      local mw,mh          = ex-sx,sy-ey                                 -- Map width/height
      local cx,cy          = (sx+ex)/2,(sy+ey)/2                           -- Center position of the map
      local ppuX,ppuY      = mw/6000,mh/6000                              -- Pixels per unit
      local fontHeight      = dxGetFontHeight(textScale,textFont)               -- Height of the specified font
      local yOffset        = fontHeight/2                              -- How much pixels the tag should be offsetted at
      local blips          = getElementsByType("blip")
      for k,v in ipairs(blips) do
         local attached=getElementAttachedTo(v)
         
         if isElement(attached) and getElementType(attached)=="player" then
            
            local px,py      = getElementPosition(attached)                  -- Player's position
            local x          = floor(cx+px*ppuX+xOffset)                  -- X for the nametag
            local y          = floor(cy+py*ppuY-yOffset)                  -- Y for the nametag
            local pname      = getPlayerName(attached)                     -- Player name
            local nameLength = dxGetTextWidth(pname,textScale,textFont)         -- Width of the playername
            local r,g,b      = getPlayerNametagColor(attached)               -- Player's nametag color
            local _,_,_,a    = getBlipColor(v)                           -- Blip alpha
            if a>minAlpha then
               dxDrawRectangle(x-widthPadding,y+heightPadding,nameLength+widthPadding*2,fontHeight-heightPadding*2,rectangleColor,false)
               dxDrawText(pname,x,y,x+nameLength,y+fontHeight,tocolor(r,g,b,textAlpha),textScale,textFont,"left","top",false,false,false)
            end
		elseif isElement(attached) then
			outputChatBox("XD")
			local opis = blipy_to_opis[getBlipIcon(attached)]
			dxDrawRectangle(x-widthPadding,y+heightPadding,nameLength+widthPadding*2,fontHeight-heightPadding*2,rectangleColor,false)
            dxDrawText(opis,x,y,x+nameLength,y+fontHeight,tocolor(r,g,b,textAlpha),textScale,textFont,"left","top",false,false,false)
         end
      end
   end
end
addEventHandler("onClientRender",getRootElement(),drawMapStuff)]]

      -- How much pixels the tag should be offsetted at

local blips_to_data = {
	[45] = "Dead_blip_info",
	--[0] = "PrivTentOpis",
}

function convertNumber(n) 
	local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
end


local function drawMapStuff()
   if isPlayerMapVisible() then
      local sx,sy,ex,ey    = getPlayerMapBoundingBox()                     -- Map positions
      local mw,mh          = ex-sx,sy-ey                                 -- Map width/height
      local cx,cy          = (sx+ex)/2,(sy+ey)/2                           -- Center position of the map
      local ppuX,ppuY      = mw/6000,mh/6000                              -- Pixels per unit
      local fontHeight      = dxGetFontHeight(textScale,textFont)               -- Height of the specified font
      local yOffset        = fontHeight/2                              
      local blips          = getElementsByType("blip")
      local police_blip = nil
	  local opis
      for k,v in ipairs(blips) do
		local attached=getElementAttachedTo(v)
         if blips_to_data[getBlipIcon(v)] and getElementData(v,blips_to_data[getBlipIcon(v)]) then
			local opis = getElementData(v,blips_to_data[getBlipIcon(v)]) or "None"
			local px,py      = getElementPosition(v)                  -- Player's position
			local x          = math.floor(cx+px*ppuX+xOffset)                  -- X for the nametag
			local y          = math.floor(cy+py*ppuY-yOffset)                  -- Y for the nametag
			local nameLength = dxGetTextWidth(opis,textScale,textFont)         -- Width of the playername
 -- Player's nametag color
			local _,_,_,a    = getBlipColor(v)
			
			dxDrawRectangle(x-widthPadding,y+heightPadding,nameLength+widthPadding*2,fontHeight-heightPadding*2,rectangleColor,false)
			dxDrawText(opis,x,y,x+nameLength,y+fontHeight,tocolor(255,255,255,255),textScale,textFont,"left","top",false,false,false,true)
         
         elseif isElement(attached) and getElementType(attached)=="player" then
            
            local px,py      = getElementPosition(attached)                  -- Player's position
            local x          = math.floor(cx+px*ppuX+xOffset)                  -- X for the nametag
            local y          = math.floor(cy+py*ppuY-yOffset)                  -- Y for the nametag
            local pname      = getPlayerName(attached):gsub("#%x%x%x%x%x%x","")         
            -- Player name
            local nameLength = dxGetTextWidth(pname,textScale,textFont)         -- Width of the playername
			local r,g,b      = getPlayerNametagColor(attached)               
            local _,_,_,a    = getBlipColor(v)                           -- Blip alpha
            
            if a>minAlpha then
               
               dxDrawRectangle(x-widthPadding,y+heightPadding,nameLength+widthPadding*2,fontHeight-heightPadding*2,rectangleColor,false)
               dxDrawText(pname,x,y,x+nameLength,y+fontHeight,tocolor(r,g,b,textAlpha),textScale,textFont,"left","top",false,false,false,true)
               
            end
		 else
			opis = blipy_to_opis[getBlipIcon(v)] 
			if not opis then
				opis = getElementData(v,"Marker-Opis")
				if opis and string.find(opis,"PP") then
					opis = string.gsub(opis,"PP","")
					opis = convertNumber(tonumber(opis))
					opis = opis.." PP"
				elseif opis then
					opis = string.gsub(opis,"GP","")
					opis = convertNumber(tonumber(opis))
					opis = opis.." GP"
				end
			end
			if opis and attached then
				local px,py      = getElementPosition(attached)                  -- Player's position
				local x          = math.floor(cx+px*ppuX+xOffset)                  -- X for the nametag
				local y          = math.floor(cy+py*ppuY-yOffset)                  -- Y for the nametag
				local nameLength = dxGetTextWidth(opis,textScale,textFont)         -- Width of the playername
     -- Player's nametag color
				local _,_,_,a    = getBlipColor(v)
				
				dxDrawRectangle(x-widthPadding,y+heightPadding,nameLength+widthPadding*2,fontHeight-heightPadding*2,rectangleColor,false)
				dxDrawText(opis,x,y,x+nameLength,y+fontHeight,tocolor(255,255,255,255),textScale,textFont,"left","top",false,false,false)
			end
         end
      end
   end
end
addEventHandler("onClientRender",getRootElement(),drawMapStuff)


setTimer(function()
	destroyElement(element)
	element = createElement("Blipy_Graczy")
	local team = getElementData(localPlayer,'Grupa')
	for i,v in pairs(getElementsByType('player')) do
		if v ~= localPlayer then
			if getElementData(v,'Grupa') then
				if team and getElementData(v,'Grupa').nazwa == team.nazwa then
					local blipy = createBlipAttachedTo(v,0,2,22,255,22)
					setElementParent(blipy,element)
				end
			end
			if getElementData(v,'GPSchannel') and getElementData(v,'GPSchannel')==getElementData(localPlayer,'GPSchannel') then
				local blipy = createBlipAttachedTo(v,0,2,0,0,250)
				setElementParent(blipy,element)
			end
		end
	end
end,10000,0)




