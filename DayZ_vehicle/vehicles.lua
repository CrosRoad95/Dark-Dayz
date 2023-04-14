setElementID(resourceRoot,'Dayz_Vehicle')


local id_data = {
	"OdejmijPaliwo",
	'repairVehicle',
}




for i,v in pairs(id_data) do
setElementData(resourceRoot,v,resourceRoot)
end

local hospitalPacks = {
	{-2670.87890625,636.8984375,14.453125},
	{-2637.0556640625,635.03125,14.453125},
	{-1515.669921875,2519.166015625,56.0703125},
	{-1513.888671875,2519.5908203125,56.064819335938},
	{-1528.8955078125,2516.724609375,55.986171722412},
	{2022.1650390625,-1402.6806640625,17.18045425415},
	{2042.7001953125,-1409.4775390625,17.1640625},
	{-316.5478515625,1051.6494140625,20.340259552002},
	{-337.9541015625,1049.490234375,19.739168167114},
	{-331.5849609375,1046.037109375,26.012474060059},
	{-307.0419921875,1045.27734375,26.012474060059},
	{1171.490234375,-1310.560546875,13.986573219299},
	{1171.609375,-1306.556640625,13.996350288391},
	{1158.5048828125,-1326.333984375,31.503561019897},
	{1159.80078125,-1323.9013671875,31.498970031738},
	{1238.7119140625,328.2431640625,19.7555103302},
	{1229.365234375,311.1435546875,24.7578125},
	{-2204.07421875,-2309.58203125,31.375},
	{1615.939453125,1818.0537109375,10.8203125},
	{1601.9443359375,1816.736328125,10.8203125},
	{1590.0166015625,1792.0234375,30.46875},
	{1607.3232421875,1776.7412109375,37.3125},

};
local patrolPoints = {
	["stacje"] = {
		{-1603.2197265625,-2712.736328125,48.9453125},
		{2465.748046875,-2215.55859375,13.546875},
		{2473.439453125,-2215.56640625,13.546875},
		{2480.0732421875,-2216.140625,13.546875},
		{2487.24609375,-2215.5966796875,13.546875},
		{2494.1005859375,-2215.5859375,13.546875},
		{-1686.6728515625,408.9970703125,7.3984375},
		{-1682.34375,412.9384765625,7.3984375},
		{-1680.0263671875,402.3642578125,7.3984375},
		{-1675.84375,406.4677734375,7.3984375},
		{-1670.5615234375,411.8359375,7.3984375},
		{-1666.2392578125,416.2509765625,7.3984375},
		{-1672.7939453125,422.81640625,7.3984375},
		{-1677.20703125,418.46484375,7.3984375},
		{-2410.7021484375,969.9091796875,45.4609375},
		{-2410.744140625,975.220703125,45.4609375},
		{-2410.837890625,980.5302734375,45.4609375},
		{-1329.3046875,2668.5126953125,50.46875},
		{-1328.7314453125,2673.90625,50.0625},
		{-1327.0185546875,2679.3876953125,50.46875},
		{-1327.3798828125,2684.62890625,50.0625},
		{1940.7099609375,-1778.5244140625,13.390598297119},
		{1940.6552734375,-1774.908203125,13.390598297119},
		{1940.630859375,-1771.728515625,13.390598297119},
		{1940.7080078125,-1767.3837890625,13.390598297119},
		{-1477.921875,1868.138671875,32.639846801758},
		{-1466.1552734375,1869.0048828125,32.6328125},
		{-1464.5224609375,1861.3828125,32.639846801758},
		{-1477.4599609375,1860.5205078125,32.6328125},
		{-735.9208984375,2744.0087890625,47.2265625},
		{-739.0439453125,2744.2421875,47.165451049805},
		{377.6953125,2601.1083984375,16.484375},
		{624.5263671875,1676.25390625,6.9921875},
		{620.2958984375,1681.2431640625,6.9921875},
		{616.248046875,1686.4169921875,7.1875},
		{612.783203125,1691.1650390625,7.1875},
		{609.2060546875,1696.201171875,7.1875},
		{605.8505859375,1700.978515625,7.1875},
		{602.27734375,1706.3603515625,7.1875},
		{2141.037109375,2742.734375,10.960174560547},
		{2142.3115234375,2752.6982421875,10.96019744873},
		{2147.9521484375,2752.3203125,10.8203125},
		{2152.60546875,2751.953125,10.8203125},
		{2152.984375,2743.85546875,10.8203125},
		{2147.75,2743.7392578125,10.8203125},
		{-97.6298828125,-1175.0283203125,2.4990689754486},
		{-90.74609375,-1177.853515625,2.2021217346191},
		{-84.75390625,-1163.853515625,2.3359375},
		{-91.5771484375,-1160.5732421875,2.4453125},
		{-1606.525390625,-2717.2138671875,48.9453125},
		{-1609.7109375,-2721.544921875,48.9453125},
		{-1599.83203125,-2708.302734375,48.9453125},
		{-2246.314453125,-2558.8212890625,32.0703125},
		{-2241.3125,-2561.3662109375,32.0703125},
		{-1132.2880859375,-135.0986328125,14.14396572113},
		{-1153.529296875,-156.373046875,14.1484375},
		{-1142.826171875,-145.67578125,14.14396572113},
		{655.611328125,-557.9912109375,16.501491546631},
		{655.6572265625,-572.1728515625,16.501491546631},
		{1601.791015625,2203.90625,11.060997009277},
		{1596.806640625,2203.4345703125,10.8203125},
		{1590.197265625,2203.4853515625,10.8203125},
		{1589.4775390625,2195.43359375,10.8203125},
		{1596.125,2194.294921875,10.8203125},
		{1601.6591796875,2194.3369140625,10.8203125},
		{2206.8466796875,2470.47265625,10.8203125},
		{2206.94140625,2474.75,10.8203125},
		{2206.9267578125,2478.86328125,10.8203125},
		{2198.06640625,2480.6953125,10.8203125},
		{2197.541015625,2475.791015625,10.995170593262},
		{2197.609375,2471.9169921875,10.995170593262},
		{2120.8251953125,915.4833984375,10.8203125},
		{2115.1181640625,915.44140625,10.8203125},
		{2109.076171875,915.4228515625,10.8203125},
		{2109.22265625,924.8779296875,10.9609375},
		{2114.9404296875,924.8857421875,10.9609375},
		{2119.5126953125,925.2861328125,10.9609375},
		{2645.7197265625,1112.7802734375,10.8203125},
		{2639.984375,1112.56640625,10.8203125},
		{2634.828125,1112.3466796875,10.9609375},
		{2634.1826171875,1101.9482421875,10.8203125},
		{2636.7509765625,1101.6748046875,10.8203125},
		{2643.5126953125,1101.81640625,10.8203125},
		{2209.576171875,2469.8251953125,10.8203125},
		{2208.8310546875,2475.09375,10.8203125},
		{1005.078125,-901.7490234375,42.216625213623},
		{993.025390625,-902.474609375,42.222496032715},
	},
	--[[
                ["auta"] = {
		{987.5673828125,770.8427734375,10.5,0},
		{1932.96875,825.942578125,6.6,90},
		{2036.1015625,1138.921875,10.5,0},
		{2078.3916015625,1455.021484375,10.5,0},
		{2382.0908203125,826.3515625,6.4,90},
		{2733.0751953125,1715.4794921875,6.4,180},
		{2438.5478515625,2634.796875,5.8,240},
		{1813.57421875,1883.1142578125,6.5,0},
		{1039.6259765625,2547.533203125,10.5,60},
		{380.861328125,1551.9541015625,15,60},
		{-76.6328125,853.9248046875,17.7,90},
		{1309.0595703125,2694.115234375,10.8203125,0},
		{1294.68359375,2650.37890625,10.8203125,0},
		{1349.34375,2649.4150390625,10.8203125,0},
		{1904.5322265625,2694.9755859375,11.0234375,0},
		{2043.5,2469.5478515625,10.8203125,0},
		{2073.3955078125,2478.845703125,10.8203125,0},
		{2130.36328125,2468.9267578125,10.8203125,0},
		{1904.55078125,2067.5927734375,10.8203125,0},
		{2102.298828125,2049.4951171875,10.8203125,0},
		{2103.521484375,2077.2578125,10.8203125,0},
		{2170.6484375,2000.28515625,10.8203125,0},
		{2184.6708984375,1983.5654296875,10.8203125,0},
		{2239.4677734375,1975.27734375,31.779651641846,0},
		{2279.052734375,1940.529296875,31.779651641846,0},
		{2244.9326171875,1974.5244140625,26.299333572388,0},
		{2247.6240234375,1954.373046875,20.822093963623,0},
		{2276.30078125,1975.1484375,15.346448898315,0},
		{2236.9609375,1997.8466796875,15.346448898315,0},
		{2245.9658203125,2041.810546875,10.8203125,0},
		{2247.0498046875,1939.4091796875,9.8671274185181,0},
		{2178.4599609375,1811.4267578125,10.8203125,0},
		{2195.1171875,1877.98046875,10.8203125,0},
		{2186.1396484375,1857.53125,10.8203125,0},
		{2035.2080078125,1913.484375,12.176197052002,0},
		{2106.4541015625,1409.26171875,10.8203125,0},
		{2141.0546875,1398.5146484375,10.8203125,0},
		{1933.1064453125,708.681640625,10.8203125,0},
		{1910.1728515625,698.4169921875,10.8203125,0},
		{1413.234375,698.4443359375,10.8203125,0},
		{1413.6923828125,764.99609375,10.8203125,0},
		{1460.6494140625,787.328125,10.8203125,0},
		{1522.3232421875,787.8486328125,10.8203125,0},
		{1315.7578125,1279.326171875,10.8203125,0},
		{1282.3994140625,1296.65234375,10.8203125,0},
		{1127.2919921875,2302.5263671875,16.71875,0},
		{1109.654296875,2262.1923828125,16.71875,0},
		{1110.0322265625,2173.4794921875,16.71875,0},
		{1112.5185546875,2194.150390625,10.8203125,0},
		{1106.8681640625,2226.236328125,10.8203125,0},
		{1115.8642578125,2260.12109375,10.8203125,0},
		{1137.3369140625,2324.875,10.8203125,0},
		{716.5478515625,1948.2958984375,5.5390625,0},
		{801.8603515625,1686.9873046875,5.28125,0},
		{660.8740234375,1722.03125,6.9921875,0},
		{679.7841796875,1724.69921875,6.9921875,0},
		{-305.1787109375,1020.4990234375,19.59375,0},
		{-213.9130859375,996.017578125,19.60094833374,0},
		{-176.9873046875,1222.6298828125,19.7421875,0},
		{-60.4794921875,-378.255859375,5.4296875,0},
		{-18.1474609375,-376.0537109375,5.4296875,0},
		{-0.947265625,-339.0087890625,5.4296875,0},
		{-2.0439453125,-301.712890625,5.4296875,0},
		{-26.2119140625,-219.3369140625,5.4296875,0},
		{196.3486328125,-156.11328125,1.578125,0},
		{328.720703125,-51.1884765625,1.5119953155518,0},
		{311.783203125,-241.126953125,1.578125,0},
		{694.4833984375,-467.2548828125,16.3359375,0},
		{844.140625,-599.78515625,18.421875,0},
		{1372.970703125,-1057.890625,26.629177093506,0},
		{1337.640625,-1250.521484375,13.546875,0},
		{1473.802734375,-1434.751953125,13.546875,0},
		{2031.986328125,-1440.1875,17.197570800781,0},
		{2091.693359375,-1558.203125,13.120858192444,0},
		{2465.4814453125,-1654.494140625,13.306631088257,0},
		{2482.53515625,-1953.36328125,13.425992965698,0},
		{2308.9423828125,-2345.6240234375,13.546875,0},
		{1984.4345703125,-2189.3740234375,13.546875,0},
		{1947.5244140625,-2130.7041015625,13.54630947113,0},
		{1947.158203125,-2118.8193359375,13.546934127808,0},
		{1780.0947265625,-1926.7197265625,13.389386177063,0},
		{1838.1201171875,-1871.7216796875,13.389747619629,0},
		{1836.6259765625,-1854.4267578125,13.389747619629,0},
		{1567.0615234375,-1608.921875,13.3828125,0},
		{1455.9443359375,-1494.8701171875,13.546875,0},
		{1541.5791015625,-1024.2587890625,23.90625,0},
		{1647.4189453125,-1084.4345703125,23.90625,0},
		{1657.818359375,-1134.4345703125,23.90625,0},
		{1705.3154296875,-1069.6806640625,23.90625,0},
		{1742.8427734375,-1046.1796875,23.90625,0},
		{1770.400390625,-1019.9541015625,23.90625,0},
		{1758.6494140625,-1035.3818359375,23.90625,0},
		{1784.6015625,-1084.7578125,23.90625,0},
		{1590.8828125,-1009.130859375,23.90625,0},
		{1966.7763671875,-1189.9052734375,25.771551132202,0},
		{2147.8115234375,-1194.173828125,23.8297996521,0},
		{2160.880859375,-1168.2294921875,23.82958984375,0},
		{2216.0380859375,-1162.123046875,25.7265625,0},
		{2543.7861328125,-1471.3828125,23.968061447144,0},
		{2473.2685546875,-1692.8017578125,13.514678001404,0},
		{2498.3037109375,-1685.2236328125,13.426837921143,0},
		{2065.4560546875,-1919.7099609375,13.546875,0},
		{2062.2880859375,-1904.5654296875,13.546875,0},
		{1934.6279296875,-1784.298828125,13.3828125,0},
		{892.421875,-1657.7353515625,13.546875,0},
		{783.923828125,-1623.7236328125,13.3828125,0},
		{334.833984375,-1789.1435546875,4.8963966369629,0},
		{-83.0732421875,-1573.6005859375,2.6107201576233,0},
		{-529.107421875,-488.6708984375,25.5234375,0},
		{-552.6328125,-487.7939453125,25.5234375,0},
		{-585.0380859375,-473.51953125,25.5234375,0},
		{-1811.00390625,-592.5205078125,16.484375,0},
		{-1651.4697265625,430.41796875,7.1796875,0},
		{-1697.3916015625,399.232421875,7.1796875,0},
		{-1896.1474609375,441.1767578125,35.076023101807,0},
		{-1993.3984375,328.76171875,35.076023101807,0},
		{-1990.7578125,266.666015625,35.076023101807,0},
		{-1985.93359375,159.052734375,27.6875,0},
		{-1986.7958984375,123.2626953125,27.6875,0},
		{-2068.6806640625,-84.48828125,35.1640625,0},
		{-2088.2373046875,-81.9111328125,35.1640625,0},
		{-2265.1318359375,135.900390625,35.171848297119,0},
		{-2414.4208984375,330.46484375,34.97550201416,0},
		{-2425.892578125,517.142578125,29.9296875,0},
		{-2419.4326171875,525.3486328125,29.9296875,0},
		{-2568.8154296875,599.341796875,14.457498550415,0},
		{-2545.8681640625,643.7138671875,27.8125,0},
		{-2591.6611328125,650.5400390625,27.8125,0},
		{-2495.4228515625,740.6005859375,35.015625,0},
		{-2443.8642578125,742.03515625,35.015625,0},
		{-2412.6630859375,741,35.015625,0},
		{-2426.140625,1039.0615234375,50.390625,0},
		{-2617.7900390625,1374.6015625,7.110372543335,0},
		{-2535.1328125,1228.908203125,37.421875,0},
		{-2523.2421875,1229.3125,37.428329467773,0},
		{-2513.5146484375,1210.9560546875,37.421875,0},
		{-1637.888671875,1295.4921875,7.0390625,0},
		{-1658.8779296875,1214.6728515625,13.671875,0},
		{-1790.6259765625,1292.205078125,59.734375,0},
		{-1824.6943359375,1291.3896484375,59.732711791992,0},
		{-1821.5205078125,1312.109375,50.441383361816,0},
		{-1811.9462890625,1311.125,41.1484375,0},
		{-1587.9755859375,748.314453125,-5.2421875,0},
		{-1573.072265625,722.3955078125,-5.2421875,0},
		{-1600.0400390625,693.5380859375,-5.2421875,0},
		{-1710.693359375,506.7724609375,38.342720031738,0},
		{-681.5263671875,965.0234375,12.1328125,0},
		{-6.7412109375,1361.298828125,9.171875,0},
	} ]]
};



local hydrant_places = {}

for i,v in pairs(hydrant_places) do
	local object = createObject(1211,v[1],v[2],v[3])
	local col = createColSphere(v[1],v[2],v[3],1.5)
	--local z = createBlipAttachedTo(object,17)
	--setBlipVisibleDistance(z,200)
	setElementData(col,'hydrant',true)
end

local lootItems = {
	["hospital"] = {
		{"Medic Kit",2},
		{"Medic Bag",1},
		{"First Aid Kit",3},
		-- {"Heat Pack",1576,1,0},
		{"Bandage",5},
		{"Blood Bag",3},
		{"Morphine",5},
		--{"Blood Bag",1580,1,0},
		--{"Medic Kit",2891,0.7,0},
		--{"Blood Bag",1580,1,0},
		{"Painkiller",5},
	},
};

local vehicleAddonsInfo = {
	[422]={ 4, 1, 1, 80}, --Bobcat
	[470]={ 4, 1, 1, 120}, --Patriot
	[468]={ 2, 1, 1, 30}, --Sanchez
	[433]={ 6, 1, 1, 260}, --Barrack
	[437]={ 4, 1, 1, 120}, --Coach
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
	[417]={ 6, 2, 1, 400}, --Leviatan
	[511]={ 2, 2, 1, 500}, --Beagle
	[593]={ 3, 1, 1, 120}, --Dodo
	[471]={ 4, 1, 1, 50}, --Quad
	[500]={ 4, 1, 1, 80}, --Mesa
	[542]={ 4, 1, 1, 60}, --Clover
	[447]={ 0, 1, 1, 40}, --SeaSparrow
	[494]={ 4, 1, 1, 60}, --HotringRacer
	[550]={ 4, 1, 1, 60}, --Sunrise
	[445]={ 4, 1, 1, 60}, --Admiral
	[525]={ 4, 1, 1, 80}, --TowTruck
	[601]={ 8, 1, 1, 260}, --Swat
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
	[502]={ 4, 1, 1, 60}, --hotring2
	[503]={ 4, 1, 1, 60}, --hotring3
	[515]={ 6, 1, 1, 60}, --rdt
	[558]={ 4, 1, 1, 80}, --uranus
	[489]={ 4, 1, 1, 150}, --rancher
	[426]={ 4, 1, 1, 200}, --premier

};

local vehicleFuelInfo = {
	[422]={ 0.25}, --Bobcat
	[470]={ 0.50}, --Patriot
	[468]={ 0.15}, --Sanchez
	[433]={ 0.75}, --Barrack
	[437]={ 0.45}, --Coach
	[509]={ 0},  --Bike
	[487]={ 0.65}, --Maverick
	[497]={ 0.65}, --PoliceMaverick
	[453]={ 0.25}, --Reffer
	[411]={ 0.25}, --Infernus
	[415]={ 0.25}, --Cheetah
	[541]={ 0.25}, --Bullet
	[429]={ 0.25}, --Bannshe
	[480]={ 0.25}, --Comet
	[402]={ 0.25}, --Buffalo
	[495]={ 0.35}, --SandKing
	[560]={ 0.25}, --Sultan
	[579]={ 0.35}, --Huntley
	[562]={ 0.25}, --Elegy
	[482]={ 0.25}, --Burrito
	[496]={ 0.25}, --BlistaCompact
	[475]={ 0.25}, --Sabre
	[507]={ 0.25}, --Elegant
	[551]={ 0.25}, --Merit
	[522]={ 0.25}, --NRG500
	[461]={ 0.25}, --PCJ600
	[420]={ 0.25}, --Taxi
	[416]={ 0.25}, --Karetka
	[417]={ 2.35}, --Leviatan
	[511]={ 1.15}, --Beagle
	[593]={ 0.90}, --Dodo
	[471]={ 0.25}, --Quad
	[500]={ 0.25}, --Mesa
	[542]={ 0.25}, --Clover
	[447]={ 0.45}, --SeaSparrow
	[494]={ 0.25}, --HotringRacer
	[550]={ 0.25}, --Sunrise
	[445]={ 0.25}, --Admiral
	[525]={ 0.25}, --TowTruck
	[601]={0.75}, --Swat
	[469]={0.55}, --Sparrow
	[506]={ 0.25}, --Supergt
	[400]={ 0.65}, --LandStarker
	[528]={ 0.75}, --FBI truck
	[483]={ 0.55}, --Camper
	[565]={ 0.25}, --Flash
	[578]={ 0.65}, --DFT-30
	[416]={ 0.25}, --Ambulans
	[451]={ 0.25}, --Turismo
	[596]={ 0.25}, --PoliceLS
	[568]={ 0.25}, --Bandito
	[502]={ 0.25}, --hotring2
	[503]={ 0.25}, --hotring3
	[515]={ 1.25}, --rdt
	[558]={ 0.35}, --uranus
	[489]={ 0.55}, --rancher
	[426]={ 0.05}, --premier
};

local vehicleFuelTable = {
	[422]={ 80}, --Bobcat
	[470]={ 150}, --Patriot
	[468]={ 60}, --Sanchez
	[433]={ 250}, --Barrack
	[437]={ 150}, --Coach
	[509]={ 0},  --Bike
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
	[417]={ 450}, --Leviatan
	[511]={ 300}, --Beagle
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
	[416]={ 100}, --Ambulans
	[596]={ 100}, --PoliceLS
	[568]={ 80}, --Bandito
	[502]={ 70}, --hotring2
	[503]={ 70}, --hotring3
	[515]={ 350}, --rdt
	[558]={150}, -- uranus
	[489]={150}, -- rancher
	[426]={200}, -- premier
};

local hospitalCol = {};
local repairTimer = {};
local backupdone = false;

--addEvent("respawnVehiclesInWater", true);
addEvent("repairVehicle", true);
--addEvent("respawnDayZVehicle", true);

function getVehicleAddonInfos(id)
--	for _,v in ipairs(vehicleAddonsInfo) do
--		if (v[1] == id) then return v[2], v[3], v[4], v[5]; end
if vehicleAddonsInfo[id] then
	local opony,silnik,tire,slots = vehicleAddonsInfo[id][1],vehicleAddonsInfo[id][2],vehicleAddonsInfo[id][3],vehicleAddonsInfo[id][4]
	return opony,silnik,tire,slots
end
end


local ammo_in_mag = {
	['MP5A5'] = 20,
	['Winchester 1866'] = 7,
	['AK-47'] = 30,
	['M4'] = 30,
	['Desert Eagle'] = 7,
	['PDW'] = 30,
	['CZ550'] = 5,
	['Lee Enfield'] = 5,
	['M9 SD'] = 17,
	['M1911'] = 17,
	['Sawn-Off Shotgun'] = 2,
	['SPAZ-12 Combat Shotgun'] = 7,
}


function updateHospitals()
	for i,_ in pairs(hospitalCol) do
		for _,v in ipairs(lootItems["hospital"]) do
			setElementData(hospitalCol[i], v[1], math.random(v[2]));
		end
	end
	setTimer(updateHospitals, 3600000, 1);
end

local patrols_col = {}

function createPatrolPoints()
	
	for k,_ in pairs(patrolPoints) do
		
		for i,v in pairs(patrolPoints[k]) do
			
			local x,y,z = v[1], v[2], v[3];
			
			local patrolCol = createColSphere(x, y, z, 3);
			if k == "auta" then
				local car = createObject(12957,x,y,z,0,0,v[4])
				attachElements(patrolCol,car)
				setElementData(patrolCol, "patrolstation", {true,math.random(1,3)});
			else
				setElementData(patrolCol, "patrolstation", {true,math.random(3,8)});
			end
			table.insert(patrols_col,{patrolCol,k})
			--createBlipAttachedTo(patrolCol,51)
			--setElementData(patrolCol, "patrolstation", {true,math.random(1,3)});
		end
	end
	updatePatrol()
end

function updatePatrol()
	for i,v in pairs(patrols_col) do
		if v[2] == "auta" then
			setElementData(v[1], "patrolstation", {true,math.random(1,3)});
		else
			setElementData(v[1], "patrolstation", {true,math.random(3,8)});
		end
	end
	setTimer(updatePatrol, 3600000 * 5, 1);
end


function createHospitalPacks()
	for i,v in ipairs(hospitalPacks) do
		local x,y,z = v[1], v[2], v[3];
		local object = createObject(1558, x, y, z, nil, nil, nil);
		hospitalCol[i] = createColSphere(x, y, z, 2);
		setElementData(hospitalCol[i], "parent", object);
		setElementData(hospitalCol[i], "hospitalbox", true);
		setElementData(hospitalCol[i], "MAX_Slots", 20);
	end
	updateHospitals();
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

addEventHandler("onPlayerVehicleEnter", root, function(veh, seat)
	local id = getElementModel(veh);
	setVehicleEngineState(veh, false);
	if (id == 548) then cancelEvent(); end
	if (id == 509) then setVehicleEngineState(veh, true); return; end
	local col = getElementData(veh, "parent");
	local tires,engine,parts,_ = getVehicleAddonInfos(id);
	setElementData(veh, "maxfuel", getVehicleMaxFuel(id));
	setElementData(veh, "needtires", tires);
	setElementData(veh, "needparts", parts);
	setElementData(veh, "needengines", engine);
	setVehicleEngineState(veh, false);
	if (getElementData(col, "Parts_inVehicle") == parts) then
		setElementData(veh, "fuelloss", 5);
	else
		setElementData(veh, "fuelloss", 20);
	end
	if (getElementData(col, "Tire_inVehicle") == tires) then
		if (getElementData(col, "Engine_inVehicle") == engine) then
			if (getElementData(col, "fuel") or 0) >= 0.1 then
				setVehicleEngineState(veh, true);
				if (seat == 0) then
					bindKey(source, "k", "down", setEngineStateByPlayer);
					outputChatBox("#d63838[!] #FFFFFFKliknij #8A8A8A[K] #FFFFFFaby włączyć/wyłączyć silnik!", source, 255, 255, 255,true);
				end
			else
				triggerClientEvent(source, "displayClientInfo", source, "W tym pojeździe nie ma paliwa!", 22, 255, 0);
				setVehicleEngineState(veh, false);
			end
		else
			triggerClientEvent(source, "displayClientInfo", source, "W tym pojeździe brakuje silnika!", 22, 255, 0);
			setVehicleEngineState(veh, false);
		end
	else
		triggerClientEvent(source, "displayClientInfo", source, "W tym pojeździe brakuje kół!", 22, 255, 0);
		setVehicleEngineState(veh, false);
	end
end);

addEventHandler("onPlayerVehicleExit", root, function(veh, seat)
	if (seat == 0) then
		setVehicleEngineState(veh, false);
		unbindKey(source, "k", "down", setEngineStateByPlayer);
	end
end);

function getVehicleFuelRemove(id)
--	for _,v in ipairs(vehicleFuelInfo) do
--		if (v[1] == id) then return v[2]; end
--	end
if vehicleFuelInfo[id] then
local paliwo = vehicleFuelInfo[id][1]
	return paliwo
end
end

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


setTimer(function()
	local tick = getTickCount()
	for i, car in pairs(getElementsByType("vehicle")) do
		if getElementModel(car) ~= 509 then
			if getVehicleEngineState(car) == true then
				local parent = getElementData(car, "parent");
				local fuel = getElementData(parent, "fuel");
				if (fuel >= 0.1) then
					local speed = getElementSpeed(car,'km/h')
					setElementData(parent, "fuel",-(math.floor(speed)/5000)+fuel-(getVehicleFuelRemove(getElementModel(car))*getElementData(car, "fuelloss"))/60);
				else
					setVehicleEngineState(car, false);
				end
			end
		end
	end
end,5000,0)

--[[
addEventHandler("repairVehicle", root, function(source,veh)
	if repairTimer[veh] then triggerClientEvent(source, "displayClientInfo", source, getVehicleName(veh).." aktualnie ktoś już naprawia!", 255, 22, 0) return; end
	repairTimer[veh] = setTimer(fixDayZVehicle, (1000-(math.floor(getElementHealth(veh))))*120, 1, veh, source);
	setElementFrozen(veh, true);
	setElementFrozen(source, true);
	setPedWeaponSlot(source, 0);
	setElementData(veh, "repairer", source);
	setElementData(source, "repairingvehicle", veh);
	setElementData(source, "repairvehicle", true);
	setPedAnimation(source, "SCRATCHING", "sclng_r", nil, true, false);
	triggerClientEvent(source, "displayClientInfo", source, "Started to repair "..getVehicleName(veh), 22, 255, 0);
end);
]]



function fixDayZVehicle(veh, player)
	setElementHealth(veh, 1000);
	fixVehicle(veh);
	setPedAnimation(player, false);
	setElementFrozen(veh, false);
	setElementFrozen(player, false);
	setElementData(player, "repairvehicle", false);
	repairTimer[veh] = nil;
	setElementData(veh, "repairer", nil);
	setElementData(player, "repairingvehicle", nil);
	triggerClientEvent(player, "displayClientInfo", player, "Naprawiłeś "..getVehicleName(veh), 22, 255, 0);
end

--[[
addEventHandler("onPlayerQuit", root, function()
	for _,v in ipairs(getElementsByType("vehicle")) do
		local rep = getElementData(v, "repairer");
		if (rep and rep == source) then
			outputDebugString("Vehicle repairer disconnected - destroyed tables", 3);
			killTimer(repairTimer[v]);
			setElementFrozen(v, false);
			repairTimer[v] = nil;
			setElementData(v, "repairer", nil);
		end 
	end
end)]]

function setEngineStateByPlayer(player)
	local veh = getPedOccupiedVehicle(player);
	if not veh then return end
	local col = getElementData(veh,"parent")
	if (getElementData(col, "fuel") >= 0.1) then
		local tires,engine,parts,_ = getVehicleAddonInfos(getElementModel(veh));
		if (getElementData(col, "Tire_inVehicle") == tires) then
			if (getElementData(col, "Engine_inVehicle") == engine) then
				if (getVehicleEngineState(veh) == false) then
					setVehicleEngineState(veh, true);
					triggerClientEvent(player, "displayClientInfo", player, "Odpalileś silnik!", 22, 255, 0);
				else
					setVehicleEngineState(veh, false);
					triggerClientEvent(player, "displayClientInfo", player, "Zgasiłeś silnik!", 255, 22, 0);
				end
			end
		end
	end
end

createPatrolPoints();
createHospitalPacks();

local blocked_cars = {
	[601] = true,
	[447] = true,
}

function disableForSwat ( theVehicle, seat, jacked )
    if blocked_cars[getElementModel ( theVehicle )] then -- if they entered a hydra
        toggleControl ( source, "vehicle_secondary_fire", false ) -- disable their fire key
        toggleControl ( source, "vehicle_fire", false ) -- disable their fire key
    else -- if they entered another vehicle
        toggleControl ( source, "vehicle_secondary_fire", true ) -- enable their fire key
        toggleControl ( source, "vehicle_fire", true ) -- enable their fire key
    end
end
addEventHandler ( "onPlayerVehicleEnter", getRootElement(), disableForSwat )
