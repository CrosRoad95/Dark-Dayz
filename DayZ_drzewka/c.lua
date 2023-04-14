addEvent('playSoundDrzewa',true)
addEventHandler('playSoundDrzewa',resourceRoot,function(plik,pozycja,metry)
	local sound = playSound3D(plik,pozycja[1],pozycja[2],pozycja[3])
	setSoundMaxDistance(sound,metry)
end)

local sx,sy = guiGetScreenSize()

function dxDrawLinedRectangle( x, y, width, height, color, _width, postGUI )
	_width = _width or 1
	dxDrawLine ( x, y, x+width, y, color, _width, postGUI ) -- Top
	dxDrawLine ( x, y, x, y+height, color, _width, postGUI ) -- Left
	dxDrawLine ( x, y+height, x+width, y+height, color, _width, postGUI ) -- Bottom
	return dxDrawLine ( x+width, y, x+width, y+height, color, _width, postGUI ) -- Right
end

local current_drzewo

function pokazZdrowko()
	local life = getElementData(current_drzewo,'Drzewo-Zdrowie')
	dxDrawRectangle(sx*0.4,sy*0.7,sx*life,sy*0.025,tocolor(0,100,0,200))
	dxDrawRectangle(sx*0.4,sy*0.7,sx*life,sy*0.025,tocolor(0,200,0,200))
	local w = dxGetTextWidth(tostring(math.ceil(life*500)).."%")/3
	dxDrawText(tostring(math.ceil(life*500)).."%",((sx*0.4)+(sx*0.2)/2)-w,sy*0.7,tocolor(255,255,255,255))
	dxDrawLinedRectangle(sx*0.4,sy*0.7,sx*0.2,sy*0.025)
end

addEvent("ShowMeRender",true)
addEventHandler("ShowMeRender",resourceRoot,function(drzewo,state)
	if state then
		addEventHandler('onClientRender',root,pokazZdrowko)
		current_drzewo = drzewo
	else
		removeEventHandler('onClientRender',root,pokazZdrowko)
	end
end)



local blip = exports.DayZ_customBlips:createCustomBlip ( -1105.7216796875,-992.970703125, 20, 20, "drzewko.png" )
exports.DayZ_customBlips:setCustomBlipRadarScale(blip,0)
local blip = exports.DayZ_customBlips:createCustomBlip ( 993,279, 20, 20, "drzewko.png" )
exports.DayZ_customBlips:setCustomBlipRadarScale(blip,0)