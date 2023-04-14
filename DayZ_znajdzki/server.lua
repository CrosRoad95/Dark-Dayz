local znajdzki = {
	-- {49.4931640625,-249.794921875,1.578125,"Znajdzka_1"},
{2394.6000976563,-1699.0999755859,13.39999961853},
{2497.6999511719,-1630.9000244141,13.10000038147},
{2480.8000488281,-1330.1999511719,34.5},
{1277,-806.09997558594,86.699996948242},
{2664.0302734375,-1117.5712890625,68.03727722168},
{2350.6000976563,-649.59997558594,127.69999694824},
{1688.6999511719,-1974.1999511719,8.5},
{1083,-2037.0999755859,68.699996948242},
{198.19999694824,-1759,4},
{-394.39999389648,-1147,69},
{-1169.4000244141,-2848.8000488281,32.099998474121},
{-2201.8701171875,-2341.3994140625,30.625},
{-2230.1000976563,-1740.6999511719,480.5},
{-2761.6999511719,-91.699996948242,6.8000001907349},
{-2532.3999023438,52.5,8.3000001907349},
{-2502,127.80000305176,24.10000038147},
{-2124.3000488281,265.29998779297,35.400001525879},
{-2905.3999023438,1021.5,36.5},
{-2666,1594.9000244141,216.89999389648},
{-1255.1999511719,954.5,138.89999389648},
{-735.09997558594,1545.9000244141,38.700000762939},
{-372.29998779297,2127.3000488281,132.69999694824},
{413.20001220703,2538,18.799999237061},
{1367.8000488281,2193.6000976563,9.3999996185303},
{2003.0999755859,2318.6999511719,10.5},
{2189.8999023438,2410.5,72.699996948242},
{2294.1000976563,548.29998779297,1.3999999761581},
{1101,1535.0999755859,51.700000762939},
{2591.3000488281,2722.1999511719,10.5},
{2728.8000488281,2685.8999023438,58.700000762939},
}

local znajdzka_to_klucz = {}

for i,v in pairs(znajdzki) do
	local pikap = createPickup(v[1],v[2],v[3],3,1254,1000)
	znajdzka_to_klucz[pikap] = "Znajdzka_"..i
end


local language = {
	["PL"] = {
		["PICKED"] = "* Podniosłeś już tą znajdzke!",
		["PICKED_2"] = "* Otrzymujesz %s EXP za podniesienie znajdzki!",
	},
	["ENG"] = {
		["PICKED"] = "* You picked this secret-item!",
		["PICKED_2"] = "* You get %s EXP for picking up a secret-item!",
	},

}

addEventHandler("onPickupHit",resourceRoot,function(hit)
	if hit and getElementType(hit) == "player" then
		local plr_znajdzki = getElementData(hit,"PLR_Znajdzki") or {["Znajdzki"] = {},["Ilosc_Znajdziek"] = 0}
		local jezyk = getElementData(hit,"Jezyk_Gry") or "PL"
		if plr_znajdzki["Znajdzki"][znajdzka_to_klucz[source]] then
			outputChatBox(language[jezyk]["PICKED"],hit,255,0,0)
			return 
		end
		plr_znajdzki["Znajdzki"][znajdzka_to_klucz[source]] = true
		plr_znajdzki["Ilosc_Znajdziek"] = plr_znajdzki["Ilosc_Znajdziek"] + 1
		local msg = string.format(language[jezyk]["PICKED_2"],plr_znajdzki["Ilosc_Znajdziek"]*10)
		outputChatBox(msg,hit,255,255,255,true)
		setElementData(hit,"PLR_Znajdzki",plr_znajdzki)
		triggerEvent("giveEXP", hit, plr_znajdzki["Ilosc_Znajdziek"] * 10) 
		triggerClientEvent(hit,"startDrawZnajdzka",resourceRoot,true,plr_znajdzki["Ilosc_Znajdziek"])
	end
end)

local min_lvl = 5

addEventHandler("onPlayerLogin",root,function(_,curr)
	local znajdzki = getAccountData(curr,"PLR_Znajdzki") or toJSON({["Znajdzki"] = {},["Ilosc_Znajdziek"] = 0})
	setElementData(source,"PLR_Znajdzki",fromJSON(znajdzki))
end)

addEventHandler("onPlayerQuit",root,function()
	if not getElementData(source,"logedin") then return end
	local znajdzki = getElementData(source,"PLR_Znajdzki") or {["Znajdzki"] = {},["Ilosc_Znajdziek"] = 0}
	setAccountData(getPlayerAccount(source),"PLR_Znajdzki",toJSON(znajdzki))
end)


local nagrody = {
	{1,"Map",1},
	{2,"GPS",1},
	{5,"Hunting Knife",1},
	{10,"Burger",1},
	{15,"Water Bottle",1},
	{20,"MAX_Slots",20},
}

function getAdditionalWeapons(player)
	local plr_znajdzki = getElementData(player,"PLR_Znajdzki") or {["Ilosc_Znajdziek"] = 20}
	if plr_znajdzki["Ilosc_Znajdziek"] < min_lvl then return end
	local nagroda = {}
	for i,v in pairs(nagrody) do
		if plr_znajdzki["Ilosc_Znajdziek"] >= v[1] then
			table.insert(nagroda,{v[2],v[3]})
		end
	end
	return nagroda;
end
