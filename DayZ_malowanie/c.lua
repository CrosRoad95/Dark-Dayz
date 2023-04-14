
local colors = nil

local sx,sy = guiGetScreenSize()

local progres = {}

local last_ticked = getTickCount()

local language = {
	['PL'] = {
		['Kolor'] = "* Wybierz kolor!",
		['Ended'] = "* Przemalowano pojazd!",
	},
	['ENG'] = {
		['Kolor'] = "* Set color!",
		['Ended'] = "* Przemalowano pojazd!",
	},
	
}

colors = {math.random(255),math.random(255),math.random(255)}
function setColor(r,g,b)
	colors = {r,g,b}
	progres = {}
end

addEventHandler('onClientPlayerWeaponFire',localPlayer,function(weapon,ammo,clip,hitx,hity,hitz,auto)
	if weapon == 41 then
		local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
		if not auto or getElementType(auto)~="vehicle" then return end
		if not colors then
			if last_ticked<getTickCount() then
				outputChatBox(language[jezyk]['Kolor'],255,255,255,true)
				last_ticked = getTickCount() + 15000
			end
			return
		end
		local r,g,b = getVehicleColor(auto,true)
		if not progres[auto] then
			local anty_again = 0
			if colors[1] == r then anty_again = anty_again + 1 end
			if colors[2] == g then anty_again = anty_again + 1 end
			if colors[3] == b then anty_again = anty_again + 1 end
			if anty_again == 3 then return end
		end
		if not progres[auto] then
			progres[auto] = 0.001
		else
			progres[auto] = progres[auto] + 0.001
		end
		local x,y,z = getElementPosition(auto)
		
		local kX,kY,kZ = interpolateBetween(r,g,b,colors[1],colors[2],colors[3],progres[auto],'Linear')
		setVehicleColor(auto,kX,kY,kZ)
		if progres[auto]>0.12 then
			progres[auto] = nil
			setVehicleColor(auto,colors[1],colors[2],colors[3])
			outputChatBox(language[jezyk]['Ended'],255,255,255,true)
			triggerServerEvent("Pomaluj",resourceRoot,auto,colors[1],colors[2],colors[3])
			
		end
	end
end)

addEvent("doEffect",true)
addEventHandler("doEffect",resourceRoot,function(a,x,y,z,zr)
	createEffect(a,x,y,z,_,_,_,30)
end)















