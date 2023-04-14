

local gui = {}


gui["Window"] = guiCreateWindow(0.36, 0.12, 0.28, 0.76, "", true)
guiWindowSetMovable(gui["Window"], false)
guiWindowSetSizable(gui["Window"], false)

gui["Colored_shit"] = guiCreateLabel(0.02, 0.04, 0.95, 0.08, "Poniżej znajdują się opcje możesz dać uprawnienia danej grupie do wchodzenia do bazy oraz otwierania tentów. Pamiętaj Administracja nie odpowiada za okradanie bazy", true, gui["Window"])
guiLabelSetColor(gui["Colored_shit"], 229, 126, 25)
guiLabelSetHorizontalAlign(gui["Colored_shit"], "center", true)
--
guiCreateStaticImage(0.02, 0.13, 0.09, 0.02, "uop.png", true, gui["Window"])
guiCreateStaticImage(0.15, 0.13, 0.09, 0.02, "uop.png", true, gui["Window"])
guiCreateStaticImage(0.27, 0.13, 0.09, 0.02, "uop.png", true, gui["Window"])
guiCreateStaticImage(0.39, 0.13, 0.09, 0.02, "uop.png", true, gui["Window"])
guiCreateStaticImage(0.51, 0.13, 0.09, 0.02, "uop.png", true, gui["Window"])
guiCreateStaticImage(0.63, 0.13, 0.09, 0.02, "uop.png", true, gui["Window"])
guiCreateStaticImage(0.75, 0.13, 0.09, 0.02, "uop.png", true, gui["Window"])
guiCreateStaticImage(0.87, 0.13, 0.09, 0.02, "uop.png", true, gui["Window"])
--
guiCreateStaticImage(0.02, 0.33, 0.09, 0.02, "uop.png", true, gui["Window"])
guiCreateStaticImage(0.15, 0.33, 0.09, 0.02, "uop.png", true, gui["Window"])
guiCreateStaticImage(0.27, 0.33, 0.09, 0.02, "uop.png", true, gui["Window"])
guiCreateStaticImage(0.39, 0.33, 0.09, 0.02, "uop.png", true, gui["Window"])
guiCreateStaticImage(0.51, 0.33, 0.09, 0.02, "uop.png", true, gui["Window"])
guiCreateStaticImage(0.63, 0.33, 0.09, 0.02, "uop.png", true, gui["Window"])
guiCreateStaticImage(0.75, 0.33, 0.09, 0.02, "uop.png", true, gui["Window"])
guiCreateStaticImage(0.87, 0.33, 0.09, 0.02, "uop.png", true, gui["Window"])
--
guiCreateStaticImage(0.02, 0.53, 0.09, 0.02, "uop.png", true, gui["Window"])
guiCreateStaticImage(0.15, 0.53, 0.09, 0.02, "uop.png", true, gui["Window"])
guiCreateStaticImage(0.27, 0.53, 0.09, 0.02, "uop.png", true, gui["Window"])
guiCreateStaticImage(0.39, 0.53, 0.09, 0.02, "uop.png", true, gui["Window"])
guiCreateStaticImage(0.51, 0.53, 0.09, 0.02, "uop.png", true, gui["Window"])
guiCreateStaticImage(0.63, 0.53, 0.09, 0.02, "uop.png", true, gui["Window"])
guiCreateStaticImage(0.75, 0.53, 0.09, 0.02, "uop.png", true, gui["Window"])
guiCreateStaticImage(0.87, 0.53, 0.09, 0.02, "uop.png", true, gui["Window"])

--
gui['Grid_baza'] = guiCreateGridList(0.02, 0.17, 0.95, 0.14, true, gui["Window"])
guiGridListAddColumn(gui['Grid_baza'], "Baza id:", 0.3)
guiGridListAddColumn(gui['Grid_baza'], "Opłacona na:", 0.3)
guiGridListAddColumn(gui['Grid_baza'], "Właściciel:", 0.3)
gui["Grid_Gracze"] = guiCreateGridList(0.02, 0.37, 0.95, 0.14, true, gui["Window"])
guiGridListAddColumn(gui["Grid_Gracze"], "Gracze", 0.3)
guiGridListAddColumn(gui["Grid_Gracze"], "Tenty:", 0.3)
guiGridListAddColumn(gui["Grid_Gracze"], "Brama 1:", 0.3)
guiGridListAddColumn(gui["Grid_Gracze"], "Brama 2:", 0.3)
guiGridListAddColumn(gui["Grid_Gracze"], "Brama 3:", 0.3)
gui["Grid_Grupy"] = guiCreateGridList(0.02, 0.57, 0.95, 0.14, true, gui["Window"])
guiGridListAddColumn(gui["Grid_Grupy"], "Grupa", 0.6)
guiGridListAddColumn(gui["Grid_Grupy"], "",0.3)
gui['Gate_open'] = guiCreateButton(0.64, 0.73, 0.31, 0.05, "Akcja brama", true, gui["Window"])
gui['Button_del_record'] = guiCreateButton(0.02, 0.73, 0.31, 0.05, "Usun", true, gui["Window"])
gui["Button_add_record"] = guiCreateButton(0.33, 0.73, 0.31, 0.05, "Dodaj", true, gui["Window"])
gui['dsadsadsadasd'] = guiCreateLabel(0.03, 0.90, 0.95, 0.08, "Pamiętaj że administracja nie odpowiada za okradanie bazy! Osoby/Grupy dodajesz na własną odpowiedzialność!", true, gui["Window"])
guiLabelSetColor(gui['dsadsadsadasd'], 253, 0, 0)
guiLabelSetHorizontalAlign(gui['dsadsadsadasd'], "center", true)
guiLabelSetVerticalAlign(gui['dsadsadsadasd'], "center")    
gui["31231231231"] = guiCreateLabel(0.03, 0.82, 0.95, 0.08, "W przypadku nie poprawnego działania skryptu, zgłoś się do administratora! Pamiętaj że każdy błąd będzie nagradzany!", true, gui['Window'])
guiLabelSetHorizontalAlign(gui["31231231231"], "center", true)
guiLabelSetVerticalAlign(gui["31231231231"], "center")    
gui['Radio_1'] = guiCreateRadioButton(0.03, 0.79, 0.29, 0.03, "Brama 1", true, gui['Window'])
gui['Radio_2'] = guiCreateRadioButton(0.34, 0.79, 0.29, 0.03, "Brama 2", true, gui['Window'])
gui['Radio_3'] = guiCreateRadioButton(0.64, 0.79, 0.29, 0.03, "Brama 3", true, gui['Window'])    
guiRadioButtonSetSelected(gui['Radio_1'], true)

guiSetProperty(gui['Button_add_record'],"NormalTextColour", "FFECD616")	
guiSetProperty(gui['Button_del_record'],"NormalTextColour", "FFFF0000")	
guiSetProperty(gui['Gate_open'],"NormalTextColour", "FF27C937")	
guiSetVisible(gui['Window'], false)

gui['Potwierdzanie'] = {}


gui['Potwierdzanie']['Window'] = guiCreateWindow(0.40, 0.33, 0.19, 0.31, "", true)
guiWindowSetMovable(gui['Potwierdzanie']['Window'], false)
guiWindowSetSizable(gui['Potwierdzanie']['Window'], false)

gui['Potwierdzanie']['Radio_Grupa']= guiCreateRadioButton(0.64, 0.12, 0.32, 0.06, "Grupa", true, gui['Potwierdzanie']['Window'])
gui['Potwierdzanie']['Radio_Gracze'] = guiCreateRadioButton(0.64, 0.22, 0.32, 0.06, "Gracz", true, gui['Potwierdzanie']['Window'])
guiRadioButtonSetSelected(gui['Potwierdzanie']['Radio_Gracze'], true)
gui['Potwierdzanie']['Grid'] = guiCreateGridList(0.04, 0.09, 0.54, 0.86, true, gui['Potwierdzanie']['Window'])
guiGridListAddColumn(gui['Potwierdzanie']['Grid'], "", 0.7)
gui['Potwierdzanie']['Button_add'] = guiCreateButton(0.59, 0.75, 0.37, 0.09, "Dodaj", true, gui['Potwierdzanie']['Window'])
gui['Potwierdzanie']['Button_close'] = guiCreateButton(0.59, 0.87, 0.37, 0.09, "Zamknij", true, gui['Potwierdzanie']['Window'])    
guiSetVisible(gui['Potwierdzanie']['Window'],false)


guiGridListSetSortingEnabled(gui['Potwierdzanie']['Grid'],false)
guiGridListSetSortingEnabled(gui["Grid_Grupy"],false)
guiGridListSetSortingEnabled(gui["Grid_Gracze"],false)
guiGridListSetSortingEnabled(gui['Grid_baza'],false)

local language = {
	['PL'] = {
		['idbazy1'] = "ID Bazy: ",
		['oplata1'] = "Opłacona na: ",
		['wlasciciel1'] = "Opłacona na: ",
		['gracze1'] = "Gracze: ",
		['brama11'] = "Brama 1: ",
		['brama21'] = "Brama 2: ",
		['brama31'] = "Brama 3: ",
		['grupa1'] = "Grupa: ",
		['akcja1'] = "Otworz brame",
		['del1'] = "Usuń",
		['add1'] = "Dodaj",
		['grupka1'] = "Grupa",
		['plejers1'] = "Gracze",
		['close1'] = "Zamknij",
		['asdas1'] = "Pamiętaj że administracja nie odpowiada za okradanie bazy! Osoby/Grupy dodajesz na własną odpowiedzialność!",
		['asdas21'] = "W przypadku nie poprawnego działania skryptu, zgłoś się do administratora! Pamiętaj że każdy błąd będzie nagradzany!",
		['asdas31'] = "Poniżej znajdują się opcje możesz dać uprawnienia danej grupie do wchodzenia do bazy oraz otwierania tentów. Pamiętaj Administracja nie odpowiada za okradanie bazy",
	},
	['ENG'] = {
		['idbazy1'] = "Base ID: ",
		['oplata1'] = "Valid: ",
		['wlasciciel1'] = "Owner: ",
		['gracze1'] = "Players: ",
		['brama11'] = "Gate 1: ",
		['brama21'] = "Gate 2: ",
		['brama31'] = "Gate 3: ",
		['grupa1'] = "Group: ",
		['akcja1'] = "Open Gate",
		['del1'] = "Delete",
		['add1'] = "Add",
		['grupka1'] = "Group",
		['plejers1'] = "Players",
		['close1'] = "Close",
		['asdas1'] = "Remember that the administration is not responsible for robbing the base! Add persons / groups at your own risk!",
		['asdas21'] = "If the script does not work correctly, please contact the administrator! Remember that every mistake will be rewarded!",
		['asdas31'] = "Below are the options you can give the group permission to enter the base and open tents. Remember The administration is not responsible for robbing the base",
	},
}

function refresz()
local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	 guiGridListSetColumnTitle(gui['Grid_baza'],1, language[jezyk]['idbazy1'])
	 guiGridListSetColumnTitle(gui['Grid_baza'],2, language[jezyk]['oplata1'])
	 guiGridListSetColumnTitle(gui['Grid_baza'],3, language[jezyk]['wlasciciel1'])
	 guiGridListSetColumnTitle(gui['Grid_Gracze'],1, language[jezyk]['gracze1'])
	 guiGridListSetColumnTitle(gui['Grid_Grupy'],1, language[jezyk]['grupa1'])
	 guiSetText(gui['Gate_open'], language[jezyk]['akcja1'])
	 guiSetText(gui['Button_del_record'], language[jezyk]['del1'])
	 guiSetText(gui['Button_add_record'], language[jezyk]['add1'])
	 guiSetText(gui['Radio_1'], language[jezyk]['brama11'])
	 guiSetText(gui['Radio_2'], language[jezyk]['brama21'])
	 guiSetText(gui['Radio_3'], language[jezyk]['brama31'])
	 guiSetText(gui['Potwierdzanie']['Radio_Grupa'], language[jezyk]['grupka1'])
	 guiSetText(gui['Potwierdzanie']['Radio_Gracze'], language[jezyk]['plejers1'])
	 guiSetText(gui['Potwierdzanie']['Button_add'], language[jezyk]['add1'])
	 guiSetText(gui['Potwierdzanie']['Button_close'], language[jezyk]['close1'])
	 guiSetText(gui['dsadsadsadasd'], language[jezyk]['asdas1'])
	 guiSetText(gui['31231231231'], language[jezyk]['asdas21'])
	 guiSetText(gui['Colored_shit'], language[jezyk]['asdas31'])
end
setTimer(refresz, 2000, 0)

local function setBlockedButtons(arg)
	guiSetEnabled(gui['Button_add_record'],arg)
	guiSetEnabled(gui['Button_del_record'],arg)
end

local function setText(dane)

	guiGridListClear(gui['Grid_baza'])
	guiGridListClear(gui['Grid_Gracze'])
	guiGridListClear(gui['Grid_Grupy'])
	for i = 1,3 do
		guiSetEnabled(gui['Radio_'..i],false)
	end
	for i = 1,#dane do
		local row = guiGridListAddRow(gui['Grid_baza'])
		guiGridListSetItemText(gui['Grid_baza'],row,1,dane[i].id,false,false)
		guiGridListSetItemText(gui['Grid_baza'],row,2,dane[i].dni.." dni",false,false)
		guiGridListSetItemText(gui['Grid_baza'],row,3,dane[i].lider,false,false)
		guiGridListSetItemData(gui['Grid_baza'],row,1,dane[i])
	end
end

local function wypiszGraczy (dane)
	local tablica = fromJSON(dane.gracze)
	guiGridListClear(gui['Grid_Gracze'])
	guiGridListSetSelectionMode(gui['Grid_Gracze'],2)
	for i,v in pairs(tablica) do
		if getElementData(localPlayer,"logedin") ~= i then
			local row = guiGridListAddRow(gui['Grid_Gracze'])
			guiGridListSetItemText(gui['Grid_Gracze'],row,2,v["tenty"],false,false)
			if dane.bramy[1] then
				guiGridListSetItemText(gui['Grid_Gracze'],row,3,v["brama_1"],false,true)
			end
			if dane.bramy[2] then
				guiGridListSetItemText(gui['Grid_Gracze'],row,4,v["brama_2"],false,true)
			end
			if dane.bramy[3] then
				guiGridListSetItemText(gui['Grid_Gracze'],row,5,v["brama_3"],false,false)
			end
			guiGridListSetItemText(gui['Grid_Gracze'],row,1,i,false,false)
			guiGridListSetItemData(gui['Grid_Gracze'],row,1,i)
		end
	end
end

local function wypiszGrupy (dane)
	local tablica = fromJSON(dane.grupa)
	guiGridListClear(gui['Grid_Grupy'])
	guiGridListSetSelectionMode(gui['Grid_Grupy'],2)
	for i,v in pairs(tablica) do
		local row = guiGridListAddRow(gui['Grid_Grupy'])
		guiGridListSetItemText(gui['Grid_Grupy'],row,1,i,false,false)
		guiGridListSetItemData(gui['Grid_Grupy'],row,1,i)
	end
end


addEventHandler('onClientGUIClick',gui['Grid_baza'],function()
	local data = guiGridListGetItemData(gui['Grid_baza'],guiGridListGetSelectedItem(gui['Grid_baza']),1)
	if data then
		if data.player_lider == getElementData(localPlayer,"logedin") then
			setBlockedButtons(true)
			wypiszGraczy(data)
			wypiszGrupy(data)
		else
			guiGridListClear(gui['Grid_Gracze'])
			guiGridListClear(gui['Grid_Grupy'])
			setBlockedButtons(false)
		end
		local gracze = fromJSON(data.gracze)
		for i=1,3 do
			if data.bramy[i] and gracze[getElementData(localPlayer,"logedin")]["brama_"..i] == "TAK" then
				guiSetEnabled(gui['Radio_'..i],true)
			else
				guiSetEnabled(gui['Radio_'..i],false)
			end
		end
	else
		guiGridListClear(gui['Grid_Gracze'])
		guiGridListClear(gui['Grid_Grupy'])
		setBlockedButtons(false)
		for i = 1,3 do
			guiSetEnabled(gui['Radio_'..i],false)
		end
	end
end)


local tabela_kolumn = {
	['Tenty:'] = "tenty",
	['Brama 1:'] = "brama_1",
	['Brama 2:'] = "brama_2",
	['Brama 3:'] = "brama_3",
}



local function refreshManualy()
	guiSetVisible(gui["Potwierdzanie"]["Window"],false)
	guiSetVisible(gui["Window"],false)
	showCursor(false)
end
addEvent("chujcyckichujcycki",true)
addEventHandler("chujcyckichujcycki",resourceRoot,refreshManualy)


addEventHandler('onClientGUIDoubleClick',gui['Grid_Gracze'],function()
	local chuj = {guiGridListGetSelectedItem(gui['Grid_Gracze'])}
	local selected = guiGridListGetItemText(gui['Grid_Gracze'],chuj[1],chuj[2])
	local column_text = guiGridListGetColumnTitle(gui['Grid_Gracze'],chuj[2])
	local player = guiGridListGetItemData(gui['Grid_Gracze'],guiGridListGetSelectedItem(gui['Grid_Gracze']),1)
	local data = guiGridListGetItemData(gui['Grid_baza'],guiGridListGetSelectedItem(gui['Grid_baza']),1)
	local typ
	if selected == "TAK" then
		typ = "NIE"
	elseif selected == "NIE" then
		typ = "TAK"
	end
	if not player then return end
	if not typ then return end
	if not tabela_kolumn[column_text] then return end
	if not data then return end
	if not data.id then return end
	triggerServerEvent("Base_SetDostep",resourceRoot,localPlayer,player,typ,tabela_kolumn[column_text],data.id)
end,false)

local function refreshGrid()
	guiGridListClear(gui['Potwierdzanie']['Grid'])
	local data = guiGridListGetItemData(gui['Grid_baza'],guiGridListGetSelectedItem(gui['Grid_baza']),1)
	local selected = guiRadioButtonGetSelected(gui['Potwierdzanie']['Radio_Gracze'])
	if data then
		if selected then
			local byl_player = {}
			local gracze = fromJSON(data.gracze)
			for i,v in pairs(getElementsByType('player')) do
				for k,_ in pairs(gracze) do
					if not gracze[getElementData(v,'logedin')] and not byl_player[v] then
						local row = guiGridListAddRow(gui['Potwierdzanie']['Grid'])
						byl_player[v] = true
						guiGridListSetItemText(gui['Potwierdzanie']['Grid'],row,1,getPlayerName(v):gsub("#%x%x%x%x%x%x",""),false,false)
						guiGridListSetItemData(gui['Potwierdzanie']['Grid'],row,1,{getPlayerName(v),getElementData(v,'logedin')})
					end
				end
			end
		else
			selected = guiRadioButtonGetSelected(gui['Potwierdzanie']['Radio_Grupa'])
			local grupy = fromJSON(data.grupa)
			local sprawdzonet = {}
			if selected then
				for i,v in pairs(getElementsByType('player')) do
					if getElementData(v,'Grupa') then
						if getElementData(v,'Grupa').nazwa and not grupy[getElementData(v,'Grupa').nazwa] and not sprawdzonet[getElementData(v,"Grupa").nazwa] then
							local row = guiGridListAddRow(gui['Potwierdzanie']['Grid'])
							sprawdzonet[getElementData(v,"Grupa").nazwa] = true
							guiGridListSetItemText(gui['Potwierdzanie']['Grid'],row,1,getElementData(v,"Grupa").nazwa,false,false)
							guiGridListSetItemData(gui['Potwierdzanie']['Grid'],row,1,{getElementData(v,"Grupa").nazwa})
						end
					end
				end
			end
		end
	end
end

addEventHandler("onClientGUIClick",gui["Button_del_record"],function()
	local data = guiGridListGetItemData(gui["Grid_Gracze"],guiGridListGetSelectedItem(gui["Grid_Gracze"]),1)
	local data_baza = guiGridListGetItemData(gui["Grid_baza"],guiGridListGetSelectedItem(gui["Grid_baza"]),1)
	if data and data_baza then
		triggerServerEvent("UsunWynikFromBaza",resourceRoot,localPlayer,{data_baza.id,data},0)
	else
		data = guiGridListGetItemData(gui["Grid_Grupy"],guiGridListGetSelectedItem(gui["Grid_Grupy"]),1)
		if data and data_baza then
			triggerServerEvent("UsunWynikFromBaza",resourceRoot,localPlayer,{data_baza.id,data},1)
		end
	end
end,false)




addEventHandler('onClientGUIClick',gui['Potwierdzanie']['Radio_Grupa'],function()
	refreshGrid()
end,false)

addEventHandler('onClientGUIClick',gui['Potwierdzanie']['Button_add'],function()
	local typ
	if guiRadioButtonGetSelected(gui['Potwierdzanie']['Radio_Gracze']) then
		typ = "gracze"
	elseif guiRadioButtonGetSelected(gui['Potwierdzanie']['Radio_Grupa']) then
		typ = "grupa"
	end
	if not typ then return end
	local data = guiGridListGetItemData(gui['Grid_baza'],guiGridListGetSelectedItem(gui['Grid_baza']),1)
	if not data then return end
	local data_2 = guiGridListGetItemData(gui['Potwierdzanie']['Grid'],guiGridListGetSelectedItem(gui['Potwierdzanie']['Grid']),1)
	if not data_2 then return end
	triggerServerEvent("Base_add_elements",resourceRoot,localPlayer,{data.id,typ},data_2)
end,false)

addEventHandler('onClientGUIClick',gui['Potwierdzanie']['Radio_Gracze'],function()
	refreshGrid()
end,false)



addEventHandler('onClientGUIClick',gui['Gate_open'],function()
	local data = guiGridListGetItemData(gui['Grid_baza'],guiGridListGetSelectedItem(gui['Grid_baza']),1)
	if not data then return end
	local selected = (guiRadioButtonGetSelected(gui["Radio_1"]) and 1) or (guiRadioButtonGetSelected(gui["Radio_2"]) and 2) or (guiRadioButtonGetSelected(gui["Radio_3"]) and 3)
	if not selected then return end
	triggerServerEvent("Base_OpenGate",resourceRoot,localPlayer,{data.id,data.gracze},selected)
end,false)

addEventHandler('onClientGUIClick',gui['Potwierdzanie']['Button_close'],function()
	guiSetVisible(gui['Potwierdzanie']['Window'],false)
end,false)

addEventHandler("onClientGUIClick",gui['Button_add_record'],function()
	local data = guiGridListGetItemData(gui['Grid_baza'],guiGridListGetSelectedItem(gui['Grid_baza']),1)
	local data_2 = guiGridListGetItemData(gui['Grid_Grupy'],guiGridListGetSelectedItem(gui['Grid_Grupy']),1)
	local bylo = false
	if not data_2 then
		bylo = true
		data_2 = guiGridListGetItemData(gui['Grid_Gracze'],guiGridListGetSelectedItem(gui['Grid_Gracze']),1)
	end
	if data then
		if not bylo then
			guiRadioButtonSetSelected(gui['Potwierdzanie']['Radio_Grupa'],true)
		else
			guiRadioButtonSetSelected(gui['Potwierdzanie']['Radio_Gracze'],true)
		end
		refreshGrid()
		guiBringToFront(gui['Potwierdzanie']['Window'])
		guiSetVisible(gui['Potwierdzanie']['Window'],true)
	end
end,false)

setBlockedButtons(false)

local function openBasePanel(filter)
	local state = guiGetVisible(gui['Window'])
	if filter and not state then
		setBlockedButtons(false)
		setText(filter)
	end
	guiSetVisible(gui['Potwierdzanie']['Window'],false)
	guiSetVisible(gui['Window'], not state)
	showCursor(not state)
end

addEvent("openBasePanel",true)
addEventHandler("openBasePanel",resourceRoot,openBasePanel)




