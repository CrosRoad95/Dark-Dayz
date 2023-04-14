local xml = xmlLoadFile('settings.xml')
local child = xmlFindChild(xml,'Komenda',0)
local att = xmlNodeGetAttribute(child,'Komenda')
addCommandHandler(tostring(att),function(s)
if not getPlayerAccount(s) then return end
local accName = getAccountName ( getPlayerAccount ( s ) )
if isObjectInACLGroup ("user."..accName, aclGetGroup ( "Admin" ) ) then
setElementData(s,'Admin:Dayz',not getElementData(s,'Admin:Dayz'))
end
end)


addEvent('Napraw_Auto',true)
addEventHandler('Napraw_Auto',resourceRoot,function(target)
fixVehicle(target)
fixVehicle(target)
setElementRotation(target,0,0,0)
end)
addEvent('Set_Blood',true)
addEventHandler('Set_Blood',resourceRoot,function(target)
				destroyElement(target)
				destroyElement(target)

end)

addEvent('Freeze_Element',true)
addEventHandler('Freeze_Element',resourceRoot,function(target)
setElementFrozen(target,not isElementFrozen(target))

end)

addEvent('Set_Max_Parts',true)
addEventHandler('Set_Max_Parts',resourceRoot,function(target)
local col = getElementData(target, "parent");
local maxfuel = tonumber(getElementData(target, "maxfuel")) or 0;
local fuel = tonumber(getElementData(col, "fuel")) or '0';
local needengine = tonumber(getElementData(target, "needengines")) or 0;
local needtires = tonumber(getElementData(target, "needtires")) or 0;
local needparts = tonumber(getElementData(target, "needparts")) or 0;
local engine = tonumber(getElementData(col, "Engine_inVehicle")) or 0;
local tires = tonumber(getElementData(col, "Tire_inVehicle")) or 0;
local parts = tonumber(getElementData(col, "Parts_inVehicle")) or 0;
setElementData(col,'fuel',maxfuel)
setElementData(col,'Engine_inVehicle',needengine)
setElementData(col,'Tire_inVehicle',needtires)
setElementData(col,'Parts_inVehicle',parts)
end)


addEvent('SetData',true)
addEventHandler('SetData',resourceRoot,function(target,key,value)
if tonumber(value) then
setElementData(target,key,tonumber(value))
else
setElementData(target,key,tostring(value))
end
end)

addCommandHandler('przenies',function(plr)
if not getPlayerAccount(plr) then return end
local accName = getAccountName ( getPlayerAccount ( plr ) )
if getElementData(plr,'Auto-Noszenie') and isObjectInACLGroup ("user."..accName, aclGetGroup ( "Admin" ) ) then
local auto = getElementData(plr,'Auto-Noszenie')
local pos = {getElementPosition(plr)}
setElementPosition(auto,pos[1],pos[2],pos[3]+0.3)
setElementPosition(plr,pos[1],pos[2],pos[3]+1)
setElementData(plr,'Auto-Noszenie',false)
setElementRotation(auto,0,0,0)
end
end)


addCommandHandler("moveTent",function(p)
	if not getElementData(p,'Admin:Dayz') then return end
	setElementData(p,'Auto-Noszenie',getElementData(getElementData(p,"currentCol"),"parent"))
	outputChatBox('Teraz wpisz /przenies aby przenieść',p)
end)




