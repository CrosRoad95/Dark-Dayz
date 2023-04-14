
local h1, h2, h3 = debug.gethook()
debug.sethook()

debug.sethook( _, h1, h2, h3 )


local table_of_mag_value = {}

local itemTable = {
	["farm"] = {
		-- NAME, ID, SIZE
		{"Wood Pile",1463,0.4,0,13},
		{"Bandage",1578,0.5,0,4},
		{"Water Bottle",2683,1,0,6},
		{"Pasta Can",2770,1,0,6},
		{"Beans Can",2601,1,0,6},
		{"Burger",2768,1,0,6},
		{"Empty Soda Cans",2673,0.5,0,12},
		{"Scruffy Burgers",2675,0.5,0,12},
		{"Soda Bottle",2647,1,0,9},
		{"Empty Gas Canister",1650,1,0,10},
		{"Hunting Knife",335,1,90,4},
		{"Box of Matches",328,0.4,90,8},
		{"Morphine",1579,1,0,4},
		{"Tent",1279,1,0,0.5},
		{"Painkiller",2709,3,0,3.5},
		{"Lee Enfield",357,1,90,0.3},
		{"Hatchet",339,1,90,1},
		{"Tire",1073,1,0,2},
		{"Civilian Clothing",1247,2,0,2.5},
		{"Map",1277,0.8,90,6},
		{"GPS",2976,0.15,0,2},
	},
	["residential"] = {
		{"Box of Matches",328,0.4,90,5},
		{"M1911",346,1,90,1.5},
		{"Hunting Knife",335,1,90,3},
		{"Hatchet",339,1,90,1},
		{"Pizza",1582,1,0,7},
		{"Soda Bottle",2647,1,0,7},
		{"Empty Gas Canister",1650,1,0,9},
		{"Roadflare",324,1,90,9},
		{"Milk",2856,1,0,7},
		{"Assault Pack (ACU)",3026,1,0,6},
		{"Painkiller",2709,3,0,7},
		{"Empty Soda Cans",2673,0.5,0,12},
		{"Scruffy Burgers",2675,0.5,0,12},
		{"Desert Eagle",348,1,90,0.4},
		{"Sawn-Off Shotgun",350,1,90,0.3},
		{"MP5A5",353,1,90,0.4},
		{"Watch",2710,1,0,3},
		{"SPAZ-12 Combat Shotgun",351,1,90,0.4},
		--{"Heat Pack",1576,5,0,6},
		{"Wire Fence",933,0.25,0,1},
		{"Lee Enfield",357,1,90,0.3},
		{"Alice Pack",1248,1,0,1.5},
		{"Tire",1073,1,0,1},
		{"Morphine",1579,1,0,2},
		{"Civilian Clothing",1247,2,0,9},
		{"Map",1277,0.8,90,10},
		{"GPS",2976,0.15,0,3},
		{"Pasta Can",2770,1,0,7},
		{"Beans Can",2601,1,0,7},
		{"Burger",2768,1,0,7},
		{"Baseball Bat",336,1,90,3},
		{"Shovel",337,1,90,3},
	},
	["military"] = {
		{"M1911",346,1,90,5},
		{"M9 SD",347,1,90,4},
		{"PDW",352,1,90,4},
		{"Hunting Knife",335,1,90,2.4},
		{"Hatchet",339,1,90,2.1},
		{"Pizza",1582,1,0,2},
		{"Soda Bottle",2647,1,0,2},
		{"Tank Parts", 1008, 1, 0, 3.5},
		{"Empty Gas Canister",1650,1,0,4},
		{"Milk",2856,1,0,1},
		{"Painkiller",2709,3,0,4},
		{"Grenade",342,1,0,0.5},

		{"M4A1-S",1830,1,90,2.4},
		{"Scar-L",1899,1,90,2.4},
		{"M4A1",1901,1,90,2.4},
		{"G36C",1831,1,90,2.4},
		{"M60",1832,1,90,2.4},
		
		{"AK-47",1834,1,90,2.4},
		{"SA-58V ACOG",1838,1,90,2.4},
		{"Cheytac M200",1870,1,90,0.4},
		{"AWP",1872,1,90,0.4},

		{"MP5A5",353,1,90,2.8},
		{"Watch",2710,1,0,4},
		--{"Heat Pack",1576,5,0,3},
		{"Wire Fence",933,0.25,0,1},
		{"Night Vision Goggles",368,1,90,4},
		{"Binoculars",369,1,0,4},
		{"Tire",1073,1,0,2},
		{"Morphine",1579,1,0,4},
		{"Woman Clothing",1247,2,0,4.5},
		{"Kombinezon X",1247,2,0,4.5},
		{"Military Clothing [F]",1247,2,0,4.5},
		{"Ghillie Suit [F]",1247,2,0,4.5},
		{"Reabel Clothing",1247,2,0,4.5},
		{"Camouflage Clothing",1247,2,0,4.5},
		{"Civilian Clothing",1247,2,0,3},
		{"GPS",2976,0.15,0,3},
		{"Map",1277,0.8,90,7},
		{"Toolbox",2969,0.5,0,1},
		{"Engine",929,0.3,0,2},
		{"Tent",1279,1,0,4.5},
		{"Ghillie Suit",1213,2,0,0.3},
		{"Infrared Goggles",369,1,90,3},
		{"Assault Pack (ACU)",3026,1,0,5},
		{"Medic Backpack",1241,1,0,2}, 
		{"Alice Pack",1242,1,0,6},
		{"Medium Backpack",1243,1,0,0.9},
		{"Czech Backpack",1244,1,0,5},
		{"Big Backpack",1245,1,0,5},
		{"Military Backpack",1246,1,0,2}, 
		{"Coyote Backpack",1575,1,0,5},
		{"CMAR Backpack",1249,1,0,2},
		{"Radio Device",330,1,0,6},
		{"Shovel",337,1,90,1},
	},
	["industrial"] = {
		{"Wire Fence",933,0.25,0,7},
		{"Toolbox",2969,0.5,0,3},
		{"Tire",1073,1,0,4},
		{"Engine",929,0.3,0,3.5},
		{"Winchester 1866",349,1,90,3},
		{"Water Bottle",2683,1,0,4},
		{"Pasta Can",2770,1,0,4},
		{"Beans Can",2601,1,0,4},
		{"Burger",2768,1,0,4},
		{"Empty Soda Cans",2673,0.5,0,12},
		{"Scruffy Burgers",2675,0.5,0,10},
		{"Soda Bottle",2647,1,0,4},
		{"Assault Pack (ACU)",3026,1,0,5},
		{"Medic Backpack",1241,1,0,2}, 
		{"Alice Pack",1242,1,0,6},
		{"Medium Backpack",1243,1,0,0.9},
		{"Czech Backpack",1244,1,0,5},
		{"Empty Gas Canister",1650,1,0,6},
		{"Full Gas Canister",1650,1,0,1.5},
		{"Map",1277,0.8,90,3},
		{"Watch",2710,1,0,2},
		{"Box of Matches",328,0.4,90,5},
		{"Wood Pile",1463,0.4,0,2},
		{"M1911",346,1,90,1.5},
		{"PDW",352,1,90,2},
		{"Hunting Knife",335,1,90,2},
		{"Hatchet",339,1,90,1.5},
		{"Tank Parts", 1008, 1, 0, 3.5},
		{"Pizza",1582,1,0,4},
		{"Roadflare",324,1,90,5},
		{"Milk",2856,1,0,4},
		{"Coyote Backpack",1252,1,0,0.5},
		{"Radio Device",330,1,0,6},
		{"Baseball Bat",336,1,90,1.5},
		{"Shovel",337,1,90,1.5},
	},
	["supermarket"] = {
		{"Raw Meat",2804,0.5,90,8},
		{"Box of Matches",328,0.4,90,5},
		{"Wood Pile",1463,0.4,0,5},
		{"M1911",346,1,90,3.5},
		{"PDW",352,1,90,2},
		{"Hunting Knife",335,1,90,3},
		{"Hatchet",339,1,90,2.1},
		{"Pizza",1582,1,0,7},
		{"Soda Bottle",2647,1,0,7},
		{"Empty Gas Canister",1650,1,0,5},
		{"Milk",2856,1,0,7},
		{"Pasta Can",2770,1,0,7},
		{"Assault Pack (ACU)",3026,1,0,5},
		{"Medic Backpack",1241,1,0,2}, 
		{"Alice Pack",1242,1,0,6},
		{"Medium Backpack",1243,1,0,0.9},
		{"Czech Backpack",1244,1,0,5},
		{"Beans Can",2601,1,0,7},
		{"Burger",2768,1,0,7},
		{"Painkiller",2709,3,0,7},
		{"Empty Soda Cans",2673,0.5,0,12},
		{"Scruffy Burgers",2675,0.5,0,12},
		{"MP5A5",353,1,90,0.5},
		{"Watch",2710,1,0,3},
		--{"Heat Pack",1576,5,0,6},
		{"Wire Fence",933,0.25,0,1},
		{"Alice Pack",1248,1,0,0.5},
		{"Tire",1073,1,0,1},
		{"Morphine",1579,1,0,2},
		{"Civilian Clothing",1247,2,0,3.5},
		{"Map",1277,0.8,90,4},
		{"GPS",2976,0.15,0,1},
		{"Radio Device",330,1,0,6},
		{"Baseball Bat",336,1,90,1.4},
		{"Shovel",337,1,90,0.3}
	},
	["other"] = {
	{"Raw Meat",2804,0.5,90},
	{"Kontener",2932,0.15,0},
	{"Cooked Meat",2806,0.5,90},
	{"Full Gas Canister",1650,1.4,0},
	{"Metal",1649,1,0},
	{"Lista Metalu",1649,1,0},
	{"Weapon parts",1649,1,0},
	{"Glass",2001,0.5,0},
	{"Bulletproof Glass",2001,0.5,0},
	{"Empty Water Bottle",2683,1,0},
	{"Survivor Clothing",1247,2,0},
	{"Night Vision Goggles",368,1,90},
	{"Infrared Goggles",369,1,90},
	{"Box of Matches",328,0.4,90,5},
	{"Wood Pile",1463,0.4,0,5},
	{"M1911",346,1,90,3.5},
	{"PDW",352,1,90,2},
	{"Hunting Knife",335,1,90,2.5},
	{"Sawn-Off Shotgun",350,1,90,0.3},
	{"SPAZ-12 Combat Shotgun",351,1,90,0.4},
	{"Hatchet",339,1,90,1.8},
	{"Pizza",1582,1,0,7},
	{"Soda Bottle",2647,1,0,7},
	{"Empty Gas Canister",1650,1.4,0,5},
	{"Roadflare",324,1,90,6},
	{"Tank Parts", 1008, 1, 0, 3.5},
	{"Milk",2856,1,0,5},
	{"Painkiller",2709,3,0,7},
	{"Empty Soda Cans",2673,1.5,0,12},
	{"Scruffy Burgers",2675,0.5,0,12},
	{"MP5A5",353,1.5,90,1.5},
	{"Watch",2710,1,0,3},
	{"M4A1-S",1830,1,90,2.4},
	{"Scar-L",1899,1,90,2.4},
	{"M4A1",1901,1,90,2.4},
	{"G36C",1831,1,90,2.4},
	{"Spray",365,1,90,1},
	{"M60",1832,1,90,2.4},
	{"PKP Pecheneg",1833,1,90,2.4},
	{"MG-34",2070,1,90,2.4},
	{"AK-47",1834,1,90,2.4},
	{"SA-58V ACOG",1838,1,90,2.4},
	{"Cheytac M200",1870,1,90,0.4},
	{"AWP",1872,1,90,0.4},
	{"Medium Tent",1279,1,0,4.5},
	{"Large Tent",1279,1,0,4.5},
	{"Assault Pack (ACU)",3026,1,0,5},
	{"Medic Backpack",1241,1,0,2}, 
	{"Alice Pack",1242,1,0,6},
	{"Medium Backpack",1243,1,0,0.9},
	{"Czech Backpack",1244,1,0,5},
	{"Big Backpack",1245,1,0,5},
	{"Military Backpack",1246,1,0,2}, 
	{"Coyote Backpack",1575,1,0,5},
	{"CMAR Backpack",1249,1,0,2},
--	{"Heat Pack",1576,5,0,6},
	{"Wire Fence",933,0.25,0,1},
	{"Rope",933,0.25,0,1},
	{"Tire",1073,1,0,1},
	{"Morphine",1579,2,0,2},
	{"Civilian Clothing",1247,2,0,3.5},
	{"Map",1277,0.8,90,4},
	{"Sandbag",2060,1,0,0},
	{"Bush",647,0.2,0,0},
	{"Safe",2332,0.9,0,0},
	{"Toolbox",2969,1.5,0,3},
	{"Trap",1920,1,0,3},
	{"Engine",929,0.3,0,3.5},
	{"Winchester 1866",349,1,90,2},
	{"AA-12",2056,1,90,2},
	{"Water Bottle",2683,1,0,4},
	{"Coca Cola",2683,1,0,4},
	{"Kebab",2769,1,0,2},
	{"M9 SD",347,1,90,5},
	{"Grenade",342,1,0,0.5},
	{"Binoculars",369,1,0,4},
	{"Camouflage Clothing",1247,2,0,4.5},
	{"Ghillie Suit",1247,2,0,0.01},
	{"Woman Clothing",1247,2,0,0.01},
	{"Reabel Clothing",1247,2,0,0.01},
	{"Kombinezon X",1247,2,0,4.5},
	{"Military Clothing [F]",1247,2,0,4.5},
	{"Ghillie Suit [F]",1247,2,0,4.5},
	{"Bandage",1578,3,0,4},
	{"Pasta Can",2770,1,0,5},
	{"Beans Can",2601,1,0,6},
	{"Burger",2768,1,0,2},
	{"Tent",1279,1,0,0.5},
	{"M1911",346,1,90,3},
	{"Desert Eagle",348,1,90,3},
	{"GPS",2976,0.15,0,1},
	{"Military GPS",2976,0.15,0,1},
	{"Medic Kit",2891,2.2,0},
	{"Helmet",2050,1,0},
	{"Helmet [75%]",2050,1,0},
	{"Helmet [50%]",2050,1,0},
	{"Helmet [25%]",2050,1,0},
	{"Mossy Helmet",2049,1,0},
	{"Mossy Helmet [80%]",2049,1,0},
	{"Mossy Helmet [60%]",2049,1,0},
	{"Mossy Helmet [40%]",2049,1,0},
	{"Mossy Helmet [20%]",2049,1,0},
	{"Mossy Helmet [10%]",2049,1,0},
	{"Police Vest",2012,1,0},
	{"Police Vest [75%]",2012,1,0},
	{"Police Vest [50%]",2012,1,0},
	{"Police Vest [25%]",2012,1,0},
	{"Tactical Vest",1997,1,0},
	{"Tactical Vest [80%]",1997,1,0},
	{"Tactical Vest [60%]",1997,1,0},
	{"Tactical Vest [40%]",1997,1,0},
	{"Tactical Vest [20%]",1997,1,0},
	{"Tactical Vest [10%]",1997,1,0},
	{"First Aid Kit",2891,2.2,0},
	{"Medic Bag",2891,2.2,0},
	{"Blood Bag",1580,1.5,0},
	{"Radio Device",2966,0.5,0,5},
	-- {"Golf Club",333,1,90,1.9},
	{"Harvest Scythe",333,1,90,1.9},
	{"Chainsaw",341,1,90,1.9},
	{"Baseball Bat",336,1,90,1.4},
	{"Shovel",337,1,90,1.5},
	{"Flara",343,1,0,0.5},
	{"1866 Slug",2358,2.5,0},
	{"2Rnd. Slug",2358,2.5,0},
	{"SPAZ-12 Pellet",2358,3,0},
	{"M4A1-S Mag",1271,2,0},
	{"Scar-L Mag",1271,2,0},
	{"G36C Mag",1271,2,0},
	{"AA-12 Mag",1271,2,0},
	{"M60",1832,1,90,0.9},
	{"AK-47",1834,1,90,0.9},
	{"M16A4",1835,1,90,0.9},
	{"SA-58V ACOG",1838,1,90,0.9},
	{"M60 Mag",1271,2,0},
	{"PKP Pecheneg Mag",1271,2,0},
	{"MG-34 Mag",1271,2,0},
	{"AK-47 Mag",1271,2,0},
	{"M16A4 Mag",1271,2,0},
	{"SA-58V ACOG Mag",1271,2,0},
	{"Cheytac M200 Mag",2358,2.5,0},
	{"AWP Mag",2358,2.5,0},
	{"Barrett M107 Mag",2358,2.5,0},
	{"SVD Dragunov Mag",2358,2.5,0},
	{"DMR Mag",2358,2.5,0},
	{"DMR",1869,1,90,0.4},
	{"Lee Enfield Mag",2358,2.5,0},
	{"Lee Enfield",357,1,90,0.3},
	{"M1911 Mag",3013,2,0},
	{"M9 SD Mag",3013,2,0},
	{"Desert Eagle Mag",3013,2,0},
	{"PDW Mag",3013,2,0},
	{"MP5A5 Mag",3013,2,0},
	{'Small Armybox [D]',964,0.4,0},
	{'Small Armybox [B]',964,0.4,0},
	{'Wrench',2057,1.3,90},
	--[[{"Spawn [Bobcat] [168H] [D]",3016,0.6,0},
	{"Spawn [Bobcat] [168H] [B]",3016,0.6,0},
	{"Spawn [Bobcat] [672H] [B]",3016,0.6,0},
	{"Spawn [Bobcat] [Forever] [B]",3016,0.6,0},
	{"Spawn [Mesa] [24H] [D]",3016,0.6,0},
	{"Spawn [Mesa] [168H] [D]",3016,0.6,0},
	{"Spawn [Mesa] [168H] [B]",3016,0.6,0},
	{"Spawn [Mesa] [672H] [B]",3016,0.6,0},
	{"Spawn [Mesa] [Forever] [B]",3016,0.6,0},
	{"Spawn [Police Maverick] [24H] [D]",3016,0.6,0},
	{"Spawn [Police Maverick] [168H] [D]",3016,0.6,0},
	{"Spawn [Police Maverick] [168H] [B]",3016,0.6,0},
	{"Spawn [Police Maverick] [672H] [B]",3016,0.6,0},
	{"Spawn [Police Maverick] [Forever] [B]",3016,0.6,0},
	{"Spawn [Dodo] [24H] [D]",3016,0.6,0},
	{"Spawn [Dodo] [168H] [B]",3016,0.6,0},
	{"Spawn [Dodo] [672H] [B]",3016,0.6,0},
	{"Spawn [Dodo] [Forever] [B]",3016,0.6,0},
	{"Spawn [Sanchez] [24H] [D]",3016,0.6,0},
	{"Spawn [Sanchez] [168H] [D]",3016,0.6,0},
	{"Spawn [Sanchez] [168H] [B]",3016,0.6,0},
	{"Spawn [Sanchez] [672H] [B]",3016,0.6,0},
	{"Spawn [Sanchez] [Forever] [B]",3016,0.6,0},
	{"Spawn [PCJ-600] [24H] [D]",3016,0.6,0},
	{"Spawn [PCJ-600] [168H] [D]",3016,0.6,0},
	{"Spawn [PCJ-600] [168H] [B]",3016,0.6,0},
	{"Spawn [PCJ-600] [672H] [B]",3016,0.6,0},
	{"Spawn [PCJ-600] [Forever] [B]",3016,0.6,0},
	{"Spawn [FBI-Truck] [24H] [D]",3016,0.6,0},
	{"Spawn [FBI-Truck] [168H] [D]",3016,0.6,0},
	{"Spawn [FBI-Truck] [168H] [B]",3016,0.6,0},
	{"Spawn [FBI-Truck] [672H] [B]",3016,0.6,0},
	{"Spawn [FBI-Truck] [Forever] [B]",3016,0.6,0},
	--{"Spawn [S.W.A.T.] [24H] [D]",0},
	--{"Spawn [S.W.A.T.] [168H] [D]",0},
	{"Spawn [S.W.A.T.] [168H] [B]",3016,0.6,0},
	{"Spawn [S.W.A.T.] [672H] [B]",3016,0.6,0},
	{"Spawn [S.W.A.T.] [Forever] [B]",3016,0.6,0},
	{"Spawn [Bullet] [168H] [B]",3016,0.6,0},
	{"Spawn [Bullet] [672H] [B]",3016,0.6,0},
	{"Spawn [Bullet] [Forever] [B]",3016,0.6,0},
	{"Spawn [Sandking] [24H] [D]",3016,0.6,0},
	{"Spawn [Sandking] [168H] [B]",3016,0.6,0},
	{"Spawn [Sandking] [672H] [B]",3016,0.6,0},
	{"Spawn [Sandking] [Forever] [B]",3016,0.6,0},
	{"Spawn [Turismo] [168H] [B]",3016,0.6,0},
	{"Spawn [Turismo] [672H] [B]",3016,0.6,0},
	{"Spawn [Turismo] [Forever] [B]",3016,0.6,0},
	{"Spawn [Comet] [168H] [B]",3016,0.6,0},
	{"Spawn [Comet] [672H] [B]",3016,0.6,0},
	{"Spawn [Comet] [Forever] [B]",3016,0.6,0},
	{"Spawn [Landstalker] [336H] [B]",3016,0.6,0},]]
	--{'Kontener',2932,0.1,0},
	--{"Large Armybox [D]",964,0.4,0},
	--{"Large Armybox [B]",964,0.4,0},
	{"Parachute",371,1,0},
	--{"Kamizelka Taktyczna",903,1,0},
	{"Bag",1241,1,0},
	{"Alice Pack",1242,1,0},
	{"Mountain Backpack",1243,1,0},
	{"Czech Backpack",1244,1,0},
	{"Military Backpack",1246,1,0},
	{"Silencer",2052,1,0},
	{"Code card #1",2053,2,0},
	{"Code card #2",2053,2,0},
	{"Code card #3",2053,2,0},
	{"Code card #4",2053,2,0},
	{"Code card #5",2053,2,0},
	{"Code card #6",2053,2,0},
	-- nju bronie
	{"SVD Dragunov",2054,1,0},
	{"Barrett M107",2055,1,0},
	}
};

local weaponAmmoTable = {
	["Weapons"] ={
		{"M1911 Mag", "M1911", 22},
		{"M9 SD Mag", "M9 SD", 23},
		{"Desert Eagle Mag", "Desert Eagle", 24},
		{"PDW Mag", "PDW", 28},
		{"MP5A5 Mag", "MP5A5", 29},
		{"AK-47 Mag", "AK-47", 31},
		{"M16A4 Mag","M16A4",31},
		{"M4A1-S Mag", "M4A1-S", 31},
		{"M4A1-S Mag", "M4A1", 31},
		{"Scar-L Mag", "Scar-L", 31},
		{"G36C Mag", "G36C", 31},
		{"M60 Mag", "M60", 30},
		{"SA-58V ACOG Mag", "SA-58V ACOG", 31},
		{"1866 Slug", "Winchester 1866", 25},
		{"2Rnd. Slug", "Sawn-Off Shotgun", 26},
		{"SPAZ-12 Pellet", "SPAZ-12 Combat Shotgun", 27},
		{"Cheytac M200 Mag", "Cheytac M200", 34},
		{"AWP Mag", "AWP", 34},
		{"M107 Mag", "M107", 34},
		{"Lee Enfield Mag", "Lee Enfield", 33},
		--{"Flara \n", "Flara \n", 17}
	},
	["others"] = {
		{"Parachute", 46},
		{"Satchel", 39},
		{"Grenade", 16},
		{"Flara", 17},
		{"Hunting Knife", 4},
		{"Hatchet", 8},
		{"Binoculars", 43},
		{"Baseball Bat", 5},
		{"Shovel", 6},
		{"Golf Club", 2},
		{"Chainsaw", 9},
	}
};

addEvent("refreshItemLoot", true);
addEvent("onPlayerTakeItemFromGround", true);
addEvent("playerDropAItem", true);
addEvent("onPlayerChangeLoot", true);
addEvent("onPlayerTakeMissionBag",true)

function getWeaponAmmoType(weaponName)
	for _,v in ipairs(weaponAmmoTable["Weapons"]) do
		if (weaponName == v[2]) then return v[1], v[3]; end
	end
	for _,v in ipairs(weaponAmmoTable["others"]) do
		if (weaponName == v[1]) then return v[1], v[2]; end
	end
	return false, false;
end


function getRealTime_()
	local time = getRealTime()
	if time.hour<10 then
		time.hour = "0"..time.hour
	end
	if time.minute<10 then
		time.minute = "0"..time.minute
	end
	return time.hour..":"..time.minute
end

function createItemPickup(item, x, y, z, tableStringName,namber,plr,animacja)
	if (item and x and y and z) then
		local object = createObject(itemTable[tostring(tableStringName)][item][2], x, y, z, itemTable[tostring(tableStringName)][item][4], 0, math.random(0, 360)); -- 0.875
		if animacja then
			moveObject(object,1000,x,y,z-0.875,0,0,0,'OutElastic')
		else
			moveObject(object,1,x,y,z-0.875,0,0,0,'Linear')
		end
		setObjectScale(object, itemTable[tostring(tableStringName)][item][3]);
		setElementCollisionsEnabled(object, false);
		setElementFrozen(object, true);
		local col = createColSphere(x, y, z, 0.75);
		table_of_mag_value[col] = (namber or 1)
		if itemTable[tostring(tableStringName)][item][1] == "Safe" then
			setElementDoubleSided(object,true)
		end
		setElementData(col, "item", itemTable[tostring(tableStringName)][item][1]);
		local czas = getRealTime_()
		setElementData(col,"itemCooldown",czas)
		setElementData(col, "parent", object);
		setElementDimension(object,(plr and getElementDimension(plr) or 0))
		setElementDimension(col,(plr and getElementDimension(plr) or 0))
		setTimer(function(col, object)
			if isElement(col) then destroyElement(col); end
			if isElement(object) then destroyElement(object); end
		end, 900000, 1, col, object);
		return object;
	end
	return false;
end

function math.percentChance(percent, repeatTime)
	local hits = 0;
	for i = 1, repeatTime do
		local number = math.random(0, 200)/2
		if (number <= percent) then hits = hits + 1; end
	end
	return hits;
end

function createItemLoot(lootPlace, x, y, z)
	local col = createColSphere(x, y, z, 1.25);
	setElementData(col, "itemloot", true);
	setElementData(col, "parent", lootPlace);
	setElementData(col, "MAX_Slots", 12);
	for _,v in ipairs(itemTable[lootPlace]) do
		local value = math.percentChance(v[5], math.random(1, 2));
		setElementData(col, v[1], value);
		local ammoData, weapID = getWeaponAmmoType(v[1], true);
		if (ammoData and value > 0) then
			setElementData(col, ammoData, math.random(1, 2));
		end
	end
	refreshItemLoot(col, lootPlace);
	return col;
end

function refreshItemLoot(col, place)
	local objects = getElementData(col, "objectsINloot");
	if objects then
		for i = 1, 3 do
			if isElement(objects[i]) then
		 destroyElement(objects[i]); 
		end
	end
	local counter = 0;
	local obejctItem = {};
	for _,v in ipairs(itemTable["other"]) do
		if (getElementData(col, v[1]) and getElementData(col, v[1]) > 0) then
			if (counter == 3) then break; end
			counter = counter + 1;
			local x,y,z = getElementPosition(col);
			obejctItem[counter] = createObject(v[2], x+math.random(-1,1), y+math.random(-1,1), z-0.875, v[4]);
			setObjectScale(obejctItem[counter], v[3]);
			setElementCollisionsEnabled(obejctItem[counter], false);
			setElementFrozen(obejctItem[counter], true);
		end
	end
	for i = 1, 3 do
		if (obejctItem[i] == nil) then
			local x,y,z = getElementPosition(col);
			obejctItem[i] = createObject(1463, x+math.random(-1,1), y+math.random(-1,1), z-0.875, 0);
			setObjectScale(obejctItem[i], 0);
			setElementCollisionsEnabled(obejctItem[i], false);
			setElementFrozen(obejctItem[i], true);
		end
	end
	setElementData(col, "objectsINloot", {obejctItem[1], obejctItem[2], obejctItem[3]});
end
end
--addEventHandler("refreshItemLoot", root, refreshItemLoot);



function createLootPickups()
end

	
addEventHandler("onPlayerTakeItemFromGround", root, function(itemName, col)
	if not isElement(col) or not col then return end
	local getRealBomber = table_of_mag_value[col]
	if not getRealBomber then return end
	--setElementData(source, itemName, (getElementData(source, itemName) or 0) + getRealBomber);
	destroyElement(getElementData(col, "parent"));
	destroyElement(col);
	if itemName == "Flara" then
		local n = getElementData(source, "Flara \n")
		if n > 0 then 
			setElementData(source, "Flara \n", n+1)
			setWeaponAmmo(source, 17, n+1);
		else
			n = getElementData(source, "Flara")
			setElementData(source, "Flara", n+1)
		end
	else
		setElementData(source,itemName,(getElementData(source,itemName) or 0) + getRealBomber)
	end
end);

addEventHandler("onPlayerChangeLoot", root, function(loot)
	for _,v in ipairs(getElementsWithinColShape(loot, "player")) do 
		triggerClientEvent(v, "refreshLootManual", v, loot);
		setElementData(v,'MaItem',true)
	end
end);



addEventHandler("playerDropAItem", root, function(itemName,itemIlosc,realnaIlosc)
	if realnaIlosc and getElementData(source,itemName)~=realnaIlosc then return end
	--if getElementData(source,itemName)>=itemIlosc then
		local x,y,z = getElementPosition(source);
	--	outputChatBox(itemIlosc,root)
		if itemName:find("Tactical Vest") then
			z = z - 0.5
		elseif itemName:find("Police Vest") then
			z = z - 0.2
		elseif itemName:find("Helmet") then
			z = z - 0.6
		end
		local item,itemString = getItemTablePosition(itemName);
		createItemPickup(item, x + math.random(-5, 5) / 12, y + math.random(-5, 5) / 12, z, itemString,itemIlosc,source,true);
	--end
end);

function getItemTablePosition(itema)
	for i,v in ipairs(itemTable["other"]) do
		if (itema == v[1]) then return i, "other"; end
	end
	return v, itemString;
end

function refreshItemLoots()
--[[	setServerPassword(tostring(math.random(999999999))..""..tostring(math.random(999999999)));
	for _,v in ipairs(getElementsByType("colshape")) do
		if getElementData(v, "itemloot") then
			local objects = getElementData(v, "objectsINloot");
			if objects then
				if objects[1] then destroyElement(objects[1]); end
				if objects[2] then destroyElement(objects[2]); end
				if objects[3] then destroyElement(objects[3]); end
			end
			destroyElement(v);
		end 
	end
	createLootPickups();
	freezeElements(false);
	setTimer(refreshItemLootPoints, 14400000, 1);
	setServerPassword(nil);]]
end

function refreshItemLootPoints()
	--[[outputChatBox("#FF0000[Warning] #FFFFFFItem loot respawn in 1 minute!", root, 255, 255, 255, true);
	outputChatBox("#FF0000[Warning] #FFFFFFAll players, vehicles & peds will freez in 50 seconds!", root, 255, 255, 255, true);
	setTimer(freezeElements, 50000, 1, true);
	setTimer(refreshItemLoots, 60000, 1);]]
end
--setTimer(refreshItemLootPoints, 14400000, 1);
--addCommandHandler('fafafa',refreshItemLoots)
function freezeElements(bool)
	for _,v in ipairs(getElementsByType("vehicle")) do
		setElementFrozen(v, bool);
	end
	for _,v in ipairs(getElementsByType("player")) do
		setElementFrozen(v, bool);
	end
	for _,v in ipairs(getElementsByType("ped")) do
		setElementFrozen(v, bool);
	end
end

addEvent("playPlayerAnim",true)
addEventHandler("playPlayerAnim",resourceRoot,function(player,t)
	setPedAnimation(player, t[1], t[2], t[3], t[4], t[5], t[6], t[7]);
end)

local repairs = {}
local p_repairs = {}


addEvent("startRepair",true)
addEventHandler("startRepair",resourceRoot,function(veh)
	local check = exports.DayZ_Automatic_base:isVehicleInBase(client,veh)
	if check then return end
	if repairs[veh] and isElement(repairs[veh]) then
		outputChatBox("* Już ktoś naprawia to auto!",client,255,0,0)
		return
	end
	triggerClientEvent(client,"rozpocznijNaprawe",resourceRoot,veh)
	repairs[veh] = client
	setElementFrozen(veh,true)
	repairs[client] = veh
end)

addEventHandler("onPlayerWasted",root,function()
	if repairs[source] then
		setElementFrozen(repairs[repairs[source]],false)
		repairs[repairs[source]] = nil
		repairs[source] = nil
	end
end)

addEventHandler("onPlayerQuit",root,function()
	if repairs[source] then
		setElementFrozen(repairs[repairs[source]],false)
		repairs[repairs[source]] = nil
		repairs[source] = nil
	end
	if isPlayerInVehicle(source) then
		removePedFromVehicle(source)
	end
end)

function stopRepair(veh,p,h)
	if h == "full" then
		fixVehicle(veh)
	end
	repairs[veh] = nil
	setElementFrozen(veh,false)
	repairs[p] = nil
	setPedAnimation(p)
end
addEvent("stopRepair",true)
addEventHandler("stopRepair",resourceRoot,stopRepair)

addEvent("ChangeVehHPState",true)
addEventHandler("ChangeVehHPState",resourceRoot,function(car,x)
	setPedAnimation(client, "SCRATCHING", "sclng_r", nil, true, false);
	setElementFrozen(car,true)
	setElementHealth(car,getElementHealth(car) + 5 * (x and 6 or 1) )
end)


addEventHandler("onColShapeLeave",root,function(element,dimension)
	if not dimension then return end
	if isElement(element) and getElementType(element) ~= "player" or not isElement(element) then return end
	if getElementData(element,'currentCol') == source then
		setElementData(element,"loot",nil)
		setElementData(element,"currentCol",nil)
		triggerClientEvent(element,"disableMenu",resourceRoot)
	end
end)

--createLootPickups();