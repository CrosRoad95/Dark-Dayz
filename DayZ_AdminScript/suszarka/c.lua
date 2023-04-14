
local sx, sy = guiGetScreenSize()

local target_select = nil

local menu_setting = false

local tent_to_move = nil

local uzycia = {
	{"Fix","suszarka/images/fix.png", dane = Vector2(225, 225),
	funkcja = function()
		if getElementType(target_select) == "vehicle" then
			triggerServerEvent("fix",resourceRoot,target_select)
		end
	end,
	},
	{"Flip","suszarka/images/flip.png", dane = Vector2(512, 512),
	funkcja = function()
		if getElementType(target_select) == "vehicle" then
			triggerServerEvent("flip",resourceRoot,target_select)
		end
	end,
	},
	{"Montaz","suszarka/images/montaz.png", dane = Vector2(512, 512),
	funkcja = function()
		local col = getElementData(target_select,"parent")
		if getElementType(target_select) == "vehicle" and col then
			triggerServerEvent("zamontujCzesci", resourceRoot, target_select, col)
			target_select = nil
		end
	end,
	},
	{"Delete","suszarka/images/delete.png", dane = Vector2(225, 225), 
	funkcja = function()
		local col = getElementData(target_select,"parent")
		if col and getElementType(target_select) ~= "player" then
			triggerServerEvent("deleteObj", resourceRoot, target_select, col)
			target_select = nil
		end
	end,
	},
	{"Warp","suszarka/images/warp.png", dane = Vector2(512, 512),
	funkcja = function()
		if getElementType(target_select) == "vehicle" then
			triggerServerEvent("moveTo", resourceRoot, target_select)
			target_select = nil
		end
	end,
	},
	{"Tent move","suszarka/images/move.png", dane = Vector2(225, 225),
	funkcja = function() 
		local col = getElementData(target_select,"parent")
		if not col then return end
		tent_to_move = target_select
                outputChatBox("#d63838[#6b6b6b!#d63838] #8A8A8AWpisz komendę #d63838/obj.przenies#8A8A8A aby przenieść obiekt. ", 255, 255, 255, true)
	end,
	},
}




local selected = 0
local last_selected = 0
local selected_tick = getTickCount()

addEventHandler("onClientRender",root,function()
	if not menu_setting then return end
	if getPedWeapon(localPlayer) == 24 then
		toggleControl("fire" , false)
	else
		toggleControl("fire" , true)
	end
	for i,v in pairs(uzycia) do
		local y = sy * 0.95
		if selected == i and selected ~= last_selected then
			y = interpolateBetween(sy * 0.95,0,0,sy * 0.93,0,0,(getTickCount()-selected_tick)/200,"Linear")
			dxDrawText(v[1],sx * 0.29 + (sx * 0.07) * (i - 1),y - sy * 0.02, sx * 0.29 + (sx * 0.07) * (i - 1) + sx * 0.05, _, _, 1, "default-bold", "center")
		elseif last_selected == i then
			y = interpolateBetween(sy * 0.93,0,0,sy * 0.95,0,0,(getTickCount()-selected_tick)/200,"Linear")
		end
		dxDrawRectangle(sx * 0.29 + (sx * 0.07) * (i - 1), y, sx * 0.05, sy * 0.08, tocolor(0,0,0, 150))
		dxDrawImageSection(sx * 0.29 + (sx * 0.07) * (i - 1), y, sx * 0.05, sy * 0.05, 0, 0, v.dane.x, v.dane.y, v[2], 0, 0, 0, tocolor(255, 255, 255, 255))
	end
end)

bindKey("arrow_r", "down", function()
	if not menu_setting then return end
	selected_tick = getTickCount()
	if selected == #uzycia then 
		last_selected = #uzycia
		selected = 1
		return 
	end
	last_selected = selected
	selected = selected + 1
end)

bindKey("arrow_l", "down", function()
	if not menu_setting then return end
	selected_tick = getTickCount()
	if selected == 1 then 
		selected = #uzycia
		last_selected = 1
		return 
	elseif selected == 0 then
		selected = #uzycia
		return
	end
	last_selected = selected
	selected = selected - 1
end)



bindKey("enter", "down", function()
	if not menu_setting then return end
	if not target_select then return end
	for i,v in pairs(uzycia) do
		if selected == i then
			v.funkcja()
			break
		end
	end
end)

bindKey("mouse1", "down", function()
	if not menu_setting then return end
	local target = getPedTarget(localPlayer)
	if not target then return end
	target_select = nil
	if getPedWeapon(localPlayer) ~= 24 then return end
	if getElementType(target) == "vehicle" or getElementType(target) == "player" then
		target_select = target
	elseif getElementType(target) == "player" then
		target_select = target
	elseif getElementType(target) == "object" and getElementData(target,"parent") then
		target_select = target
	end
	if target_select then
		outputChatBox("#d63838[#6b6b6b!#d63838] #8A8A8AZapisano target. ", 255, 255, 255, true)

	end
end)

bindKey("n", "down", function()
	if getElementData(localPlayer,"gokupomocnik") == true or getElementData(localPlayer,"Administrator-Open") == true then 
	menu_setting = not menu_setting
	toggleControl("fire", not menu_setting)
	end
end)

addCommandHandler("obj.przenies",function()
	if not menu_setting then return end
	if not tent_to_move then return end
	target_select = nil
	triggerServerEvent("moveObject", resourceRoot, tent_to_move)
	tent_to_move = nil
end)

txd = engineLoadTXD ( "suszarka/suszarka.txd" )
engineImportTXD ( txd, 348)
dff = engineLoadDFF ( "suszarka/suszarka.dff", 348)
engineReplaceModel ( dff, 348)
