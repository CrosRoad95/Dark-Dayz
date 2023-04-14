
local GUIEditor = {
    edit = {},
    button = {},
    window = {},
    label = {},
    gridlist = {}
}

local Panel_Grup = guiCreateWindow(0.35, 0.28, 0.29, 0.45, "", true)
guiWindowSetMovable(Panel_Grup, false)
guiWindowSetSizable(Panel_Grup, false)

local Nazwa_bazy_grid = guiCreateGridList(0.02, 0.07, 0.49, 0.78, true, Panel_Grup)
guiGridListAddColumn(Nazwa_bazy_grid, "Nazwa Bazy", 0.9)
local button_grid = guiCreateButton(0.64, 0.10, 0.32, 0.20, "Panel Zarządzania Bazami", true, Panel_Grup)
guiSetProperty(button_grid, "NormalTextColour", "FFAAAAAA")
GUIEditor.button[1] = guiCreateButton(0.64, 0.33, 0.32, 0.20, "Panel Członków", true, Panel_Grup)
guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FFAAAAAA")


GUIEditor.window[1] = guiCreateWindow(0.00, 0.26, 0.35, 0.48, "Panel Członków", true)
guiWindowSetMovable(GUIEditor.window[1], false)
guiWindowSetSizable(GUIEditor.window[1], false)

GUIEditor.gridlist[1] = guiCreateGridList(0.02, 0.05, 0.38, 0.58, true, GUIEditor.window[1])
guiGridListAddColumn(GUIEditor.gridlist[1], "Gracze", 0.9)
GUIEditor.gridlist[2] = guiCreateGridList(0.58, 0.05, 0.39, 0.58, true, GUIEditor.window[1])
guiGridListAddColumn(GUIEditor.gridlist[2], "Gracze [Mający dostęp do bazy]", 0.9)
GUIEditor.button[2] = guiCreateButton(0.02, 0.67, 0.25, 0.13, "Daj dostęp do bazy", true, GUIEditor.window[1])
guiSetProperty(GUIEditor.button[2], "NormalTextColour", "FFAAAAAA")
GUIEditor.button[3] = guiCreateButton(0.73, 0.67, 0.25, 0.13, "Zabierz dostęp do bazy", true, GUIEditor.window[1])
guiSetProperty(GUIEditor.button[3], "NormalTextColour", "FFAAAAAA")

GUIEditor.window[2] = guiCreateWindow(0.65, 0.26, 0.35, 0.48, "", true)
guiWindowSetMovable(GUIEditor.window[2], false)
guiWindowSetSizable(GUIEditor.window[2], false)

GUIEditor.label[1] = guiCreateLabel(0.50, 0.79, 0.48, 0.05, "Baza Jest jeszcze opłacone na:", true, GUIEditor.window[2])
guiLabelSetHorizontalAlign(GUIEditor.label[1], "center", false)
GUIEditor.label[2] = guiCreateLabel(0.50, 0.74, 0.48, 0.05, "Typ bazy:", true, GUIEditor.window[2])
guiLabelSetHorizontalAlign(GUIEditor.label[2], "center", false)
GUIEditor.label[3] = guiCreateLabel(0.02, 0.74, 0.48, 0.05, "Hasło do Bramy [1] :", true, GUIEditor.window[2])
guiLabelSetHorizontalAlign(GUIEditor.label[3], "center", false)
GUIEditor.label[10] = guiCreateLabel(0.02, 0.79, 0.48, 0.05, "Hasło do Bramy [2] :", true, GUIEditor.window[2])
guiLabelSetHorizontalAlign(GUIEditor.label[10], "center", false)
GUIEditor.label[11] = guiCreateLabel(0.02, 0.84, 0.48, 0.05, "Hasło do Bramy [3] :", true, GUIEditor.window[2])
guiLabelSetHorizontalAlign(GUIEditor.label[11], "center", false)
GUIEditor.label[4] = guiCreateLabel(0.50, 0.84, 0.48, 0.05, "Ilość pojazdów w bazie", true, GUIEditor.window[2])
guiLabelSetHorizontalAlign(GUIEditor.label[4], "center", false)
GUIEditor.edit[1] = guiCreateEdit(0.02, 0.16, 0.40, 0.07, "", true, GUIEditor.window[2])
GUIEditor.edit[2] = guiCreateEdit(0.58, 0.16, 0.40, 0.07, "", true, GUIEditor.window[2])
GUIEditor.edit[3] = guiCreateEdit(0.30, 0.39, 0.40, 0.07, "", true, GUIEditor.window[2])
GUIEditor.label[5] = guiCreateLabel(0.02, 0.07, 0.40, 0.09, "Zmiana hasła \n Brama [1]", true, GUIEditor.window[2])
guiLabelSetHorizontalAlign(GUIEditor.label[5], "center", false)
GUIEditor.label[6] = guiCreateLabel(0.58, 0.07, 0.40, 0.09, "Zmiana hasła \n Brama [2]", true, GUIEditor.window[2])
guiLabelSetHorizontalAlign(GUIEditor.label[6], "center", false)
GUIEditor.label[7] = guiCreateLabel(0.30, 0.30, 0.40, 0.09, "Zmiana hasła \n Brama [3]", true, GUIEditor.window[2])
guiLabelSetHorizontalAlign(GUIEditor.label[7], "center", false)
GUIEditor.button[4] = guiCreateButton(0.14, 0.23, 0.16, 0.04, "Potwierdz", true, GUIEditor.window[2])
GUIEditor.button[5] = guiCreateButton(0.70, 0.23, 0.16, 0.04, "Potwierdz", true, GUIEditor.window[2])
GUIEditor.button[6] = guiCreateButton(0.42, 0.46, 0.16, 0.04, "Potwierdz", true, GUIEditor.window[2])
local LabelInfoXD = guiCreateLabel(0.54, 0.58, 0.42, 0.36, "Kliknij na swoja baze aby zaladowac informacje!", true, Panel_Grup)
guiLabelSetHorizontalAlign(LabelInfoXD, "center", true)
guiLabelSetVerticalAlign(LabelInfoXD, "center")    


local language2 = {
	['PL'] = {
		['nazwabase'] = "Nazwa Bazy",
		['panelzarzadzania'] = "Panel Zarządzania Bazami",
		['panelczlonkow'] = "Panel Członków",
		['gracze'] = "Gracze",
		['gracze2'] = "Gracze [Mający dostęp do bazy]",
		['dajacces'] = "Daj dostęp do bazy",
		['zabierzaccess'] = "Zabierz dostęp do bazy",
		['oplata'] = "Baza Jest jeszcze opłacona na:",
		['typ'] = "Typ bazy:",
		['pass1'] = "Hasło do Bramy [1]",
		['pass2'] = "Hasło do Bramy [2]",
		['pass3'] = "Hasło do Bramy [3]",
		['ilosccar'] = "Ilość pojazdów w bazie",
		['chgpass1'] = "Zmiana hasła \n Brama [1]",
		['chgpass2'] = "Zmiana hasła \n Brama [2]",
		['chgpass3'] = "Zmiana hasła \n Brama [3]",
		['accept'] = "Potwierdz",
		['info'] = "Kliknij na swoja baze aby zaladowac informacje!",
	},
	['ENG'] = {
		['nazwabase'] = "Base name",
		['panelzarzadzania'] = "Base management panel",
		['panelczlonkow'] = "Members Panel",
		['gracze'] = "Players",
		['gracze2'] = "Players [Have access to the base]",
		['dajacces'] = "Give access to the base",
		['zabierzaccess'] = "Take access to the base",
		['oplata'] = "The base is paid for:",
		['typ'] = "Base type",
		['pass1'] = "Gate password [1]",
		['pass2'] = "Gate password [2]",
		['pass3'] = "Gate password [3]",
		['ilosccar'] = "Number of vehicles in the base",
		['chgpass1'] = "Password change \n Gate [1]",
		['chgpass2'] = "Password change \n Gate [2]",
		['chgpass3'] = "Password change \n Gate [3]",
		['accept'] = "Accept",
		['info'] = "Click on your base to load information!",
	},
}

function refresz3()
local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	guiGridListSetColumnTitle(Nazwa_bazy_grid,1, language2[jezyk]['nazwabase'])
	guiGridListSetColumnTitle(GUIEditor.gridlist[1],1, language2[jezyk]['gracze'])
	guiGridListSetColumnTitle(GUIEditor.gridlist[2],1, language2[jezyk]['gracze2'])
	guiSetText(button_grid, language2[jezyk]['panelzarzadzania'])
	guiSetText(GUIEditor.button[1], language2[jezyk]['panelczlonkow'])
	guiSetText(GUIEditor.button[2], language2[jezyk]['dajacces'])
	guiSetText(GUIEditor.button[3], language2[jezyk]['zabierzaccess'])
	guiSetText(GUIEditor.label[1], language2[jezyk]['oplata'])
	guiSetText(GUIEditor.label[2], language2[jezyk]['typ'])
	guiSetText(GUIEditor.label[3], language2[jezyk]['pass1'])
	guiSetText(GUIEditor.label[10], language2[jezyk]['pass2'])
	guiSetText(GUIEditor.label[11], language2[jezyk]['pass3'])
	guiSetText(GUIEditor.label[4], language2[jezyk]['ilosccar'])
	guiSetText(GUIEditor.label[5], language2[jezyk]['chgpass1'])
	guiSetText(GUIEditor.label[6], language2[jezyk]['chgpass2'])
	guiSetText(GUIEditor.label[7], language2[jezyk]['chgpass3'])
	guiSetText(GUIEditor.button[4], language2[jezyk]['accept'])
	guiSetText(GUIEditor.button[5], language2[jezyk]['accept'])
	guiSetText(GUIEditor.button[6], language2[jezyk]['accept'])
	guiSetText(LabelInfoXD, language2[jezyk]['info'])
end


addEventHandler('onClientGUIClick',button_grid,function()
	guiSetVisible(GUIEditor.window[2],not guiGetVisible(GUIEditor.window[2]))
end,false)

addEventHandler('onClientGUIClick',GUIEditor.button[1],function()
	guiSetVisible(GUIEditor.window[1],not guiGetVisible(GUIEditor.window[1]))
end,false)

guiSetVisible(Panel_Grup,false)
guiSetVisible(GUIEditor.window[1],false)
guiSetVisible(GUIEditor.window[2],false)

local timer = getTickCount() 
local bazy


bindKey('F7','down',function()
refresz3()
	if getTickCount()-timer>1000 then
		for i=1,2 do
			guiSetVisible(GUIEditor.window[i],false)
		end
		guiSetVisible(Panel_Grup,not guiGetVisible(Panel_Grup))
		showCursor(not isCursorShowing())
		guiGridListClear(Nazwa_bazy_grid)
		guiSetInputMode('no_binds_when_editing')
		guiGridListClear(GUIEditor.gridlist[1])
		guiSetEnabled(GUIEditor.button[4],false)
		restartLabels(nil)
		guiSetEnabled(GUIEditor.button[2],false)
		guiSetEnabled(GUIEditor.button[3],false)
		guiGridListClear(GUIEditor.gridlist[2])
		triggerServerEvent('GetDataFromPanelGroup',resourceRoot,localPlayer)
		if not guiGetVisible(Panel_Grup) then
			timer = getTickCount()
		end
	else
		for i=1,2 do
			guiSetVisible(GUIEditor.window[i],false)
		end
		guiSetVisible(Panel_Grup,not guiGetVisible(Panel_Grup))
		showCursor(not isCursorShowing())
		guiGridListClear(Nazwa_bazy_grid)
		guiSetInputMode('no_binds_when_editing')
		guiGridListClear(GUIEditor.gridlist[1])
		guiSetEnabled(GUIEditor.button[4],false)
		restartLabels(nil)
		guiSetEnabled(GUIEditor.button[2],false)
		guiSetEnabled(GUIEditor.button[3],false)
		guiGridListClear(GUIEditor.gridlist[2])
		triggerEvent('SetBaseToGridlist', resourceRoot, bazy)
	end
end)


local last_clicked

function setBaseNameToGridist(table,table2)
	for i,v in pairs(table) do
		local row = guiGridListAddRow(Nazwa_bazy_grid)
		guiGridListSetItemText(Nazwa_bazy_grid,row,1,v['nazwa_bazy'],false,false)
	end
	for i,v in ipairs(getElementsByType('player')) do
		local row = guiGridListAddRow(GUIEditor.gridlist[1])
		guiGridListSetItemText(GUIEditor.gridlist[1],row,1,getPlayerName(v),false,false)
	end
end


function restartLabels(clicked)
local jezyk = getElementData(localPlayer,"Jezyk_Gry") or "PL"
	if jezyk =="PL" then
		guiSetText(GUIEditor.label[4],'Ilość pojazdów w bazie: ')
		guiSetText(GUIEditor.label[2],'Typ bazy: ')
		guiSetText(GUIEditor.label[1],'Baza jest opłacona na: ')
		guiSetText(GUIEditor.label[3],'Hasło do Bramy [1]: BRAK')
		guiSetText(GUIEditor.label[10],'Hasło do Bramy [2]: BRAK')
		guiSetText(GUIEditor.label[11],'Hasło do Bramy [3]: BRAK')
	else
		guiSetText(GUIEditor.label[4],'Number of vehicles in the base: ')
		guiSetText(GUIEditor.label[2],'Base type: ')
		guiSetText(GUIEditor.label[1],'The base is paid on: ')
		guiSetText(GUIEditor.label[3],'Password for the Gate [1]: NONE')
		guiSetText(GUIEditor.label[10],'Password for the Gate [2]: NONE')
		guiSetText(GUIEditor.label[11],'Password for the Gate [3]: NONE')
	end
	if not clicked then return end
	guiGridListClear(GUIEditor.gridlist[2])
	guiSetEnabled(GUIEditor.button[4],false)
	guiSetEnabled(GUIEditor.button[5],false)
	guiSetEnabled(GUIEditor.button[6],false)
	for i,v in pairs(bazy) do
		if clicked==v['nazwa_bazy'] then
			if v['brama_jest']=='JEST' then
				guiSetEnabled(GUIEditor.button[4],true)
				if jezyk =="PL" then
					guiSetText(GUIEditor.label[3],'Hasło do Bramy[1] : '..v['brama_haslo'])
				else
					guiSetText(GUIEditor.label[3],'Passworld for the Gate[1] : '..v['brama_haslo'])
				end
			end
			if v['brama_jest2']=="JEST" then
				guiSetEnabled(GUIEditor.button[5],true)
				if jezyk =="PL" then
					guiSetText(GUIEditor.label[10],'Hasło do Bramy[2] : '..v['brama_haslo2'])
				else
					guiSetText(GUIEditor.label[10],'Passworld for the Gate[2] : '..v['brama_haslo2'])
				end
			end
			if v['brama_jest3']=="JEST" then
				guiSetEnabled(GUIEditor.button[6],true)
				if jezyk =="PL" then
					guiSetText(GUIEditor.label[11],'Hasło do Bramy[3] : '..v['brama_haslo3'])
				else
					guiSetText(GUIEditor.label[11],'Passworld for the Gate[3] : '..v['brama_haslo3'])
				end
			end
			if jezyk =="PL" then
				guiSetText(GUIEditor.label[4],'Ilość pojazdów w bazie: '..v['auta'])
				guiSetText(GUIEditor.label[2],'Typ bazy: '..v['type'])
				guiSetText(GUIEditor.label[1],'Baza Jest jeszcze opłacone na: '..v['dni'])
			else
				guiSetText(GUIEditor.label[4],'Number of vehicles in the base: '..v['auta'])
				guiSetText(GUIEditor.label[2],'Base type: '..v['type'])
				guiSetText(GUIEditor.label[1],'The base is paid on: '..v['dni'])
			end
			last_clicked = v
			triggerServerEvent('GetPlayersInBase',resourceRoot,localPlayer,clicked)
			break
		end
	end
end



addEvent('UpdateLabelHaslo',true)
addEventHandler('UpdateLabelHaslo',resourceRoot,function(haslo,id)
local jezyk = getElementData(localPlayer,"Jezyk_Gry") or "PL"
	if id=="" then
		if jezyk =="PL" then
			guiSetText(GUIEditor.label[3],'Hasło do Bramy[1] : '..haslo)
		else
			guiSetText(GUIEditor.label[3],'Password for the Gate[1] : '..haslo)
		end
	elseif id=="2" then
		if jezyk =="PL" then
			guiSetText(GUIEditor.label[10],'Hasło do Bramy[2] : '..haslo)
		else
			guiSetText(GUIEditor.label[10],'Password for the Gate[2] : '..haslo)
		end
	elseif id=="3" then
		if jezyk =="PL" then
			guiSetText(GUIEditor.label[11],'Hasło do Bramy[3] : '..haslo)
		else
			guiSetText(GUIEditor.label[11],'Password for the Gate[3] : '..haslo)
		end
	end
end)

addEventHandler('onClientGUIClick',GUIEditor.button[4],function()
local jezyk = getElementData(localPlayer,"Jezyk_Gry") or "PL"
	if guiGetText(GUIEditor.edit[1])=="" then 
	if jezyk =="PL" then
		triggerEvent("stworz_notyfikacje", localPlayer, "error", "Hasło jest za krótkie")
	else
		triggerEvent("stworz_notyfikacje", localPlayer, "error", "Password is too short")
	end
	return end
	triggerServerEvent('ZmianaHaslaBaza',resourceRoot,localPlayer,last_clicked['nazwa_bazy'],guiGetText(GUIEditor.edit[1]),"")
end,false)

addEventHandler('onClientGUIClick',GUIEditor.button[5],function()
local jezyk = getElementData(localPlayer,"Jezyk_Gry") or "PL"
	if guiGetText(GUIEditor.edit[2])=="" then 
	if jezyk =="PL" then
		triggerEvent("stworz_notyfikacje", localPlayer, "error", "Hasło jest za krótkie")
	else
		triggerEvent("stworz_notyfikacje", localPlayer, "error", "Password is too short")
	end
	return end
	triggerServerEvent('ZmianaHaslaBaza',resourceRoot,localPlayer,last_clicked['nazwa_bazy'],guiGetText(GUIEditor.edit[2]),"2")
end,false)

addEventHandler('onClientGUIClick',GUIEditor.button[6],function()
local jezyk = getElementData(localPlayer,"Jezyk_Gry") or "PL"
	if guiGetText(GUIEditor.edit[3])=="" then
	if jezyk =="PL" then
		triggerEvent("stworz_notyfikacje", localPlayer, "error", "Hasło jest za krótkie")
	else
		triggerEvent("stworz_notyfikacje", localPlayer, "error", "Password is too short")
	end
	return end
	triggerServerEvent('ZmianaHaslaBaza',resourceRoot,localPlayer,last_clicked['nazwa_bazy'],guiGetText(GUIEditor.edit[3]),"3")
end,false)


addEventHandler('onClientGUIClick',Nazwa_bazy_grid,function()
	local itemName = guiGridListGetItemText(Nazwa_bazy_grid, guiGridListGetSelectedItem(Nazwa_bazy_grid), 1);
	restartLabels(itemName)
end)


addEvent('SetBaseToGridlist',true)
addEventHandler('SetBaseToGridlist',resourceRoot,function(table,table2)
	guiSetEnabled(GUIEditor.button[2],true)
	guiSetEnabled(GUIEditor.button[3],true)
	bazy = table
	setBaseNameToGridist(bazy,table2)
end)


function setTablePlayers(table)
	guiGridListClear(GUIEditor.gridlist[2])
	for i,v in pairs(table) do
		local row = guiGridListAddRow(GUIEditor.gridlist[2])
		guiGridListSetItemText(GUIEditor.gridlist[2],row,1,v,false,false)
	end
end


addEvent('SetPlayersWhoHavePermission',true)
addEventHandler('SetPlayersWhoHavePermission',resourceRoot,function(table)
	setTablePlayers(table)
end)

addEventHandler('onClientGUIClick',GUIEditor.button[3],function()
local jezyk = getElementData(localPlayer,"Jezyk_Gry") or "PL"
	local itemName = guiGridListGetItemText(GUIEditor.gridlist[2], guiGridListGetSelectedItem(GUIEditor.gridlist[2]), 1);
	local text = guiGridListGetItemText(Nazwa_bazy_grid, guiGridListGetSelectedItem(Nazwa_bazy_grid), 1);
	if text=="" then
	if jezyk =="PL" then
		triggerEvent("stworz_notyfikacje", localPlayer, "error", "Zaznacz baze")
	else
		triggerEvent("stworz_notyfikacje", localPlayer, "error", "Select base")
	end
		return
	end
	if itemName~="" then
		triggerServerEvent('RemoveAccesBase',resourceRoot,localPlayer,itemName,last_clicked)
	end
end,false)


addEventHandler('onClientGUIClick',GUIEditor.button[2],function()
local jezyk = getElementData(localPlayer,"Jezyk_Gry") or "PL"
	local itemName = guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1);
	local text = guiGridListGetItemText(Nazwa_bazy_grid, guiGridListGetSelectedItem(Nazwa_bazy_grid), 1);
	if text=="" then
		if jezyk =="PL" then
		triggerEvent("stworz_notyfikacje", localPlayer, "error", "Zaznacz baze")
	else
		triggerEvent("stworz_notyfikacje", localPlayer, "error", "Select base")
	end
		return
	end
	if itemName~="" then
		triggerServerEvent('GiveAccesBase',resourceRoot,localPlayer,itemName,last_clicked)
	end
end,false)