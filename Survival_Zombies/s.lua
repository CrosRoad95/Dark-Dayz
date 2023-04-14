setTimer(function(p)
local time = getRealTime()
	local godzina = time.hour
	local dzien = time.monthday
	local miesiac = time.month
	local minut = time.minute
	local sekund = time.second
if (godzina == 0) and (minut == 0) then
	startResource(getResourceFromName("wielka_stopa"))
end
end, 10000, 0)
addEvent('ZombieStartPlayer',true)

local zombies = {
--kopalnia
{-154,2005,16},
{-154,2000,16},
{-160,1998,16},
{-164,2006,16},
{-165,2014,16},
{-172,2018,16},
{-175,2010,16},
{-171,1998,16},
{-164,1988,16},
{-156,1983,16},
--koniec kopalnia
{-253,2610,63},
{-266,2611,63},
{-284,2613,63},
{-270,2624,63},
{-263,2661,63},
{-271,2695,63},
{-258,2720,63},
{-233,2733,63},
{-207,2746,63},
{-187,2735,63},
{8,2523,17},
{34,2512,17},
{59,2509,17},
{84,2500,17},
{133,2527,17},
{153,2555,17},
{176,2536,17},
{210,2529,17},
{237,2511,20},
{258,2500,19},
{270,2453,17},
{293,2420,17},
{322,2388,17},
{263,2391,17},
{208,2388,17},
{531,2365,31},
{538,2355,31},
{962,2277,12},
{986,2276,12},
{990,2310,12},
{990,2344,12},
{1035,2313,12},
{1045,2109,11},
{1020,2012,11},
{1017,1843,11},
{1446,2009,11},
{1462,2016,11},
{1457,2002,11},
{1590,2834,11},
{1614,2834,11},
{1639,2832,11},
{1658,2833,11},
{1739,2847,11},
{1745,2835,11},
{1779,2787,11},
{1839,2630,11},
{1837,2606,11},
{1871,2599,11},
{1897,2604,11},
{1931,2596,11},
{1964,2595,11},
{2054,2475,11},
{2107,2474,11},
{2319,2374,11},
{2303,2379,11},
{2318,2394,11},
{2310,2414,11},
{2313,2435,11},
{2336,2452,15},
{2326,2458,12},
{2305,2456,11},
{2285,2421,11},
{2257,2406,11},
{2235,2427,11},
{2241,2451,11},
{2269,2453,11},
{2260,2470,11},
{2244,2483,11},
{2264,2494,9},
{2291,2497,4},
{2289,2479,4},
{2264,2473,4},
{2253,2458,4},
{2247,2488,4},
{2289,2488,-7},
{2227,2467,-7},
{2228,2454,-7},
{2232,2459,-7},
{2602,2170,11},
{2602,2155,11},
{2595,2135,11},
{2598,2119,11},
{2614,2098,11},
{2606,2074,11},
{2603,2045,11},
{2628,2011,11},
{1693,1296,11},
{1683,1308,11},
{1655,1305,11},
{1675,1291,11},
{1721,1290,11},
{1668,1221,11},
{1667,1195,11},
{1676,1171,11},
{1678,1054,11},
{1624,1064,11},
{1632,988,11},
{1693,976,11},
{1686,716,11},
{1662,730,11},
{1625,713,11},
{1502,714,11},
{1465,705,11},
{1453,680,11},
{1080.712890625,1048.146484375,10.153713226318},
{1063.224609375,1101.80078125,10.2734375},
{1113.9833984375,1085.0869140625,10.224426269531},
{303.8486328125,1151.54296875,8.5859375},
{316.373046875,1152.685546875,8.5859375},
{312.7841796875,1161.078125,8.6648139953613},
{-6.10546875,973.23828125,19.80375289917},
{-26.58203125,958.3291015625,19.553190231323},
{-75.2685546875,936.13671875,20.511501312256},
{-141.5380859375,920.0693359375,19.402519226074},
{-210,974,20},
{-227,993,20},
{-251,1011,20},
{-300,1056,20},
{-340,1056,20},
{-356,1059,20},
{-356,1104,20},
{-196,1065,20},
{-112,1112,20},
{-87,1116,20},
{-57,1122,20},
{-2,1220,20},
{-16,1227,20},
{-321,1526,76},
{-339,1531,76},
{-342,1547,76},
{-328,1560,76},
{-302,1560,76},
{-300,1531,76},
{-302,1759,43},--[[
{115,1897,19},
{138,1890,19},
{173,1884,21},
{198,1898,18},
{239,1916,18},
{269,1904,18},
{278,1880,18},
{262,1860,18},
{274,1826,18},
{214,1820,18},
{209,1864,14},
{218,1866,14},
{244,1872,12},
{257,1872,9},
{253,1854,9},
{252,1823,5},
{298,1830,8},
{314,1848,8},
{298,1862,9},
{277,1864,9},
{271,1892,9},
{288,1952,18},
{289,1989,18},
{323,2050,18},]]
{-1515,2538,56},
{-1526,2561,56},
{-1502,2567,56},
{-1517,2595,56},
{-1532,2627,56},
{-1507,2655,56},
{-1454,2654,56},
{-1439,2644,56},
{-2482,2508,19},
{-2465,2497,17},
{-2438,2493,14},
{-2255,2346,5},
{-2270,2303,5},
{-2303,2296,5},
{-2438,2246,5},
{-2524,2252,5},
{-2547,2274,5},
{-2459,1534,18},
{-2453,1553,18},
{-2416,1557,18},
{-2389,1545,18},
{-2349,1544,18},
{-2318,1549,19},
{-1549,430,8},
{-1563,388,8},
{-1606,382,8},
{-1633,347,8},
{-1635,319,8},
{-1659,306,8},
{-1659,274,8},
{-1487,268,8},
{-1449,318,8},
{-1368,315,8},
{-1357,346,8},
{-1384,378,8},
{-1463,404,8},
{-1334,436,8},
{-1263,481,8},
{-1373,472,8},
{-1307,499,12},
{-1367,511,12},
{-1423,499,12},
{-1459,491,19},
{-1439,512,19},
{-1357,503,19},
{-1266,501,19},
{-1601,664,8},
{-1631,685,8},
{-1605,737,-5},
{-1584,698,-5},
{-1631,665,-5},
{-1676,699,31},
{-1683,714,31},
{-1921,699,47},
{-1922,681,47},
{-1936,653,47},
{-1962,650,47},
{-1972,674,47},
{-1979,694,47},
{-1991,666,8},
{-1999,674,8},
{-1996,694,8},
{-1991,683,8},
{-1991,697,8},
{-1977,696,8},
{-1959,698,8},
{-1967,685,8},
{-1954,680,8},
{-1955,698,8},
{-1947,699,8},
{-1948,682,14},
{-1955,679,14},
{-1956,695,14},
{-1939,680,14},
{-1932,702,12},
{-1936,685,9},
{-1929,688,2},
{-1925,675,2},
{-1930,667,2},
{-1939,682,2},
{-1980,275,36},
{-1983,267,36},
{-1988,259,36},
{-2768,-286,8},
{-2754,-283,8},
{-2690,628,15},
{-2657,633,15},
{-2626,624,15},
{-2591,616,15},
{-2576,678,28},
{-2564,654,28},
{-2557,662,28},
{-1573,-363,6},
{-1570,-396,6},
{-1556,-410,6},
{-2221,-2322,31},
{-2211,-2341,31},
{-2184,-2347,31},
{-2185,-2294,31},
{-2205,-2296,31},
{-2213,-2284,31},
{-2203,-2266,31},
{-596,-2492,60},
{-579,-2504,67},
{-558,-2506,74},
{-547,-2515,80},
{-453,-2820,48},
{-433,-2813,47},
{-420,-2824,47},
{-409,-2818,47},
{-104,-1166,3},
{-87,-1153,2},
{-68,-1158,2},
{-71,-1181,2},
{-84,-1198,3},
{-531,-128,70},
{-536,-185,79},
{-488,-190,79},
{-532,-87,63},
{-478,-55,61},
{-46,83,4},
{-66,34,4},
{-79,-7,4},
{-92,-44,4},
{-108,-78,4},
{-97,-99,4},
{94,-155,3},
{121,-195,2},
{178,-220,2},
{191,-170,2},
{201,-143,2},
{228,-103,2},
{251,-79,2},
{253,-47,2},
{860,-30,64},
{879,-30,64},
{863,-20,64},
{1304,292,20},
{1287,330,20},
{1243,335,20},
{1227,343,20},
{1261,346,20},
{1284,370,20},
{1339,370,20},
{1381,438,20},
{1405,448,20},
{1435,380,19},
{1451,360,19},
{1470,357,20},
{1358,248,20},
{1360,258,20},
{1301,248,20},
{1286,166,21},
{1305,176,21},
{1298,186,21},
{625,-595,17},
{612,-600,18},
{615,-610,18},
{630,-586,17},
{649,-577,17},
{650,-557,17},
{668,-534,17},
{701,-471,17},
{750,-523,17},
{807,-531,17},
{810,-607,17},
{854,-591,18},
{2213,-1167,26},
{2222,-1167,26},
{2222,-1150,26},
{1923,-1120,27},
{1908,-1120,26},
{1889,-1120,26},
{1956,-1122,27},
{1880,-1407,14},
{1895,-1390,14},
{1907,-1387,11},
{1920,-1394,14},
{1961,-1380,19},
{1967,-1423,14},
{1943,-1439,14},
{2000,-1449,14},
{2025,-1407,18},
{2040,-1425,18},
{2360,-1472,24},
{2389,-1473,24},
{2413,-1477,24},
{2413,-1485,24},
{2401,-1515,24},
{2422,-1546,24},
{2445,-1553,24},
{2481,-1545,25},
{2482,-1528,25},
{2790,-2493,14},
{2761,-2489,14},
{2748,-2471,14},
{2745,-2448,14},
{2778,-2422,14},
{2795,-2414,14},
{2799,-2423,14},
{2698,-2411,14},
{2691,-2445,14},
{2666,-2449,14},
{2651,-2436,14},
{2639,-2411,14},
{2527,-2529,14},
{2502,-2528,14},
{2503,-2549,14},
{2499,-2566,14},
{2499,-2599,14},
{2434,-2654,14},
{1825,-1279,121},
--{1805,-1300,121},
{1797,-1305,115},
--{1800,-1307,110},
{1782,-1307,104},
--{1802,-1311,104},
--{1807,-1299,104},
{1797,-1307,99},
--{1778,-1303,94},
{1817,-1312,88},
--{1809,-1299,94},
--{1799,-1308,66},
{1781,-1305,61},
--{1803,-1307,55},
{1805,-1300,45},
--{1799,-1302,39},
{1798,-1309,34},
--{1785,-1309,28},
{1805,-1298,23},
{1576,-1711,29},
{1560,-1709,29},
{1556,-1681,29},
{1562,-1651,29},
{1551,-1623,14},
{1582,-1621,14},
{1594,-1668,6},
{1567,-1699,6},
{1546,-1665,6},
{1134,-2034,70},
{1134,-2047,70},
{-2298.3681640625,-1637.69921875,483.69897460938},
{1117,2281,11},
{1102,2271,11},
{1097,2254,11},
{1113,2246,11},
{1128,2232,11},
{1134,2218,11},
{1113,2219,11},
{1086,2219,11},
{1071,2209,11},
{1074,2183,11},
{1096,2179,11},
{1122,2179,11},
{1145,2180,11},
{1638,727,11},
{1663,718,11},
{1690,708,11},
{1709,720,11},
{2308,-1056,51},
{2338,-1054,53},
{2358,-1043,55},
{2386,-1046,54},
{2414,-1026,52},
{2433,-1023,55},
{2455,-1021,60},
{2482,-1024,65},
{2505,-1036,70},
{2537,-1034,70},
{2566,-1066,70},
{2552,-1089,66},
{2518,-1085,55},
{2473,-1096,45},
{2439,-1092,43},
{1797,-1278,14},
{1786,-1291,14},
{1777,-1281,14},
{2634,733,11},
{2602,736,11},
{2568,734,11},
{2556,747,11},
{967,1718,9},
{-2082,1413,8},
{-2076,1405,8},
{-2086,1390,8},
{967,1738,9},
{960,1763,9},
{972,1788,9},
{962,1806,9},
{1045,2098,11},
{1063,2084,11},
{1058,2106,11},
{1076,2083,11},
{-2264,2332,5},
{-2245,2314,5},
{-2252,2292,5},
{-2378,2436,10},
{-2419,2429,13},
{-2484,2436,17},
{-2504,2412,17},
{-2488,2360,11},
{-2485,2362,11},
{-2495,2339,5},
{-2512,2358,5},
{-2530,2360,5},
{-2550,2304,5},
{-1511,738,8} ,
{-1505,802,8} ,
{-1504,941,8} ,
{-1391,1493,2} ,
{-1406,1484,2} ,
{-1432,1483,2} ,
{-1435,1495,2} ,
{-775,2092,61} ,
{-675,2050,61} ,
{-380,2230,43} ,
{-392,2255,43} ,
{-411,2246,43} ,
{-422,2232,43} ,
{-439,2236,43} ,
{-445,2219,43} ,
{-433,2206,43} ,
{-416,2215,43} ,
{-366,2215,43} ,
{-363,2238,43} ,
{-355,2257,43} ,
{-338,2225,43} ,
{-334,2215,43}, 
{-21,2332,25} ,
{-33,2344,25} ,
{400,2451,17} ,
{411,2442,17} ,
{1132,2074,11} ,
{1144,2069,11}, 
{231,1400,11} ,
{247,1421,11} ,
{277,1430,11} ,
{115,1831,18} ,
{130,1849,18} ,
{109,1859,18} ,
{-777,1443,14} ,
{-803,1435,14} ,
{-818,1430,14} ,
{-350,1181,20} ,
{-359,1165,20} ,
{-326,1159,20} ,
{-256,1186,20}, 
{-75,1224,20} ,
{-87,1219,20} ,
{-31,1078,20}, 
{58,-48,1} ,
{40,-42,2} ,
{37,-13,3}, 
{11,1,4} ,
{-7,-8,4} ,
{2,-38,4} ,
{-2,-73,4} ,
{-3,-106,3} ,
{-47,-312,6} ,
{-29,-302,6} ,
{-183,-297,2} ,
{-396,-430,17} ,
{1567,-1643,29} ,
{1574,-1666,29} ,
{1566,-1686,29} ,
{1557,-1710,29} ,
{1540,-1663,14} ,
{1533,-1637,14} ,
{1558,-1621,14} ,
{1483,-1614,15} ,
{1536,-1365,330} ,
{1534,-1352,330} ,
{1551,-1347,330} ,
--{1829,-1297,132} ,
--{1825,-1283,132} ,
{1814,-1301,132}, 
{1982,-1585,14} ,
{1996,-1599,14} ,
{1963,-1599,14} ,
{1728,-2120,14} ,
{1709,-2119,14} ,
{1679,-2115,14} ,
{1698,-2105,14} ,
{1725,-2104,14} ,
{1763,-2105,14} ,
{1786,-2105,14} ,
{1982,-2194,14} ,
{1987,-2183,14} ,
{1975,-2189,14} ,
{2096,-1810,14} ,
{2096,-1803,14} ,
{2100,-1805,14} ,
{2057,-1694,14} ,
{2061,-1695,14} ,
{2171,-1517,24} ,
{2263,-1456,24} ,
{2240,-1456,24} ,
{2359,-659,129} ,
{2352,-656,129} ,
{2354,-648,129}, 
{2296,-111,27} ,
{2320,-112,27}, 
{2337,-90,27} ,
{2366,-41,27} ,
{2387,-48,28} ,
{2402,-11,27} ,
{2386,34,27} ,
{2335,123,27} ,
{2353,179,27} ,
{2252,161,28} ,
{2235,160,28} ,
{2209,111,28} ,
{1284,1293,11} ,
{1290,1288,11} ,
{1313,1287,11} ,
{1321,1278,11} ,
{1310,1265,11} ,
{1328,1264,11} ,
{2182,1815,11} ,
{2172,1813,11} ,
{2186,1822,11} ,
{2197,1872,11} ,
{2190,1875,11} ,
{2191,1866,11} ,
{2195,1856,11} ,
{2182,1857,11} ,
{2577,1892,11} ,
{2614,1897,11} ,
{2630,1876,11} ,
{2634,1764,11} ,
{2616,1670,11} ,
{2538,1509,12} ,
{2561,1434,11} ,
{2562,1418,11} ,
{2492,1278,11} ,
{2492,1290,11} ,
{2336,1458,43} ,
{2327,1445,43} ,
{2317,1460,43} ,
{2304,1469,43} ,
{2315,1487,43} ,
{2333,1497,43}, 
{2486,928,11} ,
{2494,934,11} ,
{2508,934,11} ,
{2514,936,11},
{-1566,-2737,49} ,
{-1578,-2723,49} ,
{-1584,-2731,49} ,
{-1646,-2229,30} ,
{-1648,-2240,31} ,
{-1640,-2228,30} ,
{-2124,-2508,31} ,
{-2131,-2517,31} ,
{-2092,-2510,31} ,
{-2065,-2503,31} ,
{-2042,-2529,31} ,
{-2046,-2554,31} ,
{-2074,-2558,31} ,
{-2798,-1522,140} ,
{-2802,-1528,140}, 
{-2514,-609,133} ,
{-2515,-615,133} ,
{-2508,-614,133} ,
{-2382,-584,133} ,
{-2385,-584,133}, 
{-1565,60,18} ,
{-1571,68,18} ,
{-1564,62,18}, 
{-1697,32,4} ,
{-1697,40,4} ,
{-1705,39,4} ,
{-1710,43,4} ,
{-2024,165,29} ,
{-2023,159,29} ,
{-2027,149,29}, 
{-2697,-99,5} ,
{-2697,-111,5} ,
{-2696,-121,5} ,
{-2714,-128,5} ,
{-2715,-141,5} ,
{-2716,-159,5} ,
{-2699,-175,5} ,
{-2723,-316,8} ,
{-2722,-312,8} ,
{-2720,-316,8} ,
{-2143,-416,36} ,
{-2148,-430,36} ,
{-2155,-435,36} ,
{-2067,-880,33} ,
{-2061,-861,33} ,
{-2061,-847,33} ,
{-1426,-1577,102} ,
{-1435,-1575,102} ,
{-1450,-1575,102} ,
{-1442,-1504,102} ,
{-1438,-1497,102} ,
{-1444,-1487,102} ,
{-1436,-1477,102}, 
{-100,-1178,3}, 
{-86,-1177,3} ,
{-83,-1160,3} ,
{-580,-547,26} ,
{-558,-552,26} ,
{-547,-550,26} ,
{-2855,962,45}, 
{-2838,916,45}, 
{-2832,878,45}, 
{-2763,786,53}, 
{-2764,791,53}, 
{-2558,819,50}, 
{-2551,818,50}, 
{-1644,1294,8}, 
{-1639,1291,8}, 
{-1632,1296,8}, 
{-1557,1166,8}, 
{-1555,1163,8}, 
{-1544,-434,6}, 
{-1548,-430,7}, 
{-1551,-435,7}, 
{-1559,-433,7}, 
{-1551,-443,7}, 
{-1538,-432,6}, 
{-1529,-432,6}, 
{-1355,-499,15}, 
{-1357,-502,15}, 
{-2029,-96,36}, 
{-2028,-94,36}, 
{-2022,-94,36}, 
--[[{277,1906,18}, 
{259,1919,18}, 
{236,1923,18}, 
{218,1913,18}, 
{136,1923,20}, 
{122,1926,20}, 
{108,1911,19}, 
{180,1812,18}, 
{290,2027,18}, 
{282,2028,18}, 
{247,2020,18}, 
{247,2001,18}, 
{277,1950,18}, 
{326,1989,18}, 
{325,1894,18}, ]]
{-2622,2347,9}, 
{-2622,2358,9}, 
{-2628,2402,12}, 
{-2635,2404,12}, 
{-2262,2329,5}, 
{-2258,2320,5}, 
{-2348,2421,8}, 
{-2469,2405,17}, 
{-2475,2240,5}, 
{-2473,2236,5}, 
{-2463,2237,6}, 
{-1513,2567,56}, 
{-1509,2570,56}, 
{-1521,2559,56}, 
{-1663,2560,86}, 
{-1665,2496,87}, 
{-1496,1966,49}, 
{-1500,1965,49}, 
{-1456,1867,33}, 
{-1459,1864,33}, 
{-1466,1865,33}, 
{-1477,1872,33}, 
{-1484,1866,33}, 
{382,2595,17}, 
{380,2600,17}, 
{388,2599,17}, 
{1098,2224,17}, 
{1126,2243,17}, 
{1121,2266,17}, 
{1131,2270,17}, 
{1134,2282,17}, 
{1135,2300,17}, 
{1128,2298,17}, 
{1137,2224,17}, 
{1137,2320,11}, 
{1133,2322,11}, 
{1111,2250,11}, 
{974,2155,11}, 
{970,2163,11}, 
{974,2163,11}, 
{1166,2787,11}, 
{1178,2801,11}, 
{1208,2795,11}, 
{1241,2788,11}, 
{1286,2791,11}, 
{1320,2773,11}, 
{1364,2793,11}, 
{1381,2768,11}, 
{1770,2860,11}, 
{2488,2490,22}, 
{2495,2496,22}, 
{2498,2492,22}, 
{2509,2491,22}, 
{2507,2501,22}, 
{2459,2537,22}, 
{2457,2541,22}, 
{2452,2541,22}, 
{2375,2321,9}, 
{2360,2328,9}, 
{2100,2052,11}, 
{2104,2047,11}, 
{2106,2060,11}, 
{2106,2072,11}, 
{2106,2082,11}, 
{2003,1541,14}, 
{2005,1547,14}, 
{2012,1546,12}, 
{2113,1416,11}, 
{2104,1412,11}, 
{2110,1400,11}, 
{2134,1399,11}, 
{2144,1395,11}, 
{2236,1289,11}, 
{2178,1280,11}, 
{2178,1120,13}, 
{2179,1115,13}, 
{2541,729,11}, 
{2551,734,11}, 
{2816,966,11}, 
{2833,946,11}, 
{2872,912,11}, 
{2851,919,11}, 
{2817,916,11}, 
{2852,896,11}, 
{2873,898,11}, 
{2829,1276,11}, 
{2831,1309,11}, 
{2831,1346,11}, 
{2851,1346,11}, 
{2852,1371,11}, 
{2822,1377,11}, 
{2853,2405,11}, 
{2868,2422,11}, 
{2876,2431,11}, 
{2888,2445,11}, 
{2902,2461,11}, 
{2854,2409,11}, 
{2817,2404,11}, 
{2800,2419,11}, 
{2790,2432,11}, 
{2779,2442,11}, 
{2766,2453,11}, 
{2756,2472,11}, 
{615,-605,18}, 
{852,-600,19}, 
{845,-588,18}, 
{1042,-328,74}, 
{1050,-336,74}, 
{1060,-326,74}, 
{1073,-326,74}, 
{-378,-1437,26}, 
{-376,-1432,26}, 
{-379,-1422,26}, 
{-388,-1150,70}, 
{-391,-1151,70}, 
{-384,-1044,59}, 
{-384,-1040,59}, 
{-1056,-1202,130}, 
{-1057,-1198,130}, 
{-1155,-1017,130}, 
{-1163,-976,130}, 
{-1145,-952,130}, 
{-1126,-935,130}, 
{-1112,-950,130}, 
{-1083,-954,130}, 
{-1057,-953,130}, 
{-1046,-997,130}, 
{-1014,-972,130}, 
{-1014,-1017,130}, 
{-1014,-1041,130}, 
{-1033,-1056,130}, 
{-1063,-1058,130}, 
{-2256,-1713,480}, 
{-2252,-1715,481}, 
{-2244,-1718,481}, 
{-2232,-1736,481}, 
{-2814,-1754,142}, 
{-2807,-1720,142}, 
{-2813,-1704,142}, 
{-2823,-1676,142}, 
{-2807,-1632,142}, 
{-2826,-1580,142}, 
{-2829,-1542,140}, 
{-2835,-1461,136}, 
{-2835,-1405,135}, 
{-1828,-2191,80}, 
{-1789,-2109,55}, 
{-1792,-2099,53}, 
{-1772,-1999,84}, 
{-1786,-1977,91}, 
{-1764,-1945,98}, 
{-1737,-1931,100}, 
{-1587,-1887,86}, 
{-1587,-1865,83}, 
{-1412,-1914,25}, 
{-1417,-1917,25}, 
{-1418,-1924,24}, 
{-1367,-2070,18}, 
{-1364,-2068,17}, 
{-1358,-2070,19}, 
{-1306,-2181,23}, 
{-1306,-2179,22}, 
{-1171,-2349,21}, 
{-1172,-2346,21}, 
{-1177,-2350,20}, 
{-1165,-2353,21}, 
{-1161,-2348,22}, 
{-1051,-2394,70}, 
{-1050,-2400,71}, 
{-1044,-2402,70}, 
{-1038,-2498,70}, 
{-1028,-2520,75}, 
{-767,-2487,78}, 
{-765,-2480,76}, 
{-755,-2479,74}, 
{-278,-2182,29}, 
{-285,-2176,29}, 
{-289,-2155,29}, 
{-265,-2157,29}, 
{-262,-2171,30}, 
{-257,-2186,30}, 
{-253,-2215,29}, 
{-276,-2214,29}, 
{-277,-2212,29}, 
{-400,-1819,3}, 
{-400,-1808,4}, 
{-415,-1761,6}, 
{-669,-1944,16}, 
{-673,-1945,15}, 
{-673,-1952,17}, 
{-796,-2167,22}, 
{-798,-2170,22}, 
{-801,-2166,22}, 
{-975,-2129,114}, 
{-980,-2129,114}, 
{-983,-2124,114}, 
{-990,-2125,114}, 
{-1109,-1793,119}, 
{-1104,-1796,117}, 
{-1110,-1800,118}, 
{-1654,-2419,99}, 
{-1656,-2421,100}, 
{-1655,-2428,100}, 
{-1549,-2502,91}, 
{-1550,-2505,91}, 
{-1430,-2579,68}, 
{-1431,-2573,67}, 
{-1437,-2463,42}, 
{-1434,-2459,41}, 
{-776,-2105,25}, 
{-783,-2103,25}, 
{-782,-2108,25}, 
{-683,-1978,24}, 
{-686,-1978,23}, 
{-746,-1858,14}, 
{-744,-1859,14}, 
{-469,-1916,12}, 
{-466,-1914,10}, 
{-470,-1908,9}, 
{-479,-1875,8}, 
{-484,-1869,10}, 
{-610,-1664,38}, 
{-606,-1663,37}, 
{-607,-1658,35}, 
{-611,-1658,36}, 
{-614,-1390,17}, 
{-610,-1387,17}, 
{-614,-1383,17}, 
{-595,-1074,24}, 
{-594,-1069,24}, 
{-589,-1061,24}, 
{-584,-1054,24}, 
{-577,-1044,24}, 
{-570,-1035,25}, 
{-556,-1029,25}, 
{-555,-1029,25}, 
{-549,-487,26}, 
{-557,-489,26}, 
{-572,-482,26}, 
{-550,-476,26}, 
{-524,-471,26}, 
{-517,-488,26}, 
{-521,-490,26}, 
{-513,-476,26}, 
{-487,-480,26}, 
{-474,-492,26}, 
{-468,-473,26}, 
{-488,-505,26}, 
{-503,-531,26}, 
{-495,-557,26}, 
{-421,-653,14}, 
{-421,-651,14}, 
{-423,-652,14}, 
{-948,-527,26}, 
{-950,-511,26}, 
{-930,-505,26}, 
{-532,-61,63}, 
{-540,-62,63}, 
{-533,-59,63}, 
{-516,-55,62}, 
{-488,-49,61}, 
{-456,-49,60}, 
{-436,-61,59}, 
{-435,-65,59}, 
{-464,-87,60}, 
{-460,-89,60}, 
{-460,-125,66}, 
{-459,-148,74}, 
{150,-170,2}, 
{151,-170,2}, 
{154,-163,2}, 
{169,-22,2}, 
{172,-24,2}, 
{241,-33,2}, 
{253,25,3}, 
{245,31,3}, 
{338,62,4}, 
{315,51,3}, 
{312,44,3}, 
{296,37,3}, 
{342,34,7}, 
{728,282,21}, 
{721,285,21}, 
{725,288,20}, 
{755,350,21}, 
{766,354,21}, 
{755,372,24}, 
{759,378,24}, 
{759,383,24}, 
{753,385,24}, 
{745,380,24}, 
{1214,298,20}, 
{1213,303,20}, 
{1230,284,20}, 
{1285,232,20}, 
{1286,184,21}, 
{1276,168,21}, 
{1276,151,21}, 
{1290,145,21}, 
{1308,148,21}, 
{1319,175,21}, 
{1310,178,21}, 
{1311,189,21}, 
{1301,191,21}, 
{1293,189,21}, 
{1285,193,21}, 
{1286,202,20}, 
{1291,205,20}, 
{942,-841,95}, 
{954,-826,96}, 
{971,-817,98}, 
{1014,-778,103}, 
{1024,-776,104}, 
{1077,-778,108}, 
{1088,-781,108}, 
{1276,-797,89}, 
{1285,-795,89}, 
{1292,-800,89}, 
{1296,-807,89}, 
{1289,-810,89}, 
{1278,-810,89}, 
{1269,-811,89}, 
{1261,-805,89}, 
{1257,-798,89}, 
{1255,-782,93}, 
{1253,-775,93}, 
{1259,-790,93}, 
{1286,-790,93}, 
{1286,-790,93}, 
{1526,-802,73}, 
{1528,-799,74}, 
{1531,-806,73}, 
{1526,-813,72}, 
{1533,-836,66}, 
{1538,-846,65}, 
{1536,-853,65}, 
{1477,-897,56}, 
{1468,-902,55}, 
{1434,-884,51}, 
{1425,-883,51}, 
{1317,-900,40}, 
{1314,-910,39}, 
{1191,-918,44}, 
{1188,-919,44}, 
{1183,-914,44}, 
{1179,-902,44}, 
{1181,-894,44}, 
{1265,-878,43}, 
{1265,-869,43}, 
{1283,-864,43}, 
{1293,-883,43}, 
{1287,-890,43}, 
{1288,-899,43}, 
{1219,-1081,29}, 
{1218,-1087,27}, 
{1209,-1084,28}, 
{1204,-1074,30}, 
{1173,-1075,28}, 
{1173,-1085,27}, 
{1152,-1100,26}, 
{1185,-1239,19}, 
{1183,-1232,19}, 
{1183,-1225,19}, 
{-2188,-2347,31}, 
{-2181,-2359,31}, 
{-2184,-2369,31}, 
{-2189,-2373,31}, 
{-2198,-2373,31}, 
{-2204,-2360,31}, 
{-2217,-2331,31}, 
{-2227,-2329,31}, 
{-2229,-2322,31}, 
{-2224,-2313,31}, 
{-2220,-2313,31}, 
{-2236,-2305,31}, 
{-2250,-2310,30}, 

-- bossy low
{182,1916,18,"Boss Low"}, 
{302,1964,18,"Boss Low"}, 
{390,2518,17,"Boss Low"}, 
{2266,2465,11,"Boss Low"}, 
{1265,300,20,"Boss Low"}, 
{2024,-1413,17,"Boss Low"}, 
{1536,-1656,14,"Boss Low"}, 
{-1551,419,8,"Boss Low"}, 
{-1977,701,8,"Boss Low"}, 
{-1967,686,8,"Boss Low"}, 
{-1955,691,14,"Boss Low"}, 
{-2190,-2323,31,"Boss Medium"},
{2643,-1296,-1,"Boss Medium"},  
{-2197,-2351,31,"Boss Medium"},  
{216,1869,14,"Boss Medium"},  

{-110,1979,-12,"Boss Low"},  --kopalnia
{-130,1993,5,"Boss Low"},  --kopalnia
{-139,2013,2,"Boss Low"},  --kopalnia
{-114,2029,16,"Boss Low"},  --kopalnia
{-159,2017,16,"Boss Low"},  --kopalnia
{-158,2012,16,"Boss Low"},  --kopalnia
{-87,1967,-12,"Boss Hard"},  --kopalnia
}




local zombiaki = createElement("zombiaczki")
setElementID(zombiaki,"zombiaczki_all")

setElementData(zombiaki,"zombie_max",#zombies)
setElementData(zombiaki,"zombie_zywe",#zombies)

addCommandHandler('pos1',function(p)
	local x,y,z = getElementPosition(p)
	outputChatBox("{"..math.ceil(x)..','..math.ceil(y)..','..math.ceil(z)..'},',p)
end)

local col_bot = {}


local skiny = {
	22,
	67,
	92,
	105,
	206,
}

local player_zombies = {}


local blip_zombie = {}

local data_bossow = {
	["Boss Low"] = function(bot)
		setElementData(bot,"blood",35000)
		setElementData(bot,"anty-headshot",true)
		setElementData(bot,"damage",3000)
		setElementData(bot, "Boss Low", true)
		setElementModel(bot, 70)
	end,
	["Boss Medium"] = function(bot)
		setElementData(bot,"blood",300000)
		setElementData(bot,"anty-headshot",true)
		setElementData(bot,"damage",8000)
		setElementModel(bot,72)
		local blip = createBlipAttachedTo(bot,36,0,0,0,0,0,0,300)
		setElementData(bot, "Boss Medium", true)
		blip_zombie[bot] = blip
	end,
	["Boss Hard"] = function(bot)
		setElementData(bot,"blood",1800000)
		setElementData(bot,"anty-headshot",true)
		setElementData(bot,"damage",6000)
		setElementData(bot, "Boss Hard", true)
		setElementModel(bot, 69)
		local blip = createBlipAttachedTo(bot,37,0,0,0,0,0,0,300)
		blip_zombie[bot] = blip
	end,

}

local col_zombie_spawner = {}


function spawnZombieZdalnie(x,y,z)
--[[	local bot = createPed(skiny[math.random(#skiny)],x,y,z)
	setPedWalkingStyle(bot,120)
	local col = createColSphere(x,y,z-5,150)
	attachElements(col,bot)
	col_zombie_spawner[col] = true
	setElementData(bot,'ColShape',col)
	setElementData(bot,'rsp',{x,y,z})
	setElementData(bot,'damage',1000)
	setElementData(bot,'Zombie-Typ',"Low-Zombie")
	setElementData(bot,'blood',12000)
	for i,v in pairs(getElementsWithinColShape(col,'player')) do
		if not player_zombies[v] then
			player_zombies[v] = {}
		end
		player_zombies[v][col] = col
	end
	col_bot[col] = {col,bot}]]
end
addEvent("spawnZombieZdalnie",true)
addEventHandler("spawnZombieZdalnie",root,spawnZombieZdalnie)

function spawnZombie()
	for i,v in pairs(zombies) do
		local bot = createPed(skiny[math.random(#skiny)],v[1],v[2],v[3])
		--createBlipAttachedTo(bot,0,1,0,255,0,255,0,100)
		setPedWalkingStyle(bot,120)
		local col = createColSphere(v[1],v[2],v[3]-5,150)
		attachElements(col,bot)
		col_zombie_spawner[col] = true
		--setBlipVisibleDistance(createBlipAttachedTo(bot,11),600)
		setElementData(bot,'Zombie-Respawn',true)
		setElementData(bot,'ColShape',col)
		setElementData(bot,'rsp',{v[1],v[2],v[3]})
		setElementData(bot,"blood",12000)
		setElementData(bot,'damage',1000)
		if v[4] then
			data_bossow[v[4]](bot);
			setElementData(bot,"Zombie-Typ",v[4])
		else
			setElementData(bot,'Zombie-Typ',"Low-Zombie")
			setElementData(bot,'blood',12000)
		end
		for i,v in pairs(getElementsWithinColShape(col,'player')) do
			if not player_zombies[v] then
				player_zombies[v] = {}
			end
			player_zombies[v][col] = col
		end
		--setElementData(bot,'spawnPoint',{v[1],v[2],v[3]})
		
		
		col_bot[col] = {col,bot}
	end
end
spawnZombie()



local dzwiek = 0



addEventHandler('onColShapeHit',resourceRoot,function(elem)
	if not col_zombie_spawner[source] then return end
	if getElementType(elem)=='player' then
		if not player_zombies[elem] then
			player_zombies[elem] = {}
		end
		player_zombies[elem][source] = source
	end
end)

addEventHandler('onColShapeLeave',resourceRoot,function(elem)
	if not col_zombie_spawner[source] then return end
	if getElementType(elem)=='player' then
		if col_bot[source] and player_zombies[elem] and player_zombies[elem][source] and player_zombies[elem][source]==col_bot[source][1] and isElement(col_bot[source][2]) then
			zombieBackToSpawn(col_bot[source][2])
		end
		player_zombies[elem][source] = nil
	--[[elseif getElementType(elem)=='ped' then
		if col_bot[source] and isElement(col_bot[source][2]) then
			zombieBackToSpawn(col_bot[source][2])
		end]]
	end
end)

addEventHandler('onPlayerQuit',root,function()
	if not player_zombies[source] then return end
	for i,v in pairs(player_zombies[source]) do
		if col_bot[v] then
			local bot = col_bot[v][2]
			if not isPedDead(bot) then
				zombieBackToSpawn(bot)
			end
		end
	end
end)

local zombie_to_player = {}
local zombie_timers_to_player = {}


addEventHandler('ZombieStartPlayer',resourceRoot,function(player,strzelil)
	if not player_zombies[player] then
		player_zombies[player] = {}
	end
	local sound = (getElementData(player,'volume') or 20)/5
	local visible = (getElementData(player,'visibly') or 20)/5
	if not player_zombies[player] then return end
	if strzelil then
		if isTimer(zombie_timers_to_player[player]) then
			killTimer(zombie_timers_to_player[player])
		end
	end
	for i,v in pairs(player_zombies[player]) do
		if col_bot[v] then
			local bot = col_bot[v][2]
			if not isElement(bot) or getElementType(bot) == "colshape" or isPedDead(bot) then
				player_zombies[player][i] = nil
			end
			if player_zombies[player][i] then
				local dystans_player = {getElementPosition(player)}
				local dystans_ped = {getElementPosition(bot)}
				if strzelil then
					local dystans = getDistanceBetweenPoints3D(Vector3(getElementPosition(bot)),strzelil[1],strzelil[2],strzelil[3])
					if dystans<30 and (dystans_player[3] - 10 < dystans_ped[3] and dystans_player[3] + 10 > dystans_ped[3]) then
						if not isPedDead(bot) then
							
							if getElementData(player,"Immunited") then
								setElementData(player,'Immunited',false)
							end
							if getElementData(player,"Zombie_Strzelil") then
								setElementData(player,'Zombie_Strzelil',true)
							end
							seachTarget(bot,player)
							if not isTimer(zombie_timers_to_player) then
								zombie_timers_to_player[player] = setTimer(function(player)
									if not isElement(player) then return end
									setElementData(player,'Zombie_Strzelil',false)
								end,6000,1,player)
							end
						end
					end
				else
					local distance = getDistanceBetweenPoints3D(dystans_player[1],dystans_player[2],dystans_player[3],dystans_ped[1],dystans_ped[2],dystans_ped[3])
					if bot and isElement(bot) and not isPedDead(bot) then
						if ( distance < sound*0.75+ visible*1 )  then
							setElementData(player,'Immunited',false)
							seachTarget(bot,player)
						else 
							if getElementData(bot,'target') then 
								if getElementData(bot,'target')==player then
									if ( distance > sound*2.25+ visible*1.75) then
										if not getElementData(player,"Zombie_Strzelil") then 
											setElementData(player,'Immunited',true)
											zombieBackToSpawn(bot)
										end
									else
										---seachTarget(bot,player)
										 --zombieBackToSpawn(bot,player)
									end
							--setElementData(player,'Immunited',true)
								end
							else
								zombieBackToSpawn(bot)
							end
						end
					end
				end
			end
		end
	end
end)


local items = {
	{"Hatchet",2},
	{"Pizza",5},
	{"Soda Bottle",5},
	{"Milk",5},
	{"Winchester 1866",2},
}

function math.percent(percent,maxvalue)
    if tonumber(percent) and tonumber(maxvalue) then
        return (maxvalue*percent)/100
    end
    return false
end


function restartZombie(id,x,y,z,typ)
	local col = createColSphere(x,y,z,150)
	local bot = createPed(id or skiny[math.random(#skiny)],x,y,z)
	setElementData(zombiaki,"zombie_zywe",getElementData(zombiaki,"zombie_zywe") + 1)
	attachElements(col,bot)
	col_zombie_spawner[col] = true
	setPedWalkingStyle(bot,120)
	setElementData(bot,'rsp',{x,y,z})
	for i,v in pairs(getElementsWithinColShape(col,'player')) do
		if not player_zombies[v] then
			player_zombies[v] = {}
		end
		player_zombies[v][col] = col
	end
	--setElementData(col,'Zombie-Col',true)
	setElementData(bot,'Zombie-Respawn',true)
	setElementData(bot,'ColShape',col)
	if data_bossow[typ] then
		data_bossow[typ](bot)
		setElementData(bot,"Zombie-Typ",typ)
	else
		setElementData(bot,'damage',500)
		setElementData(bot,'Zombie-Typ',"Low-Zombie")
		setElementData(bot,'blood',12000)
	end
	col_bot[col] = {col,bot}
end

local deaths_zombies = {}


setTimer(function()
	for i,v in pairs(deaths_zombies) do
		if getTickCount()>v[5] then
			restartZombie(tonumber(v[1]),v[2],v[3],v[4],v[6])
			deaths_zombies[i] = nil
		end
	end
end,60000,0)


local gp_und_exp_for_zombie = {
	["Low-Zombie"] = {GP = {1,3},EXP = {1,2}, time_respawn = 900000 * 1.5},
	["Boss Low"] = {GP ={6,12},EXP = {8,15}, time_respawn = 900000 * 2.5},
	["Boss Medium"] = {GP ={10,30},EXP = {15,30}, time_respawn = 900000 * 12},
	["Boss Hard"] = {GP ={800,1300},EXP = {200,700}, time_respawn = 86400000},
}


local itemTableZombies = {
	{"Box of Matches", 5},
	{"Wood Pile", 5},
	{"M1911", 0.4},
	{"PDW", 0.3},
	{"Hunting Knife", 7},
	{"Hatchet", 7},
	{"Pizza", 7},
	{"Soda Bottle", 7},
	{"MP5A5", 0.1},
	{"Empty Gas Canister", 5},
	{"Roadflare", 9},
	{"Baseball Bat", 0.5},
	{"Milk", 5},
	{"Assault Pack (ACU)", 99},
	{"Painkiller", 7},
	{"M9 SD", 0.4},
	{"Empty Soda Cans", 6},
	{"Scruffy Burgers", 6},
	{"Grenade", 0.5},
	--{"Desert Eagle", 0.3},
	{"Sawn-Off Shotgun", 0.2},
	{"SPAZ-12 Combat Shotgun", 0.2},
	{"Watch", 3},
	{"Heat Pack", 6},
	{"Wire Fence", 1},
	{"Winchester 1866", 0.4},
	{"Alice Pack", 0.5},
	{"Tire", 1},
	{"Morphine", 2},
	{"Civilian Clothing", 12},
	{"Map", 4},
	{"Golf Club", 0.5},
	{"GPS", 1},
	{"Pasta Can", 5},
	{"Beans Can", 5},
	{"Lee Enfield", 0.2},
	{"Burger", 2},
	{"Radio Device", 3},
	{"Shovel", 0.5}
};

function math.percentChance(percent, repeatTime)
	local hits = 0;
	for i = 1, repeatTime do
		local number = math.random(0, 200)/2
		if (number <= percent) then hits = hits + 1; end
	end
	return hits;
end

addEventHandler('onPedWasted',resourceRoot,function(totalAmmo,p,weap,bp)
	if not isElement(source) then return end
	if getElementData(source,'deadzombie') then return end
	if blip_zombie[source] then
		destroyElement(blip_zombie[source])
		blip_zombie[source] = nil
	end
	local x,y,z = getElementPosition(source);
	local ped = source
	local pedCol = createColSphere(x, y, z, 1.5);
	killPed(ped);
	if bp == 9 then
		setPedHeadless(ped,true)
	end
	setElementCollisionsEnabled(ped,false)
	setElementData(zombiaki,"zombie_zywe",getElementData(zombiaki,"zombie_zywe") - 1)
	setTimer(function(ped, pedCol)
		if blip_zombie[ped] then
			destroyElement(blip_zombie[ped])
			blip_zombie[ped] = nil
		end
		if ped then destroyElement(ped); end
		if pedCol then destroyElement(pedCol); end
	end, (60000 * 3), 1, ped, pedCol);
	attachElements(pedCol,ped);
	setElementData(pedCol, "parent", ped);
	setElementData(ped, "parent", pedCol);
	setElementData(pedCol, "playername", "Zombie");
	setElementData(pedCol, "deadman", true);
	setElementData(pedCol, "MAX_Slots", 8);
	setElementData(ped, "deadzombie", true);
	setElementData(source, "deadzombie", true);
	local rodzaj_zombiaka = getElementData(source,"Zombie-Typ")
	local colshape = getElementData(source,'ColShape')
	local x1,y1,z1 = unpack(getElementData(source,'rsp'))
	if getElementData(ped,"Zombie-Respawn") then
		table.insert(deaths_zombies,{tonumber(skiny[math.random(#skiny)]),x1,y1,z1,getTickCount()+ gp_und_exp_for_zombie[rodzaj_zombiaka].time_respawn,rodzaj_zombiaka}) -- 900000
	end
	if p  and getElementType(p) == "player" then
		player_zombies[p][colshape] = nil
		local los = math.random(gp_und_exp_for_zombie[rodzaj_zombiaka].GP[1],gp_und_exp_for_zombie[rodzaj_zombiaka].GP[2]) -- tu dajesz x2 gp
		setElementData(p,"GP",(getElementData(p,"GP") or 0)+los)
		local added_exp = math.random(gp_und_exp_for_zombie[rodzaj_zombiaka].EXP[1],gp_und_exp_for_zombie[rodzaj_zombiaka].EXP[2]) -- tu dajesz x2 exp
		triggerEvent("giveEXP",p,added_exp)
		setElementData(p,"humanity",(getElementData(p,"humanity") or 0)+math.random(20,30))
		outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] +"..los.." GP +"..added_exp.." EXP!",p,255,255,255,true)
		setElementData(p,'zombieskilled',(getElementData(p,'zombieskilled') or 0)+1)
		setElementData(p,'TotalZombieKilled',(getElementData(p,'TotalZombieKilled') or 0)+1)
		exports.DayZ_mission:addMissionProgress(p, "kill_zombies")
		--outputChatBox("testy1")
	end
	if col_bot[colshape] then
		destroyElement(colshape)
		col_bot[colshape] = nil
	end
	if getElementData(source, "Boss Low") then
	local chance = math.random(1, 100)
		if chance <= 40 then
		setElementData(pedCol, "M4A1-S Mag", math.random(1,3))
		end
		if chance <= 40 then
		setElementData(pedCol, "M4A1-S", math.random(1,3))
		end
		if chance <= 25 then
		setElementData(pedCol, "MG-34", math.random(1,3))
		end
		if chance <= 30 then
		setElementData(pedCol, "MG-34 Mag", math.random(1,3))
		end
	end
	if getElementData(source, "Boss Medium") then
		local chance = math.random(1, 100)
		if chance <= 10 then
			setElementData(pedCol, "Code card #"..math.random(1,6), 1)
		end
		if chance <= 50 then
		setElementData(pedCol, "M4A1-S Mag", math.random(2,5))
		setElementData(pedCol, "M4A1-S", math.random(1,5))
		setElementData(pedCol, "MG-34", math.random(1,3))
		setElementData(pedCol, "MG-34 Mag", math.random(3,6))
		setElementData(pedCol, "Medic Bag", 3)
		end
	end
	if getElementData(source, "Boss Hard") then
		local chance = math.random(1, 100)
		if chance <= 35 then
			setElementData(pedCol, "Code card #"..math.random(1,6), 1)
		end
		setElementData(pedCol, "M4A1-S Mag", 15)
		setElementData(pedCol, "M4A1-S", 10)
		setElementData(pedCol, "AK-47", 10)
		setElementData(pedCol, "AK-47 Mag", 5)
		setElementData(pedCol, "MG-34", 5)
		setElementData(pedCol, "MG-34 Mag", 5)
		setElementData(pedCol, "Wrench", 5)
		setElementData(pedCol, "Medic Bag", 5)
	end
	local time = getRealTime();
	setElementData(pedCol, "deadreason", "Looks like it's finally dead. Estimated time of death: "..time.hour..":"..time.minute.." o'clock.");
	for _,v in ipairs(itemTableZombies) do
		local value = math.percentChance(v[2]/2.5, 1);
		setElementData(pedCol, v[1], value);
		local ammoData,_ = exports.DayZ_core:getWeaponAmmoType(v[1]);
		if (ammoData and value > 0) then
			setElementData(pedCol, ammoData, 1);
		end
	end
end)

addEvent("killZombie",true)
addEventHandler("killZombie",resourceRoot,function(ped,weap,bp)
	killPed(ped,client,weap,bp)
end)


