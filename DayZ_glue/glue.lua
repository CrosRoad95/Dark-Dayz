




function glue()
	local player = getLocalPlayer()
	if not getPedOccupiedVehicle(player) then
		local vehicle = getPedContactElement(player)
		if vehicle and getElementType(vehicle) == "vehicle" then
		    local mod = getElementModel(vehicle)
			if mod == 481  then
				triggerEvent("stworz_notyfikacje", localPlayer, "error", "Nie możesz przykleić się do roweru!")
				return;
			elseif (getVehicleType(vehicle) == "Plane" or getVehicleType(vehicle) == "Helicopter") and getVehicleName(vehicle) ~= "Dodo" then
				triggerEvent("stworz_notyfikacje", localPlayer, "error", "Nie możesz przykleić się do pojazdu latającego!")
				return
			else
			
				toggleControl("enter_exit",false)
				toggleControl("enter_passenger",false)
				
				local px, py, pz = getElementPosition(player)
				local vx, vy, vz = getElementPosition(vehicle)
				local sx = px - vx
				local sy = py - vy
				local sz = pz - vz
			
				local rotpX = 0
				local rotpY = 0
				local rotpZ = getPedRotation(player)
			
				local rotvX,rotvY,rotvZ = getElementRotation(vehicle)
			
				local t = math.rad(rotvX)
				local p = math.rad(rotvY)
				local f = math.rad(rotvZ)
			
				local ct = math.cos(t)
				local st = math.sin(t)
				local cp = math.cos(p)
				local sp = math.sin(p)
				local cf = math.cos(f)
				local sf = math.sin(f)
			
				local z = ct*cp*sz + (sf*st*cp + cf*sp)*sx + (-cf*st*cp + sf*sp)*sy
				local x = -ct*sp*sz + (-sf*st*sp + cf*cp)*sx + (cf*st*sp + sf*cp)*sy
				local y = st*sz - sf*ct*sx + cf*ct*sy
			
				local rotX = rotpX - rotvX
				local rotY = rotpY - rotvY
				local rotZ = rotpZ - rotvZ
				
				local slot = getPedWeaponSlot(player)
				triggerServerEvent("gluePlayer", player, slot, vehicle, x, y, z, rotX, rotY, rotZ)
			end
		end
	end
end
addCommandHandler("glue",glue)

addEvent("successGlue", true)
addEventHandler("successGlue", resourceRoot, function ()
	
	unbindKey("b","down",glue)
	bindKey("b","down",unglue)
	bindKey("jump","down",unglue)
end)

function unglue ()
	local player = getLocalPlayer()
	triggerServerEvent("ungluePlayer", player)
	unbindKey("jump","down",unglue)
	unbindKey("b","down",unglue)
	bindKey("b","down",glue)
	toggleControl("enter_exit",true)
	toggleControl("enter_passenger",true)
end
addCommandHandler("unglue",unglue)


unglue()


bindKey("b","down",glue)