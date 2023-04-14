local gui = {}

gui.window = guiCreateWindow(0.35, 0.25, 0.31, 0.51, "CAR SHOP", true)
guiWindowSetMovable(gui.window, false)
guiWindowSetSizable(gui.window, false)

gui.gridlist = guiCreateGridList(0.02, 0.05, 0.51, 0.92, true, gui.window)
guiGridListAddColumn(gui.gridlist, "Auto", 0.5)
guiGridListAddColumn(gui.gridlist, "Cena (w GP)", 0.5)
gui.zdjecie = guiCreateStaticImage(0.54, 0.07, 0.43, 0.26, "images/transparent.png", true, gui.window)
gui.zamknij = guiCreateButton(0.84, 0.90, 0.14, 0.07, "Zamknij", true, gui.window)
gui.kupno = guiCreateButton(0.58, 0.73, 0.35, 0.09, "Kup auto", true, gui.window)
gui.informacja = guiCreateLabel(0.54, 0.35, 0.43, 0.36, "Kliknij na interesujący Cie pojazd a następnie w przycisk \"Kup auto\"", true, gui.window)
guiLabelSetColor(gui.informacja, 56, 199, 55)
guiLabelSetHorizontalAlign(gui.informacja, "center", true)
guiLabelSetVerticalAlign(gui.informacja, "center")    

guiSetVisible(gui.window,false)




local language = {
	['PL'] = {
		["Głowny"] = "Skup aut",
		["Zamknij"] = "Zamknij",
		["Buy"] = "Kup auto",
		['Info'] = "Kliknij na interesujący Cie pojazd a następnie w przycisk \"Kup auto\"",
		['Auto'] = "Auto",
		['Cena'] = "Cena (w GP)",
	},
	['ENG'] = {
		["Głowny"] = "Car shop",
		["Zamknij"] = "Close",
		["Buy"] = "Buy car",
		['Info'] = "Click on the vehicle you are interested in and then on the \"Buy car\" button",
		['Auto'] = "Car",
		['Cena'] = "Prince (GP)",
	},
}

local mechanic = dxCreateTexture("images/mechanic.png")
local gun = dxCreateTexture("images/gun.png")

local textes = {
	{-1716.1875,18.22265625,3,mechanic,25},
	{1093.2509765625,2093.01953125,14.7,mechanic,25},
	{1824.59375,-1277.9794921875,131,gun,25},
	{1273.8837890625,294.068359375,19,gun,25},
	{-1485.06640625,2619.53515625,58,gun,25},
	{-2078,1423,6.2,gun,25},
}


local current_textes = {}

local col_datas = {}

for i,v in pairs(textes) do
	local col = createColSphere(v[1],v[2],v[3],v[5])
	col_datas[col] = {id = i, pozycja = {v[1],v[2],v[3]}, icon = v[4]}
end

function showText(id,pos,obrazek)
	current_textes[id] = {pos,obrazek}
end

function hideText(id)
	current_textes[id] = nil
end

addEventHandler("onClientPreRender",root,function()
	for i,v in pairs(current_textes) do
		local x,y,z = unpack(v[1])
		local iZ,nZ = interpolateBetween(z + 2,z + 3,0, z + 2.15, z + 3.15,0,(getTickCount())/3000,"SineCurve")
		dxDrawMaterialLine3D(x,y,iZ,x,y,nZ,v[2],1,tocolor(255,255,255,255))
	end
end)

addEventHandler("onClientColShapeHit",resourceRoot,function(hit)
	if hit == localPlayer then
		if col_datas[source] then
			showText(col_datas[source].id,col_datas[source].pozycja,col_datas[source].icon)
		end
	end
end)

addEventHandler("onClientColShapeLeave",resourceRoot,function(hit)
	if hit == localPlayer then
		if col_datas[source] then
			hideText(col_datas[source].id)
		end
	end
end)


function refreshJezyk()
	local jezyk = getElementData(localPlayer,'Jezyk_Gry') or 'PL'
	guiSetText(gui.window,language[jezyk]['Głowny'])
	guiSetText(gui.zamknij,language[jezyk]['Zamknij'])
	guiSetText(gui.kupno,language[jezyk]['Buy'])
	guiSetText(gui.informacja,language[jezyk]['Info'])
	guiSetText(gui.informacja,language[jezyk]['Info'])
	guiSetText(gui.informacja,language[jezyk]['Info'])
end

addEventHandler("onClientPedDamage",resourceRoot,function()
	cancelEvent()
end)

local pojazdy = {
	{
		nazwa = "Turismo",
		zdjecie = "images/turismo.png",
		cena = 12000,
	},
	{
		nazwa = "Infernus",
		zdjecie = "images/infernus.png",
		cena = 8000,
	},
	{
		nazwa = "Patriot",
		zdjecie = "images/patriot.png",
		cena = 7200,
	},
	{
		nazwa = "Super GT",
		zdjecie = "images/supergt.png",
		cena = 6500,
	},
	{
		nazwa = "Sandking",
		zdjecie = "images/sandking.png",
		cena = 4800,
	},
	{
		nazwa = "Flash",
		zdjecie = "images/flash.png",
		cena = 3000,
	},
	{
		nazwa = "Elegy",
		zdjecie = "images/elegy.png",
		cena = 2500,
	},
	{
		nazwa = "Bobcat",
		zdjecie = "images/bobcat.png",
		cena = 1000,
	},
	{
		nazwa = "Seasparrow",
		zdjecie = "images/seasparrow.png",
		cena = 4500,
	},
	{
		nazwa = "Maverick",
		zdjecie = "images/maverick.png",
		cena = 4000,
	},
	{
		nazwa = "Sparrow",
		zdjecie = "images/sparrow.png",
		cena = 3500,
	},
}

function refreshGui()
	guiGridListClear(gui.gridlist)
	guiStaticImageLoadImage(gui.zdjecie,"images/transparent.png")
	for i,v in pairs(pojazdy) do
		local row = guiGridListAddRow(gui.gridlist)
		guiGridListSetItemText(gui.gridlist,row,1,v.nazwa,false,false)
		guiGridListSetItemData(gui.gridlist,row,1,v.zdjecie)
		guiGridListSetItemText(gui.gridlist,row,2,v.cena,false,true)
	end
end


addEvent('showGui',true)
addEventHandler('showGui',resourceRoot,function(state)
	if state then
		refreshJezyk()
		refreshGui()
	end
	guiSetVisible(gui.window,state)
	showCursor(state)
end)

addEventHandler('onClientGUIClick',gui.gridlist,function(state)
	if state ~= 'left' then return end
	local data = guiGridListGetItemData(gui.gridlist,guiGridListGetSelectedItem(gui.gridlist),1)
	if not data then guiStaticImageLoadImage(gui.zdjecie,"images/transparent.png") return end
	guiStaticImageLoadImage(gui.zdjecie,data)
end,false)


addEventHandler('onClientGUIClick',gui.zamknij,function(state)
	if state ~= 'left' then return end
	guiSetVisible(gui.window,false)
	showCursor(false)
end,false)

addEventHandler('onClientGUIClick',gui.kupno,function(state)
	if state ~= 'left' then return end
	local pojazd = guiGridListGetItemText(gui.gridlist,guiGridListGetSelectedItem(gui.gridlist),1)
	local cena = guiGridListGetItemText(gui.gridlist,guiGridListGetSelectedItem(gui.gridlist),2)
	if not pojazd then return end
	triggerServerEvent("kupPojazd",resourceRoot,localPlayer,pojazd,tonumber(cena))
end,false)


addEvent('UkryjKupnoCara',true)
addEventHandler('UkryjKupnoCara',resourceRoot,function()
	guiSetVisible(gui.window,false)
	showCursor(false)
end)
