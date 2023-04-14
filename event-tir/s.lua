
local barrack
local barrack2
local barrack3
local barrack4
local naczepa

addCommandHandler("eventir",function(player)
	if isObjectInACLGroup("user."..getElementData(player,"logedin"),aclGetGroup("Admin")) or isObjectInACLGroup("user."..getElementData(player,"logedin"),aclGetGroup("Moderator2")) then 
		local x,y,z = getElementPosition(player);
		local veh = createVehicle(515, 2591.0078125,1842.9833984375,11.065863609314,359.67590332031,359.62646484375,88.906860351562);
		local veh2 = createVehicle(515, 2494.421875,-1665.787109375,13.571484565735,359.82421875,0.087890625,77.546997070312);
		local veh3 = createVehicle(515, -2353.8056640625,-1635.2412109375,483.86270141602,359.69787597656,359.82421875,288.99536132812);
		local veh4 = createVehicle(515, -2044.23046875,135.0546875,28.954706192017,359.63195800781,0,272.48840332031);
		barrack = veh
		barrack2 = veh2
		barrack3 = veh3
		barrack4 = veh4
		--setElementPosition(player, x, y, (z+3));
		local vehCol = createColSphere(x, y, z, 2.5);
		local dim = getElementDimension(player)
		setVehicleHandling(veh, "engineAcceleration", 13.0)
		setVehicleHandling(veh, "maxVelocity", 240.0)
		setVehicleHandling(veh, "driveType", awd)
		setVehicleHandling(veh, "tractionLoss", 1.5)
		setVehicleHandling(veh, "brakeDeceleration", 8.0)
		attachElements(vehCol, veh,0,3,0);
		attachElements(vehCol, veh2,0,3,0);
		attachElements(vehCol, veh3,0,3,0);
		attachElements(vehCol, veh4,0,3,0);
		setElementData(vehCol, "parent", veh);
		setElementData(vehCol, "parent", veh2);
		setElementData(vehCol, "parent", veh3);
		setElementData(vehCol, "parent", veh4);
		setElementData(veh, "parent", vehCol);
		setElementData(veh2, "parent", vehCol);
		setElementData(veh3, "parent", vehCol);
		setElementData(veh4, "parent", vehCol);
		setElementData(vehCol, "vehicle", true);
		setElementData(veh, "dayzvehicle", 0); --Change this to '1' if you want to be respawned after explode!
		setElementData(veh2, "dayzvehicle", 0); --Change this to '1' if you want to be respawned after explode!
		setElementData(veh3, "dayzvehicle", 0); --Change this to '1' if you want to be respawned after explode!
		setElementData(veh4, "dayzvehicle", 0); --Change this to '1' if you want to be respawned after explode!
		setElementData(vehCol, "Tire_inVehicle", 6);
		setElementData(vehCol, "Engine_inVehicle", 1);
		setElementData(vehCol, "Parts_inVehicle", 1);
		setElementData(vehCol, "MAX_Slots", 2000);
		setElementData(vehCol, "fuel", 999999);
		local kontener = createVehicle(591, 1613,1351,11);
		
		setElementRotation(kontener, 0,0, 130)
		naczepa = kontener
		tentCol = createColSphere(x, y, z, 5)
		attachElements(tentCol, kontener, 0, 0, 0)
		setVehicleDamageProof(barrack,true)
		setVehicleDamageProof(barrack2,true)
		setElementData(kontener, "Pojazd-Naczepa", true)
		setVehicleDamageProof(barrack3,true)
		setVehicleDamageProof(barrack4,true)
		setElementData(tentCol, "parent", kontener)
		setElementData(kontener, "parent", tentCol)
		setElementData(tentCol, "kontener", true)
		setElementData(tentCol, "MAX_Slots", 2000000)
		for _,v in ipairs(getElementsByType("player")) do
		local jezyk = getElementData(v,'Jezyk_Gry') or "PL"
			if jezyk =="PL" then
			outputChatBox(" === #66CC00Wkrótce rozpocznie się event walka o naczepe#FFFFFF ===",v,255,255,255,true)
			outputChatBox(" === #66CC00W naczepie znajduje się duża ilość przedmiotów#FFFFFF ===",v,255,255,255,true)
			outputChatBox(" === #66CC00Podjedz tirem pod naczepe i zabierz ją do bazy!#FFFFFF ===",v,255,255,255,true)
			--outputChatBox(" === #FFCC99Przy naczepie znajduje się wiele zombiaków!#FFFFFF ===",root,255,255,255,true)
			outputChatBox(" === #FFCC99Naczepa jest oznaczona fioletowym ludzikiem!#FFFFFF ===",v,255,255,255,true)
		else
			outputChatBox(" === #66CC00The fight for the trailer will begin soon#FFFFFF ===",v,255,255,255,true)
			outputChatBox(" === #66CC00There are many items in the trailer#FFFFFF ===",v,255,255,255,true)
			outputChatBox(" === #66CC00Drive the truck under the trailer and take it to the base!#FFFFFF ===",v,255,255,255,true)
			--outputChatBox(" === #FFCC99Przy naczepie znajduje się wiele zombiaków!#FFFFFF ===",root,255,255,255,true)
			outputChatBox(" === #FFCC99The trailer is marked with a purple man!#FFFFFF ===",v,255,255,255,true)
		end
		end
	end
end)

addCommandHandler("dajity",function(z)
		setElementData(tentCol, "Coyote Backpack", 10)
		setElementData(tentCol, "Toolbox", 15)
		setElementData(tentCol, "Wrench", 15)
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
		setElementData(tentCol, "M4A1-S", 15)
		setElementData(tentCol, "M4A1", 10)
		setElementData(tentCol, "AK-47", 15)
		setElementData(tentCol, "AWP", 15)
		setElementData(tentCol, "M4A1-S Mag", 35)
		setElementData(tentCol, "AWP Mag",25)
		setElementData(tentCol, "AK-47 Mag", 35)
		setElementData(tentCol, "Ghillie Suit [F]", 15)
		setElementData(tentCol, "Military Backpack", 15)
		setElementData(tentCol, "Painkiller", 20)
		setElementData(tentCol, "Night Vision Goggles", 40)
		setElementData(tentCol, "Morphine", 20)
		setElementData(tentCol, "Infrared Goggles", 20)
		setElementData(tentCol, "Medic Kit", 20)
		setElementData(tentCol, "Bandage", 40)
		setElementData(tentCol, "Code card #1", 1)
		setElementData(tentCol, "Code card #6", 1)
end)
addCommandHandler("pokazBlipy",function(z)
	if isObjectInACLGroup("user."..getElementData(z,"logedin"),aclGetGroup("Admin")) or isObjectInACLGroup("user."..getElementData(z,"logedin"),aclGetGroup("Moderator2")) then 
		createBlipAttachedTo(barrack,51)
		createBlipAttachedTo(barrack2,51)
		createBlipAttachedTo(barrack3,51)
		createBlipAttachedTo(barrack4,51)
		createBlipAttachedTo(naczepa,59)
		for _,v in ipairs(getElementsByType("player")) do
		local jezyk = getElementData(v,'Jezyk_Gry') or "PL"
			if jezyk =="PL" then
			outputChatBox(" === Event walka o naczepe, rozpoczyna się ===",v,255,255,255,true)
			outputChatBox(" === Naczepa jest oznaczona ikonką #660066fioletowego ludzika, #fffffftiry #A0A0A0szarej ciężarówki!#ffffff ===",v,255,255,255,true)
			outputChatBox(" === Przedmioty z przyczepy zobaczysz, gdy znajdzie się w bazie!#ffffff ===",v,255,255,255,true)
		else
			outputChatBox(" === The fight for a trailer begins ===",v,255,255,255,true)
			outputChatBox(" === The trailer is marked with the icon #660066 purple man, #ffffff tiry #A0A0A0 gray truck#ffffff ===",v,255,255,255,true)
			outputChatBox(" === You will see the items from the trailer when it is in the base!#ffffff ===",v,255,255,255,true)
		end
		end
	end
end)

addCommandHandler("eventStop",function(z)
	if isObjectInACLGroup("user."..getElementData(z,"logedin"),aclGetGroup("Admin")) or isObjectInACLGroup("user."..getElementData(z,"logedin"),aclGetGroup("Moderator2")) then 
		restartResource(getThisResource())
	end
end)



