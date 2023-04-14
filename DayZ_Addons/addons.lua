

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

function formatTimeFromMinutes(value)
	if value then
		local hours = math.floor(value/60)
		local minutes = math.round(((value/60) - math.floor(value/60))*100/(100/60))
		if minutes < 10 then minutes = "0"..minutes end
		value = hours..":"..minutes
		return value
	end
	return false
end

function refreshInfomrations()
	for i,v in pairs(getElementsByType('player')) do
		setElementData(v,'Zabójstwa',(getElementData(v,'murders') or 0).." | "..(getElementData(v,'TotalMurders') or 0))
		setElementData(v,'Zabite Zombi',(getElementData(v,'zombieskilled') or 0).." | "..(getElementData(v,'TotalZombieKilled') or 0))
		setElementData(v,'Czas',formatTimeFromMinutes((getElementData(v,'alivetime') or 0)).." | "..formatTimeFromMinutes((getElementData(v,'alivetimetotal') or 0)))
		local grupa = "Brak"
		if getElementData(v,'Grupa') then
			grupa = getElementData(v,'Grupa').nazwa
		end
		setElementData(v,'Pseudo_Grupa',grupa)
	end
end
refreshInfomrations()
setTimer(function()
	refreshInfomrations()
end,10000,0)

--[[
for i,v in pairs(getAccounts()) do
	if getAccountData(v,"Grupa") then
		local grupa = fromJSON(getAccountData(v,"Grupa"))
		if grupa and grupa.nazwa then
			if grupa and grupa.nazwa:find("FragXperts") then
				outputChatBox(getAccountName(v))
			end
		end
	end
end]]

addEventHandler("onPlayerLogin", root, function()
	triggerClientEvent("displayClientInfo", root, getPlayerName(source):gsub("#%x%x%x%x%x%x", "").." Zalogował się do gry", 255, 255, 255);
	setElementData(source, "clientdata", {getServerName(), getMaxPlayers()});
end);



function math.percent(percent,maxvalue)
    if tonumber(percent) and tonumber(maxvalue) then
        return (maxvalue*percent)/100
    end
    return false
end

--PSEUDO

-- mp5
setWeaponProperty( 29, "poor", "weapon_range", 125 )
setWeaponProperty( 29, "std", "weapon_range", 125 )
setWeaponProperty( 29, "pro", "weapon_range", 125 )
-- ak/m4
setWeaponProperty( 31, "pro", "maximum_clip_ammo", 30 )
setWeaponProperty( 31, "pro", "weapon_range", 220 )
setWeaponProperty( 31, "std", "maximum_clip_ammo", 30 )
setWeaponProperty( 31, "std", "weapon_range", 220 )
setWeaponProperty( 31, "poor", "maximum_clip_ammo", 30 )
setWeaponProperty( 31, "poor", "weapon_range", 220 )
setWeaponProperty( 31, "poor", "accuracy", 1 ) -- od 0 do 199

setWeaponProperty( 31, "poor", "flags", 0x000020 ) 
setWeaponProperty( 31, "std", "flags", 0x000020 )

setWeaponProperty( 31, "std", "accuracy", 1 ) -- od 200 do 998
setWeaponProperty( 31, "pro", "accuracy", 1 ) -- od 999

setWeaponProperty( 30, "pro", "accuracy", 1 ) -- od 999
setWeaponProperty( 30, "pro", "maximum_clip_ammo", 20 ) -- od 999
setWeaponProperty( 30, "pro", "weapon_range", 250 )
--setWeaponProperty( 27, "pro", "flags", 0x000002 )

-- awupe
--[[
local default = getOriginalWeaponProperty( 34, "pro", "anim_loop_start")
setWeaponProperty( 34, "pro", "anim_loop_start", default)
local default = getOriginalWeaponProperty( 34, "pro", "anim_loop_stop")
setWeaponProperty( 34, "pro", "anim_loop_stop", default)
local default = getOriginalWeaponProperty( 34, "pro", "anim_loop_bullet_fire")
setWeaponProperty( 34, "pro", "anim_loop_bullet_fire", default)
local default = getOriginalWeaponProperty( 34, "pro", "anim2_loop_start")
setWeaponProperty( 34, "pro", "anim2_loop_start", default)
local default = getOriginalWeaponProperty( 34, "pro", "anim2_loop_stop")
setWeaponProperty( 34, "pro", "anim2_loop_stop", default)
local default = getOriginalWeaponProperty( 34, "pro", "anim2_loop_bullet_fire")
setWeaponProperty( 34, "pro", "anim2_loop_bullet_fire", default)]]

setWeaponProperty(34,"std","maximum_clip_ammo",10)
setWeaponProperty(34,"pro","maximum_clip_ammo",10)
setWeaponProperty(34,"poor","maximum_clip_ammo",10)

-- szotgun's

setWeaponProperty( 25, "poor", "weapon_range", 60 )
setWeaponProperty( 25, "std", "weapon_range", 60 )
setWeaponProperty( 25, "pro", "weapon_range", 60 )
setWeaponProperty( 26, "poor", "weapon_range", 60 )
setWeaponProperty( 26, "std", "weapon_range", 60 )
setWeaponProperty( 26, "pro", "weapon_range", 60 )
setWeaponProperty( 27, "poor", "weapon_range", 60 )
setWeaponProperty( 27, "std", "weapon_range", 60 )
setWeaponProperty( 27, "pro", "weapon_range", 60 )
--pdw
setWeaponProperty( 28, "poor", "weapon_range", 60 )
setWeaponProperty( 28, "std", "weapon_range", 60 )
setWeaponProperty( 28, "pro", "weapon_range", 60 )
setWeaponProperty( 28, "poor", "accuracy", 0.3 )
setWeaponProperty( 28, "std", "accuracy", 0.3 )
setWeaponProperty( 28, "pro", "accuracy", 0.3 )
setWeaponProperty( 28, "poor", "maximum_clip_ammo", 50 )
setWeaponProperty( 28, "std", "maximum_clip_ammo", 50 )
setWeaponProperty( 28, "pro", "maximum_clip_ammo", 50 )
-- LEE ENFIELD
setWeaponProperty( 33, "poor", "weapon_range", 270 )
setWeaponProperty( 33, "std", "weapon_range", 270 )
setWeaponProperty( 33, "pro", "weapon_range", 270 )
-- LSATY
setWeaponProperty( 30, "poor", "weapon_range", 220 )
setWeaponProperty( 30, "poor", "maximum_clip_ammo", 100 )
setWeaponProperty( 30, "poor", "damage", 39 )
setWeaponProperty( 30, "poor", "accuracy", 0.4 )
-- Deagle
setWeaponProperty( 24, "poor", "weapon_range", 100 )
setWeaponProperty( 24, "std", "weapon_range", 100 )
setWeaponProperty( 24, "pro", "weapon_range", 100 )
-- USP
setWeaponProperty( 23, "poor", "weapon_range", 100 )
setWeaponProperty( 23, "std", "weapon_range", 100 )
setWeaponProperty( 23, "pro", "weapon_range", 100 )
-- pistol
setWeaponProperty( 22, "poor", "weapon_range", 45 )
setWeaponProperty( 22, "std", "weapon_range", 45 )
setWeaponProperty( 22, "pro", "weapon_range", 45 )
setWeaponProperty( 22, "std", "maximum_clip_ammo", 15 )
setWeaponProperty( 22, "poor", "maximum_clip_ammo", 15 )
setWeaponProperty( 22, "pro", "maximum_clip_ammo", 15 )





addEventHandler("onResourceStart", resourceRoot, function()
	setTimer(function()
	setGameType("✪ Dark-DayZ 2.20b✫ ✪"); --[[ Multi Theft Auto DayZ Revision 3 ]]
	setMapName("By: Korea")
	end,1500,1)
	setCloudsEnabled(false)
	local realTime = getRealTime();
	setTime(realTime.hour, realTime.minute);
	setMinuteDuration(60000);
	setFarClipDistance(600);
	setFogDistance(300);
	setTrafficLightState("disabled");
	setTimer(setTrafficLightState, 10000, 0, "disabled");
end);

local nazwa_serwera = "#ed7600Dark-DayZ"

function getNazwaSerwera()
	return nazwa_serwera
end

local blocked_stat = {
	[73] = true,
	[75] = true,
}

addEventHandler("onPlayerJoin", root, function()
	setPlayerNametagShowing(source, false);
	for i = 70, 78 do
		if not blocked_stat[i] then
			if i==77 then
				setPedStat(source, i, 0);
			elseif i == 78 then
				setPedStat(source, i, 800)
			else
				setPedStat(source, i, 1000);
			end
		end
	end
end);
--[[
for _,v in pairs(getElementsByType('player')) do
	for i = 70, 79 do
		if not blocked_stat[i] then
			if i==77 then
				setPedStat(source, i, 0);
			else
				setPedStat(source, i, 1000);
			end
		end
	end
end
	]]
	
addEventHandler("onPlayerChangeNick",root,function(o,new)
	if isPlayerMuted(source) then
		outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] Posiadasz nałożoną kare!",source,255,255,255,true)
		cancelEvent()
	end
end)
	
local tickes = {}

addEventHandler("onPlayerCommand",root,function(s)
	if s == "Toggle" then return end
	if not tickes[source] then
		tickes[source] = getTickCount() + 300
	else
		if tickes[source] > getTickCount() then
			
			outputChatBox("Don't spam!",source,255,0,0)
			tickes[source] = getTickCount() + 300
			cancelEvent();
			return
		end
	end
	tickes[source] = getTickCount() + 300
end)


addEventHandler("onPlayerConnect",root,function(nick)
	nick = nick:gsub("#%x%x%x%x%x%x","")
	if nick == "" then
		cancelEvent(true,"Niepoprawny nick")
	end
end)


local zmutowani = {}

addEventHandler("onPlayerMute",root,function()
	zmutowani[getPlayerSerial(source)] = getPlayerName(source)
	local nick = getPlayerName(source)
	setPlayerName(source,""..nick.."_(MUTE)")
end)

addEventHandler("onPlayerJoin",root,function()
	setTimer(function(gracz)
		if not gracz then return end
		if isPlayerMuted(gracz) then
		local nick = getPlayerName(gracz)
			setPlayerName(gracz,""..nick.."_(MUTE)")
		end
	end,500,1,source)
end)

addEventHandler("onPlayerUnmute", root, function()
	if zmutowani[getPlayerSerial(source)] then
		setPlayerName(source, zmutowani[getPlayerSerial(source)])
		zmutowani[getPlayerSerial(source)] = nil
	end
end)


-- -2422,-2624,43
local radar = createRadarArea(-2422,-2624,600,600,0,60,0,200)
local col = createColCuboid(-2422,-2624,-43,600,600,150)



local language = {
	["PL"] = {
		['Col_enter'] = "#FFFFFF[#ed7600Dark-DayZ#FFFFFF] Wchodzisz do strefy radiacji! Bez kombinezonu X Twoja krew będzie spadać!",
		['Col_leave'] = "#FFFFFF[#ed7600Dark-DayZ#FFFFFF] Wychodzisz ze strefy radiacji!",
	},
	['ENG'] = {
		['Col_enter'] = "#FFFFFF[#ed7600Dark-DayZ#FFFFFF] You entered to radiation zone! Without \"kombinezon X\" Your blood will go down!",
		['Col_leave'] = "#FFFFFF[#ed7600Dark-DayZ#FFFFFF] You left from radiation zone!",
	},
}

local timery = {}

addEventHandler('onColShapeHit',col,function(hit)
	if hit and getElementType(hit)~='player' then return end
	local jezyk = getElementData(hit,'Jezyk_Gry') or "PL"
	outputChatBox(language[jezyk]['Col_enter'],hit,255,255,255,true)
	if isTimer(timery[hit]) then
		killTimer(timery[hit])
	end
	timery[hit] = setTimer(function(player)
		if not isElement(player) then
			killTimer(sourceTimer)
			return
		end
		if getElementModel(player)~=235 then
			setElementData(player,'blood',(getElementData(player,'blood')-100))
		end
	end,1000,0,hit)
end)

addEventHandler('onColShapeLeave',col,function(hit)
	if hit and getElementType(hit)~='player' then return end
	local jezyk = getElementData(hit,'Jezyk_Gry') or "PL"
	if isTimer(timery[hit]) then
		killTimer(timery[hit])
		outputChatBox(language[jezyk]['Col_leave'],hit,255,255,255,true)
	end
end)

addCommandHandler("event-koniec", function (localPlayer)
	outputChatBox ( "#00ff00Wypisałeś się z eventu!", localPlayer, 255, 255, 255, true )
	setElementData(localPlayer, "event", false)
	zapisy = 0
end)

local random_wskazowka = {
	["PL"] = {
		{"Zbugowałeś się? Użyj komendy /unbug"},
		{"Znalazłeś buga? Napisz o nim na naszym discordzie - Dark-DayZ.mtasa.eu/discord"},
		{"Pod komenda /shadery znajdziesz shader mapy, ktory doda klimatu DayZ!"},
		{"Regulamin znajduje się pod klawiszem F3, zalecamy się z nim zapoznać!"},
		{"Chcesz kupić Punkty Premium? Kliknij F3 i przejdz do zakładki PP."},
		{"Chcesz kupić Punkty Premium za przelew/psc? Napisz do administracji!"},
		{"Konto VIP możesz zakupić pod klawiszem F3, koszt to 10 PP."},
		{"Chcesz kupić skina grupowego? Zgłoś się na naszego discorda - Dark-DayZ.mtasa.eu/discord"},
		{"Chcesz kupić bazę? Kliknij klawisz \"I\", na mapie wyświetlą Ci się wszystkie bazy."},
		{"Już teraz możesz wykupić swój prywatny spawn pojazdów w bazie! Zapraszamy do zakupu (F3 > Dodatki)."},
	},
	["ENG"] = {
		{"Are you bugged? Use the command / unbug"},
        {"Found a bug? Write about it on our discord - Dark-DayZ.mtasa.eu/discord"},
        {"Under the command / shaders you will find a map shader that will add a DayZ atmosphere!"},
        {"The regulations can be found under the F3 key, we recommend that you read them!"},
        {"Do you want to buy Premium Points? Click F3 and go to the PP tab."},
        {"You can purchase the VIP account under the F3 key, the cost is 10 PP."},
        {"Do you want to buy a group skin? Apply on our discord - Dark-DayZ.mtasa.eu/discord"},
        {"Do you want to buy a base? Click the\"I\"button, all the bases will be displayed on the map."},
        {"Now you can buy your private vehicle spawn in the base! We invite you to purchase (F3> Extras)."},
	},
}



function getRandomWskazowka()
	local randomowy_tekst = random_wskazowka["PL"][math.random(#random_wskazowka["PL"])][1]
	outputChatBox("#FFFFFF[#ed7600Wskazówka#FFFFFF] "..randomowy_tekst,root,255,255,255,true)
end
getRandomWskazowka()
setTimer(getRandomWskazowka,60000*10,0)

--[[setTimer(function(p) --- na czas zimy
local time = getRealTime()
	local godzina = time.hour
	local minut = time.minute
    if (godzina >= 21) and (godzina <= 5) then 
        setSkyGradient(0,0,0,43, 43, 43) 
        setWeather ( 136 ) 
        setCloudsEnabled ( false ) 
        setSunSize ( 0 )
	end
  if (godzina >= 6) and (godzina <= 21) then 
        setSkyGradient(75, 94, 88,44, 56, 52) 
        setWeather ( 0 ) 
        setCloudsEnabled ( false ) 
        setSunSize ( 3 ) 
  end
end, 10000, 0)]]--