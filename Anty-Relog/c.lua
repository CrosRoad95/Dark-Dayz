

local screenW, screenH = guiGetScreenSize()

local anty_relog = 10
local anty_tick = getTickCount()

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
	if 
		type( sEventName ) == 'string' and 
		isElement( pElementAttachedTo ) and 
		type( func ) == 'function' 
	then
		local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
		if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
			for i, v in ipairs( aAttachedFunctions ) do
				if v == func then
					return true
				end
			end
		end
	end

	return false
end

setElementData(localPlayer,'Anty-Relog',false)
local col = createColCuboid(56.887969970703, 1694.1809082031, -190.15603637695,348,424.25,319.5)
addEvent('pokadupe', true)
function target()
	if getTickCount()-anty_tick>1000 then
		anty_tick= getTickCount()
		if anty_relog-1<=0 then
			removeEventHandler('onClientRender',root,target)
			setElementData(localPlayer,'Anty-Relog',false)
		else
		if isElementWithinColShape(localPlayer, col) then return end
			anty_relog = anty_relog - 1
		end
	end
	dxDrawText("Anty-Relog \n"..anty_relog, screenW * 0.0439, screenH * 0.5797, screenW * 0.2207, screenH * 0.7161, tocolor(255, 3, 3, 255), 0.80, "bankgothic", "center", "top", false, false, false, false, false)
end
addEventHandler('pokadupe', resourceRoot,target)

addEvent('Anty-Relog_On',true)
addEventHandler('Anty-Relog_On',resourceRoot,function()
	if not getElementData(localPlayer,'logedin') then return end
	anty_tick = getTickCount()
	anty_relog = 10
	setElementData(localPlayer,'Anty-Relog',true)
	if not isEventHandlerAdded('onClientRender',root,target) then
		addEventHandler('onClientRender',root,target)
	end
end)