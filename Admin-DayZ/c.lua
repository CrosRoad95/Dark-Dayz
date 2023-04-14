


local screenW, screenH = guiGetScreenSize()


GUIEditor = {
    button = {},
    label = {},
    edit = {}
}

        GUIEditor.button[1] = guiCreateButton(0.53, 0.43, 0.06, 0.02, "Set", true)
        guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FFAAAAAA")


        GUIEditor.label[1] = guiCreateLabel(0.52, 0.37, 0.03, 0.03, "Value", true)
        guiLabelSetHorizontalAlign(GUIEditor.label[1], "center", false)
        guiLabelSetVerticalAlign(GUIEditor.label[1], "center")


        GUIEditor.label[2] = guiCreateLabel(0.40, 0.397, 0.14, 0.03, "Key", true)
        guiLabelSetHorizontalAlign(GUIEditor.label[2], "center", false)
        guiLabelSetVerticalAlign(GUIEditor.label[2], "center")


        GUIEditor.label[3] = guiCreateLabel(0.50, 0.45, 0.15, 0.15, "Example: \n Value = 1 Key = Water Bottle \n return 1 Water Bottle", true)


        GUIEditor.edit[1] = guiCreateEdit(0.49, 0.40, 0.14, 0.03, "", true)


        GUIEditor.edit[2] = guiCreateEdit(0.55, 0.37, 0.03, 0.03, "", true)    
		guiSetVisible(GUIEditor.edit[1],false)
		guiSetVisible(GUIEditor.edit[2],false)
		guiSetVisible(GUIEditor.label[1],false)
		guiSetVisible(GUIEditor.label[2],false)
		guiSetVisible(GUIEditor.label[3],false)
		guiSetVisible(GUIEditor.button[1],false)



local target
local teksty = {
[0] = 'USUWA ALL CO ZAZNACZYSZ UWAZAJ!',
[1] ='Freeze Element',
[2] = 'Repair Car',
[3] = 'Set Data', 
[4] = 'Set Pos', 
[5] = 'Set Max Parts',
[6] = '---------',
[7] = '---------',
}

local weapon_enabled = false

addEventHandler('onClientPlayerTarget',root,function(targ)
if not getElementData(localPlayer,'Admin:Dayz') then return end
if not targ then target = false return end
local weapon = getPedWeapon(localPlayer)
if weapon==24 then
target = targ
toggleControl('fire',false)
weapon_enabled = true
else
toggleControl('fire',true)
weapon_enabled = false
end
end)



local target_name
local target_health
local target_gang
local target_frozen
local obroty = 0
local data = 12000
addEventHandler("onClientRender", root,
    function()
	if not getElementData(localPlayer,'Admin:Dayz') then return end
        dxDrawRectangle(screenW * 0.6279, screenH * 0.4010, screenW * 0.3623, screenH * 0.1979, tocolor(1, 0, 0, 165), false)
		
		if not target then toggleControl('fire',true) return end
		toggleControl('fire',false)
		if getElementType(target)=='player' or target then
		target_health = getElementData(target,'blood') or 'None'
		target_name = getPlayerName(localPlayer)
		target_gang = getElementData(target,'gang') or 'None'
		elseif getElementType(target)=='vehicle' then
		target_health = getElementHealth(target)
		target_name = getVehicleName(target)
		target_gang = getElementData(target,'gang') or 'None'
		end
		if isElementFrozen(target) then
		target_frozen = 'Yes'
		else
		target_frozen = 'No'
		end
		

		if getElementType(target)=='player' then
		dxDrawText("Nick: "..target_name, screenW * 0.6377, screenH * 0.4141, screenW * 0.7783, screenH * 0.4375, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, true, false, false)
		dxDrawText("Blood: "..target_health, screenW * 0.6377, screenH * 0.4505, screenW * 0.7217, screenH * 0.4714, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, true, false, false)
		dxDrawText("Gang: "..target_gang, screenW * 0.6377, screenH * 0.4844, screenW * 0.7217, screenH * 0.5052, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, true, false, false)
		dxDrawText("Freeze: "..target_frozen, screenW * 0.6377, screenH * 0.5144, screenW * 0.7217, screenH * 0.5052, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, true, false, false)
		elseif getElementType(target)=='vehicle' then
		local col = getElementData(target, "parent");
			local maxfuel = tostring(getElementData(target, "maxfuel")) or 0;
			local fuel = tostring(getElementData(col, "fuel")) or '0';
			local needengine = tostring(getElementData(target, "needengines")) or 0;
			local needtires = tostring(getElementData(target, "needtires")) or 0;
			local needparts = tostring(getElementData(target, "needparts")) or 0;
			local engine = tostring(getElementData(col, "Engine_inVehicle")) or 0;
			local tires = tostring(getElementData(col, "Tire_inVehicle")) or 0;
			local parts = tostring(getElementData(col, "Parts_inVehicle")) or 0;
		dxDrawText("Health: "..target_health, screenW * 0.6377, screenH * 0.4505, screenW * 0.7217, screenH * 0.4714, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, true, false, false)
		dxDrawText("Veh Name: "..target_name, screenW * 0.6377, screenH * 0.4141, screenW * 0.7783, screenH * 0.4375, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, true, false, false)
		dxDrawText("Freeze: "..target_frozen, screenW * 0.6377, screenH * 0.4844, screenW * 0.7217, screenH * 0.5052, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, true, false, false)
		dxDrawText("Engine: "..engine..'/'..(needengine or 0), screenW * 0.6377, screenH * 0.5200, screenW * 0.7217, screenH * 0.5052, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, true, false, false)
		dxDrawText("Tank Parts: "..(parts or '0')..'/'..(needparts or 0), screenW * 0.6377, screenH * 0.5550, screenW * 0.7217, screenH * 0.5052, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, true, false, false)
		dxDrawRectangle(screenW * 0.6279, screenH * 0.3010, screenW * 0.15, screenH * 0.0979, tocolor(1, 0, 0, 165), false)
		dxDrawText("Fuel: "..(fuel or '0').."/"..(maxfuel or '0'), screenW * 0.6357, screenH * 0.3620, screenW * 0.7002, screenH * 0.3854, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, true, false, false)
        dxDrawText("Tires: "..(tires or '0').."/"..(needtires or '0'), screenW * 0.6357, screenH * 0.3255, screenW * 0.7002, screenH * 0.3490, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, true, false, false)
		end
	--	dxDrawText("Freeze: "..target_frozen, screenW * 0.6377, screenH * 0.5144, screenW * 0.7217, screenH * 0.5052, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, true, false, false)
		dxDrawLine(screenW * 0.7783, screenH * 0.4010, screenW * 0.7783, screenH * 0.5977, tocolor(255, 255, 255, 255), 2, true)
        dxDrawText(""..teksty[obroty], screenW * 0.9033, screenH * 0.4818, screenW * 0.9658, screenH * 0.5013, tocolor(201, 0, 0, 254), 1.00, "default", "left", "top", false, false, true, false, false)
        if teksty[obroty-1] then
		dxDrawText(""..teksty[obroty-1], screenW * 0.9033, screenH * 0.4570, screenW * 0.9658, screenH * 0.4766, tocolor(201, 0, 0, 175), 1.00, "default", "left", "top", false, false, true, false, false)
        end
		if teksty[obroty+1] then
		dxDrawText(teksty[obroty+1], screenW * 0.9033, screenH * 0.5065, screenW * 0.9658, screenH * 0.5260, tocolor(201, 0, 0, 175), 1.00, "default", "left", "top", false, false, true, false, false)
        end
		if obroty==0 then
		dxDrawText(tostring(data), screenW * 0.7881, screenH * 0.4375, screenW * 0.8506, screenH * 0.4570, tocolor(201, 0, 0, 175), 1.00, "default", "left", "top", false, false, true, false, false)
		end
	end
)

bindKey('mouse_wheel_up','down',function()
if not getElementData(localPlayer,'Admin:Dayz') then return end
if not target then  return end
if teksty[obroty-1] then
obroty = obroty - 1
end
end)


local cel = 0

bindKey('mouse_wheel_down','down',function()
if not getElementData(localPlayer,'Admin:Dayz') then return end
if not target then return end
if teksty[obroty+1] then
obroty = obroty + 1
end
end)
local target_Data
local wykonywanie = {
[0] = function()
if getElementType(target)=='player' then
	triggerServerEvent('Set_Blood',resourceRoot,target,data)
end
end,

[1] = function()
	triggerServerEvent('Freeze_Element',resourceRoot,target)
end,


[2] = function()
if getElementType(target)=='vehicle' then
	triggerServerEvent('Napraw_Auto',resourceRoot,target)
end
end,

[3] = function()
target_Data = target
if guiGetVisible(GUIEditor.edit[1]) then return end
guiSetVisible(GUIEditor.edit[1],not guiGetVisible(GUIEditor.edit[1]))
guiSetVisible(GUIEditor.edit[2],not guiGetVisible(GUIEditor.edit[2]))
guiSetVisible(GUIEditor.label[1],not guiGetVisible(GUIEditor.label[1]))
guiSetVisible(GUIEditor.label[2],not guiGetVisible(GUIEditor.label[2]))
guiSetVisible(GUIEditor.label[3],not guiGetVisible(GUIEditor.label[3]))
guiSetVisible(GUIEditor.button[1],not guiGetVisible(GUIEditor.button[1]))
showCursor(true)
end,

[4] = function()
setElementData(localPlayer,'Auto-Noszenie',target)
outputChatBox('Teraz wpisz /przenies aby przenieść')
end,
[5] = function()
triggerServerEvent('Set_Max_Parts',resourceRoot,target)
end,
}






addEventHandler('onClientGUIClick',GUIEditor.button[1],function()
local text = guiGetText(GUIEditor.edit[1])
local text_2 = guiGetText(GUIEditor.edit[2])
if text=='' or text_2=='' then
guiSetVisible(GUIEditor.edit[1],false)
guiSetVisible(GUIEditor.edit[2],false)
guiSetVisible(GUIEditor.label[1],false)
guiSetVisible(GUIEditor.label[2],false)
guiSetVisible(GUIEditor.button[1],false)
guiSetVisible(GUIEditor.label[3],false)
showCursor(false)
else
guiSetVisible(GUIEditor.edit[1],false)
guiSetVisible(GUIEditor.edit[2],false)
guiSetVisible(GUIEditor.label[1],false)
guiSetVisible(GUIEditor.label[2],false)
guiSetVisible(GUIEditor.button[1],false)
guiSetVisible(GUIEditor.label[3],false)
triggerServerEvent('SetData',resourceRoot,target_Data,text,text_2)
target_Data = nil
showCursor(false)
end
end,false)

bindKey('mouse1','down',function()
if not getElementData(localPlayer,'Admin:Dayz') then return end
if not target then return end
if  wykonywanie[obroty] then 
	wykonywanie[obroty]()
end
	
end)

local timer
bindKey('arrow_d','down',function()
if not getElementData(localPlayer,'Admin:Dayz') then return end
if not target then return end
if not obroty==0 then return end
setElementFrozen(localPlayer,true)
if isTimer(timer) then
	killTimer(timer)
end
data = data - 50
timer = setTimer(function()
if getKeyState('arrow_d')==true then
data = data - 50
if data<=0 then
data = 0
return end
else
if isTimer(timer) then
	killTimer(timer)
end
setElementFrozen(localPlayer,false)
end
end,50,0)
end)

bindKey('arrow_u','down',function()
if not getElementData(localPlayer,'Admin:Dayz') then return end
if not target then return end
if not obroty==0 then return end
setElementFrozen(localPlayer,true)
if isTimer(timer) then
	killTimer(timer)
end
data = data + 50
timer = setTimer(function()
if getKeyState('arrow_u')==true then
data = data + 50
if data>=12000 then
data = 12000
return end
else
if isTimer(timer) then
	killTimer(timer)
end
setElementFrozen(localPlayer,false)
end
end,50,0)
end)




