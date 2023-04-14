local ceny = {
	["GP"] = {
		["MALA"] = {
			['7 Dni'] = 1000,
			['14 Dni'] = 2000,
			['28 Dni'] = 4000,
			--['Na Zawsze'] = 30000,
		},
		["DUZA"] = {
			['7 Dni'] = 4000,
			['14 Dni'] = 8000,
			['28 Dni'] = 12000,
			--['Na Zawsze'] = 40000,
		},
		["SREDNIA"] = {
			['7 Dni'] = 2000,
			['14 Dni'] = 4000,
			['28 Dni'] = 8000,
			--['Na Zawsze'] = 16000,
		},
		['VIP'] = {
			['7 Dni'] = 10000,
			['14 Dni'] = 20000,
			['28 Dni'] = 30000,
			--['Na Zawsze'] = 40000,
		}
	},
	--[[["PP (Punkty Premium)"] = {
		["MALA"] = {
			['7 Dni'] = 5,
			['14 Dni'] = 10,
			['28 Dni'] = 20,
			['Na Zawsze'] = 40,
		},
		["SREDNIA"] = {
			['7 Dni'] = 10,
			['14 Dni'] = 20,
			['28 Dni'] = 40,
			['Na Zawsze'] = 80,
		},
		["DUZA"] = {
			['7 Dni'] = 20,
			['14 Dni'] = 40,
			['28 Dni'] = 80,
			['Na Zawsze'] = 160,
		},
		['VIP'] = {
			['7 Dni'] = 160,
			['14 Dni'] = 160*2,
			['28 Dni'] = 160*3,
			['Na Zawsze'] = 160*4,
		}
	},]]
}

local GUIEditor = {
    button = {},
    window = {},
    label = {},
    combobox = {},
	edit = {},
	gridlist = {},
}

GUIEditor.window[1] = guiCreateWindow(0.36, 0.29, 0.29, 0.42, "System baz [OPLATA]", true)
guiWindowSetMovable(GUIEditor.window[1], false)
guiWindowSetSizable(GUIEditor.window[1], false)



GUIEditor.combobox[1] = guiCreateComboBox(0.03, 0.16, 0.29, 0.24, "", true, GUIEditor.window[1])
guiComboBoxAddItem(GUIEditor.combobox[1], "MALA")
guiComboBoxAddItem(GUIEditor.combobox[1], "SREDNIA")
guiComboBoxAddItem(GUIEditor.combobox[1], "DUZA")
guiComboBoxAddItem(GUIEditor.combobox[1], "VIP")
guiSetVisible(GUIEditor.combobox[1],false)
GUIEditor.label[1] = guiCreateLabel(0.03, 0.08, 0.29, 0.08, "Typ bazy:", true, GUIEditor.window[1])
guiLabelSetHorizontalAlign(GUIEditor.label[1], "center", false)
guiLabelSetVerticalAlign(GUIEditor.label[1], "center")
guiSetVisible(GUIEditor.label[1],false)
GUIEditor.combobox[2] = guiCreateComboBox(0.32, 0.16, 0.29, 0.24, "", true, GUIEditor.window[1])
guiComboBoxAddItem(GUIEditor.combobox[2], "7 Dni")
guiComboBoxAddItem(GUIEditor.combobox[2], "14 Dni")
guiComboBoxAddItem(GUIEditor.combobox[2], "28 Dni")
--guiComboBoxAddItem(GUIEditor.combobox[2], "Na Zawsze")
GUIEditor.label[2] = guiCreateLabel(0.32, 0.08, 0.29, 0.08, "Na ile:", true, GUIEditor.window[1])
guiLabelSetHorizontalAlign(GUIEditor.label[2], "center", false)
guiLabelSetVerticalAlign(GUIEditor.label[2], "center")
GUIEditor.combobox[3] = guiCreateComboBox(0.61, 0.16, 0.36, 0.23, "", true, GUIEditor.window[1])
guiComboBoxAddItem(GUIEditor.combobox[3], "GP")
GUIEditor.label[3] = guiCreateLabel(0.61, 0.08, 0.29, 0.08, "Typ Płatności:", true, GUIEditor.window[1])
guiLabelSetHorizontalAlign(GUIEditor.label[3], "center", false)
guiLabelSetVerticalAlign(GUIEditor.label[3], "center")
GUIEditor.button[1] = guiCreateButton(0.33, 0.85, 0.34, 0.12, "KUP", true, GUIEditor.window[1])
guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FFAAAAAA")
GUIEditor.label[4] = guiCreateLabel(0.31, 0.73, 0.38, 0.05, "Cena:  ", true, GUIEditor.window[1])
guiLabelSetHorizontalAlign(GUIEditor.label[4], "center", false)
guiLabelSetVerticalAlign(GUIEditor.label[4], "center")


guiSetVisible(GUIEditor.window[1],false)
GUIEditor.gridlist[1] = guiCreateGridList(0.24, 0.40, 0.52, 0.24, true, GUIEditor.window[1])
guiGridListAddColumn(GUIEditor.gridlist[1], "Baza", 0.9)    


local language2 = {
	['PL'] = {
		['system'] = "System baz [OPLATA]",
		['typ'] = "Typ bazy:",
		['naile'] = "Na ile:",
		['typplatnosci'] = "Typ Płatności:",
		['kup'] = "KUP",
		['basa'] = "Baza",
		['cena'] = "Cena",
	},
	['ENG'] = {
		['system'] = "Base system [PRAYING]",
		['typ'] = "Base type:",
		['naile'] = "How long:",
		['typplatnosci'] = "Payment Type:",
		['kup'] = "BUY",
		['basa'] = "Base",
		['cena'] = "Cost",
	},
}

function refresz2()
local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	guiGridListSetColumnTitle(GUIEditor.gridlist[1],1, language2[jezyk]['basa'])
	guiSetText(GUIEditor.window[1], language2[jezyk]['system'])
	guiSetText(GUIEditor.label[1], language2[jezyk]['typ'])
	guiSetText(GUIEditor.label[2], language2[jezyk]['naile'])
	guiSetText(GUIEditor.label[3], language2[jezyk]['typplatnosci'])
	guiSetText(GUIEditor.label[4], language2[jezyk]['cena'])
	guiSetText(GUIEditor.button[1], language2[jezyk]['kup'])
end
setTimer(refresz2,2000,0)

local bases = {}

local function getBaseName()
	return bases[guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)]
end

local function restartLalbes()
local jezyk = getElementData(localPlayer,"Jezyk_Gry") or "PL"
	local text = guiComboBoxGetItemText(GUIEditor.combobox[2],guiComboBoxGetSelected(GUIEditor.combobox[2]))
	local text2 = getBaseName()
	local text3 =  guiComboBoxGetItemText(GUIEditor.combobox[3],guiComboBoxGetSelected(GUIEditor.combobox[3]))
	if jezyk =="PL" then
		guiSetText(GUIEditor.label[4],'Cena: '..getCeny(text3,text2,text)..getFirstChars(text3))
	else
		guiSetText(GUIEditor.label[4],'Cost: '..getCeny(text3,text2,text)..getFirstChars(text3))
	end
end

addEventHandler('onClientGUIComboBoxAccepted',resourceRoot,function()
	restartLalbes()
end)


addEventHandler('onClientGUIClick',GUIEditor.gridlist[1],function()
	restartLalbes()
end,false)

addEventHandler('onClientGUIClick',GUIEditor.button[1],function()
	local text = guiComboBoxGetItemText(GUIEditor.combobox[2],guiComboBoxGetSelected(GUIEditor.combobox[2]))
	local text2 = getBaseName()
	local text3 = guiComboBoxGetItemText(GUIEditor.combobox[3],guiComboBoxGetSelected(GUIEditor.combobox[3]))
	local itemName = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
	if text=="" or text2=="" or text3=="" or itemName=="" then return end
	triggerServerEvent('OplacBaze',resourceRoot,localPlayer,tonumber(getCeny(text3,text2,text)),getFirstChars(text3),itemName,text)
end,false)


local function autoSortingGridlist(list)
	guiGridListClear(GUIEditor.gridlist[1])
	bases = {}
	for i,v in pairs(list) do
		local row = guiGridListAddRow(GUIEditor.gridlist[1])
		guiGridListSetItemText(GUIEditor.gridlist[1],row,1,v['nazwa_bazy'],false,false)
		bases[v['nazwa_bazy']] = v['type']
	end
end

addEvent('gui-Create-OPLATA',true)
addEventHandler('gui-Create-OPLATA',resourceRoot,function(type,lista)
	guiSetVisible(GUIEditor.window[1],type)
	showCursor(type,false)
	gui_will_close = GUIEditor.window[1]
	guiSetVisible(gui_zamknij, type)
	guiSetInputMode('no_binds_when_editing')
	if lista then
		autoSortingGridlist(lista)
	end
end)



