local drabiny = {}

function createLadder(x,y,z,rotx,roty,rotz,resourceName,to_height,maker_z)
	if not drabiny[resourceName] then
		drabiny[resourceName] = {}
	end
	maker_z = maker_z or z
	drabiny[#drabiny[resourceName]+1] = createObject(1428,x,y,z,rotx,roty,rotz)
	local nx,ny,nz = getElementPosition(drabiny[#drabiny[resourceName]+1])
	local xr,yr,zr = getElementRotation(drabiny[#drabiny[resourceName]+1]);
	local offsetRot = math.rad(zr+90);
	local vx = nx-0.2*math.cos(offsetRot);
	local vy = ny-0.2*math.sin(offsetRot);
	local pickup = createPickup(vx,vy,maker_z,3,1318,0)
	setElementData(pickup,'rotacja',rotz)
	setElementParent(pickup,drabiny[#drabiny[resourceName]+1])
	 vx = nx-0.2*math.cos(offsetRot);
	 vy = ny-0.2*math.sin(offsetRot);
	 pickup = createPickup(vx,vy,to_height,3,1318,0)
	setElementParent(pickup,drabiny[#drabiny[resourceName]+1])
	setElementData(pickup,'rotacja',rotz)
	for i,v in pairs(getElementsByType('player')) do
		triggerClientEvent(v,'setObjectBreakable',resourceRoot,drabiny[#drabiny[resourceName]+1])
	end
end
--createLadder(-145,-1471,12,"TEST")
setElementFrozen(getRandomPlayer(),false)
setElementData(getRandomPlayer(),'Wspina_sie',false)
setTimer(function()
createLadder(1733.5,-1348.9814453125,16.2,0,0,90,"system_drabiny",19,15.5)	
end,50,1)

function destroyLadder(resource)
	if not drabiny[resource] then return end
	for i,v in pairs(drabiny[resource]) do
		destroyElement(v)
	end
end

addEventHandler('onPickupHit',resourceRoot,function(hit)
	local x,y,z = getElementPosition(source)
	local rotz = getElementData(source,'rotacja')
	if hit and getElementType(hit)~='player' then return end
	if getElementData(hit,'Wspina_sie') then return end
	local x1,y1,z1 = getElementPosition(hit)
	setElementData(hit,'Wspina_sie',true)
	setElementPosition(hit,x,y,z)
	triggerClientEvent(hit,'Wspina_Sie',resourceRoot,rotz)
end)