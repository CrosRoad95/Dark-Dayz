

function startFight(bot,player)
	local x,y,z = getElementPosition(bot)
	local x1,y1,z1 = getElementPosition(player)
	local angle = findRotation(x,y,x1,y1)
	setElementData(player,'Immunited',false)
	local elements = getElementsWithinColShape(getElementData(bot,"ColShape"),"player")
	for i,v in pairs(elements) do
		triggerClientEvent(v,'setPedRun',bot,false,angle)
		triggerClientEvent(v,'startFight',bot,true,angle)
	end
end


function checkDistance(bot,player)
	if not isElement(player) or not isElement(bot) or isPedDead(bot) then return end
	local x,y,z = getElementPosition(bot)
	local x1,y1,z1 = getElementPosition(player)
	if getElementData(player,'Immunited') then return end
	if getDistanceBetweenPoints3D(x,y,z,x1,y1,z1)<1.5 then
		startFight(bot,player)
		return true
	end
	return false
end

local tick = getTickCount() + 1000
local ilosc_per_s = 0

local timers = {}


function zombieMoveToTarget(bot,player,cos)
	if not isElement(player) then
		isPedInCenterOfSpawnPoint(bot,player)
		return
	end
	
	if isTimer(timers[bot]) then return end
	if not isElement(bot) or isPedDead(player) then return end
	if getElementData(bot,'target')~=player or getElementData(player,"Immunited") then
		--[[setElementData(bot,'target',nil)
		local _,_,rot1= getElementRotation(bot)
		triggerClientEvent('setPedRun',bot,false,rot1)]]
		isPedInCenterOfSpawnPoint(bot)
		return
	end
	if checkDistance(bot,player) then isPedInCenterOfSpawnPoint(bot,player) return end
	if isElement(player) and getElementData(player,'Immunited') then isPedInCenterOfSpawnPoint(bot,player) return end
	if przerwijSledzenie(bot) then isPedInCenterOfSpawnPoint(bot) return end
	local x,y,z = getElementPosition(bot)
	local x1,y1,z1 = getElementPosition(player)
	if getElementSyncer(bot)~=player then
		setElementSyncer(bot,player)
	end
	setElementData(player,'Immunited',false)
	local _,_,rot1= getElementRotation(bot)
	local _,_,rot2 = getElementRotation(player)
	local angle = findRotation(x,y,x1,y1)
	setPedRotation( bot, angle )
	local elements = getElementsWithinColShape(getElementData(bot,"ColShape"),"player")
	local los = math.random(5) 
	for i,v in pairs(elements) do
		triggerClientEvent(v,'setPedRun',bot,true,angle)
		if los == 5 then
			triggerClientEvent(v,"zombieJump",bot)
		end
	end
	setTimer(checkDistance,500,1,bot,player)
	timers[bot] = setTimer(zombieMoveToTarget,500,1,bot,player)
end

addEvent("GetdmgPlayerToZombie",true)
addEventHandler("GetdmgPlayerToZombie",resourceRoot,zombieMoveToTarget)


function przerwijSledzenie(bot)
	if not isElement(bot) or isPedDead(bot) then return false end
	if #getElementsWithinColShape(getElementData(bot,'ColShape'),'player')==0 then
		setElementData(bot,'target',nil)
		return true
	end
	return false
end


local timery = {}
local mozliwosc = {}

function isPedInCenterOfSpawnPoint(bot,player)
	if not isElement(bot) or isPedDead(bot) then return end
	local x,y,z = unpack(getElementData(bot,'rsp'))
	local x1,y1,z1 = getElementPosition(bot)
	local x2,y2,z2
	--if timery[bot] then return end
	if isElement(player) then
		if getElementData(bot,'target') and getElementData(bot,'target')~=player then return end
		 x2,y2,z2 = getElementPosition(player)
	end
	if x2 and getDistanceBetweenPoints3D(x1,y1,z1,x2,y2,z2)<5 then
		triggerClientEvent(player,'ZombieSound',resourceRoot)
	end
	if x2 and getDistanceBetweenPoints3D(x1,y1,z1,x2,y2,z2)<1.5 then
		startFight(bot,player)
	else
		setElementData(bot,'target',nil)
		local elements = getElementsWithinColShape(getElementData(bot,"ColShape"),"player")
		for i,v in pairs(elements) do
			triggerClientEvent(v,'setPedRun',bot,false,0)
		end
	end
end

local player_ticking = {}

local suck_dick = 0

function zombieBackToSpawn(bot,player)
	if player and getElementData(player,'Zombie_Strzelil') then return end
	local anim = {getElementVelocity(bot)}
	anim = anim[1] + anim[2] + anim[3]
	if player  then
		if getPlayerIdleTime(player)>3000 then
			if getElementData(bot,'target')==player then
				if math.abs(anim) > 0.001 then
					isPedInCenterOfSpawnPoint(bot,player)
				end
			elseif not getElementData(bot,"target") then
				if math.abs(anim) > 0.001 then
					isPedInCenterOfSpawnPoint(bot)
				end
			end
			setElementData(player,'Immunited',true)
		end
	else
		if math.abs(anim) > 0.001 then
			isPedInCenterOfSpawnPoint(bot,player)
		end
		--outputChatBox(suck_dick)
		--isPedInCenterOfSpawnPoint(bot,player)
	end
end

function findRotation( x1, y1, x2, y2 ) 
    local t = -math.deg( math.atan2( x2 - x1, y2 - y1 ) )
    return t < 0 and t + 360 or t
end

function seachTarget(bot,player)
	
	if isPedDead(bot) then return end
	if not getElementData(bot,'target') then
		setElementData(bot,'target',player)
		zombieMoveToTarget(bot,player)
	elseif getElementData(bot,'target')==player then
		setElementData(bot,'target',player)
		zombieMoveToTarget(bot,player)
	--	zombieMoveToTarget(bot,player)
	end
end

