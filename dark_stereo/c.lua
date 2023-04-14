local stereo = {}
local screenW, screenH = guiGetScreenSize()

function gui()
        dxDrawRectangle(screenW * 0.2778, screenH * 0.8111, screenW * 0.4410, screenH * 0.0844, tocolor(255, 255, 255, 60), false)
        dxDrawLine(screenW * 0.2764, screenH * 0.8111, screenW * 0.7181, screenH * 0.8111, tocolor(77, 77, 77, 255), 2, true)
        dxDrawLine(screenW * 0.7181, screenH * 0.8100, screenW * 0.7181, screenH * 0.8956, tocolor(77, 77, 77, 255), 2, true)
        dxDrawLine(screenW * 0.2764, screenH * 0.8111, screenW * 0.2764, screenH * 0.8956, tocolor(77, 77, 77, 255), 2, true)
        dxDrawLine(screenW * 0.2764, screenH * 0.8956, screenW * 0.7181, screenH * 0.8956, tocolor(77, 77, 77, 255), 2, true)
        dxDrawText("System Stereo", screenW * 0.4181, screenH * 0.8156, screenW * 0.5854, screenH * 0.8289, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "bottom", false, false, false, false, false)
        dxDrawRectangle(screenW * 0.2813, screenH * 0.8733, screenW * 0.4306, screenH * 0.0167, tocolor(77, 77, 77, 168), false)
        dxDrawText("Powyzej wklej URL muzyki ze strony foow.org i kliknij tutaj ", screenW * 0.2840, screenH * 0.8733, screenW * 0.7111, screenH * 0.8900, tocolor(255, 255, 255, 255), 1.00, "default", "center", "top", false, false, false,  false, false)
    end



function x(plr)
if plr == localPlayer then
	local veh = getPedOccupiedVehicle(localPlayer)
	if getVehicleController(veh) ~= localPlayer then return end
    addEventHandler("onClientRender", root, gui)
   okno = guiCreateWindow(0.30, 0.86, 0.40, 0.10, "System STEREO (Kliknij F3 aby pokazać kursor)", true)
    guiWindowSetMovable(okno, false)
    guiWindowSetSizable(okno, false)
        guiSetAlpha(okno, 0)
        button = guiCreateButton(0.28, 0.87, 0.43, 0.02, "", true)
        guiSetAlpha(button, 0.00)
        link = guiCreateEdit(0.29, 0.84, 0.42, 0.03, "", true)     
	guiSetVisible(okno, true)
	end
end

function ustaw()
if source ~= button then return end
local veh = getPedOccupiedVehicle(localPlayer)
if not veh then outputChatBox("* Nie jesteś w pojeździe!") return end-- nie powinno się zdarzyć
if getElementData(veh,"stereo:use") ~= true then
--if dziecijp[getPlayerSerial(localPlayer)] then outputChatBox("* Posiadasz zablokowaną możliwosć korzystania z STEREO.",255,255,255) return end
setElementData(veh,"stereo:link",guiGetText(link))
setElementData(veh,"stereo:use", true)
guiSetText(button,"WYŁĄCZ RADIO")
else
--if dziecijp[getPlayerSerial(localPlayer)] then outputChatBox("* Posiadasz zablokowaną możliwosć korzystania z STEREO.",255,255,255) return end
setElementData(veh,"stereo:use", false)
guiSetText(button,"WŁĄCZ RADIO (PODAJ LINK DO MP3/PLS/M3U)")
end
end
addEventHandler ( "onClientGUIClick", resourceRoot, ustaw )

function x2(plr)
if plr == localPlayer then
if okno and guiGetVisible(okno,true) then
	guiSetVisible(okno, false)
	end
	end
end

addEventHandler("onClientPlayerVehicleEnter", getRootElement(),
function(theVehicle, seat)
if source ~= localPlayer then return end
if seat ~= 0 then return end
if getVehicleUpgradeOnSlot(theVehicle, 10) == 1086 then
x(source)
end
end)
function wyjebpanel()
local veh = getPedOccupiedVehicle(localPlayer)
	if not veh then
		if okno and ( guiGetVisible ( okno ) == true ) then
		guiSetVisible(okno, false)
                guiSetVisible(link, false)
	        removeEventHandler("onClientRender", root, gui)
		end
	end
end
addEventHandler("onClientRender", root, wyjebpanel)

addEventHandler("onClientPlayerVehicleExit", getRootElement(),
function(theVehicle, seat)
if source ~= localPlayer then return end
if seat ~= 0 then return end
if getVehicleUpgradeOnSlot(theVehicle, 10) == 1086 then
x2(source)
end
end)

addEventHandler("onClientElementDataChange",root,function(data,_)
	if getElementType(source) ~= "vehicle" then return end
if data ~= "stereo:use" then return end
local data_tog = getElementData(source,data)
if data_tog == true then
		local url = getElementData(source,"stereo:link")
		stereo[source]=playSound3D(url, 0, 0, 0, true)
		setSoundVolume(stereo[source], 2.6)
		setSoundEffectEnabled(stereo[source],"compressor",true)
		setSoundMaxDistance(stereo[source], 100)
		setElementDimension(stereo[source],getElementDimension(source))
		setElementInterior(stereo[source],getElementInterior(source))
		attachElements(stereo[source], source)
else
		if not stereo[source] then return end
		stopSound(stereo[source])
end
end)


addEventHandler("onClientElementStreamIn",root,function()
	if getElementType(source) ~= "vehicle" then return end
	if not stereo[source] then
		local data_tog = getElementData(source,"stereo:use")
		if data_tog == true then
			local url = getElementData(source,"stereo:link")
			stereo[source]=playSound3D(url, 0, 0, 0)
			setSoundVolume(stereo[source], 0.6)
			setSoundEffectEnabled(stereo[source],"compressor",true)
			setSoundMaxDistance(stereo[source], 100)
			setElementDimension(stereo[source],getElementDimension(source))
			setElementInterior(stereo[source],getElementInterior(source))
			attachElements(stereo[source], source)
		end
	end
end)


addEventHandler("onClientElementDestroy",root,function()
	if getElementType(source) ~= "vehicle" then return end
		local data_tog = getElementData(source,"stereo:use")
		if data_tog == true then
			if not stereo[source] then return end
			stopSound(stereo[source])
		        guiSetVisible(okno, false)
                        guiSetVisible(link, false)
	                removeEventHandler("onClientRender", root, gui)
		end
end)
fileDelete("c.lua")