--
-- ggun_c.lua
--

-- Parts of ggun_c.lua belong to it's respective owner CrystalMV
-- Source can be found here https://community.multitheftauto.com/index.php?p=resources&s=details&id=2542
-- CrystalMV's homepage: http://crystalmv.net84.net/

-- settings
local ReplacedWeaponID = 27
local sparkCountMultiplier = 70
local maxEffectDistance = 60
local maxSyncDistance = 60

local toggleWheelModeKey = 'lshift'
local loadPowerKey = 'lalt'

-- don't touch those
local objectVelocity = 0
local buildupTimer = nil
local isLocalEquip = false
local isLocalAming = false

-- Gravity gun main
bindKey("fire","down",function()
	if not getPedControlState(localPlayer,"aim_weapon") or isElementInWater(localPlayer) then return end
	local ggun_obj = getElementData(localPlayer,"ggun_taken")
	if not ggun_obj then
		isLocalAming = false
		return
	end
	if isElement(ggun_obj) and isTimer(buildupTimer) then
		if not isElement(ggun_obj) then ggun_obj = getPedTarget(localPlayer) end
		if not ggun_obj then return end
		local x1,y1,z1 = getElementPosition(localPlayer)
		local x2,y2,z2 = getElementPosition(ggun_obj)
		x2,y2,z2 = x2-x1,y2-y1,z2-z1
		if objectVelocity then
			local spd = objectVelocity/math.sqrt(x2*x2+y2*y2+z2*z2)
			x2,y2,z2 = x2*spd,y2*spd,z2*spd
			if (math.sqrt(x2*x2+y2*y2+z2*z2) > 0.05) then
				triggerServerEvent("ggun_push",resourceRoot,ggun_obj,x2,y2,z2)
			else
				triggerServerEvent("ggun_drop",resourceRoot)
			end
			if isTimer(buildupTimer) then
				killTimer(buildupTimer)
			end
			isLocalAming = false
		end
	else
		if not isElement(ggun_obj) then
			local target = getPedTarget(localPlayer)
			if isElement(target) and not isElementFrozen(target) and (getElementType(target) ~= "object" or  getObjectMass(target) < 5000) then 
				if getElementType(target)=="vehicle" then
					local vehType = getVehicleType(target)
					if vehType=="Train" or vehType=="Boat" then
						ggPlaySound(localPlayer,"sounds/fail.ogg",0.5)
						return
					end
				end
				if getElementType(target) == "object" then
					triggerServerEvent("ggun_take",resourceRoot,target,isObjectBreakable(target))
				else
					if target == localPlayer then
						ggPlaySound(localPlayer,"sounds/fail.ogg",0.5)
						return
					end
					triggerServerEvent("ggun_take",resourceRoot,target,getKeyState(toggleWheelModeKey))
				end
				if isTimer(buildupTimer) then 
					killTimer(buildupTimer) 
				end
				isLocalAming = true
				if getKeyState(loadPowerKey) then 
					createBuildupTimer(1)
				else 
					createBuildupTimer(0)
				end
			else
				ggPlaySound(localPlayer,"sounds/fail.ogg",0.5)
			end
		else
			triggerServerEvent("ggun_drop",resourceRoot)
			if isTimer(buildupTimer) then
				killTimer(buildupTimer)
			end
			isLocalAming = false
		end
	end
end
)		

addEvent("onGGBreakObject",true)
addEventHandler("onGGBreakObject",resourceRoot,function(target)
	if not isElementStreamedIn(target) then return end
	local x0,y0,z0 = getElementPosition(target)
	local cx,cy,cz = getCameraMatrix()
	if getDistanceBetweenPoints3D (x0,y0,z0,cx,cy,cz)<maxSyncDistance then
		if getElementType(target)=="object" then
			if isObjectBreakable(target) then
				breakObject(target)
			end
		end
	end
end
)
				
addEventHandler("onClientGUIClick", getRootElement(), function()
	if isLocalAming then
		if isElement(getElementData(localPlayer,"ggun_taken")) then
			triggerServerEvent("ggun_drop",resourceRoot)
			isLocalAming = false
		end
	end
end
)
		
bindKey("aim_weapon","up",function()
	if isElement(getElementData(localPlayer,"ggun_taken")) then
		triggerServerEvent("ggun_drop",resourceRoot)
		isLocalAming = false
	end
end
)

-- Velocity timer		
function createBuildupTimer(inVel)
	objectVelocity = inVel or 0
	buildupTimer = setTimer ( function ()
		if  getKeyState(loadPowerKey) then 
			if objectVelocity >= 1  then objectVelocity = 1 return  end
			objectVelocity = objectVelocity+0.05
		else
			if objectVelocity <= 0  then objectVelocity = 0 return end
			objectVelocity = objectVelocity-0.05
		end
	end, 60 , 0 )
	return buildupTimer
end

-- Velocity bar
local scx, scy = guiGetScreenSize()
addEventHandler("onClientRender",root,function()
	if not isLocalEquip then return end
	local resMult = (scx/scy)*(6/8)
	dxDrawRectangle(scx*0.78,resMult*scy *0.14334,(scx*0.0666),resMult*(scy*0.02667),tocolor(5,5,5,255))
		dxDrawRectangle(scx*0.7825,resMult*scy*0.14667,(scx*0.0616),resMult*(scy*0.02),tocolor(55,20,20,255))
	if objectVelocity and isLocalAming then
		dxDrawRectangle(scx*0.7825,resMult*scy*0.14667,(scx*0.0616)*math.max(0,objectVelocity),resMult*(scy*0.02),tocolor(200*objectVelocity+55, 20 + 100 * objectVelocity,20,255))
	end
end
)

addEventHandler ("onClientResourceStart",resourceRoot,function()
	if getPedWeapon(getLocalPlayer(),currentWeaponID)==ReplacedWeaponID then
		isLocalEquip = true
	else
		isLocalEquip = false
	end
end
)

-- Drop element if fall down or in water
local lastTick = getTickCount()
addEventHandler("onClientRender",root,function()
	if getTickCount() - lastTick > 300 then
		if isPedDoingTask(localPlayer,"TASK_SIMPLE_FALL") or isElementInWater(localPlayer) then
			if isElement(getElementData(localPlayer,"ggun_taken")) and not isPedDead(localPlayer) then
				isLocalAming = false
				triggerServerEvent("ggun_drop",resourceRoot)
			end
		end
		lastTick = getTickCount()
	end
end
)

-- Set element velocity
addEventHandler("onClientRender",root,function()
	local all_players = getElementsByType("player")
	for plnum,player in ipairs(all_players) do
		local taken = getElementData(player,"ggun_taken")
		local cx,cy,cz = getCameraMatrix()
		if isElement(taken) then
			if isElementStreamedIn(taken) and isElementStreamedIn(player) then
				local x0,y0,z0 = getElementPosition(player)
				if getDistanceBetweenPoints3D (x0,y0,z0,cx,cy,cz)<maxSyncDistance then
					local distMul = getElementData(player,"ggun_dist")
					if not distMul then distMul = 1 end
					if distMul > 5 then distMul = 5 end
					local x1,y1,z1 = getPedTargetStart(player)
					local x2,y2,z2 = getPedTargetEnd(player)
					local x3,y3,z3 = getPedBonePosition (player,25)
					x2,y2,z2 = x2-x1,y2-y1,z2-z1	
					local dist = (distMul * 5)/math.sqrt(x2*x2+y2*y2+z2*z2)
					x2,y2,z2 = x2*dist,y2*dist,z2*dist
					local fx,fy,fz = x1+x2,y1+y2,z1+z2
					local cx,cy,cz = getElementPosition(taken)
					x2,y2,z2 = fx-cx,fy-cy,fz-cz
					local spd = math.min(0.05*math.sqrt(x2*x2+y2*y2+z2*z2),0.1 * (0.125 + (0.875 / distMul)))
					x2,y2,z2 = x2*spd,y2*spd,z2*spd
					setElementVelocity(taken,x2,y2,z2)
				end
			end
		end
	end
end
)

-- Draw bezier curve
addEventHandler("onClientHUDRender",root,function()
	local all_players = getElementsByType("player")
	for plnum,player in ipairs(all_players) do
		local taken = getElementData(player,"ggun_taken")
		local cx,cy,cz = getCameraMatrix()
		if isElement(taken) then
			if isElementStreamedIn(taken) and isElementStreamedIn(player) then		
				local x0,y0,z0 = getElementPosition(player)
				if getDistanceBetweenPoints3D (x0,y0,z0,cx,cy,cz)<maxSyncDistance then
					local distLen = math.min(10 / getElementData(player,"ggun_dist"), 5)			
					local x1,y1,z1 = getPedWeaponMuzzlePosition(player)
					local x2,y2,z2 = getPedBonePosition(player,25)
					local vx,vy,vz = x1-x2,y1-y2,z1-z2
					local leng = math.sqrt(vx*vx+vy*vy+vz*vz)
					vx,vy,vz = vx/leng, vy/leng, vz/leng
					x1,y1,z1 = x1-0.15*vx,y1-0.15*vy,z1-0.15*vz
					x2,y2,z2 = x2+distLen*vx,y2+distLen*vy,z2+distLen*vz
					local x4,y4,z4 = getElementPosition(taken)
					local xt,yt,zt = getPedTargetStart(player)
					local lx, ly, lz = x4-xt,y4-yt,z4-zt
					local lenPO = math.sqrt(lx*lx+ly*ly+lz*lz) / 10
					local x12, y12, z12 = x2 - xt, y2 - yt, z2 - zt
					local len12 = math.sqrt(x12*x12+y12*y12+z12*z12)
					x12, y12, z12 = x12/len12, y12/len12, z12/len12
					x3, y3, z3 = xt - x12 * lenPO, yt - y12 * lenPO, zt - z12 * lenPO
					drawBezier(x1,y1,z1,x2,y2,z2,x3,y3,z3,x4,y4,z4)
				end
			end
		end
	end
end
,true,"high+10")

-- Turn velocity and distance control
addEventHandler("onClientResourceStart",resourceRoot, function()
	local getLastTick = getTickCount()
	function setMouseRollSv(isRight)
		local currentTick = getTickCount()
		if getLastTick + 200 < currentTick then 
			if not getKeyState(toggleWheelModeKey) then
				triggerServerEvent("GGbindMouseRollTurn",resourceRoot,isRight)
				getLastTick = currentTick
			else
				triggerServerEvent("GGbindMouseRollDist",resourceRoot,isRight)
			end
		end 
	end
	bindKey("mouse_wheel_up","down", function() setMouseRollSv(true) end)
	bindKey("mouse_wheel_down","down", function() setMouseRollSv(false) end)
end
)

-- Weapon sounds
addEventHandler ("onClientPlayerWeaponSwitch",root,function(previousWeaponID,currentWeaponID)
	if getPedWeapon(getLocalPlayer(),currentWeaponID)==ReplacedWeaponID then
		isLocalEquip = true
		ggPlaySound(localPlayer,"sounds/equip.ogg",0.5)
	else
		isLocalEquip = false
	end
		toggleControl("fire",not isLocalEquip)
		toggleControl("action",not isLocalEquip)
end
)

function ggPlaySound(player,soundPath,volume)
	local x,y,z = getElementPosition(player)
	local cx,cy,cz = getCameraMatrix()
	if getDistanceBetweenPoints3D (x,y,z,cx,cy,cz)>maxEffectDistance then return end
	local ggSound = playSound3D(soundPath, x, y, z, false)
	setSoundMaxDistance(ggSound,60)
	setSoundMinDistance(ggSound,5)
	setSoundVolume(ggSound,volume)
end

addEvent("onGGPlaySound",true)
addEventHandler("onGGPlaySound",resourceRoot,ggPlaySound)

-- Spark effects
function ggCreateSparkFx(player,force)
	local x1,y1,z1 = getPedBonePosition(player,24)
	local cx,cy,cz = getCameraMatrix()
	if getDistanceBetweenPoints3D(x1,y1,z1,cx,cy,cz)>maxEffectDistance then return end
	local x2,y2,z2 = getPedBonePosition(player,25)
	local vx,vy,vz = x2-x1,y2-y1,z2-z1
	local leng = math.sqrt(vx*vx+vy*vy+vz*vz)
	vx,vy,vz = vx/leng, vy/leng, vz/leng
	local px,py,pz = x1+(vx/2),y1+(vy/2),z1+0.15+(vz/2)
	fxAddSparks( px,py,pz,vx,vy,vz,force, math.ceil(sparkCountMultiplier*force),-vx/3,-vy/3,-vz/3,false,3,1)
end

addEvent("onGGCreateSparkEffect",true)
addEventHandler("onGGCreateSparkEffect",resourceRoot,ggCreateSparkFx)
