setElementID(resourceRoot,'DayZ_Inventory')

local id_datas = {
	"hideInventoryManual",
	"refreshInventoryManual",
	"refreshLootManual",
}
for i,v in pairs(id_datas) do
	setElementData(resourceRoot,v,resourceRoot)
end

local safe_gui = {}
local pitch_units

local inventoryItems = {
	[1] = {
		{"M4A1-S \n", 0},
		{"M4A1 \n", 0},
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
		{"AA-12 \n", 0},
		{"SPAZ-12 Combat Shotgun \n", 0},
		{"Sawn-Off Shotgun \n", 0},
		--{"AKS-74U \n", 0},
		{"Lee Enfield \n", 0},
		--{"DMR \n", 0},
		--{"Cheytac M200 \n", 0},
		{"Scar-L",3},
		--{"AS50 \n", 0},
		{"AWP \n", 0},
		{"SVD Dragunov \n", 0},
		{"Barrett M107 \n", 0},
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
		{"AA-12", 3},
		{"SPAZ-12 Combat Shotgun", 3},
		{"Sawn-Off Shotgun", 3},
	--	{"AKS-74U", 3},
		{"Lee Enfield", 3},
		--{"DMR", 3},
		--{"Cheytac M200", 3},
		--{"AS50", 3},
		{"AWP", 3},
		{"SVD Dragunov", 2},
		{"Barrett M107", 4},
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
	--	{"Grenade \n", 0,_,"Granat"},
		{"Flara \n",0,_,"Flara"},
		{"Binoculars \n", 0,_,"Lornetka"},
	--	{"Grenade", 1,_,"Granat"},
		{"Flara", 1,_,"Flara"},
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
		{"AA-12 Mag", 0.1},
		{"SVD Dragunov Mag", 0.2},
		{"Barrett M107 Mag", 0.3},
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
		{"Mission Bag",0,_,"Torba Faburalna"},
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
		{"Sandbag",2,"Build a sandbag","Worki z piaskiem"},
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
		{"Kontener",10,"Pitch a kontener"},
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
		-- tlumik
		--{"Silencer",1,"Zaloz tlumik","Tłumik"},
		{"Code card #1",1,_,"Karta kodowa #1"},
		{"Code card #2",1,_,"Karta kodowa #2"},
		{"Code card #3",1,_,"Karta kodowa #3"},
		{"Code card #4",1,_,"Karta kodowa #4"},
		{"Code card #5",1,_,"Karta kodowa #5"},
		{"Code card #6",1,_,"Karta kodowa #6"},
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
	{"M1911 Mag", "M1911", 22},
	{"M9 SD Mag", "M9 SD", 23},
	{"Desert Eagle Mag", "Desert Eagle", 24},
	{"PDW Mag", "PDW", 28},
	{"MP5A5 Mag", "MP5A5", 29},
	{"AKS-74U Mag", "AKS-74U", 31},
	{"AK-47 Mag", "AK-47", 31},
	{"Scar-L Mag","Scar-L",31},
	{"M16A4 Mag", "M16A4", 31},
	{"M4A1-S Mag", "M4A1-S", 31},
	{"M4A1-S Mag", "M4A1", 31},
	{"G36c Mag", "G36C", 31},
	{"MK 48 Mod 0 Mag", "MK 48 Mod 0", 30},
	{"M60 Mag", "M60", 30},
	{"PKP Pecheneg Mag", "PKP Pecheneg", 30},
	{"MG-34 Mag", "MG-34", 30},
	{"SA-58V ACOG Mag", "SA-58V ACOG", 31},
	{"1866 Slug", "Winchester 1866", 25},
	{"AA-12 Mag", "AA-12", 26},
	{"2Rnd. Slug", "Sawn-Off Shotgun", 26},
	{"SPAZ-12 Pellet", "SPAZ-12 Combat Shotgun", 27},
	{"DMR Mag", "DMR", 34},
	{"Cheytac M200 Mag", "Cheytac M200", 34},
	{"AS50 Mag", "AS50", 34},
	{"AWP Mag", "AWP", 34},
	{"Barrett M107 Mag", "Barrett M107", 34},
	{"SVD Dragunov Mag", "SVD Dragunov", 34},
	{"Mosin 9130 Mag", "Mosin 9130", 34},
	{"M24 Mag", "M24", 34},
	{"M107 Mag", "M107", 34},
	{"SVD Dragunov Camo Mag", "SVD Dragunov Camo", 34},
	{"Lee Enfield Mag", "Lee Enfield", 33},
	{"Grenade \n", "Grenade \n", 16},
	{"Flara \n", "Flara \n", 17}, -- nie jestem pewny czy to tu ma byc
	{"Parachute \n",'Parachute \n',46},
};

local scale = 1
local chujCiWCyce = {guiGetScreenSize()}
if chujCiWCyce[2]>768 then
	scale  = chujCiWCyce[2]/768
end

local font_ = "default"

local keyTable = {
	['PL'] = {
		[1] = "-> Broń główna",
		[2] = "-> Broń dodatkowa",
		[3] = "-> Broń specjalna",
		[4] = "-> Amunicja",
		[5] = "-> Jedzenie",
		[6] = "-> Plecaki",
		[7] = "-> Przebrania",
		[8] = "-> Przedmioty",
		[9] = "-> Narzędzia"
	},
	['ENG'] = {
		[1] = "-> Primary Weapon",
		[2] = "-> Secondary Weapon",
		[3] = "-> Specially Weapon",
		[4] = "-> Ammo",
		[5] = "-> Food",
		[6] = "-> Backpacks",
		[7] = "-> Suits",
		[8] = "-> Items",
		[9] = "-> Toolbelt"
	},
};

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
	{"Grenade \n", 3, "Grenade"},
	{"Flara \n", 3, "Flara"},
	{"Binoculars \n", 3, "Binoculars"}
};

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
        {476, 2, 1, 1, 80}, -- rustler
	{426, 4, 1, 1, 200}, -- premier
	{432, 6, 1, 1, 200}, -- rhino
        {573, 4, 1, 1, 210}, -- dune


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
        {476, 80}, -- rustler
	{426, 200}, -- premier
	{432, 200}, -- rhino
        {573, 210}, -- dune

};

local inv = {window={},label={},grid={},col={},img={},button={},flagi={}};
local headline = {};
local gridlistItems = {};
local buttonItems = {};
local playerFire = {};
local fireCounter = 0;
local rwindow = {};
local Type = "";
local jezyk = "PL"

local safe_haslo_podane = false
setElementData(localPlayer,'Jezyk_Gry',jezyk)

local dostepne_jezyki = {
	"PL",
	"ENG",
}

local typFlagi = xmlLoadFile("Flaga.xml")
if not typFlagi then
	typFlagi = xmlCreateFile("Flaga.xml","Flaga")
	xmlNodeSetAttribute(typFlagi,"Jezyk","PL")
	xmlSaveFile(typFlagi)
else
	local atrybut = tostring(xmlNodeGetAttribute(typFlagi,"Jezyk"))
	local zgodnosc = false
	for i,v in pairs(dostepne_jezyki) do
		if v==atrybut then
			zgodnosc = true
		end
	end
	if not zgodnosc then
		xmlNodeSetAttribute(typFlagi,'Jezyk',"PL")
		xmlSaveFile(typFlagi)
		jezyk = "PL"
	else
		setElementData(localPlayer,'Jezyk_Gry',atrybut)
		jezyk = atrybut
	end
end

function getAllInventoryItems()
	return {inventoryItems,{1,2,3,4,5,6,7,8,9},keyTable[jezyk]};
end


function zwrocCalaTablice()
	local itemy = ""
	local utworzone_gety = {}
	for k,_ in pairs({1,2,3,4,5,6,7,8,9}) do
		if not utworzone_gety[k] then
			itemy = itemy.."<h3>"..keyTable[jezyk][k].."</h3> <br>"
			utworzone_gety[k] = true
		end
		for i,v in pairs(inventoryItems[k]) do
			if not v[1]:find(" \n") then
				
				itemy = itemy..(jezyk == "PL" and (v[4] and v[4])  or v[1]).. " <br>"
			end
		end
	end
	return itemy
end


addEvent("hideInventoryManual", true);
addEvent("refreshInventoryManual", true);
addEvent("refreshLootManual", true);
addEvent("onPlayerMoveItemOutOFInventory", true);
addEvent("onPlayerMoveItemInInventory", true);

inv.window[1] = guiCreateWindow(0.15, 0.28, 0.72, 0.63, "", true);

obraz = guiCreateStaticImage(0.0,0,1,1,'inventory1.png',true,inv.window[1])

guiSetAlpha(inv.window[1],0.85)

inv.flagi[1] = guiCreateStaticImage(0,0.95,0.05,0.05,'flaga_polski.png',true,obraz)
inv.flagi[2] = guiCreateStaticImage(0.06,0.95,0.05,0.05,'flaga_eng.png',true,obraz)

inv.label[1] = guiCreateLabel(0.03, 0.05, 0.34, 0.09, "Pusto", true, obraz);
inv.label[2] = guiCreateLabel(0.63, 0.05, 0.34, 0.09, "Ekwipunek", true, obraz);
inv.label[3] = guiCreateLabel(0.655, 0.94, 0.29, 0.04, "Sloty:",true, obraz);
inv.label[4] = guiCreateLabel(0.0535, 0.94, 0.29, 0.04, "Sloty:", true, obraz);
for i = 1,2 do
	guiLabelSetColor(inv.label[i],0,200,0)
end
inv.grid[1] = guiCreateGridList(0.01, 0.10, 0.39, 0.83, true, obraz);
inv.grid[2] = guiCreateGridList(0.60, 0.10, 0.39, 0.83, true, obraz);
guiGridListSetSortingEnabled ( inv.grid[1], false )
guiSetAlpha(inv.grid[1],0.8)
guiSetAlpha(inv.grid[2],0.8)
--guiSetProperty(inv.grid[1],"InheritsAlpha","false")
--guiSetProperty(inv.grid[2],"InheritsAlpha","false")
guiGridListSetSortingEnabled ( inv.grid[2], false )
inv.col[1] = guiGridListAddColumn(inv.grid[1], "Loot", 0.7);
inv.col[2] = guiGridListAddColumn(inv.grid[1], "", 0.2);
inv.col[3] = guiGridListAddColumn(inv.grid[2], "Ekwipunek", 0.6);
inv.col[4] = guiGridListAddColumn(inv.grid[2], "", 0.2);
inv.col[5] = guiGridListAddColumn(inv.grid[2],"",0.1)
inv.button[1] = guiCreateButton(0.4, 0.17, 0.07, 0.69, "»»", true, obraz);
inv.button[2] = guiCreateButton(0.53, 0.17, 0.07, 0.69, "««", true, obraz);
inv.button[3] = guiCreateButton(0, 0, 0.0, 0.0, "", true, obraz);
--guiSetProperty(inv.button[1],"InheritsAlpha","false")
--guiSetProperty(inv.button[2],"InheritsAlpha","false")

guiSetAlpha(inv.button[1],0.95)
guiSetAlpha(inv.button[2],0.95)

guiSetEnabled(inv.button[3],false)
inv.img[1] = guiCreateStaticImage(0, 0, 0.05, 0.0215, "images/scrollmenu.png", true);
inv.label[5] = guiCreateLabel(0, 0, 1, 1, "", true, inv.img[1]);
button_info = guiCreateLabel(0.42, 0.01, 0.15, 0.13, "", true,obraz)
guiLabelSetHorizontalAlign(button_info,'center',true)
guiLabelSetVerticalAlign(button_info,'center')
guiSetAlpha(inv.label[5],0.90)
guiSetAlpha(button_info,0.90)
--[[
addEventHandler("onClientMouseEnter",inv.button[1],function()
	guiSetAlpha(source,0.8)
end,false)

addEventHandler("onClientMouseLeave",inv.button[1],function()
	guiSetAlpha(source,0.7)
end,false)

addEventHandler("onClientMouseLeave",inv.button[2],function()
	guiSetAlpha(source,0.7)
end,false)

addEventHandler("onClientMouseEnter",inv.button[2],function()
	guiSetAlpha(source,0.8)
end,false)
]]

hide_tent = guiCreateCheckBox(0.00, 0.04, 0.09, 0.03, "Ukryj tenta", false, true, obraz)    
guiSetVisible(hide_tent,false)
guiSetVisible(inv.window[1], false);
guiSetVisible(inv.img[1], false);
guiWindowSetSizable(inv.window[1], false);
guiWindowSetMovable(inv.window[1], false);

local acctualy_changed = "0"
local max_obrazek = 49
craft_menu = guiCreateStaticImage(0.465,0.89,0.07,0.1,"krefting/kreft.png",true,obraz)
guiSetAlpha(craft_menu,1)
guiSetProperty(craft_menu,"InheritsAlpha","false")





function isCurrentColIsTent()
if isPlayerInLoot() then
	if getElementData(isPlayerInLoot(),'tent') then
		return true
	end
end

	return false
end

function isCurrentColIsKontener()
if isPlayerInLoot() then
	if getElementData(isPlayerInLoot(),'helicrash') then
		return true
	end
end
	return false
end

function isCurrentColHide()
local col = isCurrentColIsTent()
if col then
	if getElementData(isPlayerInLoot(),'hide-tent') then
		return true
	end
end
	return false
end

for i = 1, 5 do
	guiLabelSetHorizontalAlign(inv.label[i], "center");
	if (i ~= 1 and i ~= 2) then
		guiLabelSetVerticalAlign(inv.label[i], "center");
	end
	guiSetFont(inv.label[i], "default-bold-small");
end



addEventHandler('onClientGUIClick',hide_tent,function()
	if isCurrentColIsTent() then
		if guiCheckBoxGetSelected(hide_tent) then
			setElementData(isPlayerInLoot(),'hide-tent',true)
		else
			setElementData(isPlayerInLoot(),'hide-tent',false)
		end
		return true
	end
	return false
end,false)


for i=1,3 do
	bindKey(tostring(i),'down',function(key)
		if not getElementData(localPlayer,'Otwarte_Inv') then return end
		local number = tonumber(key)
		local itemName = guiGridListGetItemData(inv.grid[2], guiGridListGetSelectedItem(inv.grid[2]), 1);
		local _,itemInfo = getInventoryInfosForRightClickMenu(itemName);
		if not itemInfo then return end
		if not itemName then exports.DayZ_fast_item_bar:SetItemToFastBar(number,false) return end
		exports.DayZ_fast_item_bar:SetItemToFastBar(number,itemName)
	end)
end

bindKey("j", "down", function(key, keyState)
	if getElementData(localPlayer, "logedin") then
	if getElementData(localPlayer, "block") == true then return end	
		if (keyState == "down") then
			--refreshLoot()
			guiGridListSetColumnTitle(inv.grid[1],1,"Loot")
			guiSetVisible(inv.window[1], not guiGetVisible(inv.window[1]));
			guiBringToFront(inv.flagi[1])
			guiBringToFront(inv.window[1])
			guiGridListSetColumnWidth(inv.grid[1],1,0.7,true)
			guiGridListSetColumnWidth(inv.grid[1],2,0.2,true)
			
			guiBringToFront(inv.flagi[2])
			setElementData(localPlayer,'Otwarte_Inv',guiGetVisible(inv.window[1]))
			if not guiGetVisible(inv.window[1]) then
				showCursor(false)
				guiSetVisible(safe_gui['Window'],false)
			else
				showCursor(true)
				if isPlayerInLoot() and getElementData(isPlayerInLoot(),'safe') then
					safe_haslo_podane = false
					guiGridListClear(inv.grid[1])
					pokazMenuWpisywaniaHasla(1)
				else
					safe_haslo_podane = true
					refreshLoot()
				end
			end
			if isPlayerInLoot() and not isElement(isPlayerInLoot()) then
				setElementData(localPlayer, "loot", false);
				setElementData(localPlayer, "currentCol", false);
			end
			refreshInventory();
			setElementData(localPlayer,'Craftuje',false)
			if (guiGetVisible(inv.window[1]) == true) then
				--onClientOpenInventoryStopMenu();
			else
				hideRightClickInventoryMenu();
			end
			guiSetVisible(hide_tent,false)
			if isPlayerInLoot() then 
			if getElementData(isPlayerInLoot(),'Tent-Otwieranie') then
				if (getElementData(localPlayer,'Moze-Otwierac') and getElementData(isPlayerInLoot(),'Tent-Otwieranie')==getElementData(localPlayer,'Moze-Otwierac')[2]) or getElementData(localPlayer,'Administrator-Open') then
					if isCurrentColIsTent() then
						guiSetVisible(hide_tent,true)
						guiCheckBoxSetSelected(hide_tent,isCurrentColHide())
					end
					if not getElementData(isPlayerInLoot(),"safe") then
						refreshLoot(getElementData(localPlayer, "currentCol"), getElementData(localPlayer, "lootname"));
					end
				end
				else
				if isCurrentColIsTent() then
					guiSetVisible(hide_tent,true)
					guiCheckBoxSetSelected(hide_tent,isCurrentColHide())
				end
				if not getElementData(isPlayerInLoot(),'safe') then
					refreshLoot(getElementData(localPlayer, "currentCol"), getElementData(localPlayer, "lootname"));
				end
			end
				
			end
		end
	end 
end);

addEventHandler('onClientGUIClick',inv.flagi[1],function(state)
	if jezyk~="PL" then
		jezyk = "PL"
		refreshTooltips()
		setElementData(localPlayer,'Jezyk_Gry',"PL")
		xmlNodeSetAttribute(typFlagi,'Jezyk','PL')
		xmlSaveFile(typFlagi)
		refreshInventory()
		refreshLoot()
	end
end,false)

addEventHandler('onClientGUIClick',inv.flagi[2],function(state)
	if jezyk~="ENG" then
		jezyk = "ENG"
		refreshTooltips()
		setElementData(localPlayer,'Jezyk_Gry',"ENG")
		xmlNodeSetAttribute(typFlagi,'Jezyk','ENG')
		xmlSaveFile(typFlagi)
		refreshInventory()
		refreshLoot()
	end
end,false)

function getWeaponAmmoType(weaponName)
	for _,v in ipairs(weaponAmmoTable) do
		if (weaponName == v[2]) then return v[1], v[3]; end
	end
	return false, false;
end

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

function getEquipedFromName(weapon)
	for _,v in ipairs(weaponToSlot) do
		if (weapon == v[3]) then
			return v[1];
		end
	end
end

function showInventoryManual()
	guiSetVisible(inv.window[1], not guiGetVisible(inv.window[1]));
	showCursor(not isCursorShowing());
	refreshInventory();
	if (guiGetVisible(inv.window[1]) == true) then
		onClientOpenInventoryStopMenu();
	end
end


local craftowanie = {
	{"Bandage,Bandage,Bandage",nil,"Medic Kit",1, slownie = "Bandage x3 = Medic Kit x1"},
	{"Bandage,Painkiller,Morphine",nil,"Medic Kit",1, slownie = "Bandage + Painkiller + Morphine = Medic Kit x1"},
	{"Blood Bag,Bandage",nil,"Medic Kit",1, slownie = "Blood Bag + Bandage = Medic Kit x1"},
	{"Medic Kit,Medic Kit",nil,"Medic Bag",1, slownie = "Medic Kit x2 = Medic Bag x1"},
	{"Glass,Glass,Glass,Glass,Metal,Metal,Metal,Metal","Toolbox","Bulletproof Glass",1, slownie = "Glass x4 + Metal x4 (Toolbox) = Bulletproof Glass x1"},
	{"Metal,Metal,Metal,Metal,Metal,Metal,Metal,Metal",nil,"Lista Metalu",1, slownie = "Metal x8 = Lista Metalu x1"},
}


local jezyk_to_cos = {
	['PL'] = {
		['Sloty'] = "Sloty",
		['Pusto'] = "Pusto",
		['Glowny Inventory'] = "Ekwipunek",
		['Pełny Loot'] = "Lutowisko jest pełne",
		['Brak Miejsca'] = "Posiadasz za mało miejsca w ekwipunku",
		['Pełny Inwentaż'] = "Ekwipunek jest pełny",
		['Error Item'] = "Błąd! Próbujesz użyć item który nie istnieje",
		['Craft_header'] = "Panel wytwarzania",
		['Cant drop'] = "* Nie możesz tego wyrzucić",
		['pitch_car'] = "Użyj #eb2828[Scrolla]#ffffff żeby ustawić rotacje.\nAby anulować stawianie pojazdu skorzystaj z #eb2828[BackSpace]#ffffff.\nDo postawienia pojazdu użyj #eb2828[Enter]#ffffff.",
	},
	["ENG"] = {
		['Glowny Inventory'] = "Inventory",
		["Sloty"] = "Slots",
		['Pusto'] = "Empty",
		["Pełny Loot"] = "Loot is full",
		['Brak Miejsca'] = "Not enough space",
		['Pełny Inwentaż'] = "Inventory is full",
		['Error Item'] = "Error! You try to use item who isn't exists",
		['Craft_header'] = "Crafting Menu",
		['Cant drop'] = "* You can't drop this",
		['pitch_car'] = "Use a #eb2828[Scroll]#ffffff to set the rotation.\nTo cancel operation, use #eb2828[BackSpace]#ffffff.\nUse #eb2828[Enter]#ffffff to park the vehicle.",
	},
}


function setInventoryTextes()
	guiGridListSetColumnWidth(inv.grid[1],1,2,true)
	--guiGridListSetColumnWidth(inv.grid[1],2,0,true)
	guiGridListClear(inv.grid[1])
	guiSetVisible(hide_tent,false)
	guiSetText(inv.label[1], jezyk_to_cos[jezyk]["Craft_header"]);
	guiSetText(inv.label[4], "0/0");
	if jezyk =="PL" then
		guiGridListSetColumnTitle(inv.grid[1],1,"Craftuj klikając >> [ zużywa (wymaga) = otrzymujesz]")
	else
		guiGridListSetColumnTitle(inv.grid[1],1,"Craft by clicking \">>\" [ consumes (requires) = Receive]")
	end
	for i,v in pairs(craftowanie) do
		local row = guiGridListAddRow(inv.grid[1])
		--local wymagany = " ("..(v[2] or "")..") "
		--local tekst = string.gsub(v[1],","," + ")..wymagany.." = "..v[3].." x"..v[4]
		local tekst = v.slownie
		guiGridListSetItemText(inv.grid[1],row,1,tekst,false,false)
		local stara_paka = split(v[1],",")
		local wymogi = {}
		wymogi.potrzebne = stara_paka
		wymogi.wymagane = v[2]
		wymogi.wytworzy = v[3]
		wymogi.ilosc_otrzymana = v[4]
		guiGridListSetItemData(inv.grid[1],row,1,toJSON(wymogi))
		guiGridListSetItemColor(inv.grid[1],row,1,0,255,0)
	end
end


local jezyki_tooltips = {
	['PL'] = {
		--[inv.button[1]] = "Podnieś/wycraftuj przedmiot",
		--[inv.button[2]] = "Wyrzuć/przenieś przedmiot",
		[craft_menu] = "Krafting",
		[inv.flagi[1]] = "Ustaw język na Polski",
		[inv.flagi[2]] = "Ustaw język na Angielski",
	},
	['ENG'] = {
		--[inv.button[1]] = "Drop/craft item",
		--[inv.button[2]] = "Drop item",
		[craft_menu] = "Crafting Menu",
		[inv.flagi[1]] = "Set language to Polish",
		[inv.flagi[2]] = "Set language to English",
	},
}

function refreshTooltips()
	for i,v in pairs(jezyki_tooltips[jezyk]) do
		setElementData(i,"tooltip-text",v, false)
	end
end
refreshTooltips()

addEventHandler("onClientGUIClick",craft_menu,function(state)
	if state ~= "left" then return end
	setInventoryTextes()
	setElementData(localPlayer,'Craftuje',true)
end,false)

function hideInventoryManual()
	guiSetVisible(inv.window[1], false);
	showCursor(false);
	hideRightClickInventoryMenu();
end
addEventHandler("hideInventoryManual", root, hideInventoryManual);

function refreshInventoryManual()
	refreshInventory();
end
addEventHandler("refreshInventoryManual", root, refreshInventoryManual);

function refreshLootManual(loot)
	refreshLoot(loot);
end
addEventHandler("refreshLootManual", root, refreshLootManual);


local timers_inventory = {}

local last_columns_inventory = {0,0}

local pseudo_rows = {
	["PL"] ={
		{1,1,"Bronie"},
		{2,2,"Bronie"},
		{3,3,"Bronie"},
	},
	["ENG"] = {
		{1,1,"Weapons"},
		{2,2,"Weapons"},
		{3,3,"Weapons"},
	},
}


local plecaki = {
	[14]=
	{
		["PL"] = "Plecak ACU",
		["ENG"] = "Assault Pack (ACU)",
	},
	[20]=
	{
		["PL"] = "Torba",
		["ENG"] = "Bag",
	},
	[32]={
		['PL'] = "Plecak Alice",
		["ENG"] = "Alice Pack",
	},
	[42]={
		["PL"] = "Plecak Górski",
		["ENG"] = "Mountain Backpack",
	},
	[52]={
		['PL'] = "Plecak Czech",
		['ENG'] = "Czech Backpack",
	},
	[62]={
		['PL'] = 'Plecak Kojot',
		['ENG'] = "Coyote Backpack",
	},
	[72]={
		['PL'] = "Plecak Militarny",
		['ENG'] = "Military Backpack",
	},
	[92]="CMAR Backpack",  
}


function getCarsOwned(cars)
	local my_cars = {}
	for i, v in pairs(getElementsByType("vehicle")) do
		local id = getElementData(v, "Auto-ID")
		if cars[id] then
			table.insert(my_cars, v)
		end
	end
	return my_cars
end

function getElementZoneName(element) 
	return getZoneName(getElementPosition(element))
end

function refreshInventory()
	if (inv.col[3]) then
		guiSetText(inv.label[2],jezyk_to_cos[jezyk]['Glowny Inventory'])
		if isTimer(timers_inventory[1]) then
			killTimer(timers_inventory[1])
			--guiGridListSetSelectedItem(inv.grid[2],last_columns_inventory[1],last_columns_inventory[2])
		end
		if isTimer(timers_inventory[2]) then
			killTimer(timers_inventory[2])
			--if guiGridListGetSelectedItem(inv.grid[2])~=Vector2(last_columns_inventory[1],last_columns_inventory[2]) then
			--	guiGridListSetSelectedItem(inv.grid[2],last_columns_inventory[1],last_columns_inventory[2])
			--end
		end
		local row1,column1 = guiGridListGetSelectedItem(inv.grid[2])
		local bylo
		local pod_kategorie = {}
		guiGridListClear(inv.grid[2]);
		for i,v in pairs({1,2,3,4,5,6,7,8,9}) do
			if i == 7 and not bylo then
				bylo = true
				if getElementMaxSlots(localPlayer) > 8 then
					local row = guiGridListAddRow(inv.grid[2]);
					if plecaki[getElementMaxSlots(localPlayer)] and plecaki[getElementMaxSlots(localPlayer)][jezyk] then
						guiGridListSetItemText(inv.grid[2], row, inv.col[3], plecaki[getElementMaxSlots(localPlayer)][jezyk], false, false);
					else
						guiGridListSetItemText(inv.grid[2], row, inv.col[3], "", false, false);
					end
					guiGridListSetItemColor(inv.grid[2],row,inv.col[3],0,190,0,255)
					guiGridListSetItemData(inv.grid[2], row, inv.col[3],"Take off backpack");
				end
			end
			local row = guiGridListAddRow(inv.grid[2]);
			guiGridListSetItemText(inv.grid[2], row, inv.col[3], tostring(keyTable[jezyk][v]), true, false);
			for _,item in ipairs(inventoryItems[v]) do
				if item[1] == "Code card #1" then
					local row = guiGridListAddRow(inv.grid[2])
					guiGridListSetItemText(inv.grid[2], row, inv.col[3], "     -> Karty kodowe", true, false);
				end
				if ((getElementData(localPlayer, item[1]) or 0) > 0) then
					local row = guiGridListAddRow(inv.grid[2]);
					if jezyk=="ENG" then
						guiGridListSetItemText(inv.grid[2], row, inv.col[3],tostring(item[1]), false, false);
					else
						guiGridListSetItemText(inv.grid[2], row, inv.col[3],(item[4] and tostring(item[4])) or tostring(item[1]), false, false);
					end
					guiGridListSetItemText(inv.grid[2], row, inv.col[4], getElementData(localPlayer, item[1]), false, false);
					guiGridListSetItemData(inv.grid[2],row,inv.col[3],tostring(item[1]))
					if string.find(item[1], "\n") then
						guiGridListSetItemColor(inv.grid[2], row, inv.col[3], 0, 190, 0, 255);
					end
					if getElementData(localPlayer,"current_helm") and getElementData(localPlayer,"current_helm")[1] and getElementData(localPlayer,"current_helm")[1] == item[1] then
						guiGridListSetItemColor(inv.grid[2], row, inv.col[3], 0, 190, 0, 255);
					end
					if getElementData(localPlayer,"current_kamizelka") and getElementData(localPlayer,"current_kamizelka")[1] and getElementData(localPlayer,"current_kamizelka")[1] == item[1] then
						guiGridListSetItemColor(inv.grid[2], row, inv.col[3], 0, 190, 0, 255);
					end
					if getElementData(localPlayer,"current_tlumik") and getElementData(localPlayer,"current_tlumik") == item[1] then
						guiGridListSetItemColor(inv.grid[2], row, inv.col[3], 0, 190, 0, 255);
					end
					if string.find(item[1],'Armybox') then
						guiGridListSetItemColor(inv.grid[2], row, inv.col[3], 149, 178, 6, 255);
					end	
				end
			end
		end
		local row = guiGridListAddRow(inv.grid[2])
		guiGridListSetItemText(inv.grid[2], row, inv.col[3], "-> Konto", true, false);
		if getElementData(localPlayer, "Have-Skin") then
			local row = guiGridListAddRow(inv.grid[2])
			guiGridListSetItemText(inv.grid[2], row, inv.col[3], "Skin grupowy", false, false);
			guiGridListSetItemData(inv.grid[2], row, inv.col[3], "Skin grupowy")
			if getElementData(localPlayer, "Have-Skin") == getElementModel(localPlayer) then
				guiGridListSetItemColor(inv.grid[2], row, inv.col[3], 0, 190, 0, 255);
			else
				guiGridListSetItemColor(inv.grid[2], row, inv.col[3], 25, 174, 194, 255);
			end
		end
		local spawns = getElementData(localPlayer, "Kupione-Respy")
		if spawns then
			local row = guiGridListAddRow(inv.grid[2])
			guiGridListSetItemText(inv.grid[2], row, 1, "  -> Spawny", true, false)
			for i, v in pairs(spawns) do
				if v[1] > 0 then
					local row = guiGridListAddRow(inv.grid[2])
					guiGridListSetItemText(inv.grid[2], row, 1, "    "..i, false, false)
					guiGridListSetItemText(inv.grid[2], row, 2, v[1], false, false)
					guiGridListSetItemData(inv.grid[2], row, 1, {i, v} )
				end
			end
			local row = guiGridListAddRow(inv.grid[2])
		end
		local armybox = getElementData(localPlayer, "Armyboxy")
		if armybox then
			local row = guiGridListAddRow(inv.grid[2])
			guiGridListSetItemText(inv.grid[2], row, 1, "  -> Armybox", true, false)
			for i, v in pairs(armybox) do
				if v > 0 then
					local row = guiGridListAddRow(inv.grid[2])
					guiGridListSetItemText(inv.grid[2], row, 1, "    Armybox "..i, false, false)
					guiGridListSetItemText(inv.grid[2], row, 2, v, false, false)
					guiGridListSetItemData(inv.grid[2], row, 1, {i, v} )
				end
			end
		end
		local auta = getCarsOwned(getElementData(localPlayer, "Car-Owned"))
		if #auta > 0 then
			local row = guiGridListAddRow(inv.grid[2])
			guiGridListSetItemText(inv.grid[2], row, 1, "  -> Spawny na mapie", true, false)
			for i, v in pairs(auta) do
				local row = guiGridListAddRow(inv.grid[2])
				guiGridListSetItemText(inv.grid[2], row, 1, "    "..getVehicleName(v), false, false)
				guiGridListSetItemData(inv.grid[2], row, 1, {"Przywroc pojazd", v})
				guiGridListSetItemText(inv.grid[2], row, 2, "    "..getElementZoneName(v), true, false)
			end
		end
		--timers_inventory[2] = setTimer(function(row1,column1)
			guiGridListSetSelectedItem(inv.grid[2],row1,column1)
		--	last_columns_inventory = {row1,column1}
	--	end,50,1,row1,column1)
		local data = getElementData(localPlayer,"Custom_Slots") or 0
		guiSetText(inv.label[3], jezyk_to_cos[jezyk]['Sloty']..": "..getElementCurrentSlots(localPlayer).."/"..getElementMaxSlots(localPlayer) + data);
	end
end

local tents = {
[100]='Tent',
[250]='Medium Tent',
[500]="Large Tent",
}


local timers_loot = {}
local last_columns_loot

function refreshLoot(loot, gearName)
	if not loot then
		guiGridListClear(inv.grid[1]);
		guiSetText(inv.label[1], jezyk_to_cos[jezyk]["Pusto"]);
		guiSetText(inv.label[4], "0/0");
		return false;
	end
	if not isElement(loot) then
		guiGridListClear(inv.grid[1]);
		guiSetText(inv.label[1], jezyk_to_cos[jezyk]["Pusto"]);
		guiSetText(inv.label[4], "0/0");
	return
	end
	
	if isTimer(timers_loot[1]) then
			killTimer(timers_loot[1])
		end
	if isTimer(timers_loot[2]) then
		killTimer(timers_loot[2])
		if guiGridListGetSelectedItem(inv.grid[1])~=Vector2(last_columns_loot[1],last_columns_loot[2]) then
		end
	end
	local progress_grid = guiGridListGetVerticalScrollPosition(inv.grid[1])
	local row1,column1 = guiGridListGetSelectedItem(inv.grid[1])
	if getElementData(loot,'itemloot') then
		guiSetText(inv.label[1],(getElementData(loot,'lootname') or "Loot") );
	elseif getElementData(loot,'tent') then
		guiSetText(inv.label[1],tents[getElementData(loot,'MAX_Slots')]);
	elseif getElementData(loot,'parent') and getElementType(getElementData(loot,'parent'))=='vehicle' then
		local changed_name = exports.DayZ:getVehiclePseudoName(getVehicleName(getElementData(loot,'parent')))
		guiSetText(inv.label[1],changed_name)
	end
	if (inv.col[2]) then
		guiGridListClear(inv.grid[1]);
		for _,v in pairs({1,2,3,4,5,6,7,8,9}) do
			local row = guiGridListAddRow(inv.grid[1]);
			guiGridListSetItemText(inv.grid[1], row, inv.col[1], tostring(keyTable[jezyk][v]), true, false);
			for _,item in ipairs(inventoryItems[v]) do
				if ((getElementData(loot, item[1]) or 0) >= 1) then
					local row = guiGridListAddRow(inv.grid[1]);
					if jezyk=="ENG" then
						guiGridListSetItemText(inv.grid[1], row, inv.col[1],tostring(item[1]), false, false);
					else
						guiGridListSetItemText(inv.grid[1], row, inv.col[1],(item[4] and tostring(item[4])) or tostring(item[1]), false, false);
					end
					guiGridListSetItemText(inv.grid[1], row, inv.col[2], getElementData(loot, item[1]), false, false);
					guiGridListSetItemData(inv.grid[1],row,inv.col[1],tostring(item[1]))
				end
				
			end
		end
		--timers_loot[2] = setTimer(function(row1,column1)
			--guiGridListSetSelectedItem(inv.grid[1],0,0)")
			guiGridListSetSelectedItem(inv.grid[1],row1,column1)
	--		last_columns_loot = {row1,column1}
		--end,50,1,row1,column1)
	--	guiGridListSetVerticalScrollPosition(inv.grid[1],progress_grid)
		local data = getElementData(loot,"Custom_Slots") or 0
		guiSetText(inv.label[4], jezyk_to_cos[jezyk]["Sloty"]..": "..getElementCurrentSlots(loot).."/"..getElementMaxSlots(loot) + data);
	end
end




function getElementMaxSlots(element)
	return getElementData(element, "MAX_Slots") or 0
end


function getElementCurrentSlots_2(element)
	local current_SLOTS = 0;
	for _,k in pairs({1,2,3,4,5,6,7,8,9}) do
		for _,v in ipairs(inventoryItems[k]) do
			local data = (getElementData(element, v[1]) or 0);
			if (data and data >= 1) then
				current_SLOTS = current_SLOTS+v[2]*data;
			end
		end
	end
	return tonumber(string.format("%.02f",tostring(current_SLOTS)))
end


function getElementCurrentSlots(element)
	local current_SLOTS = 0;
	for _,k in pairs({1,2,3,4,5,6,7,8,9}) do
		for _,v in ipairs(inventoryItems[k]) do
			local data = (getElementData(element, v[1]) or 0);
			if (data and data >= 1) then
				current_SLOTS = current_SLOTS+v[2]*data;
			end
		end
	end
	--outputChatBox(current_SLOTS)
	return tonumber(string.format("%.02f",tostring(current_SLOTS)))
	--return current_SLOTS
end

function isCanCraftable(element,itemName)
	if (getElementCurrentSlots(element) + getItemSlots(itemName) <= getElementMaxSlots(element)) then
		return true
	end
	return false
end

function getItemSlots(itemn)
	local current_SLOTS = 0;
	for _,k in pairs({1,2,3,4,5,6,7,8,9}) do
		for _,v in ipairs(inventoryItems[k]) do
			if (itemn == v[1]) then return v[2]; end
		end
	end
	return false;
end

function isToolbeltItem(itemn)
	--for _,v in ipairs(inventoryItems[9]) do
	--	if (itemn == v[1]) then return true; end
	--end 
	return false;
end

function getVehicleAddonInfos (id)
	for _,v in ipairs(vehicleAddonsInfo) do
		if (v[1] == id) then return v[2], v[3], v[4], v[5]; end
	end
end




function getVehicleMaxFuel(loot)
	for _,v in ipairs(vehicleFuelTable) do
		if (getElementModel(getElementData(loot, "parent")) == v[1]) then return v[2]; end
	end
	return false;
end

function getElementsWithinMarker(marker_inio)
	if (not isElement(marker_inio) or getElementType(marker_inio) ~= "marker") then
		return false
	end
	local markerColShape = getElementColShape(marker_inio)
	local elements = getElementsWithinColShape(markerColShape,'player')
	return elements
end

local gracze_marker = {}
local marker_2

addEventHandler("onClientGUIClick", inv.button[2], function(btn)
	if getElementData(localPlayer,"Craftuje") then return end
	if not safe_haslo_podane then return end
	if isPlayerInLoot() and not isElement(isPlayerInLoot()) then
		setElementData(localPlayer, "loot", false);
		setElementData(localPlayer, "currentCol", false);
	end
	if isPlayerInLoot() and getElementData(isPlayerInLoot(),'Tent-Otwieranie') then
		if getElementData(localPlayer,'Moze-Otwierac') and getElementData(isPlayerInLoot(),'Tent-Otwieranie')==getElementData(localPlayer,'Moze-Otwierac')[2] then
			
		else
			return 
		end
	end
	if playerMovedInInventory then return; end
	local itemName = guiGridListGetItemData(inv.grid[2], guiGridListGetSelectedItem(inv.grid[2]), 1);
	if not itemName then return end
	if itemName == "Take off backpack" then return end
	if itemName == "Mission Bag" then return end
	if itemName == "Survivor Clothing" and getElementData(localPlayer,"Survivor Clothing") == 1 then outputChatBox(jezyk_to_cos[jezyk]["Cant drop"],255,255,255) return end
	local liczba_2 = guiGridListGetItemText(inv.grid[2], guiGridListGetSelectedItem(inv.grid[2]), 2);
	
	if type(itemName) ~= "table" and getElementData(localPlayer, itemName) and getElementData(localPlayer, itemName) >= 1 then
		if isPlayerInLoot() and isElement(isPlayerInLoot()) then
			local data = getElementData(isPlayerInLoot(),"Custom_Slots") or 0
			if (getElementData(isPlayerInLoot(), "vehicle") and not getElementData(isPlayerInLoot(), "tent")) then
				local veh = getElementData(isPlayerInLoot(), "parent");
				local tires,engine,parts,slots = getVehicleAddonInfos(getElementModel(veh));
				if 2<1 then
					--triggerEvent("onPlayerMoveItemOutOFInventory", localPlayer, itemName.."_inVehicle", isPlayerInLoot());
					triggerServerEvent('Trigg_To_Trigg',localPlayer,itemName,isPlayerInLoot() );
					playerMovedInInventory = true;
					setTimer(function() playerMovedInInventory = false; end, 50, 1);
				elseif isToolbeltItem(itemName) then
					--triggerEvent("onPlayerMoveItemOutOFInventory", localPlayer, itemName, isPlayerInLoot());
					triggerServerEvent('Trigg_To_Trigg',localPlayer,itemName,isPlayerInLoot() );
					setTimer(function() playerMovedInInventory = false; end, 50, 1);
				elseif (getElementCurrentSlots(getElementData(localPlayer, "currentCol"))+getItemSlots(itemName) <= getElementMaxSlots(isPlayerInLoot()) + data) or getElementData(isPlayerInLoot(),'ItemDoLutowania') then
					--triggerEvent("onPlayerMoveItemOutOFInventory", localPlayer, itemName, isPlayerInLoot());
					triggerServerEvent('Trigg_To_Trigg',localPlayer,itemName,isPlayerInLoot() );
					playerMovedInInventory = true;
					setTimer(function() playerMovedInInventory = false; end, 50, 1);
				else
					exports['DayZ_core']:startRollMessage(jezyk_to_cos[jezyk]['Pełny Loot'], 255, 0, 0);
					return;
				end
			elseif isToolbeltItem(itemName) then
				--triggerEvent("onPlayerMoveItemOutOFInventory", localPlayer, itemName, isPlayerInLoot());
				triggerServerEvent('Trigg_To_Trigg',localPlayer,itemName,isPlayerInLoot() );
				playerMovedInInventory = false;
				setTimer(function() playerMovedInInventory = false; end, 50, 1);
			elseif (getElementCurrentSlots(getElementData(localPlayer, "currentCol")) + getItemSlots(itemName) <= getElementMaxSlots(isPlayerInLoot()) + data) or getElementData(isPlayerInLoot(),'ItemDoLutowania') then
				--triggerEvent("onPlayerMoveItemOutOFInventory", localPlayer, itemName, isPlayerInLoot());
				triggerServerEvent('Trigg_To_Trigg',localPlayer,itemName,isPlayerInLoot() );
				playerMovedInInventory = true
				setTimer(function() playerMovedInInventory = false; end, 50, 1);
			else
				exports['DayZ_core']:startRollMessage(jezyk_to_cos[jezyk]['Pełny Loot'], 255, 0, 0);
				return;
			end 
		else
			triggerServerEvent('Trigg_To_Trigg',localPlayer,itemName,isPlayerInLoot(),1,1,getElementData(localPlayer,itemName),btn);
			playerMovedInInventory = true
			setTimer(function() playerMovedInInventory = false; end, 300, 1);
		end 
	end
	local col = getElementData(localPlayer, "currentCol");
	--setTimer(refreshInventory, 200, 2);
	if isPlayerInLoot() then
		--setTimer(refreshLoot, 200, 2, col, guiGetText(inv.label[1]));
	end
end,false);



function kurwaGetJd(itemName,plus)
return getElementData(localPlayer,itemName)/plus
end

local kamizelkas_from_eq = {
['Kamizelka Taktyczna \n'] = 'Kamizelka Taktyczna',
}


function getKamizelkaFromName(itemName)
	if kamizelkas_from_eq[itemName] then
		return kamizelkas_from_eq[itemName]
	end
end

addEventHandler("onPlayerMoveItemOutOFInventory", root, function(itemName,loot,liczba,realNumber)
	local itemPlus = 1*1;
	local numberR
	local itemName2 = itemName;
	
	if getElementData(localPlayer,itemName)~=realNumber then return end
	if (itemName == "Tire_inVehicle") then itemName2 = "Tire"; end
	if (itemName == "Engine_inVehicle") then itemName2 = "Engine"; end
	if (itemName == "Parts_inVehicle") then itemName2 = "Tank Parts"; end
	if getElementData(localPlayer,itemName2)<=0 then return end
	local pos,posy,posz = getElementPosition(localPlayer)
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
		if (itemName == "Flara \n") and getElementData(localPlayer, itemName) > 1 then return end
		triggerServerEvent("removeBackWeaponOnDrop", localPlayer, true, getEquippedWeaponSlot(itemName));		
	end
	if loot then
		if string.find(itemName, "\n") then
			local iname = getEquippedWeaponName(itemName);
			setElementData(loot, iname, (getElementData(loot, iname) or 0) + 1);
			setElementData(localPlayer, itemName, getElementData(localPlayer, itemName) - itemPlus);
		else
		if getElementData(localPlayer,itemName2)>=itemPlus then
			setElementData(loot, itemName2, (getElementData(loot, itemName2) or 0) + 1);
			setElementData(localPlayer, itemName2, getElementData(localPlayer, itemName2) - (itemPlus));
		else
			setElementData(localPlayer,itemName2,0)
			--setElementData(loot, itemName2, (getElementData(loot, itemName2) or 0) + getElementData(localPlayer,itemName2));
			--setElementData(localPlayer, itemName2, getElementData(localPlayer, itemName2) - getElementData(localPlayer,itemName2));
		end
		end
		if (#getElementsWithinColShape(loot, "player") >= 1) then
			triggerServerEvent("onPlayerChangeLoot", root, loot);
		end
		if getElementData(localPlayer,"isLootingPrivTent") then
			triggerServerEvent("PrivTentsreloadValues",localPlayer,loot)
		end
	else
	if getElementData(localPlayer,itemName2)<=itemPlus then
	setElementData(localPlayer, itemName, getElementData(localPlayer, itemName) - realNumber);
	numberR = realNumber
	else
	setElementData(localPlayer, itemName, getElementData(localPlayer, itemName) - itemPlus);
	numberR = itemPlus
	end
		if string.find(itemName, "\n") and not itemName:find('Kamizelka') then
			triggerServerEvent("playerDropAItem", localPlayer, getEquippedWeaponName(itemName),numberR);
		elseif itemName:find("\n") and itemName:find("Kamizelka") then
			triggerServerEvent("playerDropAItem", localPlayer, getKamizelkaFromName(itemName),numberR);
		elseif itemName=='Night Vision Goggles' or itemName=='Infrared Goggles' then
			if getElementData(localPlayer,itemName)<=0 then
				setCameraGoggleEffect("normal");
				night = false
				 red = false
				 triggerServerEvent("playerDropAItem", localPlayer, itemName,numberR);
			end
		else
			triggerServerEvent("playerDropAItem", localPlayer, itemName,numberR);
		end
	end
	refreshInventory()
	--refreshLoot()
	if getElementData(localPlayer,"current_helm") and getElementData(localPlayer,"current_helm")[1] == itemName then
		if getElementData(localPlayer,itemName) == 0 then
			setElementData(localPlayer,"current_helm",nil)
		end
	end
	if getElementData(localPlayer,"current_kamizelka") and getElementData(localPlayer,"current_kamizelka")[1] == itemName then
		if getElementData(localPlayer,itemName) == 0 then
			setElementData(localPlayer,"current_kamizelka",nil)
		end
	end
	if getElementData(localPlayer,"current_tlumik") and getElementData(localPlayer,"current_tlumik") == itemName then
		if getElementData(localPlayer,itemName) == 0 then
			setElementData(localPlayer,"current_tlumik",nil)
		end
	end
	
	if (loot and getElementData(loot, "itemloot")) then
		triggerServerEvent("refreshItemLoot", root, loot, "other");
	end
end);

--[[function createSignal(creator)
	if getProjectileType(source) == 17 then
		outputChatBox("Rzuciles flare --> core_client.lua")
		setElementData(localPlayer, "Flara", getElementData(localPlayer, "Flara")-1)
		setElementData(localPlayer, "Flara \n", getElementData(localPlayer, "Flara \n")-1)
	end
end
addEventHandler("onClientProjectileCreation", root, createSignal)]]

addEventHandler('onClientPlayerWasted',localPlayer,function()
refreshInventory();
end)

if isElement(marker) then
destroyElement(marker)
end

if isElement(marker) then
destroyElement(marker)
end

local marker
local gracze_in_marker = {}


addEventHandler("onClientGUIClick", inv.button[1], function(btn)
if not safe_haslo_podane then return end
if source~=inv.button[1] then return end
	if getElementData(localPlayer,'Craftuje') then
		local itemName = guiGridListGetItemData(inv.grid[1], guiGridListGetSelectedItem(inv.grid[1]), 1);
		if not itemName then return end
		local daty = fromJSON(itemName)
		triggerServerEvent("Wycraftowano_tralalala",getElementData(getElementByID("DayZ_core"),'Wycraftowano_tralalala'),localPlayer,daty)
		return
	end
if isPlayerInLoot() and not isElement(isPlayerInLoot()) then
	setElementData(localPlayer, "loot", false);
	setElementData(localPlayer, "currentCol", false);
	end
if isPlayerInLoot() then
if getElementData(isPlayerInLoot(),'Tent-Otwieranie') then
			if getElementData(localPlayer,'Moze-Otwierac') and getElementData(isPlayerInLoot(),'Tent-Otwieranie')==getElementData(localPlayer,'Moze-Otwierac')[2] then
	
	else
	return
	end
end
end
	local data = getElementData(localPlayer,"Custom_Slots") or 0
	local itemName = guiGridListGetItemData(inv.grid[1], guiGridListGetSelectedItem(inv.grid[1]), 1);
	local ilosc = guiGridListGetItemText(inv.grid[1], guiGridListGetSelectedItem(inv.grid[1]), 2);
	if not itemName then return end
	if isPlayerInLoot() then
	
	
	--if getNetworkStats().packetlossLastSecond > 1 then exports['DayZ_core']:startRollMessage("Twoje pakiety są za wysokie!",255,0,0) return end
		if (getElementData(isPlayerInLoot(), itemName) and getElementData(isPlayerInLoot(), itemName) >= 1) then
			if not isToolbeltItem(itemName) then
				if getElementCurrentSlots(localPlayer)+getItemSlots(itemName) <= (getElementMaxSlots(localPlayer)) + data then
					if not playerMovedInInventory then
						--triggerEvent("onPlayerMoveItemInInventory", localPlayer, itemName, isPlayerInLoot());
						triggerServerEvent('MoveToEq',getElementData(getElementByID("DayZ_core"),'MoveToEq'),itemName,isPlayerInLoot());
						playerMovedInInventory = true;
						setTimer(function() playerMovedInInventory = false; end, 50, 1);
					else
						--exports['DayZ_core']:startRollMessage("Nie możesz tak szybko podnosić przedmiotów!", 255, 0, 0);
						return;
					end 
				else
					if itemName:find('Backpack') or itemName:find("Pack") then
						triggerServerEvent("onPlayerEquipBackpack_FromLoot", localPlayer, itemName,isPlayerInLoot());
					else
						exports['DayZ_core']:startRollMessage(jezyk_to_cos[jezyk]['Pełny Inwentaż'], 255, 0, 0);
					end
					return;
				end
			else
				playerMovedInInventory = true;
				setTimer(function() playerMovedInInventory = false end, 50, 1);
				--triggerEvent("onPlayerMoveItemInInventory", localPlayer, itemName, isPlayerInLoot());
				
				triggerServerEvent('MoveToEq',getElementData(getElementByID("DayZ_core"),'MoveToEq'),itemName,isPlayerInLoot());
			end
		end
		if isPlayerInLoot() then
		--	setTimer(refreshInventory, 200, 2);
		--	setTimer(refreshLoot, 200, 2, getElementData(localPlayer, "currentCol"), guiGetText(inv.label[1]));
		end
	end
end,false);

--[[
addEventHandler("onPlayerMoveItemInInventory", root, function(itemName,loot,a)
	local itemPlus = 1*1;
	if (itemName == "M1911 Mag") then itemPlus = 10*1;
	elseif (itemName == "M9 SD Mag") then itemPlus = 15*1;
	elseif (itemName == "Desert Eagle Mag") then itemPlus = 7;
	elseif (itemName == "PDW Mag") then itemPlus = 30;
	elseif (itemName == "MP5A5 Mag") then itemPlus = 20;
	elseif (itemName == "AS50 Mag") then itemPlus = 10;
	elseif (itemName == "AWP Mag") then itemPlus = 5;
	elseif (itemName == "Mosin 9130 Mag") then itemPlus = 35;
	elseif (itemName == "M24 Mag") then itemPlus = 10;
	elseif (itemName == "Cheytac M200 Mag") then itemPlus = 5
	elseif (itemName == "M107 Mag") then itemPlus = 5
	elseif (itemName == "SVD Dragunov Camo Mag") then itemPlus = 25;
	elseif (itemName == "MK 48 Mod 0 Mag") then itemPlus = 100;
	elseif (itemName == "M60 Mag") then itemPlus = 100;
	elseif (itemName == "PKP Pecheneg Mag") then itemPlus = 100;
        elseif (itemName == "AA-12 Mag") then itemPlus = 20;     
	elseif (itemName == "AK-47 Mag") then itemPlus = 30;
	elseif itemName=='Scar-L Mag' then itemPlus = 30;
	elseif (itemName == "M16A4 Mag") then itemPlus = 30;
	elseif (itemName == "SA-58V ACOG Mag") then itemPlus = 30;
	elseif (itemName == "AKS-74U Mag") then itemPlus = 30;
	elseif (itemName == "M4A1-S Mag") then itemPlus = 30;
	elseif (itemName == "1866 Slug") then itemPlus = 7;
	elseif (itemName == "2Rnd. Slug") then itemPlus = 2;
	elseif (itemName == "SPAZ-12 Pellet") then itemPlus = 7;
	elseif (itemName == "DMR Mag") then itemPlus = 5;
	elseif (itemName == "Lee Enfield Mag") then itemPlus = 10;
	end
	if loot then
		if getElementCurrentSlots(localPlayer)+(getItemSlots(itemName) * itemPlus) > (getElementMaxSlots(localPlayer)) + (getElementData(localPlayer,"Custom_Slots") or 0) then
			exports['DayZ_core']:startRollMessage(jezyk_to_cos[jezyk]['Brak Miejsca'], 255, 0, 0);
			return
		end
		if getElementData(loot,itemName)>=1 then
			setElementData(localPlayer, itemName, (getElementData(localPlayer, itemName) or 0) + (itemPlus));
			setElementData(loot, itemName, (getElementData(loot, itemName) or 0) - (1));
		else
			setElementData(loot,itemName,0)
			--setElementData(localPlayer, itemName, getElementData(localPlayer, itemName) + (getElementData(loot, itemName) or 1));
			--setElementData(loot, itemName, (getElementData(loot, itemName) or 0) - (getElementData(loot, itemName) or 1));
		end
		
		if (#getElementsWithinColShape(loot, "player") >= 1) then triggerServerEvent("onPlayerChangeLoot", root, loot); end
	end
	refreshInventory()
	if getElementData(loot, "itemloot") then
		triggerServerEvent("refreshItemLoot", root, loot, "other");
	end
	--triggerEvent("onPlayerChangeLoot",root,loot)
end);]]

function onClientOpenInventoryStopMenu()
	triggerEvent("disableMenu", localPlayer);
end

function isPlayerInLoot()
	if getElementData(localPlayer, "loot") then
		return getElementData(localPlayer, "currentCol");
	end
	return false;
end



addEvent('GetRektFromFerffa',true)
addEventHandler('GetRektFromFerffa',root,function()
	if getElementData(localPlayer,'Empty Water Bottle')<=0 then
		setElementData(localPlayer, "Empty Water Bottle",1);
	else
		setElementData(localPlayer, "Empty Water Bottle",(getElementData(localPlayer, "Empty Water Bottle") or 0) + 1);
	end
end)


GUIEditor = {
    button = {},
    window = {}
}

local stworzone = 0
local tardzet = 'None'
function stworz_buttony()
if stworzone==0 then
local x,y,_,_,_ = getCursorPosition()
        GUIEditor.window[1] = guiCreateWindow(x, y, 0.09, 0.23, "", true)
        guiWindowSetMovable(GUIEditor.window[1], false)
        guiWindowSetSizable(GUIEditor.window[1], false)

        GUIEditor.button[1] = guiCreateButton(0.10, 0.18, 0.79, 0.14, "Slot 1", true, GUIEditor.window[1])
        guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FFAAAAAA")
        GUIEditor.button[2] = guiCreateButton(0.10, 0.40, 0.79, 0.14, "Slot 2", true, GUIEditor.window[1])
        guiSetProperty(GUIEditor.button[2], "NormalTextColour", "FFAAAAAA")
        GUIEditor.button[3] = guiCreateButton(0.10, 0.60, 0.79, 0.14, "Slot 3", true, GUIEditor.window[1])
        guiSetProperty(GUIEditor.button[3], "NormalTextColour", "FFAAAAAA")
        GUIEditor.button[4] = guiCreateButton(0.66, 0.80, 0.24, 0.10, "X", true, GUIEditor.window[1])
        guiSetProperty(GUIEditor.button[4], "NormalTextColour", "FFAAAAAA")    
		
		stworzone = 1
		local Buttony_Pasek = {
[GUIEditor.button[1]] = function()
guiSetVisible(GUIEditor.window[1],false)
stworz_buttony()
exports.DayZ_fast_item_bar:SetItemToFastBar(1,tardzet)
end,
[GUIEditor.button[2]] = function()
guiSetVisible(GUIEditor.window[1],false)
stworz_buttony()
exports.DayZ_fast_item_bar:SetItemToFastBar(2,tardzet)
end,
[GUIEditor.button[3]] = function()
guiSetVisible(GUIEditor.window[1],false)
stworz_buttony()
exports.DayZ_fast_item_bar:SetItemToFastBar(3,tardzet)
end,
[GUIEditor.button[4]] = function()
guiSetVisible(GUIEditor.window[1],false)
stworz_buttony()
end,

}
function gowno_na_twarzy()
if Buttony_Pasek[source] then
Buttony_Pasek[source]()
end
end
addEventHandler('onClientGUIClick',resourceRoot,gowno_na_twarzy)



	elseif stworzone==1 then
	destroyElement(GUIEditor.window[1])
	stworzone = 0
	removeEventHandler('onClientGUIClick',resourceRoot,gowno_na_twarzy)
	end
end

function onPlayerPressRightKeyInInventory (btn)
if btn=='left' then  
	local itemName = guiGridListGetItemData(inv.grid[2], guiGridListGetSelectedItem(inv.grid[2]), 1)
	if itemName == "Take off backpack" then
		triggerServerEvent("DayZ_Core:Take_off_pack",localPlayer)
		return
	end
	if itemName == "Skin grupowy" then
		triggerServerEvent("Zaloz_skin_grupowy", localPlayer)
		return
	end
	local itemName,itemInfo = getInventoryInfosForRightClickMenu(itemName);
	local added_blood = exports["DayZ_poziomy"]:getMaxHealth(localPlayer)
	if (isCursorShowing() and guiGetVisible(inv.window[1]) and itemInfo) then
		
		if (itemName == "Box of Matches") then if (getElementData(localPlayer, "Wood Pile") == 0) then return; end
		elseif (itemName == "Bandage") then if (getElementData(localPlayer, "bleeding") == 0) then return; end
		elseif (itemName == "Medic Kit") then if (getElementData(localPlayer, "blood") > 11500 + added_blood) then return; end
		elseif (itemName == "First Aid Kit") then if (getElementData(localPlayer, "blood") > 11500 + added_blood) then return; end
		elseif (itemName == "Medic Bag") then if (getElementData(localPlayer, "blood") > 11500 + added_blood) then return; end
		elseif (itemName == "Heat Pack") then if (getElementData(localPlayer, "temperature") > 36.50) then return; end
		elseif (itemName == "Painkiller") then if not getElementData(localPlayer, "pain") then return; end
		elseif (itemName == "Morphine") then if not getElementData(localPlayer, "brokenbone") then return; end end
		if (itemName == "Blood Bag") then return false; end    
        playerUseItem(itemName,itemInfo)
		if type(itemName) ~= "table" and getElementData(localPlayer,itemName) - 1 <= 0 then
			guiSetText(button_info,"")
		end
    end
	elseif btn=='right' then
		--[[local itemName = guiGridListGetItemText(inv.grid[2], guiGridListGetSelectedItem(inv.grid[2]), 1);
		local itemName,itemInfo = getInventoryInfosForRightClickMenu(itemName)
		if not itemInfo then return end
		tardzet = itemName
		stworz_buttony()]]
	end
end
addEventHandler("onClientGUIDoubleClick",inv.grid[2],onPlayerPressRightKeyInInventory,false)

addEventHandler('onClientGUIClick',inv.grid[2],function(btn)
	if btn~='left' then return end
	local itemName = guiGridListGetItemData(inv.grid[2], guiGridListGetSelectedItem(inv.grid[2]), 1);
	local itemInfo =  getItemNameKurwo(itemName,jezyk) --call (getResourceFromName('Dayz'), "getItemNameKurwo",itemName) 
	if itemInfo then
		guiSetText(button_info,itemInfo)
	else
		guiSetText(button_info,'')
	end
end,false)

addEventHandler('onClientGUIClick',inv.grid[1],function(btn)
	if btn~='left' then return end
	local itemName = guiGridListGetItemData(inv.grid[1], guiGridListGetSelectedItem(inv.grid[1]), 1);
	local itemInfo = getItemNameKurwo(itemName,jezyk) --call (getResourceFromName('Dayz'), "getItemNameKurwo",itemName) 
	if itemInfo then
		guiSetText(button_info,itemInfo)
	else
		guiSetText(button_info,'')
	end
end,false)



function getInventoryInfosForRightClickMenu(itemName)
	if not itemName then return end
	if type(itemName) == "table" then return itemName, true end
	for _,v in ipairs(inventoryItems[1]) do
		if not string.find(itemName, "\n") then
			if (itemName == v[1]) then return itemName, "Equip Primary Weapon"; end
		else
			if (itemName == v[1]) then return itemName, "Unequip Primary Weapon"; end
		end
	end
	for _,v in ipairs(inventoryItems[2]) do
		if not string.find(itemName, "\n") then
			if (itemName == v[1]) then return itemName, "Equip Secondary Weapon"; end
		else
			if (itemName == v[1]) then return itemName, "Unequip Secondary Weapon"; end
		end
	end
	for _,v in ipairs(inventoryItems[3]) do
		if not string.find(itemName, "\n") then
			if (itemName == v[1]) then return itemName, "Equip Special Weapon"; end
		else
			if (itemName == v[1]) then return itemName, "Unequip Special Weapon"; end
		end
	end
	for _,v in ipairs(inventoryItems[4]) do
		if (itemName == v[1]) then return itemName, false; end 
	end
	for _,v in ipairs(inventoryItems[5]) do
		if (itemName == v[1]) then
			if (v[1] == "Water Bottle" or v[1] == "Milk" or v[1] == "Soda Bottle" or v[1]=="Coca Cola") then
				info = "Drink";
			else
				info = "Eat";
			end
			return itemName, info;
		end
	end
	for _,v in ipairs(inventoryItems[6]) do
		if (itemName == v[1]) then return itemName, v[3] or false; end
	end
	for _,v in ipairs(inventoryItems[7]) do
		if (itemName == v[1]) then return itemName, v[3] or false; end
	end
	for _,v in ipairs(inventoryItems[8]) do
		if (itemName == v[1]) then return itemName, v[3] or false; end
	end
	for _,v in ipairs(inventoryItems[9]) do
		if (itemName == v[1]) then return itemName, v[3] or false; end
	end
end

function showRightClickInventoryMenu(itemName, itemInfo)
	if itemInfo then
		local sx,sy,_,_,_ = getCursorPosition();
		guiSetVisible(inv.img[1], true);
		guiSetText(inv.label[5], itemInfo);
		local whith = guiLabelGetTextExtent(inv.label[5]);
		guiSetPosition(inv.img[1], sx, sy, true);
		local x,y = guiGetSize(inv.img[1], false);
		guiSetSize(inv.img[1], whith, y, false);
		guiBringToFront(inv.img[1]);
		setElementData(inv.img[1], "ItemInfo", {itemName, itemInfo});
	end
end

function hideRightClickInventoryMenu()
	guiSetVisible(inv.img[1], false);
end


local item_infos = {
	["Shovel \n"] = "Zacznij kopać",
	['Shovel'] = "Zacznij kopać",
	['Camouflage Clothing'] = "Przerób na bandaże",
	['Civilian Clothing'] = "Przerób na bandaże",
	['Survivor Clothing'] = "Przerób na bandaże",
	['Ghillie Suit'] = "Przerób na bandaże",
	['Reabel Clothing'] = "Przerób na bandaże",
	['Woman Clothing'] = "Przerób na bandaże",
	['Military Clothing [F]'] = "Przerób na bandaże",
	['Ghillie Suit [F]'] = "Przerób na bandaże",
	['Spray'] = "Ustaw kolor",
	['Spray \n'] = "Ustaw kolor",
	["Take off backpack"] = "Ukryj plecak",
}


function getItemInfo(item)
	if item_infos[item] then
		return item,item_infos[item]
	end
	return item, false
end


bindKey("mouse2", "down", function()
	local itemName = guiGridListGetItemData(inv.grid[2], guiGridListGetSelectedItem(inv.grid[2]), 1);
	local itemName,itemInfo = getItemInfo(itemName);
	if (isCursorShowing() and guiGetVisible(inv.window[1]) and itemInfo) then
		showRightClickInventoryMenu(itemName, itemInfo);
	elseif type(itemName) == "table" and itemName[1] == "Przywroc pojazd" then
		showRightClickInventoryMenu(itemName, "Przywróć pojazd");
	end
end);

addEventHandler("onClientGUIClick", inv.label[5], function(button, state)
	if (button == "left") then
		local itemName,itemInfo = unpack(getElementData(inv.img[1], "ItemInfo"));
		hideRightClickInventoryMenu();
		playerUseItem(itemName, itemInfo);
	end
end,false);

function showChannelEdit(cType)
end

addEventHandler("onClientGUIClick", resourceRoot, function()
	if (source == rwindow[3]) then
		guiSetInputMode("allow_binds");
		local channel = guiGetText(rwindow[2]);
		outputChatBox(Type.." channel was set to #ffffff"..channel, 0, 255, 0, true);
		setElementData(localPlayer, Type:lower().."channel", channel);
		destroyElement(rwindow[1]);
		Type = "";
	elseif (source == rwindow[4]) then
		guiSetInputMode("allow_binds");
		destroyElement(rwindow[1]);
		Type = "";
	end
end);

local object
local rozklada
local JakiTent
local timer_to_end
local marker_tent


safe_gui = {}
safe_gui["Window"] = guiCreateWindow(0.41, 0.33, 0.18, 0.10, "", true)
guiWindowSetMovable(safe_gui["Window"] , false)
guiWindowSetSizable(safe_gui["Window"] , false)

safe_gui['Password'] = guiCreateEdit(0.04, 0.37, 0.92, 0.39, "", true, safe_gui["Window"])

safe_gui['Success'] = guiCreateStaticImage(0.87, 0.00, 0.13, 1.00, "safe/success.png", true, safe_gui['Password'])    


safe_gui['Language'] = {
	[0] = {
		['PL'] = {
			[safe_gui["Password"]] = "Wpisz tutaj hasło do sejfu",
			[safe_gui["Success"]] = "Ustaw hasło do sejfu",
		},
		['ENG'] = {
			[safe_gui["Password"]] = "Write your's safe password",
			[safe_gui["Success"]] = "Set safe password",
		},
	},
	[1] = {
		['PL'] = {
			[safe_gui["Password"]] = "Wpisz tutaj hasło do sejfu",
			[safe_gui["Success"]] = "Otwórz sejf",
		},
		['ENG'] = {
			[safe_gui["Password"]] = "Write your's safe password",
			[safe_gui["Success"]] = "Otwórz sejf",
		},
	},
}
guiSetAlpha(safe_gui['Success'],0.6)

guiEditSetMaxLength(safe_gui["Password"],8)

addEventHandler('onClientMouseEnter',safe_gui["Success"],function()
	guiSetAlpha(safe_gui['Success'],1)
end,false)

addEventHandler('onClientMouseLeave',safe_gui["Success"],function()
	guiSetAlpha(safe_gui['Success'],0.6)
end,false)

guiSetVisible(safe_gui['Window'],false)

addEventHandler("onClientGUIClick",safe_gui["Success"],function()
	if getElementData(safe_gui['Window'],'metoda') == 0 then
		guiSetVisible(safe_gui["Window"],false)
		showCursor(false)
		tentRozkladanie(2332,"Safe")
	elseif getElementData(safe_gui['Window'],'metoda') == 1 then
		local text = guiGetText(safe_gui["Password"])
		local lut = isPlayerInLoot()
		if lut and getElementData(lut,"Safe_password") == text then
			outputChatBox("* Odszyfrowano sejf!",255,2555,255)
			guiSetVisible(safe_gui["Window"],false)
			safe_haslo_podane = true
			refreshLoot(lut,"Safe");
		else
			if jezyk == "ENG" then
				outputChatBox("* Wrong password",255,255,255)
			else
				outputChatBox("* Błędne hasło",255,255,255)
			end
			guiSetVisible(safe_gui['Window'],false)
			guiSetVisible(inv.window[1],false)
			setElementData(localPlayer,'Otwarte_Inv',guiGetVisible(inv.window[1]))
			showCursor(false)
		end
	end
end,false)




function pokazMenuWpisywaniaHasla(co)
	local metoda = co
	setElementData(safe_gui['Password'],'tooltip-text',safe_gui["Language"][metoda][jezyk][safe_gui['Password']])
	setElementData(safe_gui['Success'],'tooltip-text',safe_gui["Language"][metoda][jezyk][safe_gui['Success']])
	guiBringToFront(safe_gui['Window'])
	setElementData(safe_gui['Window'],"metoda",metoda,false)
	guiSetText(safe_gui["Password"],"")
	guiSetInputMode("no_binds_when_editing")
	if metoda == 0 then
		guiSetVisible(inv.window[1],false)
	end
	guiSetVisible(safe_gui['Window'],true)
end



addCommandHandler("zloz.sejf",function()
	if guiGetVisible(inv.window[1]) then
		if safe_haslo_podane then
			if isPlayerInLoot() and getElementData(isPlayerInLoot(),"safe") then
				triggerServerEvent("zlozSejfa",localPlayer,isPlayerInLoot())
			end
		end
	end
end)

function postawTent()
	if not rozklada then return end
	local x,y,z = getElementPosition(object)
	local rx,ry,rz = getElementRotation(object)
	if isElement(marker_tent) then
		destroyElement(marker_tent)
	end
	if isTimer(timer_to_end) then
	killTimer(timer_to_end)
	end
	if getElementModel(object)==3243 then
		triggerServerEvent("onPlayerPitchATent", localPlayer, JakiTent,x,y,z,rx,ry,rz,getElementDimension(localPlayer))
	elseif getElementModel(object)==964 and JakiTent:find('Small') then
		triggerServerEvent("onPlayerPitchASmallArmybox", localPlayer, JakiTent,x,y,z,rx,ry,rz,getElementDimension(localPlayer))
	elseif getElementModel(object)==2932 then
		triggerServerEvent("onPlayerPitchKontener", localPlayer, JakiTent,x,y,z,rx,ry,rz,getElementDimension(localPlayer))
	elseif getElementModel(object)==964 and JakiTent:find("Large") then
		triggerServerEvent("onPlayerPitchALargeArmybox", localPlayer, JakiTent,x,y,z,rx,ry,rz,getElementDimension(localPlayer))
	elseif getElementModel(object) == 2332 then
		triggerServerEvent("onPlayerPitchASafe", localPlayer, JakiTent,x,y,z,rx,ry,rz,getElementDimension(localPlayer),guiGetText(safe_gui['Password']))
	end
	if isElement(object) then
		destroyElement(object)
	end
	JakiTent = nil
	rozklada = false
end


function tent_obracaj(strona)
if not rozklada then return end
if not isElement(object) then return end
if strona=='mouse_wheel_up' then
local x,y,z,rx,ry,rz = getElementAttachedOffsets(object)
setElementAttachedOffsets(object,x,y,z,rx,ry,rz-5)
elseif strona=='mouse_wheel_down' then
local x,y,z,rx,ry,rz = getElementAttachedOffsets(object)
setElementAttachedOffsets(object,x,y,z,rx,ry,rz+5)
end
end

bindKey('mouse_wheel_up','down',tent_obracaj)
bindKey('mouse_wheel_down','down',tent_obracaj)

function tentRozkladanie(object_id,name)
	if isElement(object) then return end
		local pos = {getElementPosition(localPlayer)}
		local xr,yr,zr = getElementRotation(localPlayer);
		local offsetRot = math.rad(zr+90);
		local vx = pos[1]+5*math.cos(offsetRot);
		local vy = pos[2]+5*math.sin(offsetRot);
		local vrot = zr+180;
		JakiTent = name
		object = createObject(object_id, 0,0,0);
		marker_tent = createMarker(pos[1],pos[2],pos[3]-0.95,'cylinder',3,255,0,0,100)
		setElementRotation(object,0,0,180)
		setElementDimension(object,getElementDimension(localPlayer))
		if name:find('Kontener') then
			attachElements(object,localPlayer, 0, 4, 0, 0, 0, 90)
		elseif object_id == 2332 then
			attachElements(object,localPlayer,0,4,-0.5,0,0)
		else
			attachElements(object,localPlayer,0,4,-1,0,0,-180)
		end
		setElementCollisionsEnabled(object,false)
		rozklada = true
		bindKey('enter','down',postawTent)
		bindKey('num_enter','down',postawTent)
		timer_to_end = setTimer(function()
		if isElement(object) then
			destroyElement(object)
		end
		destroyElement(marker_tent)
		unbindKey('enter','down',postawTent)
		unbindKey('num_enter','down',postawTent)
		JakiTent = nil
		rozklada = false
	end,15000,1)
end

addEventHandler('onClientMarkerLeave',resourceRoot,function(player)
	if player~=localPlayer then return end
	if source~=marker_tent then return end
	if isElement(object) then
		destroyElement(object)
	end
	destroyElement(source)
	unbindKey('enter','down',postawTent)
	unbindKey('num_enter','down',postawTent)
	JakiTent = nil
	rozklada = false
	if isTimer(timer_to_end) then
		killTimer(timer_to_end)
	end
end)


function getElementSpeed(theElement, unit)
    -- Check arguments for errors
    assert(isElement(theElement), "Bad argument 1 @ getElementSpeed (element expected, got " .. type(theElement) .. ")")
    local elementType = getElementType(theElement)
    assert(elementType == "player" or elementType == "ped" or elementType == "object" or elementType == "vehicle" or elementType == "projectile", "Invalid element type @ getElementSpeed (player/ped/object/vehicle/projectile expected, got " .. elementType .. ")")
    assert((unit == nil or type(unit) == "string" or type(unit) == "number") and (unit == nil or (tonumber(unit) and (tonumber(unit) == 0 or tonumber(unit) == 1 or tonumber(unit) == 2)) or unit == "m/s" or unit == "km/h" or unit == "mph"), "Bad argument 2 @ getElementSpeed (invalid speed unit)")
    -- Default to m/s if no unit specified and 'ignore' argument type if the string contains a number
    unit = unit == nil and 0 or ((not tonumber(unit)) and unit or tonumber(unit))
    -- Setup our multiplier to convert the velocity to the specified unit
    local mult = (unit == 0 or unit == "m/s") and 50 or ((unit == 1 or unit == "km/h") and 180 or 111.84681456)
    -- Return the speed by calculating the length of the velocity vector, after converting the velocity to the specified unit
    return (Vector3(getElementVelocity(theElement)) * mult).length
end

local moze_uzyc_anim = true

local antybug = {
{"Bobcat"},
{"Mesa"},
{"Police Maverick"},
{"Dodo"},
{"Sanchez"},
{"PCJ-600"},
{"FBI-Truck"},
{"S.W.A.T."},
{"Bullet"},
{"Sandking"},
{"Turismo"},
{"Comet"},
{"Mesa"},
{"Landstalker"},
}


	
	
	
local antyBugHour = {
{'24H'},
{"168H"},
{"672H"},
{"Forever"},
}

function antyBugFunction(std)
	for _,v in pairs(antybug) do
		if std:find(v[1]) then
			return v[1]
		end
	end
end

function antyBugHourFunction(std)
	for _,v in pairs(antyBugHour) do
		if std:find(v[1]) then
			return v[1]
		end
	end
end


local item_to_sound = {
['Coca Cola'] = "drinksoda.mp3",
['Soda Bottle'] = "drinksoda.mp3",
['Water Bottle'] = "drink_0.mp3",
['Kebab'] = "eat_0.mp3",
['Pasta Can'] = "eat_0.mp3",
['Burger'] = "eat_0.mp3",
['Bandage'] = "bandage_1.mp3",
['Painkiller'] = "painkiller_0.mp3",
['Pack'] = "backpack.mp3",
}

function playRandomSound(itemName)
	if item_to_sound[itemName] then
		return item_to_sound[itemName];
	end
end

function playSoundEnd(itemName)
local z333333 = playRandomSound(itemName)
	if z333333 then
		playSound("item_sounds/"..z333333)
	end
end
addEvent("PlaySoundItem",true)
addEventHandler("PlaySoundItem",root,playSoundEnd)


local moze_zaczac_kopac = {
	[9] = true,
	[10] = true,
	[11] = true,
	[12] = true,
	[13] = true,
	[14] = true,
	[15] = true,
	[16] = true,
	[17] = true,
	[20] = true,
	[80] = true,
	[81] = true,
	[82] = true,
	[115] = true,
	[116] = true,
	[117] = true,
	[118] = true,
	[119] = true,
	[120] = true,
	[121] = true,
	[122] = true,
	[125] = true,
	[146] = true,
	[147] = true,
	[148] = true,
	[149] = true,
	[150] = true,
	[151] = true,
	[152] = true,
	[153] = true,
	[160] = true,
	-- DIRT
	[19] = true,
	[21] = true,
	[22] = true,
	[24] = true,
	[25] = true,
	[26] = true,
	[27] = true,
	[40] = true,
	[83] = true,
	[84] = true,
	[87] = true,
	[88] = true,
	[100] = true,
	[110] = true,
	[123] = true,
	[124] = true,
	[126] = true,
	[128] = true,
	[129] = true,
	[130] = true,
	[132] = true,
	[133] = true,
	[141] = true,
	[142] = true,
	[145] = true,
	[155] = true,
	[156] = true,
}



function isGroundisGrass()
	if not isPedOnGround(localPlayer) then
		return false
	end
	local x,y,z = getElementPosition(localPlayer)
	local _,_,_,_,_,_,_,_,material = processLineOfSight(x,y,z,x,y,z-2,true,false,false,true,false)
	if moze_zaczac_kopac[material] then
		return true
	else
		return false
	end
end

local wybieraMalowanie = false

addEventHandler("onColorPickerOK", root,
function(element, hex, r, g, b)
	if not wybieraMalowanie then return end
	wybieraMalowanie = false
	exports.DayZ_malowanie:setColor(r,g,b)
end)

function playerUseItem(itemName, itemInfo)
	
	if type(itemName) ~= "table" and (getElementData(localPlayer,itemName) or 0)<=0 and itemInfo ~= "Ukryj plecak" then exports['DayZ_core']:startRollMessage(jezyk_to_cos[jezyk]['Error Item'], 255, 0, 0); return end
	local data = getElementData(localPlayer,"Custom_Slots") or 0
	if (itemInfo == "Drink") then if not moze_uzyc_anim then return end triggerServerEvent("onPlayerRequestChangingStats", localPlayer, itemName, itemInfo, "thirst");
	elseif (itemInfo == "Eat") then
	if not moze_uzyc_anim then return end
	triggerServerEvent("onPlayerRequestChangingStats", localPlayer, itemName, itemInfo, "food");   
	elseif (itemInfo == "Put clothes on") then if not moze_uzyc_anim then return end triggerServerEvent("onPlayerChangeSkin", localPlayer, itemName);
	elseif (itemName == "Empty Water Bottle") then triggerServerEvent("onPlayerRefillWaterBottle", localPlayer, itemName);     
	elseif (itemInfo == "Pitch a tent") and (not rozklada) then if getElementData(localPlayer, "nmst") == true then triggerEvent("stworz_notyfikacje", localPlayer, "error", "Nie możesz rozłożyć namiotu w greenzonie") return end tentRozkladanie(3243,itemName) -- triggerServerEvent("onPlayerPitchATent", localPlayer, itemName);
	elseif (itemInfo == "Put a safe") and (not rozklada) then if getElementData(localPlayer, "nmst") == true then triggerEvent("stworz_notyfikacje", localPlayer, "error", "Nie możesz rozłożyć sejfu w greenzonie") return end if not getElementData(localPlayer,"Moze-Otwierac") then outputChatBox("* Sejf możesz postawić tylko i wyłącznie w bazie! Upewnij się że masz dostęp do namiotów",255,0,0) return end pokazMenuWpisywaniaHasla(0) --tentRozkladanie(2332,itemName) -- triggerServerEvent("onPlayerPitchATent", localPlayer, itemName);
	elseif (itemInfo == "Pitch a armybox") and (not rozklada) then if getElementData(localPlayer, "nmst") == true then triggerEvent("stworz_notyfikacje", localPlayer, "error", "Nie możesz rozłożyć armyboxa w greenzonie") return end if not getElementData(localPlayer,'Moze-Otwierac') then outputChatBox('Musisz byc w bazie aby to zrobic',250,0,0) return end tentRozkladanie(964,itemName) 
	elseif (itemInfo == "Pitch a kontener") and (not rozklada) then if getElementDimension(localPlayer) > 0 then triggerEvent("stworz_notyfikacje", localPlayer, "error", "Nie możesz rozłożyć kontenera w greenzonie") return end if not getElementData(localPlayer,'Moze-Otwierac') then outputChatBox('Musisz byc w bazie aby to zrobic',250,0,0) return end tentRozkladanie(2932,itemName) 
	elseif (itemInfo == "Build a wire fence") then if getElementData(localPlayer, "nmst") == true then triggerEvent("stworz_notyfikacje", localPlayer, "error", "Nie możesz rozłożyć kolczatki w greenzonie") return end triggerServerEvent("onPlayerBuildAWireFence", localPlayer, itemName);
	elseif (itemInfo == "Build a sandbag") then if getElementData(localPlayer, "nmst") == true then triggerEvent("stworz_notyfikacje", localPlayer, "error", "Nie możesz rozłożyć worków z piaskiem w greenzonie") return end triggerServerEvent("onPlayerBuildASandbag", localPlayer, itemName);
	elseif (itemInfo == "Put a bush") then triggerServerEvent("onPlayerPutaBush", localPlayer, itemName);
	elseif (itemName == "Roadflare") then triggerServerEvent("onPlayerPlaceRoadflare", localPlayer, itemName);
	elseif (itemInfo == "Make a Fire") then triggerServerEvent("onPlayerMakeAFire", localPlayer, itemName);
	elseif itemInfo == "Zacznij kopać" then
	if isGroundisGrass() then
		triggerServerEvent("Zaczyna_Kopac",root,localPlayer,itemName)
	else
		outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] W tym miejscu nie można kopać!",255,255,255,true)
	end
	elseif itemInfo == "Ustaw kolor" then
		exports.cpicker:openPicker(source)
		wybieraMalowanie = true
	elseif itemInfo=="Przerób na bandaże" then
		triggerServerEvent("PrzerobClothing",localPlayer,itemName)
	elseif itemInfo=="Ukryj plecak" then
		local plecak = getElementData(localPlayer,"tohide2")
		local data = getElementData(localPlayer,"Hide-Backpack")
		if plecak and isElement(plecak) then
			if data then
				setElementData(localPlayer,"Hide-Backpack",nil)
				setElementAlpha(plecak,255)
			else
				setElementData(localPlayer,"Hide-Backpack",true)
				setElementAlpha(plecak,0)
			end
		end
	elseif (itemInfo == "Use") then if not moze_uzyc_anim then return end triggerServerEvent("onPlayerUseMedicObject", localPlayer, itemName);
	elseif (itemInfo=='Put a trap') then triggerServerEvent("onPlayerPutATrap",localPlayer,itemName)
	elseif (itemName == "Bandage") then if not moze_uzyc_anim then return end triggerServerEvent("onPlayerUseMedicObject", localPlayer, itemName);
	elseif (itemInfo == "Use Googles") then triggerServerEvent("onPlayerChangeView", localPlayer, itemName);
	elseif (itemInfo == "Pitch a Large_armybox") then if not getElementData(localPlayer,'Moze-Otwierac') then outputChatBox('Musisz byc w bazie aby to zrobic',250,0,0) return end tentRozkladanie(964,itemName)
	elseif (itemInfo == "Equip Primary Weapon") then  triggerServerEvent("onPlayerRearmWeapon", localPlayer, itemName, 1);
	elseif (itemInfo == "Equip Secondary Weapon") then  triggerServerEvent("onPlayerRearmWeapon", localPlayer, itemName, 2);
	elseif (itemInfo == "Equip Special Weapon") then  triggerServerEvent("onPlayerRearmWeapon", localPlayer, itemName, 3);
	elseif (itemInfo == "Set radio channel") then showChannelEdit("Radio");
	elseif (itemInfo == "Spawn Aut") then
	if getElementData(localPlayer,'Rozklada-Auto') then return end
	local GET = antyBugFunction(itemName)
	local GETH = antyBugHourFunction(itemName)
	if not GET then return end
	if not GETH then return end
	triggerEvent('Rozkladaj_Auto',localPlayer,GET,GETH,itemName)
	
	
	
	elseif (itemInfo == "Set GPS channel") then showChannelEdit("GPS");
	elseif (itemInfo == "Equip Backpack") then triggerServerEvent("onPlayerEquipBackpack", localPlayer, itemName);
	elseif (itemInfo == "Unequip Primary Weapon") then
		 if (getElementCurrentSlots(localPlayer) + getItemSlots(itemName:gsub(' \n','')) > getElementMaxSlots(localPlayer) + data)  then exports['DayZ_core']:startRollMessage(jezyk_to_cos[jezyk]['Brak Miejsca'], 255, 0, 0); return end
			triggerServerEvent("onPlayerUnequipWeapon", localPlayer, itemName, 1);
	elseif (itemInfo == "Unequip Secondary Weapon") then
		 if (getElementCurrentSlots(localPlayer) + getItemSlots(itemName:gsub(' \n','')) > getElementMaxSlots(localPlayer) + data)  then exports['DayZ_core']:startRollMessage(jezyk_to_cos[jezyk]['Brak Miejsca'], 255, 0, 0); return end
			triggerServerEvent("onPlayerUnequipWeapon", localPlayer, itemName, 2);
	elseif (itemInfo == "Unequip Special Weapon") then
		if (getElementCurrentSlots(localPlayer) + getItemSlots(itemName:gsub(' \n','')) > getElementMaxSlots(localPlayer) + data)  then exports['DayZ_core']:startRollMessage(jezyk_to_cos[jezyk]['Brak Miejsca'], 255, 0, 0); return end
			triggerServerEvent("onPlayerUnequipWeapon", localPlayer, itemName, 3);
	elseif itemInfo=='Equip Kamizelka' then
		--if (getElementCurrentSlots(localPlayer) + getItemSlots(itemName) > getElementMaxSlots(localPlayer)) then startRollMessage("Not enough space!", 255, 0, 0); return end	
		triggerServerEvent("onPlayerEquipKamizelka", localPlayer, itemName);
	elseif itemInfo=='Dequip Kamizelka' then
		if (getElementCurrentSlots(localPlayer) + getItemSlots(itemName:gsub(' \n','')) > getElementMaxSlots(localPlayer) + data)  then exports['DayZ_core']:startRollMessage(jezyk_to_cos[jezyk]['Brak Miejsca'], 255, 0, 0); return end	
		triggerServerEvent("onPlayerDequipKamizelka", localPlayer, itemName);
	elseif itemInfo=="Pull down rope" then
		startRope(itemName)
	elseif itemInfo=="Zaloz helm" then
		triggerServerEvent("ZalozHelm",localPlayer,localPlayer,itemName)
	elseif itemInfo=="Zaloz kamizelke" then
		triggerServerEvent("ZalozKamizelke",localPlayer,localPlayer,itemName)
	elseif itemInfo=="Zaloz tlumik" then
		triggerServerEvent("ZalozTlumik",localPlayer,localPlayer,itemName)
	elseif itemInfo == "Przywróć pojazd" then
		triggerServerEvent("PrzywrocPojazd", localPlayer, itemName[2])
	elseif type(itemName) == "table" then
		
		local keys = {
			["Militarny"] = true,
			["Medyczny"] = true,
			["Produkty"] = true,
			
		}
		
		if tostring(itemName[1]):find("Spawn") then
			--pitch_units
			pitch_units.value = itemName
			startPitchAddon("Car")
		elseif keys[itemName[1]] then
			pitch_units.value = itemName
			startPitchAddon("Armybox")
		end
	end
end

addEventHandler('onClientPlayerSpawn',localPlayer,function()
	setElementData(localPlayer,"Hide-Backpack",nil)
end)

function to_do_useItem(itemNejm)
	if getElementData(localPlayer,"Nearly-Dead") then return end
local itemName,itemInfo = getInventoryInfosForRightClickMenu(itemNejm)
--outputChatBox(itemInfo)
		if (itemName == "Box of Matches") then if (getElementData(localPlayer, "Wood Pile") == 0) then return; end
		elseif (itemName == "Bandage") then if (getElementData(localPlayer, "bleeding") == 0) then return; end
		elseif (itemName == "Medic Kit") then if (getElementData(localPlayer, "blood") > 10500) then return; end
		elseif (itemName == "Heat Pack") then if (getElementData(localPlayer, "temperature") > 36.50) then return; end
		elseif (itemName == "Painkiller") then if not getElementData(localPlayer, "pain") then return; end
		elseif (itemName == "Morphine") then if not getElementData(localPlayer, "brokenbone") then return; end end
		if (itemName == "Blood Bag") then return false; end    
		if getElementData(localPlayer,itemName) <= 0 then return end
        playerUseItem(itemName,itemInfo)
end


addEvent("to_do_useItem",true)
addEventHandler("to_do_useItem",root,to_do_useItem)







function getWeaponAmmoType(weapon)
	for _,v in pairs(weaponAmmoTable) do
		if (weapon == v[2])	then
		return v[1], v[2]; end
	end
	return false, false;
end

--[[
addEventHandler("onClientPlayerWeaponFire", localPlayer, function(weapon, ammor)
	local slot = getSlotFromWeapon(weapon);
	if weapon == 41 then return end
	if (slot == 3 or slot == 5 or slot == 6 or slot == 7) then
		local ammo,_ = getWeaponAmmoType(getElementData(localPlayer, "currentweapon_1"));
		if (getElementData(localPlayer, ammo) > 0) then
			setElementData(localPlayer, ammo, getElementData(localPlayer, ammo) - 1);
		end
	elseif (slot == 2 or slot == 4) then
		local ammo,_ = getWeaponAmmoType(getElementData(localPlayer, "currentweapon_2"));
		if (getElementData(localPlayer, ammo) > 0) then
			setElementData(localPlayer, ammo, getElementData(localPlayer, ammo) - 1);
		end
	else
		local weap = getElementData(localPlayer, "currentweapon_3");
		if (weap == "Grenade" or weap == "Flara") then
			weap = weap.." \n";
		end
		local ammo,_ = getWeaponAmmoType(weap);
		if (getElementData(localPlayer, ammo) > 0) then
			setElementData(localPlayer, ammo, getElementData(localPlayer, ammo) - 1);
			local update_dammo = getWeaponAmmoType(weap);
			if (getElementData(localPlayer, update_dammo) <= 0) then
			setElementData(localPlayer, "currentweapon_3", "");
			end
		else
		setElementData(localPlayer, "currentweapon_3", "");
		end
	end
end);
]]

local metry = nil
local metry_cel = nil
local rope_texture = dxCreateTexture('rope.png')


local lina = {
	pozycja = {},
	koncowa = {},
}

function schodzenie()
	if not metry then
		removeEventHandler('onClientRender',root,schodzenie)
		setElementData(localPlayer,'Zjezdza',false)
		lina.pozycja = {}
		lina.koncowa = {}
		setPedAnimation(localPlayer)
		return
	end
	if metry-1<metry_cel then
		removeEventHandler('onClientRender',root,schodzenie)
		setElementData(localPlayer,'Zjezdza',false)
		lina.pozycja = {}
		lina.koncowa = {}
		setPedAnimation(localPlayer)
		return
	end
	if isElementInWater(localPlayer) then
		removeEventHandler('onClientRender',root,schodzenie)
		setElementData(localPlayer,'Zjezdza',false)
		lina.pozycja = {}
		lina.koncowa = {}
		setPedAnimation(localPlayer)
		return
	end
	metry = metry - 0.25
	setElementPosition(localPlayer,lina.koncowa[1],lina.koncowa[2],metry,true)
	dxDrawMaterialLine3D(lina.pozycja[1],lina.pozycja[2],lina.pozycja[3],lina.koncowa[1],lina.koncowa[2],lina.koncowa[3],rope_texture,0.1,_)
end
addEvent('Zejdz_Rope',true)
addEventHandler('Zejdz_Rope',root,function(vx,vy,z,grunt)
	if getElementData(localPlayer,'Zjezdza') then return end
	metry = z
	metry_cel = grunt
	lina.pozycja = {vx,vy,z}
	lina.koncowa = {vx,vy,grunt},
	setElementData(localPlayer,'Zjezdza',true)
	addEventHandler('onClientRender',root,schodzenie)
	setPedAnimation(localPlayer,"FIGHT_B","FightB_block",-1,true,false,true,false)
end)

function startRope(itemName)
	if (getElementData(localPlayer,itemName) or 0)<=0 then return end
	
	local x,y,z = getElementPosition(localPlayer)
	if not isPedOnGround(localPlayer) then return end
	local dimension = getElementDimension(localPlayer);
	local xr,yr,zr = getElementRotation(localPlayer);
	local offsetRot = math.rad(zr+90);
	local vx = x+1*math.cos(offsetRot);
	local vy = y+1*math.sin(offsetRot);
	local vrot = zr+180;
	if not isLineOfSightClear(x,y,z - 0.8,vx,vy,z - 0.8,true,true,true,true,true) then
		outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] Błąd!",255,255,255,true)
		return
	end
	local grunt = getGroundPosition(vx,vy,z)
	if grunt+2<z then
		--local marker = createMarker(x,y,z-0.95,'cylinder',1.0,180,200,0,200)
		setElementData(localPlayer,'Zjezdza',true)
		triggerServerEvent("Utwórz_linę",localPlayer,x,y,z-0.95,vx,vy,grunt)
		setElementPosition(localPlayer,vx,vy,z,true)
		lina.pozycja = {vx,vy,z-0.95}
		lina.koncowa = {vx,vy,grunt}
		setElementData(localPlayer,itemName,(getElementData(localPlayer,itemName) or 0)-1)
		metry = z-0.95
		metry_cel = grunt
		addEventHandler('onClientRender',root,schodzenie)
	else
		outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] Podejdz bliżej do krawędzi!",255,255,255,true)
	end
end

setPedTargetingMarkerEnabled(false)


pitch_units = {
	["elementAttached"] = nil,
	["isWlaczone"] = nil,
	["data"] = {
		["Car"] = Vector3(0, 5, -0.25),
		["Armybox"] = Vector3(0, 2, -0.95)
	},
	["value"] = nil,
	rotate = function(key)
		local int = -15
		if key == "mouse_wheel_up" then
			int = 15
		end
		if isElement(pitch_units.elementAttached) then
			local offsets = {getElementAttachedOffsets(pitch_units.elementAttached)}
			setElementAttachedOffsets(pitch_units.elementAttached, offsets[1], offsets[2], offsets[3], offsets[4], offsets[5], offsets[6] + int)
		end
	end,
}


function stopPitching()
	if pitch_units.isWlaczone then
		removeEventHandler("onClientRender", root, DrawPitchAddonText)
		pitch_units.value = nil
		pitch_units.isWlaczone = nil
		unbindKey("enter", "down", pitchAddon)
		unbindKey("num_enter", "down", pitchAddon)
		unbindKey("mouse_wheel_up", "down", pitch_units.rotate)
		unbindKey("mouse_wheel_down", "down", pitch_units.rotate)
		unbindKey("backspace", "down", stopPitching)
		destroyElement(pitch_units.elementAttached)
		pitch_units.elementAttached = nil
	end
end

function pitchAddon()
	if not pitch_units.isWlaczone then return end
	
	if pitch_units.isWlaczone == "Armybox" then
		triggerServerEvent("postawArmybox", localPlayer, pitch_units.value[1], {getElementPosition(pitch_units.elementAttached)})
		
	elseif pitch_units.isWlaczone == "Car" then
		local rotacja = {getElementRotation(pitch_units.elementAttached)}
		triggerServerEvent("tryBaseSpawn", localPlayer, pitch_units.value, {getElementPosition(pitch_units.elementAttached)}, {rotacja[1], rotacja[2], rotacja[3]})
	end
	stopPitching()
end

local text_lang = "ENG"

function startPitchAddon(name)
	if pitch_units.isWlaczone then
		-- notyfikacja if you want
		return
	end
	if pitch_units.data[name] then
		local x, y, z = getElementPosition(localPlayer);

		bindKey("enter", "down", pitchAddon)
		bindKey("num_enter", "down", pitchAddon)
		bindKey("mouse_wheel_up", "down", pitch_units.rotate)
		bindKey("mouse_wheel_down", "down", pitch_units.rotate)
		bindKey("backspace", "down", stopPitching)
		if name == "Car" then
			pitch_units.elementAttached = createVehicle(getVehicleModelFromName(pitch_units.value[2][2]), x, y, z)
			setElementAlpha(pitch_units.elementAttached, 180)
			text_lang = getElementData(localPlayer, "Jezyk_Gry")
			addEventHandler("onClientRender", root, DrawPitchAddonText)
		elseif name == "Armybox" then
			pitch_units.elementAttached = createObject(964, 0, 0, 0)
		end
		pitch_units.isWlaczone = name
		setElementCollisionsEnabled(pitch_units.elementAttached, false)
		attachElements(pitch_units.elementAttached, localPlayer, pitch_units.data[name].x, pitch_units.data[name].y, pitch_units.data[name].z)
	end
end

addEventHandler("onClientPlayerWasted", localPlayer, function()
	stopPitching()
end)

local screenW, screenH = guiGetScreenSize()
local font = exports.DayZ_font:GetFont("Roboto-Light", 18 * (screenW/1920))

function DrawPitchAddonText()
	dxDrawText(jezyk_to_cos[text_lang]["pitch_car"], screenW * 0.2963, screenH * 0.6767, screenW * 0.7037, screenH * 0.8933, tocolor(255, 255, 255, 255), 1.00, font, "center", "center", false, false, false, true, false)
end





