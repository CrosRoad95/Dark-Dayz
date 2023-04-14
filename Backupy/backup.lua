local backupItemsTable = {
		{"M4A1-S \n", 0},
		{"M4A1 \n", 0},
		{"Barrett M107 \n", 0},
		{"SVD Dragunov \n", 0},
		{"AA-12 \n", 0},
		{"AA-12 Mag \n", 0},
		{"SVD Dragunov Mag \n", 0},
		{"SVD Dragunov \n", 0},
		{"Barrett M107 \n", 0},
		{"Barrett M107 Mag \n", 0},
		{"G36C \n", 0},
		--{"MK 48 Mod 0 \n", 0},
		--{"M60 \n", 0},
		{"PKP Pecheneg \n", 0},
		{"MG-34 \n", 0},
		--{"PKP \n", 0},
		{"AK-47 \n", 0},
		{"Scar-L \n",0},
		{"M16A4 \n", 0},
		--{"SA-58V ACOG \n", 0},
		{"Winchester 1866 \n", 0},
		{"SPAZ-12 Combat Shotgun \n", 0},
		{"Sawn-Off Shotgun \n", 0},
		--{"AKS-74U \n", 0},
		{"Lee Enfield \n", 0},
		--{"DMR \n", 0},
		--{"Cheytac M200 \n", 0},
		{"Scar-L",3},
		--{"AS50 \n", 0},
		{"AWP \n", 0},
		--{"Mosin 9130 \n", 0},
		--{"M24 \n", 0},
		--{"M107 \n", 0},
		--{"SVD Dragunov Camo \n", 0},
		{"M4A1-S", 3},
		{"M4A1", 3},
		{"G36C", 3},
		--{"MK 48 Mod 0", 3},
		--{"M60", 3},
		{"PKP Pecheneg", 3},
		{"MG-34", 3},
		--{"PKP", 3},
		{"AK-47", 3},
		{"M16A4", 3},
		--{"SA-58V ACOG", 3},
		{"Winchester 1866", 3},
		{"SPAZ-12 Combat Shotgun", 3},
		{"Sawn-Off Shotgun", 3},
	--	{"AKS-74U", 3},
		{"Lee Enfield", 3},
		--{"DMR", 3},
		--{"Cheytac M200", 3},
		--{"AS50", 3},
		{"AWP", 3},
		--{"Mosin 9130", 3},
		--{"M24", 3},
		--{"M107", 3},
		--{"SVD Dragunov Camo", 3}
		{"M1911 \n", 0},
		{"M9 SD \n", 0},
		{"PDW \n", 0},
		{"MP5A5 \n", 0},
		{"Desert Eagle \n", 0},
		{"Hunting Knife \n", 0,_,"Nóż Myśliwski"},
		{"Hatchet \n", 0,_,"Sikierka"},
		{"Baseball Bat \n", 0,_,"Kij Bejzbolowy"},
		{"Shovel \n", 0,_,"Łopata"},
		{"Harvest Scythe \n", 0,_,'Kosa Stacha'},
		{"Chainsaw \n", 0,_,'Piła Mechaniczna'},
		{"Spray \n", 0,_,'Spray'},
		{"M1911", 2},
		{"M9 SD", 2},
		{"PDW", 2},
		{"MP5A5", 2},
		{"Desert Eagle", 2},
		{"Hunting Knife", 1,_,'Nóż Myśliwski'},
		{"Hatchet", 2,_,'Sikierka'},
		{"Parachute \n",0,_,"Spadochron"},
		{'Parachute',1,_,"Spadochron"},
		{"Baseball Bat", 1,_,"Kij Bejzbolowy"},
		{"Shovel", 1,_,"Łopata",},
		{"Harvest Scythe", 1,_,'Kosa Stacha'},
		{"Chainsaw", 2,_,"Piła Mechaniczna"},
		{"Spray", 1,_,"Spray"},
		{"Tear Gas \n", 0},
		{"Grenade \n", 0,_,"Granat"},
		{"Binoculars \n", 0,_,"Lornetka"},
		{"Tear Gas", 1},
		{"Grenade", 1,_,"Granat"},
		{"Binoculars", 1,_,"Lornetka"},
		{"M1911 Mag", 0.085},
		{"M9 SD Mag", 0.085},
		{"Desert Eagle Mag", 0.085},
		{"PDW Mag", 0.025},
		{"MP5A5 Mag", 0.025},
		--{"AKS-74U Mag", 0.035},
		{"1866 Slug", 0.067},
		{"2Rnd. Slug", 0.067},
		{"SPAZ-12 Pellet", 0.067},
		{"M4A1-S Mag", 0.035},
		{"G36C Mag", 0.035},
	--	{"MK 48 Mod 0 Mag", 0.035},
		--{"M60 Mag", 0.035},
		{"PKP Pecheneg Mag", 0.035},
		{"MG-34 Mag", 0.035},
	--	{"PKP Mag", 0.035},
		{"AK-47 Mag", 0.035},
		{"Scar-L Mag",0.035},
		{"M16A4 Mag", 0.035},
	--	{"SA-58V ACOG Mag", 0.035},
	--	{"DMR Mag", 0.1},
	--	{"AS50 Mag", 0.1},
		{"AWP Mag", 0.1},
	--	{"Mosin 9130 Mag", 0.1},
		--{"M24 Mag", 0.1},
		--{"M107 Mag", 0.1},
		--{"SVD Dragunov Camo Mag", 0.1},
		--{"Cheytac M200 Mag", 0.1},
		{"Lee Enfield Mag", 0.1},
		{"Water Bottle", 1,_,"Butelka Wody"},
		{"Pasta Can", 1,_,"Makaron"},
		{"Beans Can", 1,_,"Fasolka"},
		{"Kebab",1},
		{"Coca Cola",1},
		{"Burger", 1,_,"Burger"},
		{"Pizza", 1,_,"Pizza"},
		{"Soda Bottle", 1,_,"Napój Gazowany"},
 		{"Milk", 1,_,"Mleko"},
		{"Cooked Meat", 1,_,"Upieczone mięso"},
		{"Assault Pack (ACU)", 1, "Equip Backpack","Plecak ACU"},
		{"Bag", 2, "Equip Backpack",'Torba'},
		{"Alice Pack", 3, "Equip Backpack",'Plecak Alice'},
		{"Mountain Backpack", 4, "Equip Backpack",'Plecak Górski'},
		{"Czech Backpack", 4, "Equip Backpack","Plecak Czech"},
		{"Coyote Backpack", 4, "Equip Backpack","Plecak Kojot"},
		{"Military Backpack", 5, "Equip Backpack","Plecak Militarny"},
		{"Camouflage Clothing", 1, "Put clothes on","Przebranie Kamuflujące"},
		{"Civilian Clothing", 1, "Put clothes on","Przebranie Cywila"},
		{"Survivor Clothing", 1, "Put clothes on","Przebranie Ocalałego"},
		{"Ghillie Suit", 1, "Put clothes on","Kombinezon Ghillie"},
		{"Reabel Clothing", 1, "Put clothes on",'Przebranie Rebelianta'},
		{"Woman Clothing", 1, "Put clothes on",'Przebranie Ocalałego [F]'},
		{"Military Clothing [F]",1,"Put clothes on","Przebranie Wojskowe [F]"},
		{"Ghillie Suit [F]",1,"Put clothes on","Kombinezon Ghillie [F]"},
		{"Kombinezon X",1,"Put clothes on","Kombinezon X"},
		{"Diver Suit",1,"Put clothes on","Przebranie nurka"},
		{"Armor",1,"Zaloz Armor","Pancerz"},
		{"Bush", 1,"Put a bush","Krzak"},
		{"Safe", 3,"Put a safe","Sejf"},
		{"Wood Pile", 2,_,"Stos Drewna"},
		{"Trap",2,'Put a trap',"Pułapka"},
		{"Metal",2},
		{"Lista Metalu",4},
		{"Weapon parts",1},
		{"Bandage", 1, "Bandage yourself","Bandaż"},
		{"Empty Gas Canister", 2,_,"Pusty Karnister"},
		{"Full Gas Canister", 2,_,"Pełny Karnister"},
		{"Medic Kit", 2, "Use","Apteczka Medyczna"},
		{"First Aid Kit",1,"Use","Apteczka Pierwszej Pomocy"},
		{"Medic Bag",3,"Use","Torba Medyczna"},
		--{"Heat Pack", 1, "Use"},
		{"Painkiller", 1, "Use","Środki Przeciwbólowe"},
		{"Morphine", 1, "Use","Morfina"},
		{"Blood Bag", 1,_,"Torebka Krwi"},
		{"Wire Fence", 1, "Build a wire fence","Drut kolczasty"},
		{"Sandbag",2,"Build a sandbag","Worki z Piastkiem"},
		{"Raw Meat", 1,_,"Surowe Mięso"},
		{"Tire", 2,_,"Koło"},
		{"Tank Parts", 2,_,"Zbiornik Paliwa"},
		{"Engine", 5,_,"Silnik"},
		{"Tent", 2, "Pitch a tent","Namiot"},
		{"Medium Tent", 3, "Pitch a tent","Namiot Średni"},
		{"Large Tent", 4, "Pitch a tent","Namiot Duży"},
		{"Empty Water Bottle", 1, "Fill bottle up","Pusta butelka wody"}, 
		{"Empty Soda Cans", 1},
		{"Scruffy Burgers", 1,_,"Spleśniałe burgery"},
		{"Rope",2,'Pull down rope',"Lina"},
		{"Glass",1,_,"Szkło"},
		{"Bulletproof Glass",2,_,"Szyba Kuloodporna"},
		{"Helmet",1,"Zaloz helm","Hełm"},
		{"Helmet [75%]",1,"Zaloz helm","Hełm [75%]"},
		{"Helmet [50%]",1,"Zaloz helm","Hełm [50%]"},
		{"Helmet [25%]",1,"Zaloz helm","Hełm [25%]"},
		{"Mossy Helmet",1,"Zaloz helm","Hełm Mossy"},
		{"Mossy Helmet [80%]",1,"Zaloz helm","Hełm Mossy [80%]"},
		{"Mossy Helmet [60%]",1,"Zaloz helm","Hełm Mossy [60%]"},
		{"Mossy Helmet [40%]",1,"Zaloz helm","Hełm Mossy [40%]"},
		{"Mossy Helmet [20%]",1,"Zaloz helm","Hełm Mossy [20%]"},
		{"Mossy Helmet [10%]",1,"Zaloz helm","Hełm Mossy [10%]"},
		-- kamizelki
		{"Police Vest",2,"Zaloz kamizelke","Kamizelka policyjna"},
		{"Police Vest [75%]",2,"Zaloz kamizelke","Kamizelka policyjna [75%]"},
		{"Police Vest [50%]",2,"Zaloz kamizelke","Kamizelka policyjna [50%]"},
		{"Police Vest [25%]",2,"Zaloz kamizelke","Kamizelka policyjna [25%]"},
		{"Tactical Vest",2,"Zaloz kamizelke","Kamizelka taktyczna"},
		{"Tactical Vest [80%]",2,"Zaloz kamizelke","Kamizelka taktyczna [80%]"},
		{"Tactical Vest [60%]",2,"Zaloz kamizelke","Kamizelka taktyczna [60%]"},
		{"Tactical Vest [40%]",2,"Zaloz kamizelke","Kamizelka taktyczna [40%]"},
		{"Tactical Vest [20%]",2,"Zaloz kamizelke","Kamizelka taktyczna [20%]"},
		{"Tactical Vest [10%]",2,"Zaloz kamizelke","Kamizelka taktyczna [10%]"},
	--	{"Coyote Backpack", 5, "Equip Backpack"},
		--{"CMAR Backpack", 6, "Equip Backpack"},
		--[[{"Kamizelka Taktyczna \n",0,'Dequip Kamizelka'},
		{"Kamizelka Taktyczna",3,"Equip Kamizelka"},]]
		{"Night Vision Goggles", 0.1,_,"Google Noktowizyjne"},
		{"Infrared Goggles", 0.1,_,"Google Podczerwieni"},
		{"Map", 0.3,_,'Mapa'},
		{"Box of Matches", 0.1, "Make a Fire","Zapałki"},
		{"Watch", 0.1,_,"Zegarek"},
		{"GPS", 0.3},
		{"Toolbox", 0.5,_,"Zestaw Naprawczy"},
		{"Code card #1",1,_,"Karta kodowa #1"},
		{"Code card #2",1,_,"Karta kodowa #2"},
		{"Code card #3",1,_,"Karta kodowa #3"},
		{"Code card #4",1,_,"Karta kodowa #4"},
		{"Code card #5",1,_,"Karta kodowa #5"},
		{"Code card #6",1,_,"Karta kodowa #6"},
		{"Wrench", 1.5,"Klucz"},
		
};


local h1, h2, h3 = debug.gethook()
debug.sethook()

debug.sethook( _, h1, h2, h3 )


addEvent('onPlayerPitchASmallArmybox',true)
addEventHandler("onPlayerPitchASmallArmybox", root, function(itemName,x,y,z,rx,ry,rz)
if getElementData(source,itemName)<=0 then return end
	setElementData(source, itemName, getElementData(source, itemName) - 1);
	setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
	if itemName=='Small Armybox [D]' then
	setTimer(function(source,xx,xy,xz,xrx,xry,xrz)
		local tent = createObject(964, xx,xy,xz,xrx,xry,xrz);
		setObjectScale(tent, 1);
		local tentCol = createColSphere(xx, xy, xz, 3);
		if getElementData(source,'Moze-Otwierac') then
		local cuboid,grupa = unpack(getElementData(source,'Moze-Otwierac'))
		setElementData(tentCol,'Tent-Otwieranie',grupa)
		end
		attachElements(tentCol, tent, 0, 0, 0);
		setElementData(tentCol, "parent", tent);
		setElementData(tent, "parent", tentCol);
		setElementData(tentCol, "small_armybox[D]", true);
		setElementData(tentCol, "MAX_Slots", 750);
		setElementData(tentCol, "M4A1-S", 10);
		setElementData(tentCol, "G36C", 10);
		setElementData(tentCol, "PKM", 5);
		setElementData(tentCol, "AK-47", 10);
		setElementData(tentCol, "AS50", 10);
		setElementData(tentCol, "PKM Mag", 1000);
		setElementData(tentCol, "AK-47 Mag", 1000);
		setElementData(tentCol, "AS50 Mag", 100);
		setElementData(tentCol, "M4A1-S Mag", 1000);
		setElementData(tentCol, "G36C Mag", 1000);
		setElementData(tentCol, "Beans Can", 40);
		setElementData(tentCol, "Soda Bottle", 40);
		setElementData(tentCol, "Medic Kit", 10);
		setElementData(tentCol, "Medic Bag", 5);
		setElementData(tentCol, "Painkiller", 10);
		setElementData(tentCol, "Morphine", 10);
		setElementData(tentCol, "Tire", 12);
		setElementData(tentCol, "Engine", 3);
		setElementData(tentCol, "Tank Parts", 3);
		setElementData(tentCol, "Military Backpack", 2);
		setElementData(tentCol, "Big Backpack", 5);
		setElementData(tentCol, "Czech Backpack", 10);
		setElementData(tentCol, "Medium Backpack", 15);
		setElementData(tentCol, "Toolbox", 25);
		setElementData(tentCol, "Infrared Goggles", 25);
		setElementData(tentCol, "Night Vision Goggles", 25);
		setElementData(tentCol, "Bandage", 15);
		setElementData(tentCol, "Heat Pack", 15);
		triggerClientEvent(source, "refreshInventoryManual", source);
	end, 2000, 1, source,x,y,z,rx,ry,rz);
	elseif itemName=='Small Armybox [B]' then
	setTimer(function(source,xx,xy,xz,xrx,xry,xrz)
		local tent = createObject(964, xx,xy,xz,xrx,xry,xrz);
		setObjectScale(tent, 1);
		local tentCol = createColSphere(xx, xy, xz, 3);
		if getElementData(source,'Moze-Otwierac') then
		local cuboid,grupa = unpack(getElementData(source,'Moze-Otwierac'))
		setElementData(tentCol,'Tent-Otwieranie',grupa)
		end
		attachElements(tentCol, tent, 0, 0, 0);
		setElementData(tentCol, "parent", tent);
		setElementData(tent, "parent", tentCol);
		setElementData(tentCol, "small_armybox[B]", true);
		setElementData(tentCol, "MAX_Slots", 750);
		setElementData(tentCol, "M4A1-S", 10);
		setElementData(tentCol, "G36C", 10);
		setElementData(tentCol, "PKM", 5);
		setElementData(tentCol, "AK-47", 10);
		setElementData(tentCol, "AS50", 10);
		setElementData(tentCol, "PKM Mag", 1000);
		setElementData(tentCol, "AK-47 Mag", 1000);
		setElementData(tentCol, "AS50 Mag", 100);
		setElementData(tentCol, "M4A1-S Mag", 1000);
		setElementData(tentCol, "G36C Mag", 1000);
		setElementData(tentCol, "Beans Can", 40);
		setElementData(tentCol, "Soda Bottle", 40);
		setElementData(tentCol, "Medic Kit", 15);
		setElementData(tentCol, "Medic Bag", 5);
		setElementData(tentCol, "Painkiller", 10);
		setElementData(tentCol, "Morphine", 10);
		setElementData(tentCol, "Tire", 12);
		setElementData(tentCol, "Engine", 3);
		setElementData(tentCol, "Tank Parts", 3);
		setElementData(tentCol, "Military Backpack", 2);
		setElementData(tentCol, "Big Backpack", 5);
		setElementData(tentCol, "Czech Backpack", 10);
		setElementData(tentCol, "Medium Backpack", 15);
		setElementData(tentCol, "Toolbox", 25);
		setElementData(tentCol, "Infrared Goggles", 25);
		setElementData(tentCol, "Night Vision Goggles", 25);
		setElementData(tentCol, "Bandage", 15);
		setElementData(tentCol, "Heat Pack", 15);
		triggerClientEvent(source, "refreshInventoryManual", source);
	end, 2000, 1, source,x,y,z,rx,ry,rz);
	end
end);



addEvent('onPlayerPitchKontener',true)
addEventHandler("onPlayerPitchKontener", root, function(itemName,x,y,z,rx,ry,rz)
if getElementData(source,itemName)<=0 then return end
	setElementData(source, itemName, getElementData(source, itemName) - 1);
	setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
	setTimer(function(source,xx,xy,xz,xrx,xry,xrz)
		local tent = createObject(2932, xx,xy,xz,xrx,xry,xrz);
		setObjectScale(tent, 1);
		local tentCol = createColSphere(xx, xy, xz, 3);
		if getElementData(source,'Moze-Otwierac') then
		local cuboid,grupa = unpack(getElementData(source,'Moze-Otwierac'))
		setElementData(tentCol,'Tent-Otwieranie',grupa)
		end
		attachElements(tentCol, tent, 0, 0, 0);
		setElementData(tentCol, "parent", tent);
		setElementDimension(tent, getElementDimension(source))
		setElementFrozen(tent, true)
		setElementData(tent, "parent", tentCol);
		setElementData(tentCol, "kontener", true);
		setElementData(tentCol, "MAX_Slots", 3000);
		triggerClientEvent(source, "refreshInventoryManual", source);
	end, 2000, 1, source,x,y,z,rx,ry,rz);
end);

addEvent('onPlayerPitchALargeArmybox',true)
addEventHandler('onPlayerPitchALargeArmybox',root,function(itemName,x,y,z,rx,ry,rz)
if getElementData(source,itemName)<=0 then return end
	setElementData(source, itemName, getElementData(source, itemName) - 1);
	setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
	triggerClientEvent(source, "refreshInventoryManual", source);
	if itemName=="Large Armybox [D]" then
	setTimer(function(source,xx,xy,xz,xrx,xry,xrz)
		local tent = createObject(964, xx,xy,xz,xrx,xry,xrz);
		setObjectScale(tent, 1);
		local tentCol = createColSphere(xx, xy, xz, 3);
		attachElements(tentCol, tent, 0, 0, 0);
		setElementData(tentCol, "parent", tent);
		setElementData(tent, "parent", tentCol);
		setElementData(tentCol, "large Armybox [D]", true);
		setElementData(tentCol, "MAX_Slots", 0);
	end, 2000, 1, source,x,y,z,rx,ry,rz);
	elseif itemName=="Large Armybox [B]" then
	setTimer(function(source,xx,xy,xz,xrx,xry,xrz)
		local tent = createObject(964, xx,xy,xz,xrx,xry,xrz);
		setObjectScale(tent, 1);
		local tentCol = createColSphere(xx, xy, xz, 3);
		attachElements(tentCol, tent, 0, 0, 0);
		setElementData(tentCol, "parent", tent);
		setElementData(tent, "parent", tentCol);
		setElementData(tentCol, "large Armybox [B]", true);
		setElementData(tentCol, "MAX_Slots", 1500);
		setElementData(tentCol, "M4A1-S", 15);
		setElementData(tentCol, "G36C", 15);
		setElementData(tentCol, "AR-15", 5);
		setElementData(tentCol, "ACR", 5);
		setElementData(tentCol, "SCAR-L", 2);
		setElementData(tentCol, "M107", 5);
		setElementData(tentCol, "M14", 5);
		setElementData(tentCol, "AR-15 Mag", 500);
		setElementData(tentCol, "ACR Mag", 500);
		setElementData(tentCol, "SCAR-L Mag", 200);
		setElementData(tentCol, "M107 Mag", 50);
		setElementData(tentCol, "M14 Mag", 75);
		setElementData(tentCol, "PKM", 10);
		setElementData(tentCol, "AK-47", 15);
		setElementData(tentCol, "AS50", 15);
		setElementData(tentCol, "PKM Mag", 1700);
		setElementData(tentCol, "AK-47 Mag", 1500);
		setElementData(tentCol, "AS50 Mag", 175);
		setElementData(tentCol, "M4A1-S Mag", 1500);
		setElementData(tentCol, "G36C Mag", 1500);
		setElementData(tentCol, "Beans Can", 100);
		setElementData(tentCol, "Soda Bottle", 100);
		setElementData(tentCol, "Medic Kit", 30);
		setElementData(tentCol, "Medic Bag", 15);
		setElementData(tentCol, "Painkiller", 35);
		setElementData(tentCol, "Morphine", 35);
		setElementData(tentCol, "Tire", 40);
		setElementData(tentCol, "Engine", 10);
		setElementData(tentCol, "Tank Parts", 10);
		setElementData(tentCol, "Military Backpack", 25);
		setElementData(tentCol, "Big Backpack", 30);
		setElementData(tentCol, "Czech Backpack", 35);
		setElementData(tentCol, "Medium Backpack", 45);
		setElementData(tentCol, "Toolbox", 60);
		setElementData(tentCol, "Infrared Goggles", 60);
		setElementData(tentCol, "Night Vision Goggles", 60);
		setElementData(tentCol, "Bandage", 40);
		setElementData(tentCol, "Heat Pack", 40);
		setElementData(tentCol, "Coyote Backpack", 10);
		setElementData(tentCol, "CMAR Backpack", 5);
	end, 2000, 1, source,x,y,z,rx,ry,rz);
	end
end)

local items = {
[1] = nil,
[2] = nil,
[3] = nil,
[4] = nil,
[5] = nil
}

local Kontenery = dbConnect("sqlite", "Kontenery.db");
if Kontenery then
dbExec(Kontenery, "CREATE TABLE IF NOT EXISTS `kontener` (model, x, y, z, rX, rY, rZ, slots, scale, items, id,gang, dim)");
end

local small_armybox_d = dbConnect("sqlite", "SmallArmyBoxD.db");
if small_armybox_d then
dbExec(small_armybox_d, "CREATE TABLE IF NOT EXISTS `armybox` (model, x, y, z, rX, rY, rZ, slots, scale, items, id,gang)");
end

local small_armybox_b = dbConnect("sqlite", "SmallArmyBoxB.db");
if small_armybox_b then
dbExec(small_armybox_b, "CREATE TABLE IF NOT EXISTS `armybox` (model, x, y, z, rX, rY, rZ, slots, scale, items, id,gang)");
end

local large_armybox_d = dbConnect("sqlite", "LargeArmyBoxD.db");
if large_armybox_d then
dbExec(large_armybox_d, "CREATE TABLE IF NOT EXISTS `armybox` (model, x, y, z, rX, rY, rZ, slots, scale, items, id,gang)");
end

local large_armybox_b = dbConnect("sqlite", "LargeArmyBoxB.db");
if large_armybox_b then
dbExec(large_armybox_b, "CREATE TABLE IF NOT EXISTS `armybox` (model, x, y, z, rX, rY, rZ, slots, scale, items, id,gang)");
end


function backup_large_d() 
dbExec(large_armybox_d, "DELETE FROM `armybox`");
for _,col in ipairs(getElementsByType("colshape")) do
if getElementData(col,'large Armybox [D]') then
local tent = getElementData(col, "parent");
if tent then
items[4] = {}
local x,y,z = getElementPosition(tent)
local rX,rY,rZ = getElementRotation(tent);
for _,item in pairs(backupItemsTable) do
local quantity = getElementData(col, item[1]) or 0;
if (quantity > 0) then
table.insert(items[4], {item[1], quantity});
end
end
local dddddddd = (getElementData(col,'Tent-Otwieranie') or false)
--outputChatBox(tostring(dddddddd),root)
dbExec(large_armybox_d, "INSERT INTO `armybox` (model, x, y, z, rX, rY, rZ, slots, scale, items, id,gang) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)", 
getElementModel(tent), x, y, z, rX, rY, rZ, getElementData(col, "MAX_Slots") or 100, getObjectScale(tent), toJSON(items[4]), 0,dddddddd);
end
end
end
end

function backup_large_b() 
dbExec(large_armybox_b, "DELETE FROM `armybox`");
for _,col in ipairs(getElementsByType("colshape")) do
if getElementData(col,'large Armybox [B]') then
local tent = getElementData(col, "parent");
if tent then
items[5] = {}
local x,y,z = getElementPosition(tent)
local rX,rY,rZ = getElementRotation(tent);
for _,item in pairs(backupItemsTable) do
local quantity = getElementData(col, item[1]) or 0;
if (quantity > 0) then
table.insert(items[5], {item[1], quantity});
end
end
local dddddddd = (getElementData(col,'Tent-Otwieranie') or false)
--outputChatBox(tostring(dddddddd),root)
dbExec(large_armybox_b, "INSERT INTO `armybox` (model, x, y, z, rX, rY, rZ, slots, scale, items, id,gang) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)", 
getElementModel(tent), x, y, z, rX, rY, rZ, getElementData(col, "MAX_Slots") or 100, getObjectScale(tent), toJSON(items[5]), 0,dddddddd);
end
end
end
end



function backup_kontener() 
	dbExec(Kontenery, "DELETE FROM `kontener`");
	local x_kontenery = 0
	backupItemsTable = exports.DayZ_core:getItemTable()
	for _,col in ipairs(getElementsByType("colshape")) do
		if getElementData(col,'kontener') then
			local tent = getElementData(col, "parent");
			if tent then
				items[1] = {}
				local x,y,z = getElementPosition(tent)
				local rX,rY,rZ = getElementRotation(tent);
				for _,item in pairs(backupItemsTable) do
					local quantity = getElementData(col, item[1]) or 0;
					if (quantity > 0) then
						table.insert(items[1], {item[1], quantity});
					end
				end
				local dddddddd = (getElementData(col,'Tent-Otwieranie') or false)
				--outputChatBox(tostring(dddddddd),root)
				x_kontenery = x_kontenery + 1
				dbExec(Kontenery, "INSERT INTO `kontener` (model, x, y, z, rX, rY, rZ, slots, scale, items, id,gang, dim) VALUES(?,?,?,?,?,?,?,?,?,?,?,?, ?)", 
				getElementModel(tent), x, y, z, rX, rY, rZ, getElementData(col, "MAX_Slots") or 100, getObjectScale(tent), toJSON(items[1]), 0,dddddddd, getElementDimension(tent));
			end
		end
	end
	print("Zapisano: "..x_kontenery.. " kontenerów")
end

function backup_small_d() 
	dbExec(small_armybox_d, "DELETE FROM `armybox`");
	for _,col in ipairs(getElementsByType("colshape")) do
		if getElementData(col,'small_armybox[D]') then
			local tent = getElementData(col, "parent");
			if tent then
				items[2] = {}
				local x,y,z = getElementPosition(tent)
				local rX,rY,rZ = getElementRotation(tent);
				for _,item in pairs(backupItemsTable) do
					local quantity = getElementData(col, item[1]) or 0;
					if (quantity > 0) then
						table.insert(items[2], {item[1], quantity});
					end
				end
				local dddddddd = (getElementData(col,'Tent-Otwieranie') or false)
				--outputChatBox(tostring(dddddddd),root)
				dbExec(small_armybox_d, "INSERT INTO `armybox` (model, x, y, z, rX, rY, rZ, slots, scale, items, id,gang) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)", 
				getElementModel(tent), x, y, z, rX, rY, rZ, getElementData(col, "MAX_Slots") or 100, getObjectScale(tent), toJSON(items[2]), 0,dddddddd);
			end
		end
	end
end

function backup_small_b() 
	dbExec(small_armybox_b, "DELETE FROM `armybox`");
	for _,col in ipairs(getElementsByType("colshape")) do
		if getElementData(col,'small_armybox[B]') then
			local tent = getElementData(col, "parent");
			if tent then
				items[3] = {}
				local x,y,z = getElementPosition(tent)
				local rX,rY,rZ = getElementRotation(tent);
				for _,item in pairs(backupItemsTable) do
					local quantity = getElementData(col, item[1]) or 0;
					if (quantity > 0) then
						table.insert(items[3], {item[1], quantity});
					end
				end
				local dddddddd = (getElementData(col,'Tent-Otwieranie') or false)
				--outputChatBox(tostring(dddddddd),root)
				dbExec(small_armybox_b, "INSERT INTO `armybox` (model, x, y, z, rX, rY, rZ, slots, scale, items, id,gang) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)", 
				getElementModel(tent), x, y, z, rX, rY, rZ, getElementData(col, "MAX_Slots") or 100, getObjectScale(tent), toJSON(items[3]), 0,dddddddd);
			end
		end
	end
end

function loadBackup_kontener()
	local p2 = dbPoll(dbQuery(Kontenery, "SELECT * FROM `kontener`"), -1);
	if (#p2 > 0) then
		for _,d in pairs(p2) do
		--outputChatBox(d['gang'],root)
			createDayzTent(d["model"], d["x"], d["y"], d["z"], d["rX"], d["rY"], d["rZ"], d["slots"], d["scale"], d["items"],'kontener',d['gang']);
		end
	end
end

function loadBackup_small_d()
	local p2 = dbPoll(dbQuery(small_armybox_d, "SELECT * FROM `armybox`"), -1);
	if (#p2 > 0) then
		for _,d in pairs(p2) do
		--outputChatBox(d['gang'],root)
			createDayzTent(d["model"], d["x"], d["y"], d["z"], d["rX"], d["rY"], d["rZ"], d["slots"], d["scale"], d["items"],"small_armybox[D]",d['gang']);
		end
	end
end

function loadBackup_small_b()
	local p2 = dbPoll(dbQuery(small_armybox_b, "SELECT * FROM `armybox`"), -1);
	if (#p2 > 0) then
		for _,d in pairs(p2) do
		--outputChatBox(d['gang'],root)
			createDayzTent(d["model"], d["x"], d["y"], d["z"], d["rX"], d["rY"], d["rZ"], d["slots"], d["scale"], d["items"],"small_armybox[B]",d['gang']);
		end
	end
end


function loadBackup_large_d()
	local p2 = dbPoll(dbQuery(large_armybox_d, "SELECT * FROM `armybox`"), -1);
	if (#p2 > 0) then
		for _,d in pairs(p2) do
		--outputChatBox(d['gang'],root)
			createDayzTent(d["model"], d["x"], d["y"], d["z"], d["rX"], d["rY"], d["rZ"], d["slots"], d["scale"], d["items"],"large Armybox [D]",d['gang']);
		end
	end
end

function loadBackup_large_b()
	local p2 = dbPoll(dbQuery(large_armybox_b, "SELECT * FROM `armybox`"), -1);
	if (#p2 > 0) then
		for _,d in pairs(p2) do
		--outputChatBox(d['gang'],root)
			createDayzTent(d["model"], d["x"], d["y"], d["z"], d["rX"], d["rY"], d["rZ"], d["slots"], d["scale"], d["items"],"large Armybox [B]",d['gang']);
		end
	end
end

function createDayzTent(model, x, y, z, rX, rY, rZ, slots, scale, items,getData,genk)
	local tent = createObject(model, x, y, z);
	local tentCol = createColSphere(x, y, z, 3);
	setElementRotation(tent, rX, rY, rZ);
	setObjectScale(tent, scale);
	attachElements(tentCol, tent);
	setElementFrozen(tent, true)
	if model==2932 then
	setElementFrozen(tent,true)
	end
	if genk==0 then
	setElementData(tentCol,'Tent-Otwieranie',false)
	else
	setElementData(tentCol,'Tent-Otwieranie',genk)
	end
	setElementData(tentCol, "parent", tent);
	setElementData(tent, "parent", tentCol);
	setElementData(tentCol,getData, true);
	setElementData(tentCol, "MAX_Slots", slots);
	for _,v in ipairs(fromJSON(items)) do
		setElementData(tentCol, v[1], v[2]);
	end
end

setTimer(function() 
backup_kontener();
backup_large_b();
backup_large_d();
backup_small_b();
backup_small_d();
end,1800000+1800000,0)
addCommandHandler("dobackup", function(player)
	if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup("Admin")) then
		backup_kontener();
		backup_large_b();
		backup_large_d();
		backup_small_b();
		backup_small_d();
	end
end);

addCommandHandler("lobackup", function(player)
	if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup("Admin")) then
	for _,v in pairs(getElementsByType("colshape",resourceRoot)) do
	local col = getElementData(v, "parent");
	if col then
	destroyElement(v);
	destroyElement(col);
	end
	end
		loadBackup_kontener();
		loadBackup_large_b();
		loadBackup_large_d();
		loadBackup_small_b();
		loadBackup_small_d();
	end
end);
