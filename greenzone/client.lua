addEvent('gui-Create',true)


local ceny = {
	["GP"] = {
		["MALA"] = {
			['7 Dni'] = 1000,
			['14 Dni'] = 2000,
			['28 Dni'] = 4000,
			--['Na Zawsze'] = 20000,
		},
		["DUZA"] = {
			['7 Dni'] = 4000,
			['14 Dni'] = 8000,
			['28 Dni'] = 12000,
			--['Na Zawsze'] = 45000,
		},
		["SREDNIA"] = {
			['7 Dni'] = 2000,
			['14 Dni'] = 4000,
			['28 Dni'] = 8000,
			--['Na Zawsze'] = 16000,
		},
		--[[['VIP'] = {
			['7 Dni'] = 10000,
			['14 Dni'] = 20000,
			['28 Dni'] = 30000,
			['Na Zawsze'] = 40000,
		}]]
	},
--[[	["PP (Punkty Premium)"] = {
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
		},]]
		--[[['VIP'] = {
			['7 Dni'] = 160,
			['14 Dni'] = 160*2,
			['28 Dni'] = 160*3,
			['Na Zawsze'] = 160*4,
		}
	},]]
}

function getCeny(text1,text2,text3)
	if text1=="" or text2=="" or text3=="" then return "" end
	if ceny[text1][text2][text3] then
		return tostring(ceny[text1][text2][text3])
	end
	return false
end

local GUIEditor = {
    button = {},
    window = {},
    label = {},
    combobox = {},
	edit = {},
}

GUIEditor.window[1] = guiCreateWindow(0.36, 0.29, 0.29, 0.42, "System baz [Kupno]", true)
guiWindowSetMovable(GUIEditor.window[1], false)
guiWindowSetSizable(GUIEditor.window[1], false)


local napisy = {
	{-47,-247,7,"Kupno Baz!",50,100,300,7},
        {-47,-237,7,"Opłata Baz!",50,30,100,7},
	{-57,-224,6,'Wejście!',50,100,30,15},
--	{-62,-378,6,'Bazar!',50,100,30,15},
}

local napisy2 = {
	{-47,-247,7,"Purchase of bases!",50,100,300,7},
        {-47,-237,7,"Base fee!",50,30,100,7},
	{-57,-224,6,'Enter!',50,100,30,15},
--	{-62,-378,6,'Bazar!',50,100,30,15},
}

local col = createColCuboid(-299,-550,-10,500,500,500)


addEventHandler('onClientColShapeHit',col,function(theElement)
	   if ( theElement == localPlayer ) then
	   local detection = isElementWithinColShape ( theElement, col )
	   detection = detection and getElementDimension( theElement ) == getElementDimension( col )
	   if detection then
			toggleControl('fire',false)
			toggleControl('aim_weapon',false)
			toggleControl('next_weapon',false)
			toggleControl('previous_weapon',false)
			toggleControl('zoom_in',false)
			toggleControl('zoom_out',false)
		--	setWeather (8)
			--setFogDistance(150)
		--	setWeatherBlended ( 21 )
		end
	end
end)

addEventHandler('onClientRender',root,function()
local jezyk = getElementData(localPlayer,"Jezyk_Gry") or "PL"
	if jezyk =="PL" then
		for i,v in pairs(napisy) do
			if getDistanceBetweenPoints3D(Vector3(getElementPosition(localPlayer)),v[1],v[2],v[3])<v[8] then
				local coords = {getScreenFromWorldPosition(v[1],v[2],v[3])}
				local alg = 255 / v[8] 
				local alpha = getDistanceBetweenPoints3D(Vector3(getElementPosition(localPlayer)),v[1],v[2],v[3]) * alg
				if coords[1] and coords[2] then
					dxDrawText(v[4],coords[1],coords[2],coords[1],coords[2],tocolor(v[5],v[6],v[7],255 - alpha),2,'default-bold', "left", "top", false, flase, true)
				end
			end
		end
	else
		for i,v in pairs(napisy2) do
			if getDistanceBetweenPoints3D(Vector3(getElementPosition(localPlayer)),v[1],v[2],v[3])<v[8] then
				local coords = {getScreenFromWorldPosition(v[1],v[2],v[3])}
				local alg = 255 / v[8] 
				local alpha = getDistanceBetweenPoints3D(Vector3(getElementPosition(localPlayer)),v[1],v[2],v[3]) * alg
				if coords[1] and coords[2] then
					dxDrawText(v[4],coords[1],coords[2],coords[1],coords[2],tocolor(v[5],v[6],v[7],255 - alpha),2,'default-bold', "left", "top", false, flase, true)
				end
			end
		end
	end
end)


gui_zamknij = guiCreateButton(0.45, 0.02, 0.1, 0.03, "Zamknij", true)
gui_will_close = nil

guiSetVisible(gui_zamknij, false)

GUIEditor.combobox[1] = guiCreateComboBox(0.03, 0.16, 0.29, 0.24, "", true, GUIEditor.window[1])
guiComboBoxAddItem(GUIEditor.combobox[1], "MALA")
guiComboBoxAddItem(GUIEditor.combobox[1], "SREDNIA")
guiComboBoxAddItem(GUIEditor.combobox[1], "DUZA")
--[[guiComboBoxAddItem(GUIEditor.combobox[1], "VIP")]]
GUIEditor.label[1] = guiCreateLabel(0.03, 0.08, 0.29, 0.08, "Typ bazy:", true, GUIEditor.window[1])
guiLabelSetHorizontalAlign(GUIEditor.label[1], "center", false)
guiLabelSetVerticalAlign(GUIEditor.label[1], "center")
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
GUIEditor.label[4] = guiCreateLabel(0.31, 0.63, 0.38, 0.05, "Cena:  ", true, GUIEditor.window[1])
guiLabelSetHorizontalAlign(GUIEditor.label[4], "center", false)
guiLabelSetVerticalAlign(GUIEditor.label[4], "center")

GUIEditor.edit[2] = guiCreateEdit(0.31, 0.43, 0.36, 0.08, "", true, GUIEditor.window[1])
GUIEditor.label[6] = guiCreateLabel(0.31, 0.38, 0.35, 0.05, "Nazwa bazy", true,GUIEditor.window[1])
guiLabelSetHorizontalAlign(GUIEditor.label[6], "center", false)
guiEditSetMaxLength(GUIEditor.edit[2],16)
guiSetVisible(GUIEditor.window[1],false)

panel_wejdz = guiCreateWindow(0.33, 0.28, 0.33, 0.45, "Panel Baz", true)
grid_bazy = guiCreateGridList(0.02, 0.06, 0.42, 0.91, true, panel_wejdz)
guiGridListAddColumn(grid_bazy, "NAZWA BAZY", 0.4)
guiGridListAddColumn(grid_bazy, "TYP", 0.25)
guiGridListAddColumn(grid_bazy, "ID:", 0.2)
grid_wejdz = guiCreateButton(0.55, 0.43, 0.34, 0.19, "Wejdz", true, panel_wejdz)
guiSetProperty(grid_wejdz, "NormalTextColour", "FFAAAAAA")
guiSetVisible(panel_wejdz,false)

local language2 = {
	['PL'] = {
		['zamknij'] = "Zamknij",
		['typ'] = "Typ bazy",
		['mala'] = "MALA",
		['srednia'] = "ŚREDNIA",
		['duza'] = "DUŻA",
		['naile'] = "Na ile",
		['typplat'] = "Typ Płatności",
		['kup'] = "Kup",
		['wejdz'] = "Wejdz",
		['basepanel'] = "Panel Baz",
		['nazwabasy'] = "NAZWA BAZY",
		['type'] = "TYP",
		['system'] = "System baz [Kupno]",
	},
	['ENG'] = {
		['zamknij'] = "Close",
		['typ'] = "Base type",
		['mala'] = "SMALL",
		['srednia'] = "MEDIUM",
		['duza'] = "HIGH",
		['naile'] = "How long",
		['typplat'] = "Payment Type",
		['kup'] = "Buy",
		['wejdz'] = "Come in",
		['basepanel'] = "Base panel",
		['nazwabasy'] = "BASE NAME",
		['type'] = "TYPE",
		['system'] = "Base system [Purchase]",
	},
}

function refresz2()
local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	--guiGridListSetColumnTitle(GUIEditor.combobox[1],1, language2[jezyk]['mala'])
	--guiGridListSetColumnTitle(GUIEditor.combobox[1],2, language2[jezyk]['srednia'])
	guiGridListSetColumnTitle(grid_bazy,1, language2[jezyk]['nazwabasy'])
	guiGridListSetColumnTitle(grid_bazy,2, language2[jezyk]['type'])
	guiSetText(GUIEditor.label[6], language2[jezyk]['nazwabasy'])
	guiSetText(gui_zamknij, language2[jezyk]['zamknij'])
	guiSetText(GUIEditor.label[1], language2[jezyk]['typ'])
	guiSetText(GUIEditor.label[2], language2[jezyk]['naile'])
	guiSetText(GUIEditor.label[3], language2[jezyk]['typplat'])
	guiSetText(GUIEditor.button[1], language2[jezyk]['kup'])
	guiSetText(grid_wejdz, language2[jezyk]['wejdz'])
	guiSetText(panel_wejdz, language2[jezyk]['basepanel'])
	guiSetText(GUIEditor.window[1], language2[jezyk]['system'])
	--guiSetText(GUIEditor.combobox[1], language2[jezyk]['mala'])
	--guiSetText(GUIEditor.combobox[1], language2[jezyk]['srednia'])
	--guiSetText(GUIEditor.combobox[1], language2[jezyk]['duza'])
end
setTimer(refresz2,2000,0)

addEventHandler("onClientGUIClick", gui_zamknij, function()
	showCursor(false)
	guiSetVisible(gui_zamknij, false)
	guiSetVisible(gui_will_close, false)
end, false)


function uzupelniajListe(tabela)
	--outputChatBox(tabela[1]['nazwa_bazy'])
	for i=1,#tabela do
		local row = guiGridListAddRow(grid_bazy)
		--outputChatBox(tabela[i]['nazwa_bazy'])
		guiGridListSetItemText(grid_bazy,row,1,tabela[i]['nazwa_bazy'],false,false)
		guiGridListSetItemText(grid_bazy,row,2,tabela[i]['type'],false,false)
		guiGridListSetItemText(grid_bazy,row,3,tabela[i]['dimension'],false,false)
	end
end


local base_col_pos = {
	['SREDNIA'] = {-18,-122,60,55,65,25},
	['MALA'] = {36,-136,80,40,40,15},
	['DUZA'] = {-115,-120,60,85,85,15},
--	['VIP'] = {-219,-174,56,100,130,25},
}


addEventHandler('onClientGUIClick',grid_wejdz,function()
	local itemName = guiGridListGetItemText(grid_bazy, guiGridListGetSelectedItem(grid_bazy), 1);
	if itemName~="" then
		triggerServerEvent('WchodzeDoBazy',resourceRoot,localPlayer,itemName)
	end
end,false)




addEvent('gui-hit-create',true)
addEventHandler('gui-hit-create',resourceRoot,function(type,lista)
	guiGridListClear(grid_bazy)
	if lista then
		uzupelniajListe(lista)
	end
	showCursor(type,false)
	guiSetVisible(panel_wejdz,type)
	gui_will_close = panel_wejdz

	guiSetVisible(gui_zamknij, type)
end)


function getFirstChars(text)
	return " "..text:sub(1,2)
end

addEventHandler('gui-Create',resourceRoot,function(type)
	guiSetVisible(GUIEditor.window[1],type)
	gui_will_close = GUIEditor.window[1]
	guiSetVisible(gui_zamknij, type)
	showCursor(type,false)
	guiSetInputMode('no_binds_when_editing')
end)


addEventHandler('onClientGUIComboBoxAccepted',resourceRoot,function()
local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	local text = guiComboBoxGetItemText(GUIEditor.combobox[2],guiComboBoxGetSelected(GUIEditor.combobox[2]))
	local text2 = guiComboBoxGetItemText(GUIEditor.combobox[1],guiComboBoxGetSelected(GUIEditor.combobox[1]))
	local text3 = guiComboBoxGetItemText(GUIEditor.combobox[3],guiComboBoxGetSelected(GUIEditor.combobox[3]))
	if jezyk =="PL" then
		guiSetText(GUIEditor.label[4],'Cena: '..getCeny(text3,text2,text)..getFirstChars(text3))
	else
		guiSetText(GUIEditor.label[4],'Cost: '..getCeny(text3,text2,text)..getFirstChars(text3))
	end
end)


function isEveryCharIsBackspace(text)
local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	local spacje = 0
	for i=1,text:len() do
		if string.find(string.sub(text,i,i),' ') then
			spacje = spacje + 1
		end
	end
	if spacje==text:len() then 
		if jezyk =="PL" then
			outputChatBox('Wszystkie znaki nie moga byc spacjami!')
		else
			outputChatBox('All characters cannot be spaces!')
		end
		return true
	end
	return false
end


local texts_to_brama = {
	['MALA'] = {"BRAK","BRAK","BRAK"},
	['SREDNIA'] = {"JEST",'BRAK',"BRAK"},
	['VIP'] = {"JEST","JEST","JEST"},
	['DUZA'] = {"JEST","JEST",'BRAK'},
}

		
function returnBramys(typ)
	return texts_to_brama[typ][1],texts_to_brama[typ][2],texts_to_brama[typ][3]
end


function kupBaze()
	local text = guiComboBoxGetItemText(GUIEditor.combobox[2],guiComboBoxGetSelected(GUIEditor.combobox[2]))
	local text2 = guiComboBoxGetItemText(GUIEditor.combobox[1],guiComboBoxGetSelected(GUIEditor.combobox[1]))
	local text3 = guiComboBoxGetItemText(GUIEditor.combobox[3],guiComboBoxGetSelected(GUIEditor.combobox[3]))
	local name_of_baze = guiGetText(GUIEditor.edit[2])
	--if (getElementData(localPlayer,getFirstChars(text3)) or 0)<tonumber(text) then return end
	triggerServerEvent('KupnoBazy',resourceRoot,localPlayer,name_of_baze,text,text2,getCeny(text3,text2,text),getFirstChars(text3):gsub(" ",""),returnBramys(text2))
end


addEventHandler('onClientGUIClick',GUIEditor.button[1],function()
	local text = guiComboBoxGetItemText(GUIEditor.combobox[2],guiComboBoxGetSelected(GUIEditor.combobox[2]))
	local text2 = guiComboBoxGetItemText(GUIEditor.combobox[1],guiComboBoxGetSelected(GUIEditor.combobox[1]))
	local text3 = guiComboBoxGetItemText(GUIEditor.combobox[3],guiComboBoxGetSelected(GUIEditor.combobox[3]))
	if not getCeny(text3,text2,text) then return end
	if guiGetText(GUIEditor.edit[2])=="" then return end
	if isEveryCharIsBackspace(guiGetText(GUIEditor.edit[2])) then return end
	kupBaze()
end,false)

addEventHandler('onClientVehicleDamage', root, function()
	if getElementDimension(source) >= 1 then
		cancelEvent()
	end
	if isElementWithinColShape(source, getElementsByType("colshape", resourceRoot)[1]) then
		cancelEvent()
	end
end, true, "high")











