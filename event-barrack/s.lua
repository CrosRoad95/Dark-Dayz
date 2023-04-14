
local barrack

addCommandHandler("postawBarracka",function(player)
	if isObjectInACLGroup("user."..getElementData(player,"logedin"),aclGetGroup("Admin")) or isObjectInACLGroup("user."..getElementData(player,"logedin"),aclGetGroup("Moderator2")) or isObjectInACLGroup("user."..getElementData(player,"logedin"),aclGetGroup("Pomocnik")) then 
		local x,y,z = getElementPosition(player);
		local veh = createVehicle(getVehicleModelFromName("Barracks"), x, y, z);
		barrack = veh
		setElementPosition(player, x, y, (z+3));
		local vehCol = createColSphere(x, y, z, 2.5);
		local dim = getElementDimension(player)
		setVehicleHandling(veh, "engineAcceleration", 23.0)
		setVehicleHandling(veh, "maxVelocity", 220.0)
		setVehicleHandling(veh, "driveType", awd)
		setVehicleHandling(veh, "tractionLoss", 1.5)
		setVehicleHandling(veh, "brakeDeceleration", 8.0)
		attachElements(vehCol, veh,0,3,0);
		setElementData(vehCol, "parent", veh);
		setElementData(veh, "parent", vehCol);
		setElementData(vehCol, "vehicle", true);
		setElementData(veh, "dayzvehicle", 0); --Change this to '1' if you want to be respawned after explode!
		setElementData(vehCol, "Tire_inVehicle", 6);
		setElementData(vehCol, "Engine_inVehicle", 1);
		setElementData(vehCol, "Parts_inVehicle", 1);
		setElementData(vehCol, "MAX_Slots", 2000);
		setElementData(vehCol, "fuel", 999999);
		setElementData(vehCol, "Coyote Backpack", 10)
		setElementData(vehCol, "Toolbox", 15)
		setElementData(vehCol, "Ghillie Suit", 10)
		setElementData(vehCol, "Tent", 20)
		setElementData(vehCol, "GPS", 30)
		setElementData(vehCol, "Map", 30)
		setElementData(vehCol, "Tire", 10)
		setElementData(vehCol, "Engine", 5)
		setElementData(vehCol, "Civilian Clothing", 15)
		setElementData(vehCol, "Camouflage Clothing", 15)
		setElementData(vehCol, "WomanMilitary Clothing [F]", 15)
		setElementData(vehCol, "Milk", 30)
		setElementData(vehCol, "Pizza", 30)
		setElementData(vehCol, "Burger", 30)
		setElementData(vehCol, "Soda Bottle", 30)
		setElementData(vehCol, "M4A1-S", 30)
		setElementData(vehCol, "G36C", 30)
		setElementData(vehCol, "AK-47", 30)
		setElementData(vehCol, "AWP", 20)
		setElementData(vehCol, "M4A1-S Mag", 25)
		setElementData(vehCol, "G36C Mag", 25)
		setElementData(vehCol, "AWP Mag",18)
		setElementData(vehCol, "AK-47 Mag", 25)
		setElementData(vehCol, "Ghillie Suit [F]", 15)
		setElementData(vehCol, "Military Backpack", 5)
		setElementData(vehCol, "Painkiller", 20)
		setElementData(vehCol, "Night Vision Goggles", 40)
		setElementData(vehCol, "Morphine", 20)
		setElementData(vehCol, "Infrared Goggles", 40)
		setElementData(vehCol, "Medic Kit", 20)
		setElementData(vehCol, "Bandage", 40)
		local kontener = createObject(2932, x, y, z)
		local tentCol = createColSphere(x, y, z, 5)
		attachElements(tentCol, kontener, 0, 0, 0)
		attachElements(kontener,veh,0,-2,1.1)
		setObjectScale(kontener,0.7)
		setElementCollisionsEnabled(kontener,false)
		setVehicleDamageProof(barrack,false)
		setElementData(tentCol, "parent", kontener)
		setElementData(kontener, "parent", tentCol)
		setElementData(tentCol, "kontener", true)
		setElementData(tentCol, "MAX_Slots", 2000000)
		setElementData(tentCol, "Coyote Backpack", 10)
		setElementData(tentCol, "Toolbox", 15)
		setElementData(tentCol, "Ghillie Suit", 10)
		setElementData(tentCol, "Tent", 20)
		setElementData(tentCol, "GPS", 30)
		setElementData(tentCol, "Map", 30)
		setElementData(tentCol, "Tire", 10)
		setElementData(tentCol, "Engine", 5)
		setElementData(tentCol, "Civilian Clothing", 15)
		setElementData(tentCol, "Camouflage Clothing", 15)
		setElementData(tentCol, "WomanMilitary Clothing [F]", 15)
		setElementData(tentCol, "Milk", 30)
		setElementData(tentCol, "Pizza", 30)
		setElementData(tentCol, "Burger", 30)
		setElementData(tentCol, "Soda Bottle", 30)
		setElementData(tentCol, "M4A1-S", 30)
		setElementData(tentCol, "G36C", 30)
		setElementData(tentCol, "AK-47", 30)
		setElementData(tentCol, "AWP", 20)
		setElementData(tentCol, "M4A1-S Mag", 25)
		setElementData(tentCol, "G36C Mag", 25)
		setElementData(tentCol, "AWP Mag",18)
		setElementData(tentCol, "AK-47 Mag", 25)
		setElementData(tentCol, "Ghillie Suit [F]", 15)
		setElementData(tentCol, "Military Backpack", 5)
		setElementData(tentCol, "Painkiller", 20)
		setElementData(tentCol, "Night Vision Goggles", 40)
		setElementData(tentCol, "Morphine", 20)
		setElementData(tentCol, "Infrared Goggles", 40)
		setElementData(tentCol, "Medic Kit", 20)
		setElementData(tentCol, "Bandage", 40)
		outputChatBox(" === Wkrótce rozpocznie się event Barrack ===",root,255,255,255)
		outputChatBox(" === W barracku znajduje się duża ilość przedmiotów ===",root,255,255,255)
		outputChatBox(" === Barrack ma na przyczepie kontener z duża ilościa przedmiotów ===",root,255,255,255)
		outputChatBox(" === #FF0000Barrack zostanie oznaczony ikonką ciężarówki!#FFFFFF ===",root,255,255,255,true)
		outputChatBox(" === #FF0000Barracka bronią inni ocaleni, bądz ostrożnyi!#FFFFFF ===",root,255,255,255,true)
	end
end)

("pokazBlip",function(z)
	if isObjectInACLGroup("user."..getElementData(z,"logedin"),aclGetGroup("Admin")) or isObjectInACLGroup("user."..getElementData(z,"logedin"),aclGetGroup("Moderator2")) or isObjectInACLGroup("user."..getElementData(z,"logedin"),aclGetGroup("Pomocnik")) then 
		createBlipAttachedTo(barrack,51)
		outputChatBox(" === Event barrack, rozpoczyna się ===",root,255,255,255)
		outputChatBox(" === Barrack jest oznaczony ikonką ciężarówki! ===",root,255,255,255)
	end
end)

addCommandHandler("koniecEventu",function(z)
	if isObjectInACLGroup("user."..getElementData(z,"logedin"),aclGetGroup("Admin")) or isObjectInACLGroup("user."..getElementData(z,"logedin"),aclGetGroup("Moderator2")) then 
		restartResource(getThisResource())
	end
end)



