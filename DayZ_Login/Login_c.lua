
local sx,sy = guiGetScreenSize()


local pozycje = {
	[{sx* 0.25,sy * 0.15}] = 1,
	[{sx* 0.25,sy * 0.31}] = 2,
	[{sx* 0.25,sy * 0.475}] = 3,
	[{sx* 0.25,sy * 0.641}] = 4,
	[{sx* 0.25,sy * 0.805}] = 5,
	-- new line
	[{sx* 0.3485,sy * 0.15}] = 6,
	[{sx* 0.3485,sy * 0.31}] = 7,
	[{sx* 0.3485,sy * 0.475}] = 8,
	[{sx* 0.3485,sy * 0.641}] = 9,
	[{sx* 0.3485,sy * 0.805}] = 10,
	-- new line
	[{sx* 0.4485,sy * 0.15}] = 11,
	[{sx* 0.4485,sy * 0.31}] = 12,
	[{sx* 0.4485,sy * 0.475}] = 13,
	[{sx* 0.4485,sy * 0.641}] = 14,
	[{sx* 0.4485,sy * 0.805}] = 15,
	-- new line
	[{sx* 0.5485,sy * 0.15}] = 16,
	[{sx* 0.5485,sy * 0.31}] = 17,
	[{sx* 0.5485,sy * 0.475}] = 18,
	[{sx* 0.5485,sy * 0.641}] = 19,
	[{sx* 0.5485,sy * 0.805}] = 20,
	-- new line
	[{sx* 0.6485,sy * 0.15}] = 21,
	[{sx* 0.6485,sy * 0.31}] = 22,
	[{sx* 0.6485,sy * 0.475}] = 23,
	[{sx* 0.6485,sy * 0.641}] = 24,
	[{sx* 0.6485,sy * 0.805}] = 25,
}

function isMouseInPosition ( x, y, width, height )
	if ( not isCursorShowing( ) ) then
		return false
	end
	local sx, sy = guiGetScreenSize ( )
	local cx, cy = getCursorPosition ( )
	local cx, cy = ( cx * sx ), ( cy * sy )
	
	return ( ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) )
end

local selected = nil

function mapkaPapka()
	dxDrawImage(0,0,sx*1,sy*1,"image/bg.png",0,0,0,_,true)
	dxDrawImage(sx* 0.2,0,sx*0.6,sy*1,"image/mapa.png",0,0,0,tocolor(255,255,255,255),true)
	selected = nil
	for k,v in pairs(pozycje) do
		if isMouseInPosition(k[1],k[2],sx * 0.1, sy * 0.16) then
			dxDrawRectangle(k[1],k[2],sx * 0.1, sy * 0.16,tocolor(255,255,255,120),true)
			selected = v
			break
		end
	end
end

addEventHandler("onClientClick",root,function()
	if selected then
		triggerServerEvent("Zresp",resourceRoot,localPlayer,selected)
		showCursor(false)
		removeEventHandler("onClientRender",root,mapkaPapka)
		selected = nil
	end
end)

addEvent('PokazMape',true)
addEventHandler('PokazMape',resourceRoot,function()
	addEventHandler("onClientRender",root,mapkaPapka)
	showCursor(true)
end)
