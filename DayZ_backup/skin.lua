local h1, h2, h3 = debug.gethook()
debug.sethook()

debug.sethook( _, h1, h2, h3 )


function math.percentChance(percent, repeatTime)
	local hits = 0;
	for i = 1, repeatTime do
		local number = math.random(0, 200)/2
		if (number <= percent) then hits = hits + 1; end
	end
	return hits;
end

local weaponAmmoTable = {
	["Weapons"] ={
		{"M1911 Mag", "M1911", 22, 346},
		{"M9 SD Mag", "M9 SD", 23, 347},
		{"Desert Eagle Mag", "Desert Eagle", 24, 348},
		{"PDW Mag", "PDW", 28, 352},
		{"MP5A5 Mag", "MP5A5", 29, 353},
		{"AKS-74U Mag", "AKS-74U", 31, 1839},
		{"AK-47 Mag", "AK-47", 31, 1834},
		{"AKS Gold Mag", "AKS Gold", 31, 1835},
		{"M4A1-S Mag", "M4A1-S", 31, 1830},
		{"M4A1-S Mag", "M4A1", 31, 1901},
		{"Scar-L Mag", "Scar-L", 31, 1899},
		{"MK 48 Mod 0 Mag", "MK 48 Mod 0", 30, 1880},
		{"M60 Mag", "M60", 30, 1832},
		{"PKP Mag", "PKP", 30, 1833},
		{"SA-58V ACOG Mag", "SA-58V ACOG", 31, 1838},
		{"1866 Slug", "Winchester 1866", 25, 349},
		{"2Rnd. Slug", "Sawn-Off Shotgun", 26, 350},
		{"SPAZ-12 Pellet", "SPAZ-12 Combat Shotgun", 27, 351},
		{"DMR Mag", "DMR", 34, 1869},
		{"KVSK Mag", "KVSK", 34, 1870},
		{"AS50 Mag", "AS50", 34, 1871},
		{"AWP Mag", "AWP", 34, 1872},
		{"Mosin 9130 Mag", "Mosin 9130", 34, 1873},
		{"M24 Mag", "M24", 34, 1874},
		{"M107 Mag", "M107", 34, 1875},
		{"SVD Dragunov Camo Mag", "SVD Dragunov Camo", 34, 1876},
		{"Lee Enfield Mag", "Lee Enfield", 33, 357}
	},
	["others"] = {
		{"Tear Gas", 17, 343, "Tear Gas \n"},
		{"Grenade", 16, 342, "Grenade \n"},
		{"Hunting Knife", 4, 335, "Hunting Knife \n"},
		{"Hatchet", 8, 339, "Hatchet \n"},
		{"Binoculars", 43, 367, "Binoculars \n"},
		{"Baseball Bat", 5, 336, "Baseball Bat \n"},
		{"Shovel", 6, 337, "Shovel \n"},
		{"Harvest Scythe", 2, 333, "Harvest Scythe \n"},
		{"Spray", 1, 365, "Spray \n"},
	}
};


local check_namioty = {}

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
local vehicleSpawns = {
	--Comet
{480, 2588.27, -2338.81, 13.29, 359.6, 360.0, 182.5},
{480,  1419.95, 2519.88, 10.49, 359.5, 359.9, 91.4},
{480, -2534.53, 1229.47, 37.08, 359.6, 360.0, 210.2},

	--Merit
{551, -2028.08, 133.43, 28.46, 359.6, 0.0, 0.2},
{551, -2680.05, 274.50, 3.96, 359.7, 360.0, 179.5},
{551, 1709.68, 1454.92, 10.36, 359.7, 355.0, 166.1},
{551, 2120.52, -1777.86, 13.01, 359.7, 360.0, 89.5},
{551, 314.70, -1809.02, 4.11, 0.9, 359.9, 1.0},

	--Sabre
{475, 1098.72, -1774.60, 13.18, 1.5, 0.1, 2.1},
{475, 2242.24, -1237.08, 24.70, 353.0, 359.6, 359.3},
{475, 2172.36, 1019.25, 10.65, 1.5, 0.1, 269.0},
{475, 2453.02, 1990.18, 10.64, 1.5, 0.1, 354.9},
{475, -2071.88, 973.89, 62.74, 1.6, 0.1, 187.2},

	--Sultan
{560, -2532.88, 308.27, 27.64, 0.5, 0.1, 298.7},
{560, -737.24, 1643.19, 27.23, 359.3, 359.9, 151.0},
{560, 2817.19, -1429.25, 32.01, 0.5, 0.1, 177.6},
{560, 658.31, -499.98, 16.22, 0.5, 0.1, 358.6},

	--Bannshe
{429, 310.98, -41.24, 1.44, 359.9, 0.0, 0.2},
{429, 1096.14, 2207.09, 16.62, 0.9, 360.0, 179.1},
{429, -2239.31, -2312.48, 30.25, 1.5, 4.5, 197.4},

	--Buffalo
{402, -1365.50, 2497.09, 87.39, 355.8, 0.8, 277.7},
{402, -2613.52, 2249.86, 7.80, 0.6, 359.7, 359.1},
{402, 479.71, -1088.74, 82.07, 1.1, 0.1, 356.3},

	--Dodo
{593, 3147.34, -1080.35, 6.22, 5.0, 0.0, 335.4},
{593, 1583.38, -2650.85, 13.88, 4.9, 360.0, 359.9},
{593, -1395.04, 507.84, 18.58, 4.9, 0.0, 268.7}, 
{593, 290.53125,2543.7333984375,17.146965026855,4.7845458984375,0,180},

	--Clover
{542, 1511.67, 2258.34, 10.68, 359.9, 360.0, 176.8},
{542, 2620.07, 2204.68, 10.68, 359.9, 359.7, 0.1},
{542, 2831.92, -1677.53, 9.77, 359.7, 0.6, 169.0},
{542, 1917.11, -1789.28, 13.25, 359.9, 0.1, 270.3},
{542, -2104.76, -808.69, 32.03, 359.9, 360.0, 88.6},
{542,-2320.32, 997.56, 50.56, 359.8, 360.0, 85.4},

	--PoliceLS
{596, -1623.43, 650.40, -5.47, 359.7, 0.0, 89.7},
{596, 1544.18, -1610.75, 13.18, 359.8, 0.0, 274.5},
{596, 615.57, -608.09, 16.99, 359.7, 0.0, 1.3},
{542,2403.24, 2547.40, 21.64, 359.7, 0.0, 271.2},

	--DFT-30
--[[{578, 2609.7705078125,-978.3369140625,80.879661560059},
{578, 60.15625,-258.1416015625,1.578125},
{578, 2538.4716796875,2787.39453125,10.8203125},
{578, 1039.9521484375,2071.912109375,10.8203125},
{578, 641.603515625,1225.978515625,11.711267471313},]]

	--Flash
{565, 2851.94, 2374.36, 10.44, 359.7, 359.9, 90.9},
{565, 1090.78, -639.16, 112.55, 357.8, 5.8, 0.1},
{565, -1896.18, -838.08, 31.65, 359.6, 360.0, 88.6},
{565, -2460.66, 742.27, 34.64, 359.6, 0.0, 179.6},
{565, -1787.71, 1206.03, 24.75, 359.6, 0.0, 180.2},

	--Fbi truck
--[[{528, 2055.673828125,1911.1259765625,12.168135643005},
{528, 1613.9345703125,1685.62109375,10.8203125},
{528, -265.740234375,994.361328125,19.775972366333},
{528, -1452.5712890625,312.9345703125,7.1875},
{528, 1264.9599609375,-2011.572265625,59.278167724609},]]

	--Elegy
{562,-1884.11, -202.10, 15.50, 13.6, 0.1, 270.1},
{562,-297.08, 1294.02, 53.14, 0.6, 358.6, 355.6},
{562,1393.32, 303.31, 19.15, 358.9, 360.0, 243.9},
{562,1095.27, -1250.51, 15.42, 358.9, 360.0, 360.0},

	--Supergt
{506, 2655.87, -2117.44, 13.25, 360.0, 360.0, 92.6},
{506, 2284.54, 1387.40, 29.73, 360.0, 360.0, 0.6},
{506, -2651.87, -283.02, 7.20, 0.8, 0.0, 134.8},

	--Infernus
{411, 1295.90, -987.99, 32.16, 0.4, 0.0, 51.4},

-- Leviathan
{417, -2318.7958984375,-1647.880859375,483.9235534668, 0.1922607421875,0.3900146484375,211.80541992188},

	--Swat
{601, -2156.58, -193.95, 35.38, 360.0, 360.0, 181.1},
{601, -540.34, -74.25, 62.92, 360.0, 360.0, 270.5},
{601, 3282.89, -1293.87, 5.76, 359.9, 360.0, 336.3},
{601, 1684.87, 676.56, 10.88, 360.0, 359.9, 358.7},
{601, 577.37, 1218.01, 11.80, 0.9, 1.8, 121.7},

	--Sunrise
{550, -2467.81, 2512.50, 16.77, 358.8, 350.7, 183.6},
{550, -1287.81, 2714.94, 49.65, 359.4, 359.8, 186.8},
{550, 1658.12, 2834.73, 10.42, 359.4, 359.9, 184.6},
{550, 1195.37, 248.38, 19.14, 359.4, 359.8, 337.4},
{550, 2482.78, -1752.69, 13.10, 359.3, 359.8, 359.9},
{550, 1400.89, -2263.79, 13.13, 359.3, 359.8, 359.0},
{550, -2796.40, -102.23, 6.78, 359.2, 359.8, 88.5},
{550, -1756.71, 954.76, 24.33, 359.4, 359.8, 89.0},

	--SeaSparrow
{447, -2223.53, 2429.49, 0.83, 0.0, 360.0, 314.2},
{447, 175.21, 592.21, 0.83, 0.0, 360.0, 0.0},
{447, 2294.92, 493.81, 0.83, 0.0, 360.0, 0.1},
{447, 2956.17, -2049.65, 0.82, 0.1, 0.4, 171.8},
{447, -1637.17, 163.84, 0.83, 0.0, 360.0, 312.8},

	--Coach
{437, -1853.39, 116.84, 15.24, 360.0, 360.0, 358.7},
{437, -2410.22, 330.61, 35.10, 0.0, 360.0, 329.0},
{437, 1776.87, -1930.15, 13.52, 0.0, 360.0, 0.0},
{437, 2228.56, -1350.64, 24.12, 360.0, 359.9, 0.1},

	--[[bullet]]
{541, -1184.48, -1138.72, 128.64, 359.7, 0.0, 0.2},
{541, -426.96, 1395.14, 15.32, 8.7, 359.0, 12.2},

	--[[Maverick]]
{487, 1765.72, -2285.66, 26.95, 0.3, 359.7, 181.7},
{487, 1291.48, -787.78, 96.62, 0.4, 359.7, 180.1},
{487, 2859.19, 942.06, 13.39, 0.3, 359.6, 90.7},
{487, 1331.17, 1612.01, 10.98, 0.3, 359.7, 271.2},
{487, 365.79, 1960.08, 17.80, 0.3, 359.7, 94.3},
{487, -2227.52, 2328.51, 7.71, 0.3, 359.7, 180.5},
{487, -1185.62, 24.55, 14.32, 0.3, 359.7, 46.2},
{487, -2661.40, 628.63, 66.26, 0.3, 359.7, 274.0},

	--[[Patriot]]

{470,-1360.98, 300.04, 6.98, 0.4, 0.0, 358.6},
{470,829.64, -1214.97, 16.77, 0.4, 0.0, 268.3},
{470,2296.34, 2770.45, 10.61, 0.4, 0.0, 269.4},
{470,182.19, 1783.07, 17.43, 0.4, 0.0, 0.8},

	--Sandking
{495, -659.57, 2319.43, 139.05, 2.3, 2.5, 41.3},
{495, -798.83, -1886.87, 11.72, 0.0, 4.7, 283.5},
{495, 2226.56, -2292.20, 14.06, 0.1, 3.8, 135.8},

	--[[Sanchez]]
{468, 1782.64, -1702.86, 13.18, 0.9, 0.0, 2.2},
{468, 2351.38, -652.64, 127.72, 1.2, 360.0, 181.7},
{468, 1928.27, 173.87, 36.96, 1.2, 0.0, 77.0},
{468, 826.60, 858.50, 11.93, 4.8, 1.1, 279.7},
{468, -259.76, 1158.80, 19.42, 1.1, 0.0, 95.2},
{468, -1669.06, 2495.63, 86.74, 358.7, 356.5, 274.9},
{468, -1860.75, -1726.21, 21.42, 1.5, 360.0, 18.9},
{468, -571.01, -1478.87, 9.98, 1.4, 6.0, 356.4},
{468, 2446.51, -1978.35, 13.22, 1.1, 360.0, 266.7},

	--[[Barracks]]
{433,2709.98, -2544.60, 13.33, 0.0, 360.0, 0.0},
{433,136.13, 1919.31, 18.69, 1.8, 0.1, 0.0},
{433, -2078.87, 1429.48, 6.82, 0.0, 0.0, 179.7}, 
	
	--Reefer
{453, -1891.89, 1400.41, -0.35, 359.6, 359.9, 89.1},
{453, -1477.88, 676.01, -0.35, 359.6, 359.9, 180.0},
{453, -426.08, 1168.28, -0.34, 359.6, 359.9, 91.0},
{453, 1627.03, 568.29, -0.35, 359.6, 359.9, 178.9},
{453, 2092.89, -109.95, -0.40, 359.6, 359.9, 126.3},
{453, 2302.13, -2422.46, -0.61, 359.6, 359.9, 140.8},
{453, 723.28, -1505.62, -0.15, 359.6, 359.8, 180.1},
{453, -2961.51, 496.32, -0.13, 359.6, 359.7, 357.7},

	--Sparrow
{469, 365.67, 2538.53, 16.76, 0.8, 359.5, 180.2},
{469, 1059.12, 1748.08, 10.80, 0.4, 359.6, 0.8},
{469, 1152.74, -2037.15, 69.02, 0.3, 359.7, 269.1},
{469, 2392.82, 1135.75, 34.27, 0.3, 359.7, 90.8},
{469, -2052.79, -198.58, 35.31, 0.4, 359.6, 358.5},

	--Ambulans
{416, 1199.09765625,-1312.2724609375,13.3984375},
{416, 2030.5205078125,-1415.703125,16.9921875},
{416, 1221.59375,301.556640625,19.5546875},
{416, -347.8681640625,1047.6396484375,19.940929412842},
{416, 1588.40625,1829.6640625,10.8203125},
{416, -1532.6328125,2524.896484375,55.852394104004},
{416, -2666.74609375,625.8134765625,14.453125},

	--NRG 
{522, -343.35, 1544.40, 75.14, 1.2, 0.0, 180.7},
{522, -2461.27, 157.98, 34.54, 1.3, 360.0, 176.1},
{522, 1128.90, -1490.39, 22.35, 1.2, 360.0, 359.2},
{522, 2761.21, -1177.12, 68.99, 1.2, 359.9, 88.0},

	--PCJ
{461, 797.62, -616.71, 15.92, 1.2, 360.0, 2.5},
{461, 397.65, -1541.98, 31.86, 1.2, 0.0, 357.3},
{461, -2617.45, -159.49, 3.92, 1.2, 0.0, 266.9},
{461, -1656.11, 1313.92, 6.62, 1.2, 360.0, 139.1},
{461, 1938.06, 1344.43, 8.83, 1.1, 360.0, 0.2},
{461, 1426.20, 1039.35, 9.79, 6.3, 0.1, 89.2},

	--Cheetah
{415, 2872.66, -2124.79, 4.30, 346.2, 5.2, 274.4},
{415, 2540.37, 2372.44, 3.97, 0.6, 360.0, 88.0},
{415, -2459.59, -5.00, 27.70, 0.6, 360.0, 207.6},

	--Bandito
{568, -2333.60, -125.24, 35.17, 359.2, 0.0, 180.0},	
{568, -473.28, -177.57, 78.06, 359.2, 0.0, 180.3},	
{568, 889.78, -23.35, 63.10, 358.4, 359.3, 160.6},	
{568, 540.50, 881.32, -35.92, 348.8, 0.5, 76.2},	
{568, -440.76, 2215.99, 42.24, 359.4, 360.0, 280.2},	
{568, 386.07, 2599.05, 16.34, 359.1, 359.9, 190.8},	

	--Turismo
{451, -1456.59, -102.91, 5.68, 2.2, 359.9, 1.7},	
{451, 1739.46, 2338.98, 14.51, 2.2, 359.9, 90.1},	

	--Landstalker
{400, 1478.19, 2878.75, 10.91, 360.0, 0.0, 182.2},	
{400, 2130.57, 2649.37, 10.92, 360.0, 0.0, 0.0},	
{400, 2430.51, 1873.57, 8.26, 360.0, 0.0, 1.4},	
{400, 2552.39, 9.66, 27.12, 359.4, 360.0, 89.7},	
{400, 1543.96, 16.58, 24.23, 359.9, 0.1, 276.9},
{400, -416.73, -1750.56, 6.91, 5.3, 359.8, 2.6},	
{400, -1442.27, -1577.28, 101.86, 360.0, 0.0, 89.0},	
{400, -1048.63, -672.32, 32.43, 360.0, 0.0, 0.0},	
{400, -2278.15, 187.30, 35.26, 360.0, 0.0, 265.3},	
{400, -2888.74, 1016.06, 36.89, 359.4, 356.1, 290.2},	

	--BlistaCompact
{496, -2380.31, 1232.14, 31.83, 1.2, 353.6, 270.1},	
{496, -1580.87, 418.76, 9.10, 0.0, 360.0, 322.6},	
{496, -2394.81, -595.75, 132.36, 0.0, 360.0, 124.0},	
{496, -1035.23, -1188.39, 128.93, 0.1, 0.1, 88.3},	
{496, -53.08, -1147.81, 0.79, 0.0, 360.0, 60.4},	
{496, 1213.19, -902.74, 42.64, 0.1, 359.9, 185.4},	

	--Huntley
{579, 2015,-1199,21, 359.4, 359.9, 92.6},	
{579, 2182.45, -1990.49, 13.48, 359.4, 360.0, 351.6},	
{579, -2815.96, -1511.74, 139.22, 359.3, 359.9, 273.5},	
{579, 383.14, -2073.05, 7.85, 359.7, 0.0, 0.0},	
{579, 2330.47, 155.83, 26.98, 349.8, 359.4, 267.1},	
};






local lootItems = {
	["helicrashsides"] = {
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
		{"MP5A5",353,1,90,2.8},
		{"Watch",2710,1,0,4},
		{"Heat Pack",1576,5,0,3},
		{"Wire Fence",933,0.25,0,1},
		{"Night Vision Goggles",368,1,90,4},
		{"Binoculars",369,1,0,4},
		{"Tire",1073,1,0,2},
		{"Morphine",1579,1,0,4},
		{"Camouflage Clothing",1247,2,0,4.5},
		{"Civilian Clothing",1241,2,0,3},
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
		{"Radio Device",330,1,0,6},
		{"Shovel",337,1,90,1},
	},
};

local backupItemsTable = {
		{"M4A1-S \n", 0},
		{"M4A1 \n", 0},
		--{"MK 48 Mod 0 \n", 0},
		--{"M60 \n", 0},
		{"PKP Pecheneg \n", 0},
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
		--{"MK 48 Mod 0", 3},
		--{"M60", 3},
		{"PKP Pecheneg", 3},
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
		{"Flara \n", 0,_,"Flara"},
		{"Binoculars \n", 0,_,"Lornetka"},
		{"Tear Gas", 1},
		{"Grenade", 1,_,"Granat"},
		{"Flara", 1,_,"Flara"},
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
	--	{"MK 48 Mod 0 Mag", 0.035},
		--{"M60 Mag", 0.035},
		{"PKP Pecheneg Mag", 0.035},
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
		{"Kontener",10,"Pitch a kontener"},
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
		{"Wrench", 1.5,_,"Klucz"},
};

local vehicleAddonsInfo = {
	[422]={ 4, 1, 1, 80}, --Bobcat
	[470]={ 4, 1, 1, 120}, --Patriot
	[468]={ 2, 1, 1, 30}, --Sanchez
	[433]={ 6, 1, 1, 260}, --Barrack
	[437]={ 6, 1, 1, 120}, --Coach
	[509]={ 0, 0, 0, 0},  --Bike
	[487]={ 0, 1, 1, 40}, --Maverick
	[497]={ 0, 1, 1, 40}, --PoliceMaverick
	[453]={ 0, 1, 1, 60}, --Reffer
	[411]={ 4, 1, 1, 60}, --Infernus
	[415]={ 4, 1, 1, 60}, --Cheetah
	[541]={ 4, 1, 1, 60}, --Bullet
	[429]={ 4, 1, 1, 60}, --Bannshe
	[480]={ 4, 1, 1, 60}, --Comet
	[402]={ 4, 1, 1, 60}, --Buffalo
	[495]={ 4, 1, 1, 120}, --SandKing
	[560]={ 4, 1, 1, 80}, --Sultan
	[579]={ 4, 1, 1, 120}, --Huntley
	[562]={ 4, 1, 1, 60}, --Elegy
	[482]={ 4, 1, 1, 80}, --Burrito
	[496]={ 4, 1, 1, 60}, --BlistaCompact
	[475]={ 4, 1, 1, 60}, --Sabre
	[507]={4, 1, 1, 60}, --Elegant
	[551]={ 4, 1, 1, 60}, --Merit
	[522]={ 2, 1, 1, 40}, --NRG500
	[461]={ 2, 1, 1, 40}, --PCJ600
	[420]={ 4, 1, 1, 60}, --Taxi
	[416]={ 4, 1, 1, 120}, --Karetka
	[417]={ 6, 2, 1, 500}, --Leviatan
	[511]={ 2, 2, 1, 180}, --Beagle
	[593]={ 3, 1, 1, 120}, --Dodo
	[471]={ 4, 1, 1, 50}, --Quad
	[500]={ 4, 1, 1, 80}, --Mesa
	[542]={ 4, 1, 1, 60}, --Clover
	[447]={ 0, 1, 1, 40}, --SeaSparrow
	[494]={ 4, 1, 1, 60}, --HotringRacer
	[550]={ 4, 1, 1, 60}, --Sunrise
	[445]={ 4, 1, 1, 60}, --Admiral
	[525]={ 4, 1, 1, 80}, --TowTruck
	[601]={ 4, 1, 1, 260}, --Swat
	[469]={ 0, 1, 1, 40}, --Sparrow
	[506]={ 4, 1, 1, 60}, --Supergt
	[400]={ 4, 1, 1, 160}, --LandStarker
	[528]={ 4, 1, 1, 160}, --FBI truck
	[483]={ 4, 1, 1, 100}, --Camper
	[565]={ 4, 1, 1, 60}, --Flash
	[578]={ 4, 1, 1, 160}, --DFT-30
	[451]={ 4, 1, 1, 60}, --Turismo
	[596]={ 4, 1, 1, 80}, --PoliceLS
	[416]={ 4, 1, 1, 100}, --Ambulas
        [568]={ 4, 1, 1, 60}, --Bandito
       


};

local vehicleFuelTable = {
	[422]={ 80}, --Bobcat
	[470]={ 150}, --Patriot
	[468]={ 60}, --Sanchez
	[433]={ 250}, --Barrack
	[437]={ 150}, --Coach
	[509]={ 0},  --Bike
	[416]={ 0.25}, --Ambulans
	[487]={ 250}, --Maverick
	[497]={ 250}, --PoliceMaverick
	[453]={ 80}, --Reffer
	[411]={ 100}, --Infernus
	[415]={ 100}, --Cheetah
	[541]={ 100}, --Bullet
	[429]={ 100}, --Bannshe
	[480]={ 100}, --Comet
	[402]={ 100}, --Buffalo
	[495]={150}, --SandKing
	[560]={ 100}, --Sultan
	[579]={ 100}, --Huntley
	[562]={ 100}, --Elegy
	[482]={ 100}, --Burrito
	[496]={ 100}, --BlistaCompact
	[475]={ 100}, --Sabre
	[507]={ 100}, --Elegant
	[551]={ 100}, --Merit
	[522]={ 80}, --NRG500
	[461]={ 80}, --PCJ600
	[420]={ 100}, --Taxi
	[416]={ 100}, --Karetka
	[417]={ 350}, --Leviatan
	[511]={ 400}, --Beagle
	[593]={ 250}, --Dodo
	[471]={ 80}, --Quad
	[500]={ 100}, --Mesa
	[542]={ 100}, --Clover
	[447]={ 150}, --SeaSparrow
	[494]={ 100}, --HotringRacer
	[550]={ 100}, --Sunrise
	[445]={ 100}, --Admiral
	[525]={ 120}, --TowTruck
	[601]={ 300}, --Swat
	[469]={ 200}, --Sparrow
	[506]={ 100}, --Supergt
	[400]={ 200}, --LandStarker
	[528]={ 250}, --FBI truck
	[483]={ 100}, --Camper
	[565]={ 100}, --Flash
	[578]={ 180}, --DFT-30
	[451]={ 100}, --Turismo
	[596]={ 100}, --PoliceLS
        [568]={ 60}, --Bandito
};

local car_timers = {}
local backupdone = true;

if not fileExists('backup.db') then
	backupdone = false
end

local db = dbConnect("sqlite", "backup.db");
dbExec(db, "CREATE TABLE IF NOT EXISTS `vehicles` (model, x, y, z, rX, rY, rZ, slots, fuel, engines, moving, parts, items, health, dayz, sx, sy, sz, id,friz,dimension,szyba)");
local db_tent = dbConnect("sqlite", "backup_tents.db");
dbExec(db_tent, "CREATE TABLE IF NOT EXISTS `tents` (model, x, y, z, rX, rY, rZ, slots, scale, items, id,gang,dimension)");
dbExec(db_tent, "CREATE TABLE IF NOT EXISTS `safes` (model, x, y, z, rX, rY, rZ, slots, scale, items, id,password,dimension)");


local tenty_sloty = {
["Tent"]=100,
["Medium Tent"]=250,
["Large Tent"]=500,
}

addEvent("onPlayerPitchATent", true);
addEventHandler("onPlayerPitchATent", root, function(itemName,x,y,z,rx,ry,rz,dimension)
if getElementData(source,itemName)<=0 then return end
	setElementData(source, itemName, getElementData(source, itemName) - 1);
	setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
	
	setTimer(function(source,xx,xy,xz,xrx,xry,xrz,itemNejm,dimension)
			--[[local x,y,z = getElementPosition(source);
		local xr,yr,zr = getElementRotation(source);
		local offsetRot = math.rad(zr+90);
		local vx = x+5*math.cos(offsetRot);
		local vy = y+5*math.sin(offsetRot);
		local vrot = zr+180;]]
		local tent = createObject(3243, xx,xy,xz,xrx,xry,xrz);
		setObjectScale(tent, 1);
		local tentCol = createColSphere(xx, xy, xz, 3);
			if getElementData(source,'Moze-Otwierac') then
		local cuboid,grupa = unpack(getElementData(source,'Moze-Otwierac'))
		setElementData(tentCol,'Tent-Otwieranie',grupa)
		end
		setElementDimension(tent,dimension)
		setElementDimension(tentCol,dimension)
		attachElements(tentCol, tent, 0, 0, 0);
		setElementData(tentCol, "parent", tent);
		table.insert(check_namioty, {col = tentCol, time = getTickCount() + 86400000})
		setElementData(tent, "parent", tentCol);
		setElementData(tentCol, "tent", true);
		if tenty_sloty[itemName] then
		setElementData(tentCol, "MAX_Slots", tenty_sloty[itemName]);
		end
		triggerClientEvent(source, "refreshInventoryManual", source);
	end, 2000, 1, source,x,y,z,rx,ry,rz,itemName,dimension);
end);

addEvent("onPlayerPitchASafe", true);
addEventHandler("onPlayerPitchASafe", root, function(itemName,x,y,z,rx,ry,rz,dimension,pass)
if getElementData(source,itemName)<=0 then return end
	setElementData(source, itemName, getElementData(source, itemName) - 1);
	setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
	
	setTimer(function(source,xx,xy,xz,xrx,xry,xrz,itemNejm,dimension)
			--[[local x,y,z = getElementPosition(source);
		local xr,yr,zr = getElementRotation(source);
		local offsetRot = math.rad(zr+90);
		local vx = x+5*math.cos(offsetRot);
		local vy = y+5*math.sin(offsetRot);
		local vrot = zr+180;]]
		local tent = createObject(2332, xx,xy,xz,xrx,xry,xrz);
		setObjectScale(tent, 1);
		local tentCol = createColSphere(xx, xy, xz, 2);
		if getElementData(source,'Moze-Otwierac') then
			local cuboid,grupa = unpack(getElementData(source,'Moze-Otwierac'))
			setElementData(tentCol,'Tent-Otwieranie',grupa)
		end
		outputChatBox("* Hasło: "..pass,source,255,255,255)
		setElementDoubleSided(tent,true)
		setElementDimension(tent,dimension)
		setElementDimension(tentCol,dimension)
		attachElements(tentCol, tent, 0, 0, 0);
		setElementData(tentCol, "parent", tent);
		setElementData(tentCol,"Safe_password",pass)
		setElementData(tent, "parent", tentCol);
		setElementData(tentCol, "safe", true);
		setElementData(tentCol, "MAX_Slots", 250);
		triggerClientEvent(source, "refreshInventoryManual", source);
	end, 2000, 1, source,x,y,z,rx,ry,rz,itemName,dimension);
end);


function getVehicleAddonInfos(id)
--	for _,v in ipairs(vehicleAddonsInfo) do
--		if (v[1] == id) then return v[2], v[3], v[4], v[5]; end
if vehicleAddonsInfo[id] then
	local opony,silnik,tire,slots = vehicleAddonsInfo[id][1],vehicleAddonsInfo[id][2],vehicleAddonsInfo[id][3],vehicleAddonsInfo[id][4]
	return opony,silnik,tire,slots
end
end

function spawnDayZVehicles()
	--[[for _,v in ipairs(getElementsByType("vehicle")) do
		local col = getElementData(v, "parent");
		if col then
			destroyElement(col);
		end
		destroyElement(v);
	end]]
	for _,v in ipairs(vehicleSpawns) do
		local x,y,z, rotx, roty, rotz = v[2], v[3], v[4], v[5], v[6], v[7];
		local veh = createVehicle(v[1], x, y, z, rotx, roty, rotz);
		local vehCol = createColSphere(x, y, z, 2.5);
		attachElements(vehCol, veh);
		setElementData(vehCol, "parent", veh);
		setElementData(veh, "parent", vehCol);
		setElementData(vehCol, "vehicle", true);
		setElementData(veh, "dayzvehicle", 1);
		local tires,engine,parts,slots = getVehicleAddonInfos(getElementModel(veh));
		setElementData(vehCol, "MAX_Slots", tonumber(slots));
		--if tires then
		--setElementData(vehCol, "Tire_inVehicle", math.random(tonumber(tires)));
		--else
		setElementData(vehCol, "Tire_inVehicle",math.random(0,4));
		--end
		setElementData(vehCol, "Engine_inVehicle", math.random(0,1));
		setElementData(vehCol, "Parts_inVehicle", math.random(0,1));
		setElementData(vehCol, "spawn", {v[1], x, y, z});
		setElementData(vehCol, "fuel", math.random(40));
		for _,v in ipairs(lootItems["helicrashsides"]) do
			local value =  math.percentChance(v[5], math.random(2));
			setElementData(vehCol, v[1], (value or 0));
			local ammoData,_ = getWeaponAmmoType(v[1], true);
			if (ammoData and value > 0) then
				setElementData(vehCol, ammoData, math.random(2));
			end
		end
	end
	--backup();
end



addEventHandler("onVehicleExplode", root,  function()
	if not isElement(source) then return end
	for _,v in pairs(getVehicleOccupants(source)) do
		triggerEvent("kilLDayZPlayer",getElementData(getElementByID('DayZ_Login'),'kilLDayZPlayer'), v);
	end
	local x1,y1,z1 = getElementPosition(source);
	local col = getElementData(source, "parent");
	if getElementData(col, "spawn") then
		local id,x,y,z = unpack(getElementData(col,'spawn'))
	end
	setElementData(col, "deadVehicle", true);
	setElementData(source, "isExploded", true);
	if (getElementData(source, "dayzvehicle") == 1) then
		car_timers[source] = setTimer(respawnDayZVehicle, 1800000, 1, id, x, y, z, col, source); -- 10*30000)
	end
end);



setTimer(function()
	for _,v in ipairs(getElementsByType("vehicle")) do
		if (getElementModel(v) ~= 453) then
			local col = getElementData(v, "parent");
			if col then
				if not getElementData(col, "deadVehicle") then
					if isElementInWater(v) then
						local id,x,y,z = unpack(getElementData(col, "spawn"));
						if (getElementData(v, "dayzvehicle") == 1) then
							car_timers[v] = setTimer(respawnDayZVehicle, 1800000, 1, id, x, y, z, col, v);
						end
					end
				end
			end
		end
	end
end, (5*60000), 0);

function respawnDayZVehicle(zid, mx, my, mz, col, vehz)
	if not isElement(vehz) then return end
if vehz then
if not (isElementInWater(vehz) or isVehicleBlown(vehz)) then return end
local id,x,y,z = unpack(getElementData(col, "spawn"))
	destroyElement(vehz)
	destroyElement(col)
	local veh = createVehicle(id, x, y, z + 1);
	local vehCol = createColSphere(x, y, z, 2.5);
	attachElements(vehCol, veh);
	setElementData(vehCol, "parent", veh);
	setElementData(veh, "parent", vehCol);
	setElementData(vehCol, "vehicle", true);
	setElementData(veh, "dayzvehicle", 1);
	local tires,engine,parts,slots = getVehicleAddonInfos(id);
	setElementData(vehCol, "MAX_Slots", slots);
	setElementData(vehCol, "Tire_inVehicle", math.random(0, tires));
	setElementData(vehCol, "Engine_inVehicle", math.random(0, engine));
	setElementData(vehCol, "Parts_inVehicle", math.random(0, parts));
	setElementData(vehCol, "spawn", {id, x, y, z});
	setElementData(vehCol, "fuel", 10);
	for _,v in ipairs(lootItems["helicrashsides"]) do
		local value =  math.percentChance(v[5], math.random(2));
		setElementData(vehCol, v[1], value);
		local ammoData,_ = getWeaponAmmoType(v[1], true);
		if (ammoData and value > 0) then
			setElementData(vehCol, ammoData, math.random(2));
		end
	end
	
	end
end
addEventHandler("respawnDayZVehicle", root, respawnDayZVehicle);

function getVehicleFuelRemove(id)
--	for _,v in ipairs(vehicleFuelInfo) do
--		if (v[1] == id) then return v[2]; end
--	end
if vehicleFuelInfo[id] then
local paliwo = vehicleFuelInfo[id][1]
	return paliwo
end
end

function getVehicleMaxFuel(id)
--[[	for _,v in ipairs(vehicleFuelTable) do
		if (id == v[1]) then return v[2]; end
	end
	return false;]]
if vehicleFuelTable[id] then
local fuel = vehicleFuelTable[id][1]
	return fuel
end
end



function backup()
	dbExec(db, "DELETE FROM `vehicles`");
	dbExec(db_tent, "DELETE FROM `tents`");
	dbExec(db_tent, "DELETE FROM `safes`");
	local vc,tc = 0, 0;
	backupItemsTable = exports.DayZ_core:getItemTable()
	for _,veh in ipairs(getElementsByType("vehicle")) do
		if not getElementData(veh, "helicrash") then
			local col = getElementData(veh, "parent");
			if col then
			if (getElementData(veh,'dayzvehicle') or 0)~=0 then
				local x,y,z = getElementPosition(veh);
				local rX,rY,rZ = getElementRotation(veh);
				local health = getElementHealth(veh);
				local dimension = getElementDimension(veh)
				if (health < 500) then health = 500; end
				local _,sx,sy,sz = unpack(getElementData(col, "spawn"));
				local items = {};
				vc = vc+1;
				for _,item in ipairs(backupItemsTable) do
					local quantity = getElementData(col, item[1]) or 0;
					if (quantity > 0) then
						table.insert(items, {item[1], quantity});
					end
				end
				local frized = isElementFrozen(veh) 
				if frized then
					MaxFriz = 'Jest'
				else
					MaxFriz = 'Nie ma'
				end
				local masno = getElementData(veh,"Szyba-Kuloodporna")
				if masno then
					masno = "Tak"
				else
					masno = "Nie"
				end
				
				
				dbExec(db, "INSERT INTO `vehicles` (model, x, y, z, rX, rY, rZ, slots, fuel, engines, moving, parts, items, dayz, health, sx, sy, sz, id,friz,dimension,szyba) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", 
					getElementModel(veh), x, y, z, rX, rY, rZ, getElementData(col, "MAX_Slots") or 20, getElementData(col, "fuel") or 0, getElementData(col, "Engine_inVehicle") or 0, 
					getElementData(col, "Tire_inVehicle") or 0, getElementData(col, "Parts_inVehicle") or 0, toJSON(items), getElementData(veh, "dayzvehicle") or 0, health, sx, sy, sz, vc,MaxFriz,dimension,masno);
			end
			end
	end
end
	local safes = 0
	for _,col in ipairs(getElementsByType("colshape")) do
		if getElementData(col, "tent") then
			local tent = getElementData(col, "parent");
			if tent then
				local x,y,z = getElementPosition(tent);
				local rX,rY,rZ = getElementRotation(tent);
				local dimension = getElementDimension(tent)
				local items = {};
				tc = tc+1;
				for _,item in ipairs(backupItemsTable) do
					local quantity = getElementData(col, item[1]) or 0;
					if (quantity > 0) then
						table.insert(items, {item[1], quantity});
					end
				end
				local s = getElementData(col,'Tent-Otwieranie')
				local mozecogowno
				if s then
				mozecogowno = tostring(getElementData(col,'Tent-Otwieranie'))
				else
				mozecogowno = 'Nie Moze'
				end
				dbExec(db_tent, "INSERT INTO `tents` (model, x, y, z, rX, rY, rZ, slots, scale, items, id,gang,dimension) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)", 
					getElementModel(tent), x, y, z, rX, rY, rZ, getElementData(col, "MAX_Slots") or 100, getObjectScale(tent), toJSON(items), tc,mozecogowno,dimension);
			end
		elseif getElementData(col,"safe") then
			local tent = getElementData(col, "parent");
			if tent then
				local x,y,z = getElementPosition(tent);
				local rX,rY,rZ = getElementRotation(tent);
				local dimension = getElementDimension(tent)
				local items = {};
				safes = safes +1;
				for _,item in ipairs(backupItemsTable) do
					local quantity = getElementData(col, item[1]) or 0;
					if (quantity > 0) then
						table.insert(items, {item[1], quantity});
					end
				end
				dbExec(db_tent, "INSERT INTO `safes` (model, x, y, z, rX, rY, rZ, slots, scale, items, id,password,dimension) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)", 
					getElementModel(tent), x, y, z, rX, rY, rZ, getElementData(col, "MAX_Slots") or 100, getObjectScale(tent), toJSON(items), tc,getElementData(col,'Safe_password'),dimension);
			end
		end
	end
	--outputChatBox("#193dc3[D-DayZ] #193dc3Zapisano: "..tc.." namiotów",root,255,255,255,true) -- 193dc3
	--outputChatBox("#193dc3[D-DayZ] #193dc3Zapisano: "..vc.." pojazdów",root,255,255,255,true)
	--outputChatBox("#FFFFFF[#ed7600D-DayZ#FFFFFF] Zapisano: #193dc3"..tc.." #FFFFFFnamiotów",root,255,255,255,true)
	--outputChatBox("#FFFFFF[#ed7600D-DayZ#FFFFFF] Zapisano: #193dc3"..vc.." #FFFFFFpojazdów",root,255,255,255,true)
	outputDebugString("Backup done ("..tc.." Tents) and ("..vc.." Vehicles)", 3);
	outputDebugString("Zapisano "..safes.." sejfów!")
end

function createDayzVeh(model, x, y, z, rX, rY, rZ, slots, fuel, engines, moving, parts, items, dayz, health, sx, sy, sz,friz,dimension,szyba)
	local veh = createVehicle(model, x, y, z);
	local vehCol = createColSphere((x+5), y, z, 3);
	local tires,engine,parts,_ = getVehicleAddonInfos(model);
	if dayz==0 then return end
	if friz=='Nie ma' then
	setElementFrozen(veh,false)
	else
	setElementFrozen(veh,true)
	end
	local masno = szyba
	if masno == "Tak" then
		setElementData(veh,"Szyba-Kuloodporna",true)
	end
	setElementDimension(veh,dimension)
	setElementDimension(vehCol,dimension)
	setElementData(veh, "maxfuel", getVehicleMaxFuel(model));
	setElementData(veh, "needtires", tires);
	setElementData(veh, "needparts", parts);
	setElementData(veh, "needengines", engine);
	setElementRotation(veh, rX, rY, rZ);
	setElementData(veh, "parent", vehCol);
	setElementData(veh, "dayzvehicle", tonumber(dayz));
	attachElements(vehCol, veh);
	setElementData(vehCol, "parent", veh);
	setElementData(vehCol, "vehicle", true);
	setElementData(vehCol, "MAX_Slots", tonumber(slots));
	setElementData(vehCol, "Tire_inVehicle", tonumber(moving));
	setElementData(vehCol, "Engine_inVehicle", tonumber(engines));
	setElementData(vehCol, "Parts_inVehicle", tonumber(parts));
	setElementData(vehCol, "spawn", {model, sx, sy, sz});
	setElementData(vehCol, "fuel", tonumber(fuel));
	for _,v in ipairs(fromJSON(items)) do
		setElementData(vehCol, v[1], v[2]);
	end
	if (health > 250) then
		setElementHealth(veh, tonumber(health));
	else
		blowVehicle(veh, false);
		setTimer(respawnDayZVehicle, 1800000, 1, model, x, y, z, vehCol, source);
	end
end



function createDayzTent(model, x, y, z, rX, rY, rZ, slots, scale, items,genk,dimension)
	local tent = createObject(model, x, y, z);
	local tentCol = createColSphere(x, y, z, 3);
	setElementRotation(tent, rX, rY, rZ);
	setObjectScale(tent, scale);
	attachElements(tentCol, tent);
	
	if dimension > 0 then
		genk = dimension
	end
	
	if genk=='Nie Moze' then
	--setElementData(tentCol,'Tent-Otwieranie',false)
	else
	setElementData(tentCol,'Tent-Otwieranie',tostring(genk))
	end
	setElementDimension(tent,dimension)
	setElementDimension(tentCol,dimension)
	setElementData(tentCol, "parent", tent);
	setElementData(tent, "parent", tentCol);
	setElementData(tentCol, "tent", true);
	setElementData(tentCol, "MAX_Slots", slots);
	for _,v in ipairs(fromJSON(items)) do
		setElementData(tentCol, v[1], v[2]);
	end
	local _max = exports.DayZ_core:getElementCurrentSlots(tentCol)
	if _max <= 1 then
		table.insert(check_namioty, {col = tentCol, time = getTickCount() + 86400000})
	end
end

function createDayZSafe(model, x, y, z, rX, rY, rZ, slots, scale, items,password,dimension)
	local tent = createObject(model, x, y, z);
	local tentCol = createColSphere(x, y, z, 2);
	setElementRotation(tent, rX, rY, rZ);
	setObjectScale(tent, scale);
	attachElements(tentCol, tent);
	setElementData(tentCol,"Safe_password",password)
	setElementDimension(tent,dimension)
	setElementDoubleSided(tent,true)
	setElementDimension(tentCol,dimension)
	setElementData(tentCol, "parent", tent);
	setElementData(tent, "parent", tentCol);
	setElementData(tentCol, "safe", true);
	setElementData(tentCol, "MAX_Slots", slots);
	for _,v in ipairs(fromJSON(items)) do
		setElementData(tentCol, v[1], v[2]);
	end
end

function loadBackup()
	for _,v in pairs(getElementsByType("vehicle",resourceRoot)) do
		local col = getElementData(v, "parent");
		if col then
			destroyElement(col);
		end
		destroyElement(v);
	end
	local p = dbPoll(dbQuery(db, "SELECT * FROM `vehicles`"), -1);
	if (#p > 0) then
		for _,d in pairs(p) do
			createDayzVeh(d["model"], d["x"], d["y"], d["z"], d["rX"], d["rY"], d["rZ"], d["slots"], d["fuel"], d["engines"], d["moving"], d["parts"], d["items"], d["dayz"], d["health"], d["sx"], d["sy"], d["sz"],d['friz'],tonumber(d['dimension']),d['szyba']);
		end
	end
	local p2 = dbPoll(dbQuery(db_tent, "SELECT * FROM `tents`"), -1);
	if (#p2 > 0) then
		for _,d in pairs(p2) do
			createDayzTent(d["model"], d["x"], d["y"], d["z"], d["rX"], d["rY"], d["rZ"], d["slots"], d["scale"], d["items"],d['gang'], tonumber(d['dimension']));
		end
	end
	local p3 = dbPoll(dbQuery(db_tent, "SELECT * FROM `safes`"), -1);
	if (#p3 > 0) then
		for _,d in pairs(p3) do
			createDayZSafe(d["model"], d["x"], d["y"], d["z"], d["rX"], d["rY"], d["rZ"], d["slots"], d["scale"], d["items"],d['password'],tonumber(d['dimension']));
		end
	end
end
--spawnDayZVehicles()

local xml = xmlLoadFile("meta.xml")

local id = tonumber(xmlNodeGetAttribute(xmlFindChild(xml,"numer",0),"id"))

function copyDatabase()
	fileCopy("backup.db","bakapy/auta/auta_"..tostring(id))
	fileCopy("backup_tents.db","bakapy/tenty/namioty_"..tostring(id))
	id = id + 1
	xmlNodeSetAttribute(xmlFindChild(xml,"numer",0),"id",id)
	xmlSaveFile(xml)
end


if not backupdone then
	loadBackup();
	spawnDayZVehicles()
	backupdone = true;
else
	loadBackup();
end



setTimer(function()
	backup()
	copyDatabase()
	for i, v in pairs(check_namioty) do
		if v.time < getTickCount() then
			if isElement(v.col) then
				if getElementData(v.col, "tent") then
					if usunNamiotEmpty(v.col) then
						table.remove(check_namioty, i)
					end
				end
			end
		end
	end
end,3600000, 0);

addCommandHandler("dobackup", function(player)
	if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup("Admin")) then
		backup();
	end
end);

function usunNamiotEmpty(v)
	local _max = exports.DayZ_core:getElementCurrentSlots(v) 
	if _max <= 1 then
		destroyElement(getElementData(v, "parent"))
		destroyElement(v)
		return true
	end
	return false
end


addCommandHandler("usun_puste_namioty", function(player)
	if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup("Admin")) then
		local ticker = getTickCount()
		for i, v in pairs(getElementsByType("colshape", resourceRoot)) do
			if getElementData(v, "tent") then
				usunNamiotEmpty(v)
			end
		end
		triggerClientEvent(root, "dxPickupsText", root, "Puste namioty zostały usunięte!", 255,255,255)
	end
end)

