--
-- ggun.lua
--

-- Most of ggun_s.lua belong to it's respective owner CrystalMV
-- Source can be found here https://community.multitheftauto.com/index.php?p=resources&s=details&id=2542
-- CrystalMV's homepage: http://crystalmv.net84.net/

ggun_enabled = {}

function togglePlayerGravityGun(player,on)
	if not (isElement(player) and getElementType(player) == "player") then return false end
	if on ~= true and on ~= false then return false end
	if ggun_enabled[player] == (on == true) then return false end
	ggun_enabled[player] = on == true
	if on then
		setElementData(player,"ggun_taken",true)
	else
		removeElementData(player,"ggun_taken")
	end
	toggleControl(player,"fire",not on)
	toggleControl(player,"action",not on)
	return true
end

function isGravityGunEnabled(player)
	return ggun_enabled[player] or false
end

addEventHandler("onPlayerQuit",root,function()
	ggun_enabled[source] = nil
	triggerClientEvent("onGGShell",resourceRoot,source,nil,false)
end
)

ped_timer = {}

addEvent("ggun_take",true)
addEventHandler("ggun_take",resourceRoot,function(taken,isFlag)
	local tempTimer = getTickCount()
	if not ped_timer[client] then ped_timer[client] = tempTimer - 200 end
	if ped_timer[client] + 200 <= tempTimer then
		if not isElement(getElementData(client,"ggun_taken")) then
			local taker = getElementData(taken,"ggun_taker")
			if isElement(taker) then
				if getElementData(taker,"ggun_taken") ~= taken then
					removeElementData(taken,"ggun_taker")
				end
			end
			if not isElement(getElementData(taken,"ggun_taker")) then
				if (isFlag and getElementType(taken) == "object") then
					triggerClientEvent("onGGBreakObject",resourceRoot,taken)
					triggerClientEvent("onGGPlaySound",resourceRoot,client,"sounds/fire.ogg",0.9)
					triggerClientEvent("onGGCreateSparkEffect",resourceRoot,client,0.9)
					ped_timer[client] = tempTimer
					return 
				end				
				triggerClientEvent("onGGPlaySound",resourceRoot,client,"sounds/pickup.ogg",0.5)
				triggerClientEvent("onGGShell",resourceRoot,client,taken,true)
				setElementData(client,"ggun_taken",taken)
				setElementData(taken,"ggun_taker",client)
				local dist = 1
				if isFlag then
					local x1,y1,z1 = getElementPosition(taken)
					local x2,y2,z2 = getElementPosition(client)
					x2,y2,z2 = x2-x1,y2-y1,z2-z1
					dist = math.sqrt(x2*x2+y2*y2+z2*z2)/5
				end
				setElementData(client,"ggun_dist", dist)
				ped_timer[client] = tempTimer
			end
		end
	end
end
)

addEvent("ggun_drop",true)
addEventHandler("ggun_drop",resourceRoot,function()
	local tempTimer = getTickCount()
	if not ped_timer[client] then ped_timer[client] = tempTimer - 200 end
	if ped_timer[client] + 200 <= tempTimer then
		triggerClientEvent("onGGPlaySound",resourceRoot,client,"sounds/drop.ogg",0.3)
		triggerClientEvent("onGGShell",resourceRoot,client,nil,false)
		removeElementData(getElementData(client,"ggun_taken"),"ggun_taker")
		setElementData(client,"ggun_taken",true)
		ped_timer[client] = tempTimer
	end
end
)

addEvent("ggun_push",true)
addEventHandler("ggun_push",resourceRoot,function(taken,vx,vy,vz)
	local taker = getElementData(taken,"ggun_taker")
	if isElement(taker) then setElementData(taker,"ggun_taken",true) end
	local vecLen = math.sqrt(vx * vx + vy * vy + vz * vz)
	triggerClientEvent("onGGPlaySound",resourceRoot,taker,"sounds/fire.ogg",vecLen)
	triggerClientEvent("onGGShell",resourceRoot,taker,nil,false)
	triggerClientEvent("onGGCreateSparkEffect",resourceRoot,taker,vecLen)
	removeElementData(taken,"ggun_taker")
	setElementVelocity(taken,vx,vy,vz)
end
)

addEventHandler("onPlayerWasted", getRootElement(), function()
	if isGravityGunEnabled(source) then
		local elData = getElementData(source,"ggun_taken")
		if elData then
			if isElement(elData) then
				triggerClientEvent("onGGShell",resourceRoot,source,nil,false)
				removeElementData(elData,"ggun_taker")
				removeElementData(source,"ggun_taken")
			end
		end
		togglePlayerGravityGun(source,false)
	end
end
)

roll_timer = {}

-- Turn velocity control
addEvent("GGbindMouseRollTurn",true)
addEventHandler("GGbindMouseRollTurn",resourceRoot,function(isDir)
	local tempTimer = getTickCount()
	if not roll_timer[client] then roll_timer[client] = tempTimer - 100 end
	if roll_timer[client] + 100 <= tempTimer then
		local taken = getElementData(client,"ggun_taken")
		if isElement(taken) then
			if getElementType(taken) == "vehicle" then
				local velX,velY,velZ = getElementAngularVelocity(taken)
				if isDir then
					if velZ<1 then setElementAngularVelocity(taken,velX,velY,velZ+0.02) end
				else
					if velZ>-1 then setElementAngularVelocity(taken,velX,velY,velZ-0.02) end
				end
			end
		end
	roll_timer[client] = tempTimer
	end
end
)	

-- Taken distance control
addEvent("GGbindMouseRollDist",true)
addEventHandler("GGbindMouseRollDist",resourceRoot,function(isDir)
	local tempTimer = getTickCount()
	if not roll_timer[client] then roll_timer[client] = tempTimer - 100 end
	if roll_timer[client] + 100 <= tempTimer then
		local taken = getElementData(client,"ggun_taken")
		if isElement(taken) then
			local distMul = getElementData(client,"ggun_dist")
			if not distMul then distMul = 1 end
			if isDir then
				distMul = distMul + 0.5
				if distMul > 5 then distMul = 5 end
			else
				distMul = distMul - 0.5
				if distMul < 0.5 then distMul = 0.5 end
			end
			setElementData(client,"ggun_dist", distMul)
		end
	roll_timer[client] = tempTimer
	end
end
)
