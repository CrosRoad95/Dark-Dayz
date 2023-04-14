
GUIEditor = {
    gridlist = {},
    staticimage = {}
}
GUIEditor.staticimage[1] = guiCreateStaticImage(0.21, 0.12, 0.57, 0.70, "Ranking.png", true)

GUIEditor.gridlist[1] = guiCreateGridList(0.01, 0.29, 0.26, 0.69, true, GUIEditor.staticimage[1])
guiGridListAddColumn(GUIEditor.gridlist[1], "Grupa:", 0.5)
guiGridListAddColumn(GUIEditor.gridlist[1], "Punkty;", 0.3)
GUIEditor.gridlist[2] = guiCreateGridList(0.72, 0.29, 0.26, 0.69, true, GUIEditor.staticimage[1])
guiGridListAddColumn(GUIEditor.gridlist[2], "Gracz:", 0.5)
guiGridListAddColumn(GUIEditor.gridlist[2], "Punkty:", 0.3)    

guiSetVisible(GUIEditor.staticimage[1],false)


function refreshGrupy(tablica)
	guiGridListClear(GUIEditor.gridlist[1])
	for i,v in pairs(tablica) do
		local row = guiGridListAddRow(GUIEditor.gridlist[1])
		guiGridListSetItemText(GUIEditor.gridlist[1],row,1,v[1],false,false)
		guiGridListSetItemText(GUIEditor.gridlist[1],row,2,v[2],false,false)
	end
end



function refreshGracze(tablica)
	guiGridListClear(GUIEditor.gridlist[2])
	for i,v in pairs(tablica) do
		local row = guiGridListAddRow(GUIEditor.gridlist[2])
		guiGridListSetItemText(GUIEditor.gridlist[2],row,1,v[1],false,false)
		guiGridListSetItemText(GUIEditor.gridlist[2],row,2,v[2],false,false)
	end
end

function openPanel(tablica_gracze,tablica_grupy)
	local widzialnosc = guiGetVisible(GUIEditor.staticimage[1])
	guiSetVisible(GUIEditor.staticimage[1],not widzialnosc)
	showCursor(not widzialnosc)
	refreshGrupy(tablica_grupy)
	refreshGracze(tablica_gracze)
	setElementData(localPlayer,'PanelOtwarty',not widzialnosc)
end
addEvent("openPanel",true)
addEventHandler('openPanel',resourceRoot,openPanel)


