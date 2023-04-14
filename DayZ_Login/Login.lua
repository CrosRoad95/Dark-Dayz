local h1, h2, h3 = debug.gethook()
debug.sethook()

debug.sethook( _, h1, h2, h3 )

setElementID(resourceRoot,'DayZ_Login')

local spawnPositions = {};

local poz = {
	{-2248,2195,652},
	{-2241,2700,652},
	{-2748,2700,652},
	{-2748,2074,652},
}
--[[
for _,v in pairs(poz) do
	for i = 0, 4 do
		local ktore = 0
		for z = 0,4 do
			ktore = ktore + 1
			createBlip(v[1] + 1200 * i,v[2] - 1200 * z,v[3],46)
		end
		outputChatBox(ktore)
	end
end]]

local ktore = 0
for i = 0, 4 do
	for z = 0,4 do
		ktore = ktore + 1
		for _,v in pairs(poz) do 
			-- createBlip(v[1] + 1200 * i,v[2] - 1250 * z,v[3],46)
			if not spawnPositions[ktore] then
				spawnPositions[ktore] = {}
			end
			table.insert(spawnPositions[ktore],{v[1] + 1200 * i,v[2] - 1250 * z,v[3]})
		end
	end
end

local playerDataTable = {
	{"alivetime", 0},
	--{"alivetimetotal", 0},
	{"Custom_Slots",0},
	{"skin", 73},
	{"MAX_Slots", 8},
	{"htype", "Survivor"},
	{"blood", 12000},
	{"food", math.random(80, 100)},
	{"thirst", math.random(80, 100)},
	{"temperature", 37},
	{"currentweapon_1", ""},
	{"currentweapon_2", ""},
	{"currentweapon_3", ""},
	{"bleeding", 0},
	{"brokenbone", false},
	{"pain", false},
	{"cold", false},
	{"Small Armybox [D]",0},
	{"Small Armybox [B]",0},
	{"Large Armybox [D]",0},
	{"Large Armybox [B]",0},
	{"spawnedzombies", 0},
	{"humanity", 2500},
	{"zombieskilled", 0},
	{"Medium Tent",0},
	{"Large Tent",0},
	{"headshots", 0},
	{"murders", 0},
	{"murderstotal", 0},
	{"banditskilled", 0},
	{"Spray", 0},
	{"Spray \n", 0},
	{"radiochannel", "99999"},
	{"gpschannel", ""},
	{"Bandage", 2},
	{"Mission Bag", 0},
	{"Painkiller", 1},
	{"Wood Pile", 0},
	{"Water Bottle", 0},
	{"Pasta Can", 0},
	{"Beans Can", 0},
	{"Coca Cola",0},
	{"Kombinezon X",0},
	{"Kebab",0},
	{"Rope",0},
	{"Burger", 0},
	{"Metal",0},
	{"Lista Metalu",0},
	{"Weapon parts",0},
	{"Box of Matches", 0},
	{"PDW", 0},
	{"Hunting Knife", 0},
	{"Hatchet", 0},
	{"Pizza", 0},
	{"Morphine", 1},
	{"Soda Bottle", 0},
	{"Empty Gas Canister", 0},
	{"Full Gas Canister", 0},
	{"Roadflare", 0},
	{"Milk", 0},
	{"PDW Mag", 0},
	{"MP5A5 Mag", 0},
	--{"Tear Gas", 0},
--	{"Grenade", 0},
	{"Flara", 0},
	{"M1911", 0},
	{"M1911 Mag", 0},
	{"M9 SD", 0},
	{"M9 SD Mag", 0},
	{"Desert Eagle", 0},
	{"Desert Eagle Mag", 0},
	{"MP5A5", 0},
	{"Watch", 0},
	{"Medic Kit", 0},
	{"First Aid Kit",0},
	{"Medic Bag",0},
	{"Sandbag",0},
	{"Heat Pack", 0},
	{"Blood Bag", 0},
	{"GPS", 1},
	{"Military GPS", 0},
	{"Map",1},
	{"Trap",0},
	{"Toolbox", 0},
	{"Wire Fence", 0},
	{"Tire", 0},
	{"Engine", 0},
	{"Satchel", 0},
	{"Infrared Goggles", 0},
	{"Night Vision Goggles", 0},
	{"Tent", 0},
	{"Kontener",0},
	{"Bush",0},
	{"Safe",0},
	--{'Armybox small',0},
	{"Raw Meat", 0},
	{"Cooked Meat", 0},
	{"Camouflage Clothing", 0},
	{"Ghillie Suit", 0},
	{"Civilian Clothing", 0},
	{"Woman Clothing", 0},
	{"Survivor Clothing", 0},
	{"Reabel Clothing", 0},
	{"Military Clothing [F]", 0},
	{"Ghillie Suit [F]", 0},
	{"Diver Suit", 0},
	{"Binoculars", 0},
	{"Empty Water Bottle", 0},
	{"Empty Soda Cans", 0},
	{"Scruffy Burgers", 0},
	{"Radio Device", 0},
	{"Baseball Bat", 0},
	{"Shovel", 0},
	{"Tank Parts", 0},
	{"Harvest Scythe", 0},
	{"Harvest Scythe \n", 0},
	{"Radio Device", 0},
	{"Assault Pack (ACU)", 0},
	{"Alice Pack",0},
	{"Bag",0},
	{"Alice Pack",0},
	{"Mountain Backpack",0},
	{"Czech Backpack",0},
	{"Coyote Backpack",0},
	{"Military Backpack",0},
	{"M4A1-S", 0},
	{"M4A1", 0},
	{"G36C", 0},
	--{"MK 48 Mod 0", 0},
	{"M60", 0},
	{"PKP Pecheneg", 0},
	{"MG-34", 0},
	--{"PKP", 0},
	{"AK-47", 0},
	{"Scar-L",0},
	{"M16A4", 0},
	--{"SA-58V ACOG", 0},
	{"Winchester 1866", 0},
	{"SPAZ-12 Combat Shotgun", 0},
	{"Sawn-Off Shotgun", 0},
	--{"AKS-74U", 0},
	{"Lee Enfield", 0},
	--{"DMR", 0},
	{"Cheytac M200", 0},
	--{"AS50", 0},
	{"AWP", 0},
	--{"Mosin 9130", 0},
	--{"M24", 0},
	--{"M107", 0},
	--{"SVD Dragunov Camo", 0},
	--{"AKS-74U Mag", 0},
	{"1866 Slug", 0},
	{"2Rnd. Slug", 0},
	{"SPAZ-12 Pellet", 0},
	{"M4A1-S Mag", 0},
	{"G36C Mag", 0},
	--{"MK 48 Mod 0 Mag", 0},
	{"M60 Mag", 0},
	{"PKP Pecheneg Mag", 0},
	{"MG-34 Mag", 0},
	--{"PKP Mag", 0},
	{"AK-47 Mag", 0},
	{"Scar-L Mag",0},
	{"M16A4 Mag", 0},
	--{"SA-58V ACOG Mag", 0},
	--{"Kamizelka Taktyczna",0},
	--{"DMR Mag", 0},
	--{"AS50 Mag", 0},
	{"AWP Mag", 0},
	--{"Mosin 9130 Mag", 0},
	--{"M24 Mag", 0},
	--{"M107 Mag", 0},
	{"SVD Dragunov Mag", 0},
	{"SVD Dragunov", 0},
	{"SVD Dragunov \n", 0},
	--
	{"Barrett M107 Mag", 0},
	{"Barrett M107", 0},
	{"Barrett M107 \n", 0},
	{"AA-12 Mag", 0},
	{"AA-12", 0},
	{"AA-12 \n", 0},
	--{"SVD Dragunov Camo Mag", 0},
	{"Cheytac M200 Mag", 0},
	{"Lee Enfield Mag", 0},
	{"M4A1-S \n", 0},
	{"M4A1 \n", 0},
	{"G36C \n", 0},
	--{"MK 48 Mod 0 \n", 0},
	{"M60 \n", 0},
	{"PKP Pecheneg \n", 0},
	{"MG-34 \n", 0},
--	{"PKP \n", 0},
	{"AK-47 \n", 0},
	{"Scar-L \n",0},
	{"M16A4 \n", 0},
	--{"SA-58V ACOG \n", 0},
	{"Winchester 1866 \n", 0},
	{"SPAZ-12 Combat Shotgun \n", 0},
	{"Sawn-Off Shotgun \n", 0},
	--{"AKS-74U \n", 0},
	{"Lee Enfield \n", 0},
--	{"DMR \n", 0},
	{"Cheytac M200 \n", 0},
	--{"AS50 \n", 0},
	{"AWP \n", 0},
	--{"Kamizelka Taktyczna \n",0},
	--{"Mosin 9130 \n", 0},
	--{"M24 \n", 0},
	--{"M107 \n", 0},
	--{"SVD Dragunov Camo \n", 0},
	{"M1911 \n", 0},
	{"M9 SD \n", 0},
	{"PDW \n", 0},
	{"MP5A5 \n", 0},
	{"Desert Eagle \n", 0},
	{"Chainsaw",0},
	{"Chainsaw \n",0},
	{"Hunting Knife \n", 0},
	{"Hatchet \n", 0},
	{"Baseball Bat \n", 0},
	{"Shovel \n", 0},
	{"Golf Club \n", 0},
	{"Tear Gas \n", 0},
--	{"Grenade \n", 0},
	{"Flara \n",0},
	{"Parachute",0},
	{"Parachute \n",0},
	{"Binoculars \n", 0},
	--[[{"Spawn [Bobcat] [24H] [D]",0},
	{"Spawn [Bobcat] [168H] [D]",0},
	{"Spawn [Bobcat] [168H] [B]",0},
	{"Spawn [Bobcat] [672H] [B]",0},
	{"Spawn [Bobcat] [Forever] [B]",0},
	{"Spawn [Mesa] [24H] [D]",0},
	{"Spawn [Mesa] [168H] [D]",0},
	{"Spawn [Mesa] [168H] [B]",0},
	{"Spawn [Mesa] [672H] [B]",0},
	{"Spawn [Mesa] [Forever] [B]",0},
	{"Spawn [Police Maverick] [24H] [D]",0},
	{"Spawn [Police Maverick] [168H] [D]",0},
	{"Spawn [Police Maverick] [168H] [B]",0},
	{"Spawn [Police Maverick] [672H] [B]",0},
	{"Spawn [Police Maverick] [Forever] [B]",0},
	{"Spawn [Dodo] [24H] [D]",0},
	{"Spawn [Dodo] [168H] [B]",0},
	{"Spawn [Dodo] [672H] [B]",0},
	{"Spawn [Dodo] [Forever] [B]",0},
	{"Spawn [Sanchez] [24H] [D]",0},
	{"Spawn [Sanchez] [168H] [D]",0},
	{"Spawn [Sanchez] [168H] [B]",0},
	{"Spawn [Sanchez] [672H] [B]",0},
	{"Spawn [Sanchez] [Forever] [B]",0},
	{"Spawn [PCJ-600] [24H] [D]",0},
	{"Spawn [PCJ-600] [168H] [D]",0},
	{"Spawn [PCJ-600] [168H] [B]",0},
	{"Spawn [PCJ-600] [672H] [B]",0},
	{"Spawn [PCJ-600] [Forever] [B]",0},
	{"Spawn [FBI-Truck] [24H] [D]",0},
	{"Spawn [FBI-Truck] [168H] [D]",0},
	{"Spawn [FBI-Truck] [168H] [B]",0},
	{"Spawn [FBI-Truck] [672H] [B]",0},
	{"Spawn [FBI-Truck] [Forever] [B]",0},
	--{"Spawn [S.W.A.T.] [24H] [D]",0},
	--{"Spawn [S.W.A.T.] [168H] [D]",0},
	{"Spawn [S.W.A.T.] [168H] [B]",0},
	{"Spawn [S.W.A.T.] [672H] [B]",0},
	{"Spawn [S.W.A.T.] [Forever] [B]",0},
	{"Spawn [Bullet] [168H] [B]",0},
	{"Spawn [Bullet] [672H] [B]",0},
	{"Spawn [Bullet] [Forever] [B]",0},
	{"Spawn [Sandking] [24H] [D]",0},
	{"Spawn [Sandking] [168H] [B]",0},
	{"Spawn [Sandking] [672H] [B]",0},
	{"Spawn [Sandking] [Forever] [B]",0},
	{"Spawn [Turismo] [168H] [B]",0},
	{"Spawn [Turismo] [672H] [B]",0},
	{"Spawn [Turismo] [Forever] [B]",0},
	{"Spawn [Comet] [168H] [B]",0},
	{"Spawn [Comet] [672H] [B]",0},
	{"Spawn [Comet] [Forever] [B]",0},
	{"Spawn [Landstalker] [336H] [B]",0},]]
	{"Player-RES",false},
	{"Nearly-Dead",false},
	{"Podniesiony-Pause",false},
	{"Podniesiony-Pause",false},
	{"Armor",0},
	{"Armor-state",0},
	{"Glass",0},
	{"Bulletproof Glass",0},
	-- helmy
	{"current_helm",false},
	{"Helmet",0},
	{"Helmet [75%]",0},
	{"Helmet [50%]",0},
	{"Helmet [25%]",0},
	{"Mossy Helmet",0},
	{"Mossy Helmet [80%]",0},
	{"Mossy Helmet [60%]",0},
	{"Mossy Helmet [40%]",0},
	{"Mossy Helmet [20%]",0},
	{"Mossy Helmet [10%]",0},
	-- kamizelki
	{"current_kamizelka",false},
	{"Police Vest",0},
	{"Police Vest [75%]",0},
	{"Police Vest [50%]",0},
	{"Police Vest [25%]",0},
	{"Tactical Vest",0},
	{"Tactical Vest [80%]",0},
	{"Tactical Vest [60%]",0},
	{"Tactical Vest [40%]",0},
	{"Tactical Vest [20%]",0},
	{"Tactical Vest [10%]",0},
	{"Kontener",0},
	-- tlumik
	{"current_tlumik",false},
	{"Silencer",0},
	{"Wrench",0},
	-- karty kodowe
	{"Code card #1",0},
	{"Code card #2",0},
	{"Code card #3",0},
	{"Code card #4",0},
	{"Code card #5",0},
	{"Code card #6",0},
};

local TabelaMozliwosci = {
	["Spawn [Bobcat] [24H] [D]"]=false,
	["Spawn [Bobcat] [168H] [D]"]=false,
	["Spawn [Bobcat] [168H] [B]"]=true,
	["Spawn [Bobcat] [672H] [B]"]=true,
	["Spawn [Bobcat] [Forever] [B]"]=true,
	["Spawn [Mesa] [24H] [D]"]=false,
	["Spawn [Mesa] [168H] [D]"]=false,
	["Spawn [Mesa] [168H] [B]"]=true,
	["Spawn [Mesa] [672H] [B]"]=true,
	["Spawn [Mesa] [Forever] [B]"]=true,
	["Spawn [Police Maverick] [24H] [D]"]=false,
	["Spawn [Police Maverick] [168H] [D]"]=false,
	["Spawn [Police Maverick] [168H] [B]"]=true,
	["Spawn [Police Maverick] [672H] [B]"]=true,
	["Spawn [Police Maverick] [Forever] [B]"]=true,
	["Spawn [Dodo] [24H] [D]"]=false,
	["Spawn [Dodo] [168H] [B]"]=true,
	["Spawn [Dodo] [672H] [B]"]=true,
	["Spawn [Dodo] [Forever] [B]"]=true,
	["Spawn [Sanchez] [24H] [D]"]=false,
	["Spawn [Sanchez] [168H] [D]"]=false,
	["Spawn [Sanchez] [168H] [B]"]=true,
	["Spawn [Sanchez] [672H] [B]"]=true,
	["Spawn [Sanchez] [Forever] [B]"]=true,
	["Spawn [PCJ-600] [24H] [D]"]=false,
	["Spawn [PCJ-600] [168H] [D]"]=false,
	["Spawn [PCJ-600] [168H] [B]"]=true,
	["Spawn [PCJ-600] [672H] [B]"]=true,
	["Spawn [PCJ-600] [Forever] [B]"]=true,
	["Spawn [FBI-Truck] [24H] [D]"]=false,
	["Spawn [FBI-Truck] [168H] [D]"]=false,
	["Spawn [FBI-Truck] [168H] [B]"]=true,
	["Spawn [FBI-Truck] [672H] [B]"]=true,
	["Spawn [FBI-Truck] [Forever] [B]"]=true,
	["Spawn [S.W.A.T.] [168H] [B]"]=true,
	["Spawn [S.W.A.T.] [672H] [B]"]=true,
	["Spawn [S.W.A.T.] [Forever] [B]"]=true,
	["Spawn [Bullet] [168H] [B]"]=true,
	["Spawn [Bullet] [672H] [B]"]=true,
	["Spawn [Bullet] [Forever] [B]"]=true,
	["Spawn [Sandking] [24H] [D]"]=false,
	["Spawn [Sandking] [168H] [B]"]=true,
	["Spawn [Sandking] [672H] [B]"]=true,
	["Spawn [Sandking] [Forever] [B]"]=true,
	["Spawn [Turismo] [168H] [B]"]=true,
	["Spawn [Turismo] [672H] [B]"]=true,
	["Spawn [Turismo] [Forever] [B]"]=true,
	["Spawn [Comet] [168H] [B]"]=true,
	["Spawn [Comet] [672H] [B]"]=true,
	["Spawn [Comet] [Forever] [B]"]=true,
	["Spawn [Landstalker] [336H] [B]"]=true,
	["Small Armybox [B]"] = true,
	["Small Armybox [D]"] = false,
	["Large Armybox [B]"] = true,
	["Large Armybox [D]"] = false,
	--['alivetimetotal'] = true,
}

addEvent("onPlayerDayZRegister", true);
addEvent("onPlayerDayZLogin", true);
addEvent("kilLDayZPlayer", true);



addEventHandler("onPlayerDayZLogin", root, function(player)
	local account = getPlayerAccount(player);
	local x,y,z = getAccountData(account, "last_x"), getAccountData(account, "last_y"), getAccountData(account, "last_z") or 0,0,0;
	local skin = getAccountData(account, "skin");
	local kille=  getAccountData(account,'TotalMurders') or 0
	local dedy=  getAccountData(account,'TotalDeaths') or 0
	local tAlive = getAccountData(account,'alivetimetotal') or 0
	local tZombie = getAccountData(account,'TotalZombieKilled') or 0
	local tHeadshot = getAccountData(account,'TotalHeadshot') or 0
	local KDR = getAccountData(account, 'KDR') or 0;
	local fog = getAccountData(account, 'fog') or 0;
	local object = getAccountData(account, 'object') or 0;
	--setElementData(player,"UID",(getAccountData(account,"UID") or math.random(0,9999)))
	local chuj = getAccountData(account,"UID") or #getAccounts()
	setElementData(player,"UID",chuj)
	local plec = getAccountData(account,'Plec') or "MEN"
	setElementData(player,'Plec',plec)
	setElementData(player, 'KDR', KDR);
	setElementData(player,'alivetimetotal',tAlive)
	setElementData(player,'TotalHeadshot',tHeadshot)
	setElementData(player,'TotalMurders',kille)
	setElementData(player,'TotalDeaths',dedy)
	setElementData(player,'TotalZombieKilled',tZombie)
	setElementData(player, 'player:renderFog', fog);
	setElementData(player, 'player:renderObject', object);
	if isObjectInACLGroup("user."..getElementData(player,"logedin"),aclGetGroup("Admin")) then -- rivek
		setElementData(player,"Ryjek",true)
		setElementData(player,"mawidziec",true)
	end
	if isObjectInACLGroup("user."..getElementData(player,"logedin"),aclGetGroup("Pomocnik2")) then  -- goku
		setElementData(player,'GodMode',true)
		setElementData(player,"Ryjek",true)
		setElementData(player,"gokupomocnik",true)
	end
	if getAccountData(account, "isDead") then
		createMapToSelect(player);
		return 
	end
	spawnPlayer(player, x, y, z, math.random(360), skin, 0, 0);
	fadeCamera(player, true);
	setCameraTarget(player, player);
	local playerCol = createColSphere(x, y, z, 1.5);
	setElementData(player, "playerCol", playerCol);
	attachElements(playerCol, player, 0, 0, 0);
	setElementData(playerCol, "parent", player);
	setElementData(playerCol, "player", true);
	local itemy = getAccountData(account,'Itemy')
	if not itemy then
		spawnDayZPlayer(player,1)
		return
	end
	for i,v in pairs(fromJSON(itemy)) do
		setElementData(player,v[1],v[2])
	end
	--for _,v in ipairs(playerDataTable) do
--		setElementData(player, v[1], getAccountData(account, v[1]));
	--end
	setElementData(player, "logedin", getAccountName(account));
	setElementModel(player, getElementData(player, "skin"));
	setTimer(checkBuggedAccont, (25*1000), 1, player);
	setElementData(player, "spawnedzombies", 0);
	exports['DayZ_core']:equipThem(player, 0);
end);

addEventHandler("onPlayerDayZRegister", getRootElement(), function(player)
	local plec = getAccountData(getPlayerAccount(player),'Plec') or "MEN"
	setAccountData(getPlayerAccount(player),"UID",#getAccounts())
	setElementData(player,"UID",#getAccounts())
	setElementData(player,'Plec',plec)
	createMapToSelect(player);
	setElementData(player, "radiochannel", "99999");
	setElementData(player, "gpschannel",false);
	setElementData(player, "gang",nil);
	setElementData(player,'TotalZombieKilled',0)
	savePlayerData(player);
	setElementData(player,'TotalMurders',0)
	setElementData(player,'TotalHeadshot',0)
	setElementData(player,'TotalDeaths',0)
	setElementData(player, 'TotalHeadshot', 0);
	setElementData(player, 'KDR', 0);
	setElementData(player,'alivetimetotal',0)
	setElementData(player, 'player:renderFog', 300);
	setElementData(player, 'player:renderObject', 1500);
end);

--[[addCommandHandler('duty',function(p)
if not getPlayerAccount ( p ) then return end
	local accName = getAccountName ( getPlayerAccount ( p ) ) -- get his account name
		if isObjectInACLGroup ("user."..accName, aclGetGroup ( "Admin" ) ) or isObjectInACLGroup ("user."..accName, aclGetGroup ( "Pomocnik" ) ) then
			if not getElementData(p, 'duty') then
				setElementData(p,'Administrator-Open',true)
				setElementData(p,'GodMode',true)
				setElementData(p,'skin',217)
				setElementData(p, 'duty', true, nil);
				setElementModel(p,217)
				outputChatBox("#d63838[!] #ffffffStatus twojej służby Administracyjnej: #32c732ON", p, 255, 255, 255, true)
				setElementData(p, "MAX_Slots", 3000)
			else
				outputChatBox("#d63838[!] #ffffffStatus twojej służby Administracyjnej: #c73e32OFF", p, 255, 255, 255, true)
				setElementData(p, 'duty', nil, nil);
				setElementData(p,'Administrator-Open',false)
				setElementData(p,'GodMode',false)
				setElementData(p, 'showAdmin', nil);
			end
		end
end)]]


function createMapToSelect(player)
	if not isElement(player) then return end
	triggerClientEvent(player,'PokazMape',resourceRoot)
end


randomresp = {
{-1223.2277832031,2650.779296875,61.923439025879},
{-1102.4284667969,2503.5942382812,90.451560974121},
{-1094.8254394531,2432.9946289062,88.04224395752},
{-1066.7509765625,2259.00390625,87.256301879883},
{-1182.0908203125,2224.4599609375,102.60809326172},
{-1238.732421875,2208.0686035156,102.21577453613},
{-1372.1767578125,2412.455078125,94.147064208984},
{-1308.9482421875,2541.0888671875,87.7421875},
{-1252.0390625,2609.498046875,89.958396911621},
{-1142.2741699219,2459.9389648438,121.67633056641},
{-1323.0302734375,2310.359375,127.8133392334},
{-1269.51953125,2293.875,132.77545166016},
{-1161.7939453125,2317.10546875,110.73261260986},
{-1253.5185546875,2481.8076171875,87.046875},
{-1326.3779296875,2618.0849609375,57.294410705566}
}

addEvent('Zresp',true)
addEventHandler('Zresp',resourceRoot,function(player,lokalizacja)
if getElementData(player, "event") == true then
setTimer(function()
	local rnd = math.random(1,#randomresp)
	setElementPosition( player, randomresp[rnd][1],randomresp[rnd][2],randomresp[rnd][3] )
	setElementDimension(player, 1)
	setCameraTarget(player, player);
		fadeCamera(player, true);
		setPedHeadless(player,false)
		setAccountData(getPlayerAccount(player), "isDead", false);
		
		setElementData(player, "isDead", false);
		if not getElementData(player,"logedin") then
			setElementData(player, "logedin", getAccountName(getPlayerAccount(player)));
		end
		for _,v in ipairs(playerDataTable) do
			if v[1] ~= "radiochannel" or v[1] ~= "gpschannel" or v[1] ~= "blood" then
				setElementData(player,v[1],v[2])
			elseif v[1] == "blood" then
				local max_blood = exports["DayZ_poziomy"]:getMaxHealth(player)
				setElementData(player,v[1],v[2] + max_blood)
			end
		end
		exports["DayZ_poziomy"]:getCosNaStart(player)
		giveWeapon(player,getWeaponIDFromName('Parachute'),1)
		setElementData(player, "spawnedzombies", 0);
		setElementData(player, "M4A1-S", 1)
		setElementData(player, "M4A1-S Mag", 300)
		setElementData(player, "AWP Mag", 30)
		setElementData(player, "AWP", 1)
		setElementData(player, "Military Backpack", 1)
		setElementData(player, "Medic Kit", 2)
		setElementData(player, "Medic Bag", 2)
		setElementData(player, "Infrared Goggles", 1)
	end, 10, 1)
end
	spawnDayZPlayer(player,lokalizacja)
end)

function spawnDayZPlayer(player,lokalizacja)
	if player and isElement(player) then
		local x,y,z = unpack(spawnPositions[lokalizacja][math.random(#spawnPositions[lokalizacja])]);
		--if getElementData(player,'Plec')=="WOMAN" then
			--spawnPlayer(player, x, y, (z+0.5), math.random(360), 75, 0, 0);
		--else
			spawnPlayer(player, x, y, (z+0.5), math.random(360), 73, 0, 0);
		--end
		setCameraTarget(player, player);
		fadeCamera(player, true);
		local playerCol = createColSphere(x, y, z, 1.5);
		setElementData(player, "playerCol", playerCol);
		attachElements(playerCol, player, 0, 0, 0);
		setPedHeadless(player,false)
		setElementData(playerCol, "parent", player);
		setElementData(playerCol, "player", true);
		setAccountData(getPlayerAccount(player), "isDead", false);
		
		setElementData(player, "isDead", false);
		if not getElementData(player,"logedin") then
			setElementData(player, "logedin", getAccountName(getPlayerAccount(player)));
		end
		--setElementData(player, "logedin", true);
		for _,v in ipairs(playerDataTable) do
			if v[1] ~= "radiochannel" or v[1] ~= "gpschannel" or v[1] ~= "blood" then
				setElementData(player,v[1],v[2])
			elseif v[1] == "blood" then
				local max_blood = exports["DayZ_poziomy"]:getMaxHealth(player)
				setElementData(player,v[1],v[2] + max_blood)
			end
		end
		--[[if getElementData(player,'Plec')=="WOMAN" then
			setElementData(player,'blood',13000)
			setElementData(player,'skin',75)
		else
			setElementData(player,'blood',13000)
		end]]
		--[[local dodatnowe_bronie = exports["DayZ_znajdzki"]:getAdditionalWeapons(player)
		if dodatnowe_bronie then
			for i,v in pairs(dodatnowe_bronie) do
				setElementData(player,v[1],v[2])
			end
		end]]
		exports["DayZ_poziomy"]:getCosNaStart(player)
		giveWeapon(player,getWeaponIDFromName('Parachute'),1)
		--setElementData(player, "logedin", true);
		--setTimer(checkBuggedAccont, (25*1000), 1, player);
		setElementData(player, "spawnedzombies", 0);
	end
end


local blipo = {}

function rysujBlipDlaCzlonkow(player,gang,asdsadsad)
	for i,v in ipairs(getElementsByType('player')) do
		if gang and gang==getElementData(v,'gang') and getElementData(v,'gang')~="None" and v~=player then
		local blip =	createBlip(asdsadsad[1],asdsadsad[2],asdsadsad[3],62,_,_,_,_,_,_,300,v)
		blipo[blip] = setTimer(function(blip)
			destroyElement(blip)
		end,60000,1,blip)
		end
	end
end


function checkGrupa(p,kordy)
	if getElementData(p,"Grupa") then
		local blip = createBlip(kordy[1],kordy[2],kordy[3],45,1,2,2,2,255,0,300,resourceRoot)
		setElementData(blip,"Dead_blip_info",formatTime())
		for i,v in pairs(getElementsByType("player")) do
			if getElementData(v,"Grupa") and getElementData(v,"Grupa").nazwa == getElementData(p,"Grupa").nazwa then
				setElementVisibleTo(blip,v,true)
			end
		end
		setTimer(function(blip)
			destroyElement(blip)
		end,60000*3,1,blip)
	end
end

function formatTime()
	local czas = getRealTime()
	
	return czas.hour..":"..czas.minute
end

setElementData(resourceRoot,'kilLDayZPlayer',resourceRoot)

function round(num, idp) 
    return tonumber(string.format("%." .. (idp or 0) .. "f", num)) 
end 

addEventHandler("kilLDayZPlayer", root, function(player,killer, headshot, weapon,ground)
	local account = getPlayerAccount(player);
	if not account then
	kickPlayer(player,'Buggy Account')
	return; end	
	--triggerClientEvent(player,"ShowMeDeadRender",resourceRoot,false)
	if getElementData(player,"isDead") then return end
	if isPedInVehicle(player) then
		removePedFromVehicle(player)
	end
	if killer and killer~=player then
	triggerClientEvent(player, "onClientPlayerDeathInfo", player,killer);
	else
	triggerClientEvent(player, "onClientPlayerDeathInfo", player,false);
	end
	if killer and killer ~= player and getElementType(killer) == "player" then
	local sram = {getElementPosition(player)}
		local gowno = {getElementPosition(killer)}
	local distance = getDistanceBetweenPoints3D(sram[1],sram[2],sram[3],gowno[1],gowno[2],gowno[3])
	killPed(player,killer);
	else
	killPed(player);
	end
	triggerClientEvent(player, "hideInventoryManual", getElementData(getElementByID('DayZ_Inventory'),'hideInventoryManual'));
	if true then
		if (getElementData(player, "alivetime") or 0) >= 5 or ( getElementData(player,"currentweapon_1") ~= "" or getElementData(player,"currentweapon_2") ~= "" or getElementData(player,"currentweapon_3") ~= "" ) then -- If alivetime is bigger than 5 mins, to avoid haveing too much corpses at spawn.
			local x,y,z = getElementPosition(player);
			--outputChatBox(ground,root)
				local asdsadsad = {getElementPosition(player)}
				local gang = getElementData(player,'gang')
				if gang or gang~="None" then 
					--rysujBlipDlaCzlonkow(player,gang,asdsadsad)
				end
			setElementData(player,'TotalDeaths',(getElementData(player,'TotalDeaths') or 0)+1)
			setTimer(function()
				setElementData(player,'KDR', round(getElementData(player,'TotalMurders')/getElementData(player,'TotalDeaths'), 2));
			end, 300, 1);
			
			if (getDistanceBetweenPoints3D(x, y, z, 6000, 6000, 0) > 200) then
				local x,y,z = getElementPosition(player);
				checkGrupa(player,{x,y,z})
				local _,_,rotz = getElementRotation(player);
				setTimer(setElementPosition, 50, 1, player, 6000, 6000, 0);
				local skin = getElementModel(player);
				local ped = createPed(skin, x, y, z, rotz);
				local pedCol = createColSphere(x, y, z, 1.5);
				if headshot then
					setPedHeadless(player,true)
					setPedHeadless(ped,true)
				end
				attachElements(pedCol,ped);
				killPed(ped);
				setTimer(function(ped, pedCol)
					local x,y,z = getElementPosition(ped)
					triggerEvent("spawnZombieZdalnie",root,x,y,z)
					if isElement(ped) then destroyElement(ped); end
					if isElement(pedCol) then destroyElement(pedCol); end
				end, (10*60000), 1, ped, pedCol);
				
				--attachElements(ped, pedCol)
				setElementData(pedCol, "parent", ped);
				setElementData(pedCol, "playername", getPlayerName(player));
				setElementData(pedCol, "deadman", true);
				setElementData(pedCol, "MAX_Slots", getElementData(player, "MAX_Slots"));
				local time = getRealTime();
				setElementData(pedCol, "deadreason", getPlayerName(player):gsub("#%x%x%x%x%x%x","").." jest martwy. Przyczyną śmierci: "..(weapon or "Unknown")..". Czas zgonu: "..time.hour..":"..time.minute..".");
				if pedCol then
					for _,v in ipairs(playerDataTable) do
					if TabelaMozliwosci[v[1]] and (getElementData(player,v[1]) or 0)>=1 then
					
					else
						local itemPlus = getElementData(player, v[1]);
						if (v[1] == "M1911 Mag") then itemPlus = math.floor(getElementData(player, v[1])/17);
						elseif (v[1] == "M9 SD Mag") then itemPlus = math.floor(getElementData(player, v[1])/15);
						elseif (v[1] == "Desert Eagle Mag") then itemPlus = math.floor(getElementData(player, v[1])/7);
						elseif (v[1] == "PDW Mag") then itemPlus = math.floor(getElementData(player, v[1])/30);
						elseif (v[1] == "MP5A5 Mag") then itemPlus =  math.floor(getElementData(player, v[1])/20);
						elseif (v[1] == "AK-47 Mag") then itemPlus = math.floor(getElementData(player, v[1])/30);
						elseif (v[1] == "M4A1-S Mag") then itemPlus = math.floor(getElementData(player, v[1])/30);
						elseif (v[1] == "G36C Mag") then itemPlus = math.floor(getElementData(player, v[1])/30);
						elseif (v[1] == "Scar-L Mag") then itemPlus = math.floor(getElementData(player, v[1])/30);
						elseif (v[1] == "AWP Mag") then itemPlus = math.floor(getElementData(player, v[1])/5);
						elseif (v[1] == "SVD Dragunov Mag") then itemPlus = math.floor((getElementData(player, v[1]) or 0)/10);
						elseif (v[1] == "AA-12 Mag") then itemPlus = math.floor((getElementData(player, v[1]) or 0)/20);
						elseif (v[1] == "1866 Slug") then itemPlus = math.floor(getElementData(player, v[1])/7);
						elseif (v[1] == "2Rnd. Slug") then itemPlus = math.floor(getElementData(player, v[1])/2);
						elseif (v[1] == "SPAZ-12 Pellet") then itemPlus = math.floor(getElementData(player, v[1])/7);
						elseif (v[1] == "PKP Pecheneg Mag") then itemPlus = math.floor(getElementData(player, v[1])/100);
						elseif (v[1] == "MG-34 Mag") then itemPlus = math.floor(getElementData(player, v[1])/100);
						elseif (v[1] == "Lee Enfield Mag") then itemPlus = math.floor(getElementData(player, v[1])/10);
						end 
						if not string.find(v[1], " \n") and v[1] ~= "Mission Bag" then
							setElementData(pedCol, v[1], itemPlus);
						end
					end
				end
				end
					if getElementData(player,'MAX_Slots')>9 then
					local backpack = exports['DayZ_core']:getBackpackNameFromSlots(getElementData(player, "MAX_Slots"));
					if backpack then
					setElementData(pedCol, backpack, (getElementData(pedCol, backpack) or 0) + 1);
					end
					end
					for i = 1, 3 do
						local item = getElementData(player, "currentweapon_"..tostring(i));
						if (item ~= "") then
							setElementData(pedCol, item, (getElementData(pedCol,item) or 0)+1);
						end
					end
					--[[if getElementData(player,"current_kamizelka") and getElementData(player,"current_kamizelka")[1] then
						setElementData(pedCol,getElementData(player,"current_kamizelka")[2],(getElementData(pedCol,getElementData(player,"current_kamizelka")[2]) or 0) + 1)
					end
					if getElementData(player,"current_helm") and getElementData(player,"current_helm")[1] then
						setElementData(pedCol,getElementData(player,"current_helm")[2],(getElementData(pedCol,getElementData(player,"current_helm")[2]) or 0) + 1)
					end]]
				end
			end
		end
	if (killer and killer ~= player and getElementType(killer) == "player") then
		if isPedInVehicle(player) then
			removePedFromVehicle(player)
			end

		if (getElementData(player, "htype") ~= "Bandit") then
			exports['DayZ_core']:addPlayerStats(killer, "humanity", math.random(-2500, -1000));
		else
			exports['DayZ_core']:addPlayerStats(killer, "humanity", math.random(1000, 2500));
		end
		setElementData(killer, "murders", getElementData(killer, "murders") + 1);
		triggerEvent("ShowKillInformation",root,killer,player)
		setElementData(killer,'TotalMurders',(getElementData(killer,'TotalMurders') or 0)+1)
		setTimer(function()
			setElementData(killer,'KDR', round(getElementData(killer,'TotalMurders')/getElementData(killer,'TotalDeaths'), 2));
		end, 300, 1);
		if (getElementData(player, "htype") == "Bandit") then
			setElementData(killer, "banditskilled", getElementData(killer, "banditskilled") + 1);
		end
		if headshot then
			setElementData(killer, "headshots", getElementData(killer, "headshots") + 1);
			setElementData(killer, "TotalHeadshot", (getElementData(killer, "TotalHeadshot") or 0) + 1);
		else
		--	triggerClientEvent(killer,'GrajKillSound',killer,killer)
		end
		local sram = {getElementPosition(player)}
		local gowno = {getElementPosition(killer)}
		local distance = getDistanceBetweenPoints3D(sram[1],sram[2],sram[3],gowno[1],gowno[2],gowno[3])
		local gracz_1 = getPlayerName(player):gsub("#%x%x%x%x%x%x","")
		local gracz_2 = getPlayerName(killer):gsub("#%x%x%x%x%x%x","")
		triggerClientEvent("displayClientInfo", root, gracz_1.." został zabity przez "..gracz_2.." ("..tostring(math.floor(distance)).."m)", 255, 255, 255);
		--outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] "..getPlayerName(player):gsub("#%x%x%x%x%x%x","").." został zabity od gracza "..getPlayerName(killer):gsub("#%x%x%x%x%x%x","").." ("..tostring(math.floor(distance)).."m)",root,255,255,255,true)
		exports.DayZ_Integracja:sendDiscordMessage(getPlayerName(player):gsub("#%x%x%x%x%x%x","").." został zabity od gracza "..getPlayerName(killer):gsub("#%x%x%x%x%x%x","").." ("..tostring(math.floor(distance)).."m)")
		local los = math.random(3,5)
		outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] Za zabicie gracza "..getPlayerName(player):gsub("#%x%x%x%x%x%x","").." otrzymujesz: "..los.." GP!",killer,255,255,255,true)
		setElementData(killer,"GP",(getElementData(killer,"GP") or 0) + los)
		--givePlayerMoney(killer,los)
		exports.DayZ_mission:addMissionProgress(killer, "kill_players")
	elseif (killer and killer ~= player and getElementType(killer) == "ped") then
	else
		if (getElementData(player,'alivetime') or 0)>5 then
			local gracz_1 = getPlayerName(player):gsub("#%x%x%x%x%x%x","")
			triggerClientEvent("displayClientInfo", root, gracz_1.." nie żyje", 255, 255, 255);
		-- outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] "..getPlayerName(player):gsub("#%x%x%x%x%x%x","").." zginął",root,255,255,255,true)
		end
	end
	if isPedInVehicle(player) then
			removePedFromVehicle(player)
			end
	local plrcol=getElementData(player, "playerCol")
  if(isElement(plrcol))then
	destroyElement(plrcol)
  end 
	setTimer(function(gracz)
	if not isElement(gracz) then return end
	setElementPosition(gracz, 6000, 6000, 0)
	end,2000,1,player);
	
	setAccountData(account, "isDead", true);
	setElementData(player, "isDead", true);
	setTimer(createMapToSelect, 5000, 1, player);
end);

addEventHandler("onPlayerQuit", root, function()
local account = getPlayerAccount(source)
    savePlayerData(source)
    local plrcol=getAccountData(account, "playerCol")
  if(isElement(plrcol))then
    destroyElement(plrcol)
	zapisy = 0
  end 
end);


for _,v in pairs(getElementsByType('player')) do
	setPlayerNametagShowing(v, false);
end

addEventHandler('onPlayerJoin',root,function()
	setPlayerNametagShowing(source, false);
end)

function savePlayerData(player)
	local account = getPlayerAccount(player)
	local account2 = getAccountName(account)
	if account then
		local itemy = {}
		for _,v in ipairs(playerDataTable) do
			--setAccountData(account, v[1], getElementData(player, v[1]));
			table.insert(itemy,{v[1],getElementData(player, v[1])})
		end
		setAccountData(account,'Itemy',toJSON(itemy))
		local x,y,z = getElementPosition(player);
		local kille = getElementData(player,'TotalMurders') or 0
		local dedy = getElementData(player,'TotalDeaths') or 0
		local totalalivetime = getElementData(player,'alivetimetotal') or 0
		local totalkilledz = getElementData(player,'TotalZombieKilled') or 0
		local skin = getElementData(player,'skin') or getElementModel(player)
		local KDR = getElementData(player, 'KDR');
		local hs = getElementData(player, 'TotalHeadshot');
		local fog = getElementData(player, 'player:renderFog');
		local object = getElementData(player, 'player:renderObject');
		local gp = getElementData(player, 'GP')
		local pp = getElementData(player, 'PP')
		local lvl = getElementData(player, 'LVL')
		exports["db-mysql"]:dbSet("UPDATE Konta SET kille=?, zgony=?, headshoty=?, kdr=?, alivetime=?, gp=?, pp=?, lvl=?, totalzombie=? WHERE login=?",kille,dedy,hs,KDR,totalalivetime,gp,pp,lvl,totalkilledz,account2)
		setAccountData(account, 'KDR', KDR);
		setAccountData(account,'TotalMurders',kille)
		setAccountData(account,'TotalDeaths',dedy)
		setAccountData(account, 'TotalHeadshot', hs);
		setAccountData(account,'alivetimetotal',totalalivetime)
		setAccountData(account,'TotalZombieKilled',totalkilledz)
		setAccountData(account,'skin',skin)
		setAccountData(account, "last_x", x);
		setAccountData(account, "last_y", y);
		setAccountData(account, "last_z", z);
		setAccountData(account, 'fog', fog);
		setAccountData(account, 'object', object);
		if getElementData(player,'Anty-Relog') or getElementData(player,"Nearly-Dead") then
			setAccountData(account, "isDead",true);
		end
	end
end

function checkBuggedAccont(player)
end

addCommandHandler("kill", function(player)
	triggerEvent("kilLDayZPlayer",resourceRoot,player);
end);


	--{"Player-RES",false},
	--{"Nearly-Dead",false},

function wczyt()
	if isObjectInACLGroup("user.RivEk",aclGetGroup("Admin")) then 
		for i,v in pairs(getAccounts()) do 
			local konto = getAccountName(v)
			local kille = getAccountData(v, "TotalMurders")
			local dedy = getAccountData(v, "TotalDeaths")
			local hs = getAccountData(v, "TotalHeadshot")
			local tot = getAccountData(v, "alivetimetotal")
			local pass = getAccountData(v, "Password")
			local kdr = getAccountData(v, "KDR")
			local gp = getAccountData(v, "GP")
			local pp = getAccountData(v, "PP")
			local lvl = getAccountData(v, "LVL")
			local zombie = getAccountData(v, "TotalZombieKilled")
			exports["db-mysql"]:dbSet("INSERT INTO Konta (login,haslo,kille,zgony,headshoty,kdr,alivetime,gp,pp,lvl,totalzombie) VALUES (?,?,?,?,?,?,?,?,?,?,?)", konto,md5(pass),kille,dedy,hs,kdr,tot,gp,pp,lvl,zombie)
		end
	end
end
addCommandHandler("wczyt",wczyt)

function startDeadPlayer()
	setElementData(source,"blood",3000)
	setPedAnimation(source,"SWEET","Sweet_injuredloop",-1,true, false, false, false)
	setElementData(source,"Nearly-Dead",true)
	--triggerClientEvent(source,"ShowMeDeadRender",resourceRoot,true)
end
addEvent("startLastPlayerChance",true)
addEventHandler("startLastPlayerChance",root,startDeadPlayer)

