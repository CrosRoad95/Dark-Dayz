


local GUIEditor = {
    button = {},
    window = {},
    label = {}
}

GUIEditor.window[1] = guiCreateWindow(0.41, 0.32, 0.19, 0.37, "Magazyn #1", true)
guiWindowSetMovable(GUIEditor.window[1], false)
guiWindowSetSizable(GUIEditor.window[1], false)
guiSetProperty(GUIEditor.window[1], "CaptionColour", "FF2FBCCD")

GUIEditor.label[1] = guiCreateLabel(0.04, 0.26, 0.92, 0.05, "Wymagana: Karta kodowa #1", true, GUIEditor.window[1])
guiLabelSetColor(GUIEditor.label[1], 55, 236, 183)
GUIEditor.label[2] = guiCreateLabel(0.04, 0.40, 0.92, 0.05, "W magazynie znajduje się losowy pojazd", true, GUIEditor.window[1])
guiLabelSetColor(GUIEditor.label[2], 239, 228, 51)
GUIEditor.button[1] = guiCreateButton(20, 211, 210, 45, "Otwórz bramę", false, GUIEditor.window[1])
guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FF0BF310")
GUIEditor.button[2] = guiCreateButton(0.44, 0.91, 0.53, 0.06, "Zamknij", true, GUIEditor.window[1])
guiSetProperty(GUIEditor.button[2], "NormalTextColour", "FFFD0000")    



guiSetVisible(GUIEditor.window[1],false)

local edited_marker = false

function openGUI(arg)
	showCursor(arg)
	guiSetVisible(GUIEditor.window[1],arg)
end

function refreshGUI(marker)
	guiSetText(GUIEditor.label[1],"Wymagana: "..marker_info[marker].wymagany)
	guiSetText(GUIEditor.window[1],"Magazyn "..string.gsub(marker_info[marker].wymagany,"Code card",""))
	if marker_info[marker].status == "Close" then
		guiSetText(GUIEditor.button[1],"Otwórz brame")
	else
		guiSetText(GUIEditor.button[1],"Zamknij brame")
	end
end

addEventHandler("onClientMarkerHit",resourceRoot,function(e)
	if e ~= localPlayer then return end
	if isPedInVehicle(e) then return end
	local x,y,z = getElementPosition(e)
	local x2,y2,z2 = getElementPosition(source)
	if z2 + 2 < z or z2 - 2 > z then return end
	refreshGUI(source)
	openGUI(true)
	edited_marker = source
end)

addEventHandler("onClientMarkerLeave",resourceRoot,function(e)
	if e ~= localPlayer then return end
	openGUI(false)
end)

addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
	openGUI(false)
end,false)

addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
	if not edited_marker then return end
	if (getElementData(localPlayer,marker_info[edited_marker].wymagany) or 0) > 0 then
		triggerServerEvent("OpenGate",resourceRoot,edited_marker)
	else
		outputChatBox("* Nie posiadasz karty!",255,255,255)
	end
end,false)

addEvent("ChangeBramaText",true)
addEventHandler("ChangeBramaText",resourceRoot,function(e,cos)
	if not edited_marker then return end
	marker_info[edited_marker].status = cos
	guiSetText(GUIEditor.button[1],e)
end)

addEvent("SetSomething",true)
addEventHandler("SetSomething",resourceRoot,function(e)
	marker_info = e
end)

local col = engineLoadCOL("a51_jetdoor.col")
engineReplaceCOL(col,3095)


