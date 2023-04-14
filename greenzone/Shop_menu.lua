

local Shop_Window = guiCreateWindow(0.35, 0.44, 0.30, 0.12, "Item Shop", true)
guiWindowSetMovable(Shop_Window, false)
guiWindowSetSizable(Shop_Window, false)

local Button_menu_buy = guiCreateButton(0.04, 0.28, 0.34, 0.49, "BUY", true, Shop_Window)
guiSetProperty(Button_menu_buy, "NormalTextColour", "FFAAAAAA")
local Button_menu_sell = guiCreateButton(0.63, 0.28, 0.34, 0.49, "SELL", true, Shop_Window)
guiSetProperty(Button_menu_sell, "NormalTextColour", "FFAAAAAA")    


local GUIEditor = {
    gridlist = {},
    window = {},
    button = {},
	label = {},
	combobox = {}
}

GUIEditor.window[1] = guiCreateWindow(0.37, 0.28, 0.27, 0.46, "Buy Menu", true)
guiWindowSetMovable(GUIEditor.window[1], false)
guiWindowSetSizable(GUIEditor.window[1], false)

GUIEditor.gridlist[1] = guiCreateGridList(0.03, 0.07, 0.57, 0.65, true, GUIEditor.window[1])
guiGridListAddColumn(GUIEditor.gridlist[1], "Item", 0.7)
guiGridListAddColumn(GUIEditor.gridlist[1], "Cost", 0.2)
guiGridListAddColumn(GUIEditor.gridlist[1], "#", 0.1)
GUIEditor.button[1] = guiCreateButton(0.07, 0.79, 0.28, 0.16, "Buy", true, GUIEditor.window[1])
guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FFAAAAAA")
GUIEditor.button[2] = guiCreateButton(0.68, 0.79, 0.28, 0.16, ">>", true, GUIEditor.window[1])
guiSetProperty(GUIEditor.button[2], "NormalTextColour", "FFAAAAAA")    
GUIEditor.combobox[1] = guiCreateComboBox(0.64, 0.31, 0.27, 0.33, "", true, GUIEditor.window[1])
guiComboBoxAddItem(GUIEditor.combobox[1], "Weapons")
guiComboBoxAddItem(GUIEditor.combobox[1], "Ammunation")
guiComboBoxAddItem(GUIEditor.combobox[1], "Food & Drink")
guiComboBoxAddItem(GUIEditor.combobox[1], "Medicines")
guiComboBoxAddItem(GUIEditor.combobox[1], "Backpack")
guiComboBoxAddItem(GUIEditor.combobox[1], "Toolbelt")
GUIEditor.label[2] = guiCreateLabel(0.64, 0.24, 0.27, 0.04, "Type", true, GUIEditor.window[1])
guiSetFont(GUIEditor.label[2], "default-bold-small")
guiLabelSetHorizontalAlign(GUIEditor.label[2], "center", false)    


local CloseButton = guiCreateButton(0.42, 0.74, 0.15, 0.15, "Close", true,Shop_Window)

local items = {
    ['Weapons'] = {
    {item = "M4", cost_sell = 50, cost_buy = 350, ilosc=1},
    {item = "AK-47", cost_sell = 50, cost_buy = 350, ilosc=1},
    {item = "CZ550", cost_sell = 70, cost_buy = 500, ilosc=1},
    {item = "M60", cost_sell = 100, cost_buy = 650, ilosc=1},
    {item = "Lee Enfield", cost_sell = 25, cost_buy = 150, ilosc=1},
    {item = "M1911", cost_sell = 10, cost_buy = 70, ilosc=1},
    {item = "M9 SD", cost_sell = 10, cost_buy = 70, ilosc=1},
    {item = "Desert Eagle", cost_sell = 15, cost_buy = 80, ilosc=1},
    {item = "PDW", cost_sell = 20, cost_buy = 80, ilosc=1},
    {item = "MP5A5", cost_sell = 20, cost_buy = 80, ilosc=1},
    {item = "Winchester 1866", cost_sell = 20, cost_buy = 80, ilosc=1},
    {item = "SPAZ-12 Combat Shotgun", cost_sell = 20, cost_buy = 80, ilosc=1},
    {item = "Sawn-Off Shotgun", cost_sell = 20, cost_buy = 80, ilosc=1},
    {item = "Baseball Bat", cost_sell = 15, cost_buy = 50, ilosc=1},
    {item = "Hunting Knife", cost_sell = 10, cost_buy = 50, ilosc=1},
    {item = "Hatchet", cost_sell = 15, cost_buy = 50, ilosc=1},
    {item = "Shovel", cost_sell = 15, cost_buy = 50, ilosc=1},
    {item = "Golf Club", cost_sell = 15, cost_buy = 50, ilosc=1},
    },
    ['Ammunation'] = {
    {item = "M4 Mag", cost_sell = 10, cost_buy = 55, ilosc=1},
    {item = "AK-47 Mag", cost_sell = 10, cost_buy = 55, ilosc=1},
    {item = "CZ550 Mag", cost_sell = 20, cost_buy = 80, ilosc=1},
    {item = "M60 Mag", cost_sell = 20, cost_buy = 100, ilosc=1},
    {item = "Lee Enfield Mag", cost_sell = 8, cost_buy = 40, ilosc=1},
    {item = "M1911 Mag", cost_sell = 5, cost_buy = 30, ilosc=1},
    {item = "M9 SD Mag", cost_sell = 5, cost_buy = 30, ilosc=1},
    {item = "Desert Eagle Mag", cost_sell = 5, cost_buy = 35, ilosc=1},
    {item = "PDW Mag", cost_sell = 7, cost_buy = 35, ilosc=1},
    {item = "MP5A5 Mag", cost_sell = 7, cost_buy = 35, ilosc=1},
    {item = "1866 Slug", cost_sell = 8, cost_buy = 40, ilosc=1},
    {item = "SPAZ-12 Pellet", cost_sell = 8, cost_buy = 40, ilosc=1},
    {item = "2Rnd. Slug", cost_sell = 8, cost_buy = 40, ilosc=1},
    },
    ['Food & Drink'] = {
    {item = "Pasta Can", cost_sell = 5, cost_buy = 25, ilosc=1},
    {item = "Beans Can", cost_sell = 5, cost_buy = 25, ilosc=1},
    {item = "Kebab", cost_sell = 5, cost_buy = 25, ilosc=1},
    {item = "Pizza", cost_sell = 5, cost_buy = 25, ilosc=1},
    {item = "Burger", cost_sell = 5, cost_buy = 25, ilosc=1},
    {item = "Soda Bottle", cost_sell = 5, cost_buy = 25, ilosc=1},
    {item = "Milk", cost_sell = 5, cost_buy = 25, ilosc=1},
    {item = "Coca Cola", cost_sell = 5, cost_buy = 25, ilosc=1},
    {item = "Water Bottle", cost_sell = 5, cost_buy = 25, ilosc=1},
    {item = "Cooked Meat", cost_sell = 5, cost_buy = 25, ilosc=1},
    {item = "Raw Meat", cost_sell = 5, cost_buy = 25, ilosc=1},
    },
    ['Medicines'] = {
    {item = "Bandage", cost_sell = 10, cost_buy = 80, ilosc=1},
    {item = "Painkiller", cost_sell = 10, cost_buy = 80, ilosc=1},
    {item = "Morphine", cost_sell = 10, cost_buy = 80, ilosc=1},
    {item = "Heat Pack", cost_sell = 15, cost_buy = 90, ilosc=1},
    {item = "First Aid Kit", cost_sell = 25, cost_buy = 150, ilosc=1},
    {item = "Medic Kit", cost_sell = 40, cost_buy = 200, ilosc=1},
    {item = "Blood Bag", cost_sell = 30, cost_buy = 100, ilosc=1},
    {item = "Medic Bag", cost_sell = 60, cost_buy = 250, ilosc=1},
    },
    ['Backpack'] = {
    {item = "Assault Pack (ACU)", cost_sell = 10, cost_buy = 100, ilosc=1},
    {item = "Medic Backpack", cost_sell = 25, cost_buy = 200, ilosc=1},
    {item = "Alice Pack", cost_sell = 35, cost_buy = 300, ilosc=1},
    {item = "Medium Backpack", cost_sell = 40, cost_buy = 400, ilosc=1},
    {item = "Czech Backpack", cost_sell = 50, cost_buy = 500, ilosc=1},
    {item = "Big Backpack", cost_sell = 60, cost_buy = 600, ilosc=1},
    {item = "Military Backpack", cost_sell = 80, cost_buy = 700, ilosc=1},
    {item = "Coyote Backpack", cost_sell = 90, cost_buy = 800, ilosc=1},
    {item = "CMAR Backpack", cost_sell = 100, cost_buy = 900, ilosc=1},
    },
    ['Misc'] = {
        -- przyklad {item = "M4", cost_sell = 300, cost_buy = 500, ilosc=1},
    },
    ['Toolbelt'] = {
    {item = "GPS", cost_sell = 20, cost_buy = 100, ilosc=1},
    {item = "Map", cost_sell = 20, cost_buy = 100, ilosc=1},
    {item = "Toolbox", cost_sell = 25, cost_buy = 250, ilosc=1},
    {item = "Watch", cost_sell = 10, cost_buy = 80, ilosc=1},
    {item = "Box of Matches", cost_sell = 10, cost_buy = 80, ilosc=1},
    {item = "Night Vision Goggles", cost_sell = 25, cost_buy = 250, ilosc=1},
    {item = "Infrared Goggles", cost_sell = 25, cost_buy = 250, ilosc=1},

    },
}

local player_page = nil

local function refreshPage(grid,arg)
	guiGridListClear(grid)
	local comoboxText = guiGetText(GUIEditor.combobox[1])
	if comoboxText=="" then return end
	for i,v in pairs(items[comoboxText]) do
		if arg=='buy' then
			local row = guiGridListAddRow(grid)
			guiGridListSetItemText(grid,row,1,v.item,false,false)
			guiGridListSetItemText(grid,row,2,v.cost_buy,false,false)
			guiGridListSetItemText(grid,row,3,v.ilosc,false,false)
		elseif arg=='sell' then
			if (getElementData(localPlayer,v.item) or 0)>=1 then
				local row = guiGridListAddRow(grid)
				guiGridListSetItemText(grid,row,1,v.item,false,false)
				guiGridListSetItemText(grid,row,2,v.cost_sell,false,false)
				guiGridListSetItemText(grid,row,3,getElementData(localPlayer,v.item) or '0',false,false)
			end
		end
	end
end

local function closeMenu(arg)
	if not arg then arg = false end
	guiSetVisible(GUIEditor.window[1],arg)
	guiSetVisible(Shop_Window,arg)
end

closeMenu()

local button_to_function = {
	['BUY'] = function()
		guiComboBoxSetSelected(GUIEditor.combobox[1],0)
		guiSetText(GUIEditor.window[1],'Buy Menu')
		guiSetText(GUIEditor.button[1],'Buy')
		refreshPage(GUIEditor.gridlist[1],'buy')
		guiSetVisible(GUIEditor.window[1],true)
		guiSetVisible(Shop_Window,false)
		player_page = 'buy'
	end,
	['>>'] = function()
		guiSetVisible(GUIEditor.window[1],false)
		guiSetVisible(Shop_Window,true)
	end,
	['SELL'] = function()
		guiComboBoxSetSelected(GUIEditor.combobox[1],0)
		guiSetText(GUIEditor.window[1],'Sell Menu')
		guiSetText(GUIEditor.button[1],'Sell')
		refreshPage(GUIEditor.gridlist[1],'sell')
		guiSetVisible(GUIEditor.window[1],true)
		guiSetVisible(Shop_Window,false)
		player_page = 'sell'
	end,
	['Buy'] = function()
		local item = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
		local cena = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),2)
		local ilosc = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),3)
		if player_page~='buy' then
			outputChatBox("Error, try later!",200,0,0)
			return
		end
		if item=="" or cena=="" or ilosc=="" then
			return
		end
		triggerServerEvent("giveItem",resourceRoot,localPlayer,item,tonumber(cena),tonumber(ilosc))
	end,
	['Sell'] = function()
		local item = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
		local cena = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),2)
		local ilosc = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),3)
		if player_page~='sell' then
			outputChatBox("Error, try later!",200,0,0)
			return
		end
		if item=="" or cena=="" or ilosc=="" then
			return
		end
		triggerServerEvent("sellItem",resourceRoot,localPlayer,item,tonumber(cena),tonumber(ilosc))
	end,
	['Close'] = function()
		showCursor(false)
		guiSetVisible(Shop_Window,false)
		guiSetVisible(GUIEditor.window[1],false)
	end,
}


addEventHandler('onClientGUIClick',resourceRoot,function()
	if button_to_function[guiGetText(source)] then
		button_to_function[guiGetText(source)]()
	end
end)

addEventHandler('onClientGUIClick',GUIEditor.combobox[1],function()
	refreshPage(GUIEditor.gridlist[1],player_page)
end,false)


addEvent('ShowMeBuyMenu',true)
addEventHandler('ShowMeBuyMenu',resourceRoot,function(arg)
	showCursor(true,false)
	guiSetVisible(GUIEditor.window[1],false)
	guiSetVisible(Shop_Window,arg)	
	if not arg then
		showCursor(false)
	end
end)

addEvent('RefreshGridListBuyMenu',true)
addEventHandler('RefreshGridListBuyMenu',resourceRoot,function()
	refreshPage(GUIEditor.gridlist[1],player_page)
end)