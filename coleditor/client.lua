-- -- -- -- -- -- -- -- -- -- ---
-- Collision Editor by MuLTi. --
-- -- -- -- -- -- -- -- -- -- ---

local Guivar = 0
local gMe = getLocalPlayer()
local gCol
local gColx, gColy, gColz, gColw, gColh, gCold, rot

--[[
function move_o_rotate_2()
	if(isInColEdit() == false) then return end
		local x, y, z = getElementPosition(gCol)
		gColx, gColy, gColz, gColw, gColh, gCold, rot = x, y, z, gColw, gColh, gCold, rot-0.25
		setCameraMatrix(x+2+gColw, y+7+gColw, z+2+(gColh/2), x+(gColw/2), y+(gColw/2), z)
		destroyElement(gCol)
		gCol = createColCuboid(gColx, gColy, gColz, gColw, gColh, gCold)
		setElementRotation(gCol, rot, rot, rot)
end

function move_o_rotate_1()
	if(isInColEdit() == false) then return end
		local x, y, z = getElementPosition(gCol)
		gColx, gColy, gColz, gColw, gColh, gCold, rot = x, y, z, gColw, gColh, gCold, rot+0.25
		setCameraMatrix(x+2+gColw, y+7+gColw, z+2+(gColh/2), x+(gColw/2), y+(gColw/2), z)
		destroyElement(gCol)
		gCol = createColCuboid(gColx, gColy, gColz, gColw, gColh, gCold)
		setElementRotation(gCol, rot, rot, rot)
end
--]]

function move_o_depth_raus()
	if(isInColEdit() == false) then return end
		local x, y, z = getElementPosition(gCol)
		if(gColh < 0.1) then return end
		gColx, gColy, gColz, gColw, gColh, gCold = x, y, z, gColw, gColh-0.25, gCold
		setCameraMatrix(x+2+gColw, y+7+gColw, z+2+(gColh/2), x+(gColw/2), y+(gColw/2), z)
		destroyElement(gCol)
		gCol = createColCuboid(gColx, gColy, gColz, gColw, gColh, gCold)
end

function move_o_depth_rein()
	if(isInColEdit() == false) then return end
		local x, y, z = getElementPosition(gCol)
		
		gColx, gColy, gColz, gColw, gColh, gCold = x, y, z, gColw, gColh+0.25, gCold
		setCameraMatrix(x+2+gColw, y+7+gColw, z+2+(gColh/2), x+(gColw/2), y+(gColw/2), z)
		destroyElement(gCol)
		gCol = createColCuboid(gColx, gColy, gColz, gColw, gColh, gCold)
end
function move_o_tiefe()
	if(isInColEdit() == false) then return end
		local x, y, z = getElementPosition(gCol)
		gColx, gColy, gColz, gColw, gColh, gCold = x, y, z, gColw, gColh, gCold-0.25
		setCameraMatrix(x+2+gColw, y+7+gColw, z+2+(gColh/2), x+(gColw/2), y+(gColw/2), z)
		destroyElement(gCol)
		gCol = createColCuboid(gColx, gColy, gColz, gColw, gColh, gCold)
end

function move_o_hohe()
	if(isInColEdit() == false) then return end
		local x, y, z = getElementPosition(gCol)
		gColx, gColy, gColz, gColw, gColh, gCold = x, y, z, gColw, gColh, gCold+0.25
		setCameraMatrix(x+2+gColw, y+7+gColw, z+2+(gColh/2), x+(gColw/2), y+(gColw/2), z)
		destroyElement(gCol)
		gCol = createColCuboid(gColx, gColy, gColz, gColw, gColh, gCold)
end

function move_o_zup()
	if(isInColEdit() == false) then return end
		local x, y, z = getElementPosition(gCol)
		gColx, gColy, gColz, gColw, gColh, gCold = x, y, z+0.25, gColw, gColh, gCold
		setCameraMatrix(x+2+gColw, y+7+gColw, z+2+(gColh/2), x+(gColw/2), y+(gColw/2), z)
		destroyElement(gCol)
		gCol = createColCuboid(gColx, gColy, gColz, gColw, gColh, gCold)
end

function move_o_zero()
	if(isInColEdit() == false) then return end
		local x, y, z = getElementPosition(gCol)
		gColx, gColy, gColz, gColw, gColh, gCold = x, y, z-0.25, gColw, gColh, gCold
		setCameraMatrix(x+2+gColw, y+7+gColw, z+2+(gColh/2), x+(gColw/2), y+(gColw/2), z)
		destroyElement(gCol)
		gCol = createColCuboid(gColx, gColy, gColz, gColw, gColh, gCold)
end

function move_o_right()
	if(isInColEdit() == false) then return end
		local x, y, z = getElementPosition(gCol)
		if(gColw < 0.1) then return end
		gColx, gColy, gColz, gColw, gColh, gCold = x, y, z, gColw-0.25, gColh, gCold
		setCameraMatrix(x+2+gColw, y+7+gColw, z+2+(gColh/2), x+(gColw/2), y+(gColw/2), z)
		destroyElement(gCol)
		gCol = createColCuboid(gColx, gColy, gColz, gColw, gColh, gCold)
end
function move_o_front()
	if(isInColEdit() == false) then return end
		local x, y, z = getElementPosition(gCol)
		gColx, gColy, gColz, gColw, gColh, gCold = x-0.25, y-0.5, z, gColw, gColh, gCold
		setCameraMatrix(x+2+gColw, y+7+gColw, z+2+(gColh/2), x+(gColw/2), y+(gColw/2), z)
		destroyElement(gCol)
		gCol = createColCuboid(gColx, gColy, gColz, gColw, gColh, gCold)
end

function move_o_back()
	if(isInColEdit() == false) then return end
		local x, y, z = getElementPosition(gCol)
		gColx, gColy, gColz, gColw, gColh, gCold = x+0.25, y+0.5, z, gColw, gColh, gCold
		setCameraMatrix(x+2+gColw, y+7+gColw, z+2+(gColh/2), x+(gColw/2), y+(gColw/2), z)
		destroyElement(gCol)
		gCol = createColCuboid(gColx, gColy, gColz, gColw, gColh, gCold)
end

function move_o_xright()
	if(isInColEdit() == false) then return end
		local x, y, z = getElementPosition(gCol)
		gColx, gColy, gColz, gColw, gColh, gCold = x+0.25, y-0.25, z, gColw, gColh, gCold
		setCameraMatrix(x+2+gColw, y+7+gColw, z+2+(gColh/2), x+(gColw/2), y+(gColw/2), z)
		destroyElement(gCol)
		gCol = createColCuboid(gColx, gColy, gColz, gColw, gColh, gCold)
end

function move_o_xleft()
	if(isInColEdit() == false) then return end
		local x, y, z = getElementPosition(gCol)
		gColx, gColy, gColz, gColw, gColh, gCold = x-0.25, y+0.25, z, gColw, gColh, gCold
		setCameraMatrix(x+2+gColw, y+7+gColw, z+2+(gColh/2), x+(gColw/2), y+(gColw/2), z)
		destroyElement(gCol)
		gCol = createColCuboid(gColx, gColy, gColz, gColw, gColh, gCold)
end

function move_o_left()
	if(isInColEdit() == false) then return end
		local x, y, z = getElementPosition(gCol)
		gColx, gColy, gColz, gColw, gColh, gCold = x, y, z, gColw+0.25, gColh, gCold
		setCameraMatrix(x+2+gColw, y+7+gColw, z+2+(gColh/2), x+(gColw/2), y+(gColw/2), z)
		destroyElement(gCol)
		gCol = createColCuboid(gColx, gColy, gColz, gColw, gColh, gCold)
end

function o_fertig_func()
	if(isInColEdit() == false) then return end
	setElementAlpha(gMe, 255)
	setCameraTarget(gMe)
	unbindBinds()
	destroyElement(gCol)
	gCol = nil
	setElementData(gMe, "coledit", false)
	outputChatBox("Informations: ", 200, 200, 200, false)
	outputChatBox("coordinates: "..gColx..", "..gColy..", "..gColz, 255, 255, 255)
	outputChatBox("Lenght: "..gColw..", depth: "..gColh..", height: "..gCold, 255, 255, 255)
	triggerServerEvent("onCollisionSpeichere", gMe, gColx, gColy, gColz, gColw, gColh, gCold)
	outputChatBox("Collision has been saved into collisions.txt!", 255, 255, 255)
	setElementFrozen(gMe, false)
	gColx, gColy, gColz, gColw, gColh, gCold, rot = nil, nil, nil, nil, nil, nil, nil
end

function o_abbrechen_func()
	if(isInColEdit() == false) then return end
	gColx, gColy, gColz, gColw, gColh, gCold = nil, nil, nil, nil, nil, nil
	setElementAlpha(gMe, 255)
	setCameraTarget(gMe)
	unbindBinds()
	destroyElement(gCol)
	gCol = nil
	setElementData(gMe, "coledit", false)
	outputChatBox("You canceled the operation.", 0, 200, 0, false)
	setElementFrozen(gMe, false)
end
function unbindBinds(id2)

		unbindKey("arrow_l", "down", move_o_left)
		unbindKey("arrow_r", "down", move_o_right)
		unbindKey("arrow_u", "down", move_o_depth_raus)
	    unbindKey("arrow_d", "down", move_o_depth_rein)
		unbindKey("pgup", "down", move_o_zero)
		unbindKey("pgdn", "down", move_o_zup)
		unbindKey("num_add", "down", move_o_hohe)
		unbindKey("num_sub", "down", move_o_tiefe)
		--unbindKey("mouse_wheel_up", "down", move_o_rotate_1)
		--unbindKey("mouse_wheel_down", "down", move_o_rotate_2)
		unbindKey("num_2", "down", move_o_back)
		unbindKey("num_6", "down", move_o_xleft)
		unbindKey("num_4", "down", move_o_xright)
		unbindKey("num_8", "down", move_o_front)
		unbindKey("enter", "down", o_fertig_func)
		unbindKey("space", "down", o_abbrechen_func)

end

function setToBinds(id2)

		bindKey("arrow_l", "down", move_o_left)
		bindKey("arrow_r", "down", move_o_right)
		bindKey("arrow_u", "down", move_o_depth_raus)
	    bindKey("arrow_d", "down", move_o_depth_rein)
		bindKey("pgup", "down", move_o_zero)
		bindKey("pgdn", "down", move_o_zup)
		bindKey("num_add", "down", move_o_hohe)
		bindKey("num_sub", "down", move_o_tiefe)
		bindKey("num_2", "down", move_o_back)
		bindKey("num_6", "down", move_o_xleft)
		bindKey("num_4", "down", move_o_xright)
		bindKey("num_8", "down", move_o_front)
		bindKey("enter", "down", o_fertig_func)
		bindKey("space", "down", o_abbrechen_func)
		--bindKey("mouse_wheel_up", "down", move_o_rotate_1)
		--bindKey("mouse_wheel_down", "down", move_o_rotate_2)
end
function setToCollisionEdit(id)
	local x, y, z = getElementPosition(gMe)
	setDevelopmentMode(true)
	outputChatBox("Use /showcol to see the collision shape!.", 0, 255, 0, false)
	outputChatBox("Use the arrow keys, to move the Collision!, Use 'Page up and Page down' to move it up or down.", 0, 255, 0, false)
	outputChatBox("Use 'Num 2, Num 4, Num6, Num8' to move the Collision !.", 0, 255, 0, false)
	outputChatBox("If you are finnished, press 'Enter' to save the Collision. Space to cancel.", 0, 255, 0, false)
	setToBinds(id)
	setElementFrozen(gMe, true)
	setElementAlpha(gMe, 0)
	move_o_zero()
	if(id == 1) then
		if(gCol) then destroyElement(gCol) end
		gCol = createColCuboid(x, y, z, 2, 2, 2)
		gColx, gColy, gColz, gColw, gColh, gCold, rot = x, y, z, 2, 2, 2, 0
	else
	
	end
end
function createColMenue()
	if(Guivar == 1) then return end
	Guivar = 1
	showCursor(true)

	local sWidth, sHeight = guiGetScreenSize()
 
    local Width,Height = 246,115
    local X = (sWidth/2) - (Width/2)
    local Y = (sHeight/2) - (Height/2)

	local COLFenster = {}
	local COLKnopf = {}

	COLFenster[1] = guiCreateWindow(X, Y, Width, Height, "Collision Editor(by [XP]MuLTi)",false)
	COLKnopf[1] = guiCreateButton(12,80,80,28,"Close",false,COLFenster[1])
	COLKnopf[2] = guiCreateButton(12,30,109,45,"Col Cuboid",false,COLFenster[1])
	COLKnopf[3] = guiCreateButton(125,30,109,45,"Col Sphere",false,COLFenster[1])
	COLKnopf[4] = guiCreateButton(97,80,140,26,"Cancel edit",false,COLFenster[1])

	if(isInColEdit() ~= true) then guiSetEnabled(COLKnopf[4], false) end
	
	local function quitFenster(rofl)
		guiSetVisible(COLFenster[1], false)
		Guivar = 0
		showCursor(false)
		if(rofl) then
			o_abbrechen_func()
		end
	end
	addEventHandler("onClientGUIClick", COLKnopf[4], function() quitFenster(1) end, false) -- Quitten
	
	addEventHandler("onClientGUIClick", COLKnopf[1], quitFenster, false) -- Schliessen
	
	addEventHandler("onClientGUIClick", COLKnopf[2], -- Col Cuboid
	function()
		if(isInColEdit() == true) then outputChatBox("You are already in a edit!", 255, 0, 0, false) return end
		if(isPedInVehicle(gMe) == true) then outputChatBox("You are in a Car.", 255, 0, 0, false) return end
		setToCollisionEdit(1)
		setElementData(gMe, "coledit", true)
		quitFenster()
	end, false)

end


addCommandHandler("editcol", createColMenue)



function isInColEdit()
	if(getElementData(gMe, "coledit") == true) then return true else return false end
	return false;
end