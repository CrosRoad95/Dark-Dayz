-- FG HUD UP TEXT

local screenWidth, screenHeight = guiGetScreenSize( )
local px,py = 1600,900
local x,y = (screenWidth/px), (screenHeight/py)
local tick = getTickCount()
local polacja
local timer
local refresh = 0

function dxPickupsText( szText, r, g, b )

    if notifyDataText then
		removeEventHandler( "onClientRender", root, dxPickupsTextRender )
		notifyDataText = nil
	end
	tick = getTickCount()
	notifyDataText = { szText, r, g, b }	
	refresh = 0
	addEventHandler( "onClientRender", root, dxPickupsTextRender ) 	
end 
addEvent( "dxPickupsText", true ) 
addEventHandler( "dxPickupsText", root, dxPickupsText ) 

function dxPickupsTextRender( )
	
	if not notifyDataText then 
        return
    end 
	
	local text, r, g, b = notifyDataText[1], notifyDataText[2], notifyDataText[3], notifyDataText[4]
	local alpha
	if refresh == 0 then
		alpha = interpolateBetween(0, 0, 0, 230, 0, 0, (getTickCount() - tick) / 1500, "InOutQuad")
	else
		alpha = interpolateBetween(230, 0, 0, 0, 0, 0, (getTickCount() - tick) / 1500, "InOutQuad")
	end
    dxDrawImage( screenWidth * 0.30, screenHeight * 0.075, screenWidth * 0.40, screenHeight * 0.04, textura, 0, 0, 0, tocolor( 255,255,255, alpha ), false )
    dxDrawText( text, 0, screenHeight* 0.11, screenWidth, screenHeight * 0.08, tocolor( r,g,b, alpha > 30 and alpha - 30 or 0 ), 1, font, "center", "center" )

    if not isTimer(timer) and refresh == 0 then
		timer = setTimer( function( )
			refresh = 1
			tick = getTickCount()
		end, 5000, 1 )
	end
end