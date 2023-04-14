setTimer(function()
local time = getRealTime()
	local godzina = time.hour
	local dzien = time.monthday
	local miesiac = time.month
	local minut = time.minute
	local sekund = time.second
if (godzina == 5) and (minut == 5) then
	stopResource(getThisResource())
end
end, 10000, 0)

addEvent('ZombieStartPlayer',true)

local zombies = {
{-1680,-2257,38,"Boss Stopa"},  --wielka stopa
{-1026,-2526,76,"Boss Stopa"},  --wielka stopa
{-471,-2111,90,"Boss Stopa"},  --wielka stopa
{-1487,-1841,66,"Boss Stopa"},  --wielka stopa
{-1622,-2598,42,"Boss Stopa"},  --wielka stopa
{-458,-2708,164,"Boss Stopa"},  --wielka stopa
}

local zombiaki = createElement("zombiaczki")
setElementID(zombiaki,"zombiaczki_all")

setElementData(zombiaki,"zombie_max",#zombies)
setElementData(zombiaki,"zombie_zywe",#zombies)

addCommandHandler('pos1',function(p)
	local x,y,z = getElementPosition(p)
	outputChatBox("{"..math.ceil(x)..','..math.ceil(y)..','..math.ceil(z)..'},',p)
end)

local col_bot = {}


local skiny = {
	22,
	67,
	92,
	105,
	206,
}

local player_zombies = {}


local blip_zombie = {}

local data_bossow = {
	["Boss Stopa"] = function(bot)
		setElementData(bot,"blood",3500000)
		setElementData(bot,"anty-headshot",true)
		setElementData(bot,"damage",12000)
		setElementData(bot, "Boss Stopa", true)
		setElementModel(bot, 68)
	end,

}

local col_zombie_spawner = {}


function spawnZombieZdalnie(x,y,z)
--[[	local bot = createPed(skiny[math.random(#skiny)],x,y,z)
	setPedWalkingStyle(bot,120)
	local col = createColSphere(x,y,z-5,150)
	attachElements(col,bot)
	col_zombie_spawner[col] = true
	setElementData(bot,'ColShape',col)
	setElementData(bot,'rsp',{x,y,z})
	setElementData(bot,'damage',1000)
	setElementData(bot,'Zombie-Typ',"Low-Zombie")
	setElementData(bot,'blood',12000)
	for i,v in pairs(getElementsWithinColShape(col,'player')) do
		if not player_zombies[v] then
			player_zombies[v] = {}
		end
		player_zombies[v][col] = col
	end
	col_bot[col] = {col,bot}]]
end
addEvent("spawnZombieZdalnie",true)
addEventHandler("spawnZombieZdalnie",root,spawnZombieZdalnie)

function spawnZombie()
		local rnd = math.random(1,#zombies)
		local bot = createPed(skiny[math.random(#skiny)],zombies[rnd][1],zombies[rnd][2],zombies[rnd][3])
	for i,v in pairs(zombies) do
		--createBlipAttachedTo(bot,0,1,0,255,0,255,0,100)
		setPedWalkingStyle(bot,118)
		local col = createColSphere(v[1],v[2],v[3]-5,150)
		attachElements(col,bot)
		col_zombie_spawner[col] = true
		--setBlipVisibleDistance(createBlipAttachedTo(bot,11),600)
		setElementData(bot,'Zombie-Respawn',true)
		setElementData(bot,'ColShape',col)
		setElementData(bot,'rsp',{v[1],v[2],v[3]})
		setElementData(bot,"blood",12000)
		setElementData(bot,'damage',1000)
		if v[4] then
			data_bossow[v[4]](bot);
			setElementData(bot,"Zombie-Typ",v[4])
		else
			setElementData(bot,'Zombie-Typ',"Low-Zombie")
			setElementData(bot,'blood',12000)
		end
		for i,v in pairs(getElementsWithinColShape(col,'player')) do
			if not player_zombies[v] then
				player_zombies[v] = {}
			end
			player_zombies[v][col] = col
		end
		--setElementData(bot,'spawnPoint',{v[1],v[2],v[3]})
		
		
		col_bot[col] = {col,bot}
	end
end
spawnZombie()



local dzwiek = 0



addEventHandler('onColShapeHit',resourceRoot,function(elem)
	if not col_zombie_spawner[source] then return end
	if getElementType(elem)=='player' then
		if not player_zombies[elem] then
			player_zombies[elem] = {}
		end
		player_zombies[elem][source] = source
	end
end)

addEventHandler('onColShapeLeave',resourceRoot,function(elem)
	if not col_zombie_spawner[source] then return end
	if getElementType(elem)=='player' then
		if col_bot[source] and player_zombies[elem] and player_zombies[elem][source] and player_zombies[elem][source]==col_bot[source][1] and isElement(col_bot[source][2]) then
			zombieBackToSpawn(col_bot[source][2])
		end
		player_zombies[elem][source] = nil
	--[[elseif getElementType(elem)=='ped' then
		if col_bot[source] and isElement(col_bot[source][2]) then
			zombieBackToSpawn(col_bot[source][2])
		end]]
	end
end)

addEventHandler('onPlayerQuit',root,function()
	if not player_zombies[source] then return end
	for i,v in pairs(player_zombies[source]) do
		if col_bot[v] then
			local bot = col_bot[v][2]
			if not isPedDead(bot) then
				zombieBackToSpawn(bot)
			end
		end
	end
end)

local zombie_to_player = {}
local zombie_timers_to_player = {}


addEventHandler('ZombieStartPlayer',resourceRoot,function(player,strzelil)
	if not player_zombies[player] then
		player_zombies[player] = {}
	end
	local sound = (getElementData(player,'volume') or 20)/5
	local visible = (getElementData(player,'visibly') or 20)/5
	if not player_zombies[player] then return end
	if strzelil then
		if isTimer(zombie_timers_to_player[player]) then
			killTimer(zombie_timers_to_player[player])
		end
	end
	for i,v in pairs(player_zombies[player]) do
		if col_bot[v] then
			local bot = col_bot[v][2]
			if not isElement(bot) or getElementType(bot) == "colshape" or isPedDead(bot) then
				player_zombies[player][i] = nil
			end
			if player_zombies[player][i] then
				local dystans_player = {getElementPosition(player)}
				local dystans_ped = {getElementPosition(bot)}
				if strzelil then
					local dystans = getDistanceBetweenPoints3D(Vector3(getElementPosition(bot)),strzelil[1],strzelil[2],strzelil[3])
					if dystans<30 and (dystans_player[3] - 10 < dystans_ped[3] and dystans_player[3] + 10 > dystans_ped[3]) then
						if not isPedDead(bot) then
							
							if getElementData(player,"Immunited") then
								setElementData(player,'Immunited',false)
							end
							if getElementData(player,"Zombie_Strzelil") then
								setElementData(player,'Zombie_Strzelil',true)
							end
							seachTarget(bot,player)
							if not isTimer(zombie_timers_to_player) then
								zombie_timers_to_player[player] = setTimer(function(player)
									if not isElement(player) then return end
									setElementData(player,'Zombie_Strzelil',false)
								end,6000,1,player)
							end
						end
					end
				else
					local distance = getDistanceBetweenPoints3D(dystans_player[1],dystans_player[2],dystans_player[3],dystans_ped[1],dystans_ped[2],dystans_ped[3])
					if bot and isElement(bot) and not isPedDead(bot) then
						if ( distance < sound*0.75+ visible*1 )  then
							setElementData(player,'Immunited',false)
							seachTarget(bot,player)
						else 
							if getElementData(bot,'target') then 
								if getElementData(bot,'target')==player then
									if ( distance > sound*2.25+ visible*1.75) then
										if not getElementData(player,"Zombie_Strzelil") then 
											setElementData(player,'Immunited',true)
											zombieBackToSpawn(bot)
										end
									else
										---seachTarget(bot,player)
										 --zombieBackToSpawn(bot,player)
									end
							--setElementData(player,'Immunited',true)
								end
							else
								zombieBackToSpawn(bot)
							end
						end
					end
				end
			end
		end
	end
end)


local items = {
	{"Hatchet",2},
	{"Pizza",5},
	{"Soda Bottle",5},
	{"Milk",5},
	{"Winchester 1866",2},
}

function math.percent(percent,maxvalue)
    if tonumber(percent) and tonumber(maxvalue) then
        return (maxvalue*percent)/100
    end
    return false
end


function restartZombie(id,x,y,z,typ)
	local col = createColSphere(x,y,z,150)
	local bot = createPed(id or skiny[math.random(#skiny)],x,y,z)
	setElementData(zombiaki,"zombie_zywe",getElementData(zombiaki,"zombie_zywe") + 1)
	attachElements(col,bot)
	col_zombie_spawner[col] = true
	setPedWalkingStyle(bot,120)
	setElementData(bot,'rsp',{x,y,z})
	for i,v in pairs(getElementsWithinColShape(col,'player')) do
		if not player_zombies[v] then
			player_zombies[v] = {}
		end
		player_zombies[v][col] = col
	end
	--setElementData(col,'Zombie-Col',true)
	setElementData(bot,'Zombie-Respawn',true)
	setElementData(bot,'ColShape',col)
	if data_bossow[typ] then
		data_bossow[typ](bot)
		setElementData(bot,"Zombie-Typ",typ)
	else
		setElementData(bot,'damage',500)
		setElementData(bot,'Zombie-Typ',"Low-Zombie")
		setElementData(bot,'blood',12000)
	end
	col_bot[col] = {col,bot}
end

local deaths_zombies = {}


setTimer(function()
	for i,v in pairs(deaths_zombies) do
		if getTickCount()>v[5] then
			restartZombie(tonumber(v[1]),v[2],v[3],v[4],v[6])
			deaths_zombies[i] = nil
		end
	end
end,60000,0)


local gp_und_exp_for_zombie = {
	["Boss Stopa"] = {GP ={2000,3300},EXP = {500,1000}, time_respawn = 9999999999},
}


local itemTableZombies = {
	{"Box of Matches", 5},
	{"Wood Pile", 5},
	{"M1911", 0.4},
	{"PDW", 0.3},
	{"Hunting Knife", 7},
	{"Hatchet", 7},
	{"Pizza", 7},
	{"Soda Bottle", 7},
	{"MP5A5", 0.1},
	{"Empty Gas Canister", 5},
	{"Roadflare", 9},
	{"Baseball Bat", 0.5},
	{"Milk", 5},
	{"Assault Pack (ACU)", 99},
	{"Painkiller", 7},
	{"M9 SD", 0.4},
	{"Empty Soda Cans", 6},
	{"Scruffy Burgers", 6},
	{"Grenade", 0.5},
	--{"Desert Eagle", 0.3},
	{"Sawn-Off Shotgun", 0.2},
	{"SPAZ-12 Combat Shotgun", 0.2},
	{"Watch", 3},
	{"Heat Pack", 6},
	{"Wire Fence", 1},
	{"Winchester 1866", 0.4},
	{"Alice Pack", 0.5},
	{"Tire", 1},
	{"Morphine", 2},
	{"Civilian Clothing", 12},
	{"Map", 4},
	{"Golf Club", 0.5},
	{"GPS", 1},
	{"Pasta Can", 5},
	{"Beans Can", 5},
	{"Lee Enfield", 0.2},
	{"Burger", 2},
	{"Radio Device", 3},
	{"Shovel", 0.5}
};

function math.percentChance(percent, repeatTime)
	local hits = 0;
	for i = 1, repeatTime do
		local number = math.random(0, 200)/2
		if (number <= percent) then hits = hits + 1; end
	end
	return hits;
end

addEventHandler('onPedWasted',resourceRoot,function(totalAmmo,p,weap,bp)
	if not isElement(source) then return end
	if getElementData(source,'deadzombie') then return end
	if blip_zombie[source] then
		destroyElement(blip_zombie[source])
		blip_zombie[source] = nil
	end
	local x,y,z = getElementPosition(source);
	local ped = source
	local pedCol = createColSphere(x, y, z, 1.5);
	killPed(ped);
	if bp == 9 then
		setPedHeadless(ped,true)
	end
	setElementCollisionsEnabled(ped,false)
	setElementData(zombiaki,"zombie_zywe",getElementData(zombiaki,"zombie_zywe") - 1)
	setTimer(function(ped, pedCol)
		if blip_zombie[ped] then
			destroyElement(blip_zombie[ped])
			blip_zombie[ped] = nil
		end
		if ped then destroyElement(ped); end
		if pedCol then destroyElement(pedCol); end
	end, (60000 * 3), 1, ped, pedCol);
	attachElements(pedCol,ped);
	setElementData(pedCol, "parent", ped);
	setElementData(ped, "parent", pedCol);
	setElementData(pedCol, "playername", "Zombie");
	setElementData(pedCol, "deadman", true);
	setElementData(pedCol, "MAX_Slots", 8);
	setElementData(ped, "deadzombie", true);
	setElementData(source, "deadzombie", true);
	local rodzaj_zombiaka = getElementData(source,"Zombie-Typ")
	local colshape = getElementData(source,'ColShape')
	local x1,y1,z1 = unpack(getElementData(source,'rsp'))
	if getElementData(ped,"Zombie-Respawn") then
		table.insert(deaths_zombies,{tonumber(skiny[math.random(#skiny)]),x1,y1,z1,getTickCount()+ gp_und_exp_for_zombie[rodzaj_zombiaka].time_respawn,rodzaj_zombiaka}) -- 900000
	end
	if p  and getElementType(p) == "player" then
		player_zombies[p][colshape] = nil
		local los = math.random(gp_und_exp_for_zombie[rodzaj_zombiaka].GP[1],gp_und_exp_for_zombie[rodzaj_zombiaka].GP[2])
		setElementData(p,"GP",(getElementData(p,"GP") or 0)+los)
		local added_exp = math.random(gp_und_exp_for_zombie[rodzaj_zombiaka].EXP[1],gp_und_exp_for_zombie[rodzaj_zombiaka].EXP[2])
		triggerEvent("giveEXP",p,added_exp)
		setElementData(p,"humanity",(getElementData(p,"humanity") or 0)+math.random(20,30))
		outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] +"..los.." GP +"..added_exp.." EXP!",p,255,255,255,true)
		setElementData(p,'zombieskilled',(getElementData(p,'zombieskilled') or 0)+1)
		setElementData(p,'TotalZombieKilled',(getElementData(p,'TotalZombieKilled') or 0)+1)
	end
	if col_bot[colshape] then
		destroyElement(colshape)
		col_bot[colshape] = nil
	end
	if getElementData(source, "Boss Stopa") then
		local chance = math.random(1, 100)
		if chance <= 50 then
			setElementData(pedCol, "Code card #"..math.random(1,6), 1)
		end
		setElementData(pedCol, "M4A1-S Mag", math.random(20,40))
		setElementData(pedCol, "Scar-L", math.random(3,8))
		setElementData(pedCol, "Scar-L Mag", math.random(3,10))
		setElementData(pedCol, "M4A1-S", math.random(10,20))
		setElementData(pedCol, "AK-47", math.random(10,20))
		setElementData(pedCol, "AK-47 Mag", math.random(10,30))
		setElementData(pedCol, "MG-34", math.random(5,15))
		setElementData(pedCol, "MG-34 Mag", math.random(15,35))
		setElementData(pedCol, "Wrench", math.random(3,15))
		setElementData(pedCol, "Medic Bag", math.random(5,15))
		setElementData(pedCol, "Military Backpack", math.random(5,15))
	end
	local time = getRealTime();
	setElementData(pedCol, "deadreason", "Looks like it's finally dead. Estimated time of death: "..time.hour..":"..time.minute.." o'clock.");
	for _,v in ipairs(itemTableZombies) do
		local value = math.percentChance(v[2]/2.5, 1);
		setElementData(pedCol, v[1], value);
		local ammoData,_ = exports.DayZ_core:getWeaponAmmoType(v[1]);
		if (ammoData and value > 0) then
			setElementData(pedCol, ammoData, 1);
		end
	end
end)

addEvent("killZombie",true)
addEventHandler("killZombie",resourceRoot,function(ped,weap,bp)
	killPed(ped,client,weap,bp)
end)

