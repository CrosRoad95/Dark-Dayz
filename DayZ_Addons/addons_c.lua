whiteWindow = guiCreateStaticImage(0, 0, 1, 1, "image/white.png", true)
guiSetVisible(whiteWindow, false)

function showPlayerDamageScreen(visibly2, stateControle2)
  guiSetVisible(whiteWindow, true)
  visibly = visibly2 or visibly
  stateControle = stateControle2 or stateControle
  if visibly >= 0.15000000000000002 and stateControle == "up" then
    stateControle = "down"
  end
  if visibly < 0 then
    guiSetVisible(whiteWindow, false)
    return
  end
  if stateControle == "up" then
    visibly = visibly + 0.025
  elseif stateControle == "down" then
    visibly = visibly - 0.025
  end
  guiSetAlpha(whiteWindow, visibly)
  setTimer(showPlayerDamageScreen, 50, 1)
end

function showDamageForPlayer(arg1,arg2)
	showPlayerDamageScreen(arg1, arg2)
	playSound("hit.wav")
end

function showWhiteScreen(attacker, weapon, bodypart)
	if attacker and getElementType(attacker) == "ped" then return end
	if isPedInVehicle(localPlayer) and getElementData(getPedOccupiedVehicle(localPlayer),"Szyba-Kuloodporna") then return end
	showDamageForPlayer(0, "up")
end
addEventHandler("onClientPlayerDamage", getLocalPlayer(), showWhiteScreen)

addEvent("showDamageManual",true)
addEventHandler("showDamageManual",root,function()
	showDamageForPlayer(0, "up")
end)

--[[
exports.DayZ_scoreboard:scoreboardAddColumn("Zabójstwa",65)
exports.DayZ_scoreboard:scoreboardAddColumn("Czas",85,"Przeżyty czas")
exports.DayZ_scoreboard:scoreboardAddColumn("Grupa ",200,"Grupa")
exports.DayZ_scoreboard:scoreboardAddColumn("ID_player",20,"#",1)
]]

local nazwa_serwera = "#ed7600Dark-DayZ" -- ed7600

function getNazwaSerwera()
	return nazwa_serwera
end

local language = {
	["PL"] = {
		["Quit"] = " opuścił serwer!",
		["Kicked"] = " został wyrzucony z serwera!",
		["Banned"] = "  został zbanowany na serwerze!",
		["Join"] = " dołączył na serwer!",
		["Nick"] = " zmienił nick na: ",
		['Max_distance'] = "* Min. wartość to 300, a maks. to 1500",
		['Render_uzycie'] = "* Użycie: /render.distance [wartość]",
	},
	["ENG"] = {
		["Quit"] = " has left the server!",
		["Kicked"] = " has kicked from the server!",
		["Banned"] = " has banned!",
		["Join"] = " has joined the server!",
		["Nick"] = " is now known as: ",
		['Max_distance'] = "* Min. value must be a 300 and max. value is 1500",
		['Render_uzycie'] = "* Use: /render.distance [value]",
	},
	
}


addEventHandler('onClientPlayerQuit',root,function(quitType)
	local jezyk = getElementData(localPlayer,"Jezyk_Gry") or "PL"
	if quitType=='Quit' then
		outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] "..getPlayerName(source):gsub("#%x%x%x%x%x%x", "")..language[jezyk]["Quit"],255,255,255,true)
	elseif quitType=='Kicked' then
		outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] "..getPlayerName(source):gsub("#%x%x%x%x%x%x", "")..language[jezyk]["Kicked"],255,255,255,true)
	elseif quitType=='Banned' then
		outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] "..getPlayerName(source):gsub("#%x%x%x%x%x%x", "")..language[jezyk]["Banned"],255,255,255,true)
	else
		outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] "..getPlayerName(source):gsub("#%x%x%x%x%x%x", "")..language[jezyk]["Quit"],255,255,255,true)
	end
	--exports.DayZ_Integracja:sendDiscordMessage(getPlayerName(source):gsub("#%x%x%x%x%x%x","").." opuścił serwer! Aktualna liczba graczy: "..getPlayerCount()-1)
end)

-- ):gsub("#%x%x%x%x%x%x", "")


addEventHandler('onClientPlayerChangeNick',root,function(old,new)
	local jezyk = getElementData(localPlayer,"Jezyk_Gry") or "PL"
	outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] "..old:gsub("#%x%x%x%x%x%x", "")..language[jezyk]["Nick"]..new:gsub("#%x%x%x%x%x%x", ""),255,255,255,true)
end)

addEventHandler("onClientPlayerJoin", root, function()
	setPlayerNametagShowing(source, false);
	local jezyk = getElementData(localPlayer,"Jezyk_Gry") or "PL"
	outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] "..getPlayerName(source):gsub("#%x%x%x%x%x%x", "")..language[jezyk]['Join'],255,255,255,true)
	--exports.DayZ_Integracja:sendDiscordMessage(getPlayerName(source):gsub("#%x%x%x%x%x%x","").." dołączył na serwer! Aktualna liczba graczy: "..getPlayerCount())
end);

addEventHandler ( "onClientChatMessage", root, function ( msg )  
    if ( tostring ( msg ) : lower ( ) == "login: you successfully logged in" ) then 
		outputChatBox("* Zalogowałeś się na serwer #00ff00Dark-DayZ#FFFFFF!", 255, 255, 255, true)
		--outputChatBox("* #66a832Drop exp oraz gp za zabite zombie zwiekszony x2!", 255, 255, 255, true)
		--outputChatBox("* #32a863Drop exp oraz gp za zabite bossy zwiekszony x2!", 255, 255, 255, true)
		--outputChatBox("* #329ca8Do końca dnia 18.10.2020!", 255, 255, 255, true)
        cancelEvent ( ) 
    end  
end ) 

local sx,sy = guiGetScreenSize()

local font = dxCreateFont("font.ttf",9*(sy/768))

--[[addEvent("onClientLogin", true)
addEventHandler("onClientLogin", root, function()
	addEventHandler("onClientRender",root,function()
		local zone = getZoneName(getElementPosition(localPlayer))
		local width = dxGetTextWidth(zone:upper(),1,font) * 1.5
		dxDrawText(zone:upper(),(sx * 0.75), sy * 0.0000, sx * 0.9888, sy * 0.0286,tocolor(255,255,255,255),1,font,"center","center")
	end)
end)]]

setBlurLevel(0)


local pozycje = {

}

addCommandHandler("pos",function()
	local x,y,z = getElementPosition(localPlayer)
	x = math.ceil(x)
	y = math.ceil(y)
	z = math.ceil(z)
	outputChatBox(x..","..y..","..z)
	table.insert(pozycje,"{"..x..","..y..","..z.."},")
end)

addCommandHandler("get_copied",function()
	local napis = ""
	for i,v in pairs(pozycje) do
		napis = napis..v.." \n"
	end
	setClipboard(napis)
end)


--[[
cyclones = {{0,0,0},{0,0,0},{0,0,0}}

function weatherCyclones (x1,y1,r1,x2,y2,r2,x3,y3,r3)
	cyclones[1][1] = x1
	cyclones[1][2] = y1
	cyclones[1][3] = r1
	cyclones[2][1] = x2
	cyclones[2][2] = y2
	cyclones[2][3] = r2
	cyclones[3][1] = x3
	cyclones[3][2] = y3
	cyclones[3][3] = r3
end
addEvent("weatherCyclones",true)
addEventHandler("weatherCyclones",getRootElement(),weatherCyclones)


weat_city = {12,12,15,15,66,66,12,12,61,58,63,28,28,28,6,11,11,11,11,11,11,11,2,2,14,14,14,14,34,34,34,34,1,1,1,1,17,17,18,3,3,3,3,3,1,0,3,3}
weat_green = {1,1,54,1,1,1,9,1,61,58,63,28,28,28,6,11,11,11,11,11,11,11,2,2,14,14,14,14,34,34,34,34,1,1,1,1,17,17,18,3,3,3,2,1,1,0,3,3}
weat_desert = {1,1,1,1,1,19,1,1,61,61,58,28,28,28,18,11,11,11,11,11,11,11,2,2,14,14,14,14,34,34,34,34,1,1,1,1,17,17,18,18,2,2,2,1,1,0,3,19}
weat_lv = {12,12,15,15,66,66,12,12,61,58,28,28,28,28,18,11,11,11,11,11,11,11,2,2,14,14,14,14,34,34,34,34,1,1,1,1,17,17,18,3,3,3,2,1,1,0,3,3}

weat_zone = {
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,4,4,4,4,4,4,4,4,4,4,4,4,8,8,8,8,8,8,8,8,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,4,4,4,4,4,4,4,4,4,4,4,4,4,8,8,8,8,8,8,8,8,8,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,4,4,4,4,4,4,4,4,4,4,8,8,8,8,8,8,8,8,8,8,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,4,4,4,4,4,4,4,4,4,4,8,8,8,8,8,8,8,8,8,8,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,4,4,4,4,4,4,4,4,4,4,4,8,8,8,8,8,8,8,8,8,8,8,1,1,1,1,1},
{1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,4,4,4,4,4,4,4,4,8,8,8,8,8,8,8,8,8,8,8,1,1,1,1,1},
{1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,4,4,4,4,4,4,4,4,8,8,8,8,8,8,8,8,8,8,8,1,1,1,1,1},
{1,1,1,1,1,1,2,2,2,2,2,2,2,1,1,1,4,4,4,4,4,4,4,4,4,8,8,8,8,8,8,8,8,8,8,1,1,1,1,1},
{1,1,1,1,1,2,2,2,2,2,2,2,2,1,1,1,4,4,4,4,4,4,4,4,4,8,8,8,8,8,8,8,8,8,8,1,1,1,1,1},
{1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,1,1,1,4,4,4,4,4,4,4,8,8,8,8,8,8,8,8,8,8,1,1,1,1,1},
{1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,1,1,1,4,4,4,4,4,4,8,8,8,8,8,8,8,8,8,8,8,1,1,1,1,1},
{1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,4,4,4,8,8,8,8,8,8,8,8,8,8,1,1,1,1,1},
{1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
{1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
{1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
{1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
{1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
{1,1,1,1,1,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
{1,1,1,1,1,1,1,2,2,1,1,2,2,2,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
}

function wheaterStep(imm)
if (getElementInterior(getLocalPlayer()) == 0 ) then
	local hour,mins = getTime()
	hour = hour * 2
	if (mins>=30) then
		hour = hour + 1
	end
	local x,y,z = getElementPosition(getLocalPlayer())
	local px = math.floor((x+4000)/200)
	local py = math.floor((y+4000)/200)
	if (px<1) then
		px = 1
	elseif (px>40) then
		px = 40
		end
	if (py<1) then
		py = 1
	elseif (py>40) then
		py = 40
		end
	py = 41 - py
	local zone = weat_zone[py][px]
	if (zone == 2) then
		weat = 9
	elseif (zone == 4) then
		weat = 12
	elseif (zone == 8) then
		weat = 8
	else
		weat = 12
	end
	local cyc_power = 0
	for i, cyc in pairs(cyclones) do
	if (cyc[3]>0) then
		local dist = getDistanceBetweenPoints2D (x, y, cyc[1], cyc[2])
		if (cyc[3]>600) then
			if (dist<cyc[3]/4) then
				cyc_power = math.max(cyc_power,3)
			elseif (dist<cyc[3]*1/2) then
				cyc_power = math.max(cyc_power,2) 
			elseif (dist<cyc[3]) then
				cyc_power = math.max(cyc_power,1) 
			end
		else
			if (dist<cyc[3]/2) then
				cyc_power = math.max(cyc_power,2)
			elseif (dist<cyc[3]) then
				cyc_power = math.max(cyc_power,1)
			end
		end
	end
	end
	if (cyc_power==3) then
		if (zone==4) then
			weat = 12
		else
			weat = 8
		end
	elseif (cyc_power==2) then
		if ((hour>2)and(hour<38)) then
			weat = 8
		else
			weat = 9
		end		
	elseif (cyc_power==1) then
		weat = 7
	end
	if (imm==0) then 
		setWeather(12)
	else
		setWeather(8)
	end
end
end

function onPlayerSpawn()
	if (source==getLocalPlayer()) then
		wheaterStep()
	end
end
addEventHandler("onClientPlayerSpawn",getLocalPlayer(),onPlayerSpawn)
setTimer(wheaterStep,60000,0,0)

function weatherConfig ()
	setTrafficLightsLocked(false)
	setMinuteDuration(45000)
	setTrafficLightState(9)
end
addEventHandler("onClientResourceStart",getRootElement(),weatherConfig)
]]

setTrafficLightsLocked(false)
setTrafficLightState(9)

local file = fileExists("dane.korea") and fileOpen("dane.korea")

if file then
	local r = fileRead(file, fileGetSize(file))
	r = tonumber(r)
	if r then
		r = r > 1500 and 1500 or r < 300 and 300 or r
		setFarClipDistance(r)
		setFogDistance(r - 200)
	end
	fileClose(file)
else
	file = fileCreate("dane.korea")
	fileClose(file)
end


function saveDist(int)
	fileDelete("dane.korea")
	file = fileCreate("dane.korea")
	fileWrite(file, int)
	fileClose(file)
end


addCommandHandler("render.distance",function(cmd,a)
	local jezyk = getElementData(localPlayer,"Jezyk_Gry") or "PL"
	if not a or not tonumber(a) then outputChatBox(language[jezyk]["Render_uzycie"],255,0,0) return end
	a = tonumber(a)
	if a >= 300 and a <= 1500 then
		setFarClipDistance(a)
		setFogDistance(a - 200)
		saveDist(tostring(a))
	else
		outputChatBox(language[jezyk]["Max_distance"],255,0,0)
	end
end)

addEventHandler("onClientPlayerChangeNick",localPlayer,function(old,new)
	new = new:gsub("#%x%x%x%x%x%x","")
	if nick == "" then
		outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] Niepoprawny nick!",255,255,255,true)
		cancelEvent()
	end
end,true,"high")


local weaponslots = {
	[25] = 1, [26] = 1, [27] = 1,
	[30] = 1, [31] = 1, [33] = 1,
	[34] = 1, [2]  = 2, [4]  = 2,
	[5]  = 2, [6]  = 2, [8]  = 2,
	[22] = 2, [23] = 2, [24] = 2,
	[29] = 2, [16] = 3, [17] = 3,
	[46] = 3, [43] = 3, [39] = 3
};

function getWeapon()
	if weaponslots[getPedWeapon(localPlayer)] then
		local bron = getElementData(localPlayer,"currentweapon_"..weaponslots[getPedWeapon(localPlayer)])
		return bron
	end
	return false
end

local shoot_timer = nil

toggleControl("action",false)

addEventHandler("onClientPlayerWeaponFire",localPlayer,function(weapon)
	if isTimer(shoot_timer) then toggleControl("fire",false) return end
	if weapon == 34 then
		local czas = 1300
		if getWeapon() == "Barret M107" then
			czas = 3000
		elseif getWeapon() == "SVD Dragunov" then
			czas = 300
		end
		toggleControl("fire",false)
		if isTimer(shoot_timer) then
			killTimer(shoot_timer)
			return
		end
		shoot_timer = setTimer(function()
			toggleControl("fire",true)
		end,czas,1)
	elseif weapon == 30 then
		if getWeapon() == "AA-12" then
			toggleControl("fire",false)
			shoot_timer = setTimer(function()
				toggleControl("fire",true)
			end,150,1)
		end
	end
end)


addEventHandler("onClientPlayerWeaponSwitch",localPlayer,function(prev,curr)
	if isTimer(shoot_timer) then
		if curr == 6 or getPedWeapon(localPlayer,curr) == 30 then
			toggleControl("fire",false)
		end
	end
end,true,"low")



