
FPSLimit = 65
FPSMax = 1

ping_limit = 300


addEvent("onClientLogin", true)
addEventHandler("onClientLogin", root, function()
	if ( guiFPSLabel == nil ) then
		FPSLimit = 255 / FPSLimit
		guiFPSLabel	= guiCreateLabel ( 0.015, 0.0, 0.1, 0.1, "FPS: 0", true )
		guiPINGLabel	= guiCreateLabel ( 0.1, 0.0, 0.1, 0.1, "Ping: 0 | Max: "..ping_limit, true )
		FPSCalc = 0
		FPSTime = getTickCount() + 1000
		
		addEventHandler ( "onClientRender", getRootElement (), onClientRender )
	end
end)



local refresh_fps = getTickCount()

local sx, sy = guiGetScreenSize()

function onClientRender ( )
	if ( getTickCount() < FPSTime ) then
		FPSCalc = FPSCalc + 1
	else
		if ( FPSCalc > FPSMax ) then FPSLimit = 255 / FPSCalc FPSMax = FPSCalc end
		guiSetText ( guiFPSLabel, "FPS: "..FPSCalc.." Max: "..FPSMax )
		guiSetText ( guiPINGLabel, "Ping: "..getPlayerPing(localPlayer).." | Max: "..ping_limit)
		guiLabelSetColor ( guiFPSLabel, 255 - math.ceil ( FPSCalc * FPSLimit ), math.ceil ( FPSCalc * FPSLimit ), 0 )
		local new_limit = ping_limit / 1.17
		local new_ping = getPlayerPing(localPlayer) / 1.17
		if new_ping > 255 then
			new_ping = 255
		end
		guiLabelSetColor ( guiPINGLabel, new_ping, new_limit - new_ping,0)
		--setElementData(localPlayer, "FPS", FPSCalc)
		if refresh_fps < getTickCount() then
			refresh_fps = getTickCount() + 5000
			setElementData(localPlayer, "FPS", FPSCalc)
		end
		FPSCalc = 0
		FPSTime = getTickCount() + 1000
	end
	--[[if getElementData(localPlayer, "duty") then
		for i, v in pairs(getElementsByType("player")) do
			dxDrawText(getPlayerName(v).."           FPS:  "..(getElementData(v, "FPS") or 0),sx * 0.15,sy * 0.4 + i * 15)
		end
	end]]
end

addEvent("ustawFPS",true)
addEventHandler("ustawFPS",resourceRoot,function(fps)
	setFPSLimit(fps)
end)




