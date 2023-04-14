local lezenie = false

addEvent('GetFuck',true)
addEventHandler('GetFuck',root,function()

lezenie = true

end)

--setPedAnimation(player, "WUZI", "CS_Dead_Guy", -1, true, false, false, true);



local timer
bindKey('W','both',function(key,state)

local Block, Anim = getPedAnimation(localPlayer)
if Block~='ped' then
lezenie = false
triggerServerEvent('TakoDziewczyneHaline',resourceRoot,localPlayer)
return
end
if not lezenie then
if isTimer(timer) then
killTimer(timer)
end
lezenie = false
return end
if state=='down' then
if isTimer(timer) then
killTimer(timer)
end
if isElementFrozen(localPlayer) then return end
local pos = {getElementPosition(localPlayer)}
local rz = 360 - getPedCameraRotation(localPlayer)
setElementRotation(localPlayer,0,0,rz)
local offsetRot = math.rad(rz+90);
local vx = pos[1]+0.05*math.cos(offsetRot);
local vy = pos[2]+0.05*math.sin(offsetRot);
proces = processLineOfSight(vx-0.5,vy-0.5,pos[3],vx+0.5,vy+0.5,pos[3])
if proces then return end
setElementPosition(localPlayer,vx,vy,pos[3],false)

timer = setTimer(function()
local Block, Anim = getPedAnimation(localPlayer)
if isPedInVehicle(localPlayer) then
setPedAnimation(localPlayer)
end
if Block~='ped' then
lezenie = false
triggerServerEvent('TakoDziewczyneHaline',resourceRoot,localPlayer)
if isTimer(timer) then
killTimer(timer)
end
return 
end
if not lezenie then
if isTimer(timer) then
killTimer(timer)
end
return end
local pos = {getElementPosition(localPlayer)}
local rz = 360 - getPedCameraRotation(localPlayer)
setElementRotation(localPlayer,0,0,rz)
local offsetRot = math.rad(rz+90);
local vx = pos[1]+0.05*math.cos(offsetRot);
local vy = pos[2]+0.05*math.sin(offsetRot);
proces = processLineOfSight(vx-0.5,vy-0.5,pos[3],vx+0.5,vy+0.5,pos[3])
if proces then return end
setElementPosition(localPlayer,vx,vy,pos[3],false)

end,50,0)
elseif state=='up' then
if isTimer(timer) then
killTimer(timer)
end
end
end)

setElementData(localPlayer,'Moze-Lezec',true)


function getElementSpeed(theElement, unit)
    -- Check arguments for errors
    assert(isElement(theElement), "Bad argument 1 @ getElementSpeed (element expected, got " .. type(theElement) .. ")")
    local elementType = getElementType(theElement)
    assert(elementType == "player" or elementType == "ped" or elementType == "object" or elementType == "vehicle" or elementType == "projectile", "Invalid element type @ getElementSpeed (player/ped/object/vehicle/projectile expected, got " .. elementType .. ")")
    assert((unit == nil or type(unit) == "string" or type(unit) == "number") and (unit == nil or (tonumber(unit) and (tonumber(unit) == 0 or tonumber(unit) == 1 or tonumber(unit) == 2)) or unit == "m/s" or unit == "km/h" or unit == "mph"), "Bad argument 2 @ getElementSpeed (invalid speed unit)")
    -- Default to m/s if no unit specified and 'ignore' argument type if the string contains a number
    unit = unit == nil and 0 or ((not tonumber(unit)) and unit or tonumber(unit))
    -- Setup our multiplier to convert the velocity to the specified unit
    local mult = (unit == 0 or unit == "m/s") and 50 or ((unit == 1 or unit == "km/h") and 180 or 111.84681456)
    -- Return the speed by calculating the length of the velocity vector, after converting the velocity to the specified unit
    return (Vector3(getElementVelocity(theElement)) * mult).length
end


addEventHandler('onClientPlayerDamage', root, function()
    if getElementData(source, 'Lezy') then
        setPedAnimation ( plr, "ped", "FLOOR_hit_f", -1, false, false )
    end
end);

addEventHandler('onClientVehicleStartExit',root,function(player)
if localPlayer~=player then return end
local kmh = getElementSpeed(source,1)
if kmh>=40 then
setElementData(player,"Moze-Lezec",false)
setTimer(function()
setElementData(player,"Moze-Lezec",true)
end,1500+((kmh*0.5)*10),1)
end
end)







