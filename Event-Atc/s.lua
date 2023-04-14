veh = nil
blip = nil

function zbinduj(plr)
if isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(plr)), aclGetGroup("Admin")) then
triggerClientEvent(plr,"zrzuc_box",plr)
end
end
addCommandHandler("drop_box",zbinduj)

addCommandHandler("event-atc",function(plr)
if isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(plr)), aclGetGroup("Admin")) then
if getElementData(resourceRoot,"Event-Atc")==false then
setElementData(resourceRoot,"Event-Atc",true)
outputChatBox("=== Rozpoczyna się event! ===",root,255,255,255)
outputChatBox("=== Samolot lata po mapie i zrzuca skrzynki z przedmiotami! ===",root,255,255,255)
outputChatBox("=== Skrzynki są oznaczone pucharem! ===",root,255,255,255)
local x,y,z = getElementPosition(plr)
veh = createVehicle(434,x,y,z)
blip = createBlipAttachedTo(veh,5)
setBlipColor(blip,255,0,0,255)
setTimer(function()
setVehicleEngineState(veh,true)	
end,50,1)
setVehicleDamageProof(veh,true)
--setElementCollisionsEnabled(veh,false)
warpPedIntoVehicle(plr,veh)

--setElementVelocity(veh,_,_,50)
end
end
end)

addEventHandler("onResourceStart",resourceRoot,function()
setElementData(resourceRoot,"Event-Atc",false)

end)


--local obiectt = {}
addEvent("zrzuc_box_server",true)
addEventHandler("zrzuc_box_server",root,function(ground,x,y,z)
local obiect = createObject(1275,x,y,z)
setObjectScale ( obiect, 1.5)
createBlipAttachedTo(obiect,33)
moveObject(obiect,6000,x,y,ground+0.8)
local tentCol = createColSphere(x,y,z,3)
attachElements(tentCol,obiect,0,0,0)
setElementData(tentCol, "parent", obiect)
setElementData(obiect, "parent", tentCol)
setElementData(tentCol, "hospitalbox", true)
setElementData(tentCol, "MAX_Slots", 2000000)
setElementData(tentCol, "Coyote Backpack", math.random(2,5))
setElementData(tentCol, "Alice Pack", math.random(6,12))
setElementData(tentCol, "Toolbox", 10)
setElementData(tentCol, "Ghillie Suit", 10)
setElementData(tentCol, "Tent", 10)
setElementData(tentCol, "GPS", 15)
setElementData(tentCol, "Map", 15)
setElementData(tentCol, "Tire", 5)
setElementData(tentCol, "Engine", 3)
setElementData(tentCol, "Civilian Clothing", 10)
setElementData(tentCol, "Camouflage Clothing", 7)
setElementData(tentCol, "Ghillie Suit [F]", 7)
setElementData(tentCol, "Milk", 15)
setElementData(tentCol, "Pizza", 15)
setElementData(tentCol, "Burger", 15)
setElementData(tentCol, "Soda Bottle", 15)
setElementData(tentCol, "M4A1-S", 10)
setElementData(tentCol, "G36C", 10)
setElementData(tentCol, "AK-47", 10)
setElementData(tentCol, "AWP", math.random(5,8))
setElementData(tentCol, "M4A1-S Mag", math.random(15,20))
setElementData(tentCol, "G36C Mag", math.random(15,20))
setElementData(tentCol, "AWP Mag",math.random(8,12))
setElementData(tentCol, "AK-47 Mag", math.random(20,25))
setElementData(tentCol, "Ghillie Suit [F]", 15)
setElementData(tentCol, "Military Backpack", math.random(1,2))
setElementData(tentCol, "Painkiller", 20)
setElementData(tentCol, "Night Vision Goggles", 20)
setElementData(tentCol, "Morphine", 20)
setElementData(tentCol, "Infrared Goggles", 20)
setElementData(tentCol, "Medic Kit", 10)
setElementData(tentCol, "Medic Bag", 5)
setElementData(tentCol, "Bandage", 25)
end)







