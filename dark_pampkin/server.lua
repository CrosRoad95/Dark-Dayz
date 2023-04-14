local Gifts = {
	position = {
{-2017.0732421875,-105.8828125,34.969306945801},
{-2530.84765625,-13.763671875,16.421875},
{-2777.7763671875,69.400390625,7.1875},
{-2708.958984375,637.1513671875,14.454549789429},
{-2609.6474609375,1178.3017578125,36.990322113037},
{-2378.0009765625,1546.970703125,2.1171875},
{-1813.859375,1301.21875,31.8515625},
{-1834.4599609375,1050.494140625,46.078125},
{-1947.849609375,883.7568359375,38.5078125},
{-1832.20703125,670.025390625,30.43127822876},
{-1956.9169921875,254.943359375,47.703125},
{-2130.74609375,161.3564453125,35.358127593994},
{-2533.26171875,-706.6455078125,139.3203125},
{-2080.53125,-885.8134765625,32.164207458496},
{-1366.111328125,-251.044921875,14.14396572113},
{-995.26953125,-721.15625,35.9375},
{-1431.3564453125,-965.388671875,200.9407043457},
{-2234.318359375,-1741.3134765625,480.83804321289},
{-2187.0654296875,-2412.037109375,35.296875},
{-2115.37890625,-2410.6279296875,31.273286819458},
{-1109.869140625,-1637.8544921875,76.3671875},
{-481.9052734375,-112.6142578125,63.746639251709},
{214.1376953125,-176.6640625,1.578125},
{245.8212890625,-53.76953125,1.5776442289352},
{792.375,-496.15234375,17.3359375},
{863.3564453125,-11.1923828125,63.244911193848},
{1246.5771484375,231.033203125,28.072776794434},
{2327.1962890625,-1.228515625,26.539226531982},
{2252.6640625,-70.5771484375,31.594974517822},
{2224.6025390625,-1168.5439453125,25.7265625},
{2764.9814453125,-1177.5546875,69.405502319336},
{2625.4130859375,-2000.439453125,14.637851715088},
{2836.46484375,-2377.8984375,12.293982505798},
{1094.6015625,-2036.857421875,82.756454467773},
{1478.5029296875,-1666.224609375,14.553216934204},
{1777.9853515625,-1367.7939453125,15.7578125},
{839.4560546875,-1503.0283203125,12.930241584778},
{896.421875,-1102.1162109375,24.703125},
{305.5810546875,-1501.1298828125,24.600702285767},
{407.455078125,-1266.7685546875,50.019790649414},
{1664.900390625,-988.4677734375,29.393419265747},
{1796.9830322266,843.54510498047,30.561111450195},
{-161.44140625,1134.40234375,19.7421875},
{-347.630859375,1629.232421875,75.501586914062},
{268.255859375,1883.6064453125,-30.09375},
{-549.5625,2593.93359375,53.93478012085},
{-2389.69140625,2387.615234375,8.8381462097168},
{-1514.63671875,2582.5361328125,55.8359375},
{-662.58984375,2314.5341796875,142.9375},
{-229.166015625,2817.4033203125,62.216636657715},
{1494.5986328125,2773.3193359375,10.8203125},
{2788.74609375,2533.7236328125,13.105983734131},
{2482.4013671875,1526.3115234375,11.503800392151},
{2784.380859375,1020.833984375,10.8984375},
{1941.0048828125,1343.0751953125,24.615127563477},
{1951.84765625,1626.451171875,22.767917633057},
{1373.623046875,2318.068359375,10.8203125},
{1307.00390625,1114.8486328125,10.8203125},
{1168.607421875,1354.0732421875,10.921875},
{669.9990234375,1703.572265625,7.1948890686035},
	},
	special = {
		{10, "10 PP"},
		{5, "5 PP"},
		{5, "5 PP"},
		{15, "15 PP"},
		{20, "20 PP"},
		{0, "0 PP"},
		{0, "0 PP"},
		{0, "0 PP"},
	},
}

Gifts.settings = {}
Gifts.settings.pickupID = 1348
Gifts.settings.giftMoney = 180

Gifts.create = function()
	for k, v in ipairs(Gifts.position) do
		v.pickup = createPickup(v[1], v[2], v[3], 3, Gifts.settings.pickupID, 0)
		if v[4] then setElementDimension(v.pickup, v[4]) end
		setElementData(v.pickup, "gift:id", k)
		addEventHandler("onPickupHit", v.pickup, Gifts.hitPickup)
	end
end

Gifts.hitPickup = function(player)
	if player.type == "player" and not player.vehicle then
		local gifts = exports["db-mysql"]:dbGet("select prezenty from dark_prezenty where serial = ?", getPlayerSerial(player))
		if not gifts[1] or not gifts[1].prezenty then _gifts = {} else _gifts = fromJSON(gifts[1].prezenty) end
		
		if not table.find(_gifts, getElementData(source, "gift:id")) then
			table.insert(_gifts, getElementData(source, "gift:id"))
		else
			outputChatBox("#ff0000✗ #ffffffZebrałeś już tą dynie!", player, 63, 173, 168, true)
			return
		end

		if not gifts[1] then
			exports["db-mysql"]:dbSet("insert into dark_prezenty values(?,?)", getPlayerSerial(player), toJSON(_gifts))
		else
			exports["db-mysql"]:dbSet("update dark_prezenty set prezenty = ? where serial = ?", toJSON(_gifts), getPlayerSerial(player))
		end

		if #_gifts >= #Gifts.position then
			local veh = Gifts.special[math.random(#Gifts.special)]
			outputChatBox("#3fada8ⓘ "..getPlayerName(player):gsub("#%x%x%x%x%x%x", "").." #ffffffzebrał ostatnią dynie i znalazł w niej: #3fada8"..veh[2].."!", root, 255, 255, 255, true)
			--exports["db-mysql"]:dbSet("insert into vc_vehicles set model = ?, ownedPlayer = ?, parking = 1, silnik = ?", veh[1], getElementData(player, "player:sid"), "1.6")
			setElementData(player,"PP",veh[1])
		else
			setElementData(player,"GP",Gifts.settings.giftMoney)
			outputChatBox("#3fada8✓ #ffffffZebrałeś dynie, otrzymujesz "..formatNumber(Gifts.settings.giftMoney).."GP! ("..(#_gifts).."/"..#Gifts.position..")", player, 63, 173, 168, true)
		end
	end
end
addEventHandler("onResourceStart", resourceRoot, Gifts.create)

function table.find(t, val)
	for k, v in pairs(t) do
		if v == val then
			return true
		end
	end

	return false
end

function formatNumber(number) 
	while true do      
		number, k = string.gsub(number, "^(-?%d+)(%d%d%d)", '%1,%2')    
		if k==0 then      
			break   
		end  
	end  
	return number
end