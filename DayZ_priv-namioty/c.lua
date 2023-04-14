
local GUIEditor = {
    button = {},
    window = {},
    label = {}
}

GUIEditor.window[1] = guiCreateWindow(0.39, 0.30, 0.23, 0.40, "", true)
guiWindowSetMovable(GUIEditor.window[1], false)
guiWindowSetSizable(GUIEditor.window[1], false)

GUIEditor.button[1] = guiCreateButton(0.23, 0.89, 0.53, 0.08, "Pryw. namiot (10PP)", true, GUIEditor.window[1])
guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FFF1480D")
GUIEditor.label[1] = guiCreateLabel(0.01, 0.07, 0.96, 0.46, "Tak jak nazwa mówi namiot prywatny jest tylko do naszego użytku\n\nW namiocie znajduje się 500 slotów!\nMożesz mieć tylko 1 namiot prywatny!", true, GUIEditor.window[1])
guiLabelSetColor(GUIEditor.label[1], 111, 226, 27)
guiLabelSetHorizontalAlign(GUIEditor.label[1], "center", true)
guiLabelSetVerticalAlign(GUIEditor.label[1], "center")    

guiSetVisible(GUIEditor.window[1],false)


local blip = exports.DayZ_customBlips:createCustomBlip ( -842.68188476563,2751.8505859375, 17, 17, "Blipid31.png" )



addEventHandler("onClientRender",root,function()
	for i,v in pairs(getElementsByType("blip",resourceRoot)) do
		if isPlayerMapVisible() then
			setBlipIcon(v,0)
			setBlipSize(v,0)
		else
			setBlipIcon(v,7)
		end
	end
end)

addEventHandler("onClientMarkerHit",resourceRoot,function(e)
	if e ~= localPlayer then return end
	if isPedInVehicle(e) then return end
	guiSetVisible(GUIEditor.window[1],true)
	showCursor(true,false)
end)

addEventHandler("onClientMarkerLeave",resourceRoot,function(e)
	if e ~= localPlayer then return end
	guiSetVisible(GUIEditor.window[1],false)
	showCursor(false)
end)


addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
	triggerServerEvent("KupPrivTent",resourceRoot)
end,false)


