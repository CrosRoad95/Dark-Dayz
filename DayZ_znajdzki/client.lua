
local sx,sy = guiGetScreenSize()

local font = dxCreateFont("font.ttf",16*(sy/768))


local znajdzka = 1
local ticket = nil
local ticket_2 = nil

function chujowo()
	local alpha = 255
	if getTickCount()-ticket > 1 then
		if not ticket_2 then
			ticket_2 = getTickCount()
		end
		alpha = interpolateBetween(255,0,0,0,0,0,(getTickCount()-ticket_2)/2000,"Linear")
		if alpha == 0 then
			removeEventHandler("onClientRender",root,chujowo)
			ticket_2 = nil
			ticket = nil
		end
	end
	dxDrawText("Znalazłeś znajdzke! \n "..znajdzka.."/30",sx * 0.6, sy * 0.7,sx * 0.4,sy * 0.7,tocolor(255,255,255,alpha),1,font,"center")
end


function startGowno(arg,znajdzki)
	if arg then
		znajdzka = znajdzki 
		addEventHandler("onClientRender",root,chujowo)
		ticket = getTickCount() + 1000
	else
		removeEventHandler("onClientRender",root,chujowo)
	end
end
addEvent("startDrawZnajdzka",true)
addEventHandler("startDrawZnajdzka",resourceRoot,startGowno)