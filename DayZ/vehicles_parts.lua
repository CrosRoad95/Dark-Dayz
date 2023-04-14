local vehicleAddonsInfo = {
	{422, 4, 1, 1, 80}, --Bobcat
	{470, 4, 1, 1, 120}, --Patriot
	{468, 2, 1, 1, 30}, --Sanchez
	{433, 6, 1, 1, 260}, --Barrack
	{437, 4, 1, 1, 120}, --Coach
	{509, 0, 0, 0, 0},  --Bike
	{487, 0, 1, 1, 40}, --Maverick
	{497, 0, 1, 1, 40}, --PoliceMaverick
	{453, 0, 1, 1, 60}, --Reffer
	{411, 4, 1, 1, 60}, --Infernus
	{415, 4, 1, 1, 60}, --Cheetah
	{541, 4, 1, 1, 60}, --Bullet
	{429, 4, 1, 1, 60}, --Bannshe
	{480, 4, 1, 1, 60}, --Comet
	{402, 4, 1, 1, 60}, --Buffalo
	{495, 4, 1, 1, 120}, --SandKing
	{560, 4, 1, 1, 80}, --Sultan
	{579, 4, 1, 1, 120}, --Huntley
	{562, 4, 1, 1, 60}, --Elegy
	{482, 4, 1, 1, 80}, --Burrito
	{496, 4, 1, 1, 60}, --BlistaCompact
	{475, 4, 1, 1, 60}, --Sabre
	{507, 4, 1, 1, 60}, --Elegant
	{551, 4, 1, 1, 60}, --Merit
	{522, 2, 1, 1, 40}, --NRG500
	{461, 2, 1, 1, 40}, --PCJ600
	{420, 4, 1, 1, 60}, --Taxi
	{416, 4, 1, 1, 120}, --Karetka
	{417, 6, 2, 1, 400}, --Leviatan
	{511, 2, 2, 1, 180}, --Beagle
	{593, 3, 1, 1, 120}, --Dodo
	{471, 4, 1, 1, 50}, --Quad
	{500, 4, 1, 1, 80}, --Mesa
	{542, 4, 1, 1, 60}, --Clover
	{447, 0, 1, 1, 40}, --SeaSparrow
	{494, 4, 1, 1, 60}, --HotringRacer
	{550, 4, 1, 1, 60}, --Sunrise
	{445, 4, 1, 1, 60}, --Admiral
	{525, 4, 1, 1, 80}, --TowTruck
	{601, 8, 1, 1, 260}, --Swat
	{469, 0, 1, 1, 40}, --Sparrow
	{506, 4, 1, 1, 60}, --Supergt
	{400, 4, 1, 1, 160}, --LandStarker
	{528, 4, 1, 1, 160}, --FBI truck
	{483, 4, 1, 1, 100}, --Camper
	{565, 4, 1, 1, 60}, --Flash
	{578, 4, 1, 1, 160}, --DFT-30
	{451, 4, 1, 1, 60}, --Turismo
	{596, 4, 1, 1, 80}, --PoliceLS
	{502, 4, 1, 1, 60}, --hotring2
	{503, 4, 1, 1, 60}, --hotring3
	{568, 4, 1, 1, 60}, --banditto
	{515, 6, 1, 1, 350}, --rdt
	{558, 4, 1, 1, 350}, --uran
	{489, 4, 1, 1, 250}, --rancher
};

local vehicleFuelTable = {
	{422, 80}, --Bobcat
	{470, 150}, --Patriot
	{468, 60}, --Sanchez
	{433, 250}, --Barrack
	{437, 150}, --Coach
	{509, 0},  --Bike
	{487, 250}, --Maverick
	{497, 250}, --PoliceMaverick
	{453, 80}, --Reffer
	{411, 100}, --Infernus
	{415, 100}, --Cheetah
	{541, 100}, --Bullet
	{429, 100}, --Bannshe
	{480, 100}, --Comet
	{402, 100}, --Buffalo
	{495, 150}, --SandKing
	{560, 100}, --Sultan
	{579, 100}, --Huntley
	{562, 100}, --Elegy
	{482, 100}, --Burrito
	{496, 100}, --BlistaCompact
	{475, 100}, --Sabre
	{507, 100}, --Elegant
	{551, 100}, --Merit
	{522, 80}, --NRG500
	{461, 80}, --PCJ600
	{420, 100}, --Taxi
	{416, 100}, --Karetka
	{417, 350}, --Leviatan
	{511, 400}, --Beagle
	{593, 250}, --Dodo
	{471, 80}, --Quad
	{500, 100}, --Mesa
	{542, 100}, --Clover
	{447, 150}, --SeaSparrow
	{494, 100}, --HotringRacer
	{550, 100}, --Sunrise
	{445, 100}, --Admiral
	{525, 120}, --TowTruck
	{601, 300}, --Swat
	{469, 200}, --Sparrow
	{506, 100}, --Supergt
	{400, 200}, --LandStarker
	{528, 250}, --FBI truck
	{483, 100}, --Camper
	{565, 100}, --Flash
	{578, 180}, --DFT-30
	{451, 100}, --Turismo
	{596, 100}, --PoliceLS
	{502, 70}, --hotring2
	{503, 70}, --hotring3
	{568, 70}, --banditto
	{515, 350}, --banditto
	{558, 350}, --uran
	{489, 150}, --rancher
};

function getVehicleAddonInfos (id)
	for _,v in ipairs(vehicleAddonsInfo) do
		if (v[1] == id) then return v[2], v[3], v[4], v[5]; end
	end
end


local VehicleOperation = {}

addEvent("onVehicleOperation", true)
addEventHandler("onVehicleOperation", root, function(operation, arg1)
    if not source then return end
    if getNetworkStats(source)["packetlossLastSecond"] > 0 then return end
    VehicleOperation[operation](source, getElementData(source, "Jezyk_Gry"), arg1)
end)

VehicleOperation['repairvehicle'] = function(player, jezyk)
    local col = getElementData(player, "currentCol");
    --triggerServerEvent("repairVehicle",getElementData(getElementByID('Dayz_Vehicle'),'repairVehicle'), player, getElementData(col, "parent"));
    triggerServerEvent("startRepair",resourceRoot,getElementData(col, "parent"))
    --repair_vehicle.startRepair(getElementData(col, "parent"))
    
end

VehicleOperation['removetire'] = function(player, jezyk)
    local col = getElementData(player, "currentCol");
    if (getElementData(col, "Tire_inVehicle") >= 1 and getElementData(player,"Toolbox") >= 1) then
        setElementData(player, "Tire", (getElementData(player, "Tire") or 0) + 1);
        setElementData(col, "Tire_inVehicle", getElementData(col, "Tire_inVehicle") - 1);
        setPedAnimation(player, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
        exports.DayZ_notification:DrawNotification(getTextLang(jezyk, 'Output_odmontowane kolo'), 255, 255, 255, player) 
        setVehicleEngineState(getElementData(col,'parent'),false)
    end
end

VehicleOperation['removeengine'] = function(player, jezyk)
    local col = getElementData(player, "currentCol");
    if (getElementData(col, "Engine_inVehicle") >= 1 and getElementData(player, "Toolbox") >= 1) then
        setElementData(player, "Engine", (getElementData(player, "Engine") or 0) + 1);
        setElementData(col, "Engine_inVehicle", getElementData(col, "Engine_inVehicle") - 1);
        setPedAnimation(player, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
        exports.DayZ_notification:DrawNotification(getTextLang(jezyk, 'Output_odmontowany silnik'), 255, 255, 255, player)
        setVehicleEngineState(getElementData(col,'parent'),false)  
    end
end

VehicleOperation['removeparts'] = function(player, jezyk)
    local col = getElementData(player, "currentCol");
    if (getElementData(col, "Parts_inVehicle") >= 1 and getElementData(player, "Toolbox") >= 1) then
        setElementData(player, "Tank Parts", getElementData(player, "Tank Parts") + 1);
        setElementData(col, "Parts_inVehicle", getElementData(col, "Parts_inVehicle") - 1);
        setPedAnimation(player, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
        exports.DayZ_notification:DrawNotification(getTextLang(jezyk, 'Output_odmontowany zbiornik'), 255, 255, 255, player)     
    end
end

VehicleOperation['removeglass'] = function(player, jezyk)
    local col = getElementData(player, "currentCol");
    local parent = getElementData(col,"parent")
    if (getElementData(parent, "Szyba-Kuloodporna") and getElementData(player, "Toolbox") >= 1) then
        local col = getElementData(player, "currentCol");
        setElementData(player, "Bulletproof Glass", getElementData(player, "Bulletproof Glass") + 1);
        setElementData(parent, "Szyba-Kuloodporna",false);
        setPedAnimation(player, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
        exports.DayZ_notification:DrawNotification(getTextLang(jezyk, 'Output_odmontowany szyba'), 255, 255, 255, player) 
    end
end

VehicleOperation['addengine'] = function(player, jezyk)
    local col = getElementData(player, "currentCol");
    local tires,engine,parts,_ = getVehicleAddonInfos(getElementModel(getElementData(col, "parent")))
    if (getElementData(col, "Engine_inVehicle") or 0) <= engine-1 and getElementData(player, "Toolbox") >= 1 then
        local col = getElementData(player, "currentCol");
        setElementData(player, "Engine", getElementData(player, "Engine") - 1);
        setElementData(col, "Engine_inVehicle", (getElementData(col, "Engine_inVehicle") or 0) + 1);
        setPedAnimation(player, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
        exports.DayZ_notification:DrawNotification(getTextLang(jezyk, 'Output_zamontowany silnik'), 255, 255, 255, player)
    end
end

VehicleOperation['addtire'] = function(player, jezyk)
    local col = getElementData(player, "currentCol");
    local tires,engine,parts,_ = getVehicleAddonInfos(getElementModel(getElementData(col, "parent")))
    if (getElementData(col, "Tire_inVehicle") or 0) <= tires-1 and getElementData(player, "Toolbox") >= 1 then
        local col = getElementData(player, "currentCol");
        setElementData(player, "Tire", getElementData(player, "Tire") - 1);
        setElementData(col, "Tire_inVehicle", (getElementData(col, "Tire_inVehicle") or 0) + 1);
        setPedAnimation(player, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
        exports.DayZ_notification:DrawNotification(getTextLang(jezyk, 'Output_zamontowane koło'), 255, 255, 255, player)        
    end
end

VehicleOperation['addglass'] = function(player, jezyk)
    local col = getElementData(player, "currentCol");
    local parent = getElementData(col,"parent")
    -- local tires,engine,parts,_ = getVehicleAddonInfos(getElementModel(getElementData(col, "parent")))
    if not getElementData(parent, "Szyba-Kuloodporna") and getElementData(player, "Toolbox") >= 1 then
        setElementData(player, "Bulletproof Glass", getElementData(player, "Bulletproof Glass") - 1);
        setElementData(parent, "Szyba-Kuloodporna", true);
        setPedAnimation(player, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
        exports.DayZ_notification:DrawNotification(getTextLang(jezyk, 'Output_zamontowany szyba'), 255, 255, 255, player)    
    end
end

VehicleOperation['addfuel'] = function(player, jezyk, arg1)
    if getElementData(player, "Full Gas Canister") < 1 then return end
    local col = getElementData(player, "currentCol");
    exports.DayZ_notification:DrawNotification(getTextLang(jezyk, 'Output_pomyslnie zatankowano'), 255, 255, 255, player)
    setElementData(col, "fuel", (getElementData(col, "fuel") or 0) + arg1);
    setElementData(player, "Empty Gas Canister", getElementData(player, "Empty Gas Canister") + 1);
    setElementData(player, "Full Gas Canister", getElementData(player, "Full Gas Canister") - 1);
end

VehicleOperation['addparts'] = function(player, jezyk)
    local col = getElementData(player, "currentCol");
    local tires,engine,parts,_ = getVehicleAddonInfos(getElementModel(getElementData(col, "parent")))
    if (getElementData(col, "Parts_inVehicle") or 0) <=parts-1 and getElementData(player, "Toolbox") >= 1 then
        local col = getElementData(player, "currentCol");
        setElementData(player, "Tank Parts", getElementData(player, "Tank Parts") - 1);
        setElementData(col, "Parts_inVehicle", (getElementData(col, "Parts_inVehicle") or 0) + 1);
        setPedAnimation(player, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
        exports.DayZ_notification:DrawNotification(getTextLang(jezyk, 'Output_zamontowany zbiornik'), 255, 255, 255, player) 
    end
end