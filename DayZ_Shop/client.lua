local gui = {}
gui['Window'] = guiCreateWindow(0.35, 0.34, 0.30, 0.39, "Sklep GP | Posiadasz:", true)
guiWindowSetMovable(gui['Window'], false)
guiWindowSetSizable(gui['Window'], false)

gui["tabpanel"] = guiCreateTabPanel(0.02, 0.09, 0.95, 0.77,true,gui["Window"])
gui["tab_1"] = guiCreateTab("Kupno",gui["tabpanel"])
gui["Gridlist"] = guiCreateGridList(0.02, 0.09, 0.95, 0.77, true, gui['tab_1'])
guiGridListAddColumn(gui["Gridlist"], "Przedmiot", 0.7)
guiGridListAddColumn(gui["Gridlist"], "Cena", 0.2)    

gui["tab_2"] = guiCreateTab("Sprzedasz",gui["tabpanel"])
gui["Gridlist_2"] = guiCreateGridList(0.02, 0.09, 0.95, 0.77, true, gui['tab_2'])
guiGridListAddColumn(gui["Gridlist_2"], "Przedmiot", 0.7)
guiGridListAddColumn(gui["Gridlist_2"], "Cena", 0.2)    

gui["Close"] = guiCreateButton(0.7,0.9,0.25,0.1,"Close",true,gui['Window'])
guiGridListSetSortingEnabled(gui['Gridlist'],false)

local label = guiCreateLabel(0.1,0.9,0.7,0.1,"Double click to buy/sell",true,gui['Window'])
guiLabelSetColor(label,0,160,0)




function setPrzedmiotToGrid()
	guiGridListClear(gui["Gridlist"])
	guiGridListClear(gui["Gridlist_2"])
	local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	for i,v in pairs(przedmioty) do
		local row = guiGridListAddRow(gui["Gridlist"])
		guiGridListSetItemText(gui["Gridlist"],row,1,v.item[jezyk],false,false)
		guiGridListSetItemText(gui["Gridlist"],row,2,v.cena,false,false)
		guiGridListSetItemData(gui['Gridlist'],row,1,v.realName)
		guiGridListSetItemData(gui['Gridlist'],row,2,v.ilosc)
	end
	for i,v in pairs(sell_items) do
		if (getElementData(localPlayer,i) or 0) >= 1 then
			local row = guiGridListAddRow(gui["Gridlist_2"])
			if jezyk == "PL" then
				guiGridListSetItemText(gui["Gridlist_2"],row,1,v[1],false,false)
			else
				guiGridListSetItemText(gui["Gridlist_2"],row,1,i,false,false)
			end
			guiGridListSetItemText(gui["Gridlist_2"],row,2,v[2],false,true)
			guiGridListSetItemData(gui['Gridlist_2'],row,1,i)
			guiGridListSetItemData(gui['Gridlist_2'],row,2,1)
		end
	end
end


function showMeGunMenu()
	setPrzedmiotToGrid()
	local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	guiSetText(gui['Window'],language[jezyk]['Window']..(getElementData(localPlayer,"GP") or 0))
	guiSetText(label,language[jezyk]["Label"])
	guiSetText(gui['Close'],language[jezyk]['Close'])
	local state = guiGetVisible(gui['Window'])
	showCursor(true)
	guiSetVisible(gui['Window'],true)
end
addEvent("DayZ_Shop:showMeGunMenu",true)
addEventHandler("DayZ_Shop:showMeGunMenu",root,showMeGunMenu)

function hideGunMenu()
	guiSetVisible(gui['Window'],false)
	showCursor(false)
end
addEvent("DayZ_Shop:hideGunMenu",true)
addEventHandler("DayZ_Shop:hideGunMenu",root,hideGunMenu)

addEventHandler("onClientGUIClick",gui['Close'],function()
	guiSetVisible(gui["Window"],false)
	showCursor(false)
end,false)



addEventHandler('onClientGUIDoubleClick',resourceRoot,function()

	local selected = guiGetSelectedTab(gui["tabpanel"])
	if selected == gui["tab_1"] then
		local cena = guiGridListGetItemText(gui['Gridlist'],guiGridListGetSelectedItem(gui['Gridlist']),2)
		local item = guiGridListGetItemData(gui['Gridlist'],guiGridListGetSelectedItem(gui['Gridlist']),1)
		local ilosc = guiGridListGetItemData(gui['Gridlist'],guiGridListGetSelectedItem(gui['Gridlist']),2)
		local itemPseudo = guiGridListGetItemText(gui['Gridlist'],guiGridListGetSelectedItem(gui['Gridlist']),1)
		if not item then return end
		triggerServerEvent("KupPrzedmiot",resourceRoot,localPlayer,{cena,item,itemPseudo,ilosc})
	elseif selected == gui["tab_2"] then
		local cena = guiGridListGetItemText(gui['Gridlist_2'],guiGridListGetSelectedItem(gui['Gridlist_2']),2)
		local item = guiGridListGetItemData(gui['Gridlist_2'],guiGridListGetSelectedItem(gui['Gridlist_2']),1)
		local ilosc = guiGridListGetItemData(gui['Gridlist_2'],guiGridListGetSelectedItem(gui['Gridlist_2']),2)
		local itemPseudo = guiGridListGetItemText(gui['Gridlist_2'],guiGridListGetSelectedItem(gui['Gridlist_2']),1)
		if not item then return end
		triggerServerEvent("SellPrzedmiot",resourceRoot,localPlayer,{cena,item,itemPseudo,ilosc})
	end
end)

guiSetVisible(gui['Window'],false)
setPrzedmiotToGrid()
