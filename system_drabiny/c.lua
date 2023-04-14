local tick = getTickCount()
local rotacja = nil

function adding()
	local _,_,s123123 = getElementRotation(localPlayer)
	if getTickCount()<tick then return end
	toggleAllControls(false)
	local offsetRot = math.rad(rotacja+90);
	local x,y,z = getElementPosition(localPlayer)
	setElementRotation(localPlayer,0,0,rotacja,"default",true)
	if getKeyState("w") then
		local vx = x+0.2*math.cos(offsetRot);
		local vy = y+0.2*math.sin(offsetRot);
		local _,_,_,_,hitElement = processLineOfSight(x,y,z,vx,vy,z)
		if not hitElement then
			vx = x+0.5*math.cos(offsetRot);
			vy = y+0.5*math.sin(offsetRot);
			setElementPosition(localPlayer,vx,vy,z+1)
			setElementFrozen(localPlayer,false)
			toggleAllControls(true)
			setTimer(function()
				setElementData(localPlayer,'Wspina_sie',false)
			end,1000,1)
			removeEventHandler('onClientRender',root,adding)
			return
		end
		setElementPosition(localPlayer,x,y,z+0.05)
	elseif getKeyState("s") then
		local offsetRot = math.rad(rotacja+90);
		local vx = x-0.2*math.cos(offsetRot);
		local vy = y-0.2*math.sin(offsetRot);
		local _,_,_,_,hitElement,_,_,_,material = processLineOfSight(x,y,z,x,y,z-1,true,true,false)
		if material and material~=174 then
			vx = x-0.5*math.cos(offsetRot);
			vy = y-0.5*math.sin(offsetRot);
			setElementPosition(localPlayer,vx,vy,z+1)
			setElementFrozen(localPlayer,false)
			toggleAllControls(true)
			setTimer(function()
				setElementData(localPlayer,'Wspina_sie',false)
			end,1000,1)
			removeEventHandler('onClientRender',root,adding)
			return
		end
		setElementPosition(localPlayer,x,y,z-0.05)
	end
end

addEvent('Wspina_Sie',true)
addEventHandler('Wspina_Sie',resourceRoot,function(zr)
	setElementFrozen(localPlayer,true)
	rotacja = zr
	rotacja_2 = plr
	tick = getTickCount() + 100
	addEventHandler('onClientRender',root,adding)
end)

addEvent("setObjectBreakable",true)
addEventHandler('setObjectBreakable',resourceRoot,function(obj)
	setObjectBreakable(obj,false)
end)

for k, obj in pairs(getElementsByType("object", resourceRoot)) do
	setObjectBreakable(obj,false)
end
