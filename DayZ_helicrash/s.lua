crash = {}
crash.pozycja = {
	["HELI"] = {
		{-306.169921875,1507.671875,75.359375},
		{-2117,-236,36},
		{-1022.359375,-645.2548828125,32.0078125},
		{997.712890625,232.9375,33.445373535156},
		{1942.69140625,-1318.6865234375,20.163866043091},
		{1589.078125,1580.78125,10.8203125},
		{2400,1876,6},
		{-2574,590,15},
		{2585,-1977,4},
	},
}

crash.czas = {
	heli = 90,
}

crash.itemy = {
	["HELI"] = {
		{"Bandage",5,10},
		{"Infrared Goggles",5,40},
		{"Morphine",5,10},
		{"Painkiller",5,10},
		{"Blood Bag",2,5},
		{"Tent",1,3},
		{"Burger",5,10},
		{"Water Bottle",5,10},
		{"Pasta Can",5,10},
		{"Soda Bottle",5,10},
		{"Medium Tent",1,1},
		{"Map",10,20},
		{"GPS",10,20},
		{"Watch",10,20},
		{"Box of Matches",10,20},
		{"Toolbox",1,5},
		{"CZ550",3,6},
		{"CZ550 Mag",5,8},
		{"Winchester 1866",6,12},
		{"1866 Slug",8,15},
		{"Hatchet",4,6},
		{"M1911",6,16},
		{"M1911 Mag",8,16},
		{"PDW",3,9},
		{"MP5A5",3,9},
		{"PDW Mag",6,12},
		{"MP5A5 Mag",6,12},
		{"M4A1-S",5,7},
		{"M4A1-S Mag",7,10},
		{"MG-34",5,7},
		{"MG-34 Mag",3,7},
		{"AK-47",7,10},
		{"AK-47 Mag",9,12},
		{"AWP",7,10},
		{"AWP Mag",9,12},
		{"Tire",1,5},
		{"Engine",1,3},
		{"Tank Parts",1,5},
		{"Full Gas Canister",2,5},
		{"Wire Fence",2,5},
		{"Sandbag",1,3},
		{"Rope",1,3},
		{"Lee Enfield",6,8},
		{"Lee Enfield Mag",6,8},
		{"Medic Kit",2,5},
		{"Assault Pack (ACU)",5,8},
		{"Bag",4,7},
		{"Alice Pack",3,6},
		{"Mountain Backpack",2,5},
		{"Czech Backpack",1,4},
		{"Coyote Backpack",0,2},
		
	},
	["Wagonik"] = {
		
	},
}


for i,v in pairs(crash.itemy['HELI']) do
	table.insert(crash.itemy['Wagonik'],{v[1],math.floor(v[2]*1.2),math.floor(v[3]*1.2)})
end

crash.elements = {
	heli = createElement('Helicrash'),
}


function math.percentChance(percent, repeatTime)
	local hits = 0;
	for i = 1, repeatTime do
		local number = math.random(0, 200)/2
		if (number <= percent) then hits = hits + 1; end
	end
	return hits;
end



function crash:createCrash(typ)
	if typ=="HELI" then
	if getPlayerCount() >= 1 then
		outputChatBox("#F39D09>>> Rozbił się helikopter wojskowy! Miejsce zostało oznaczone na mapie! <<<",root,255,255,255,true)
		exports.DayZ_Integracja:sendDiscordMessage("Rozbił się helikopter! helikopter zawiera sporą ilość przedmiotów!")
		local los = math.random(#crash.pozycja["HELI"])
		local crash_ = createObject ( 1882, crash.pozycja['HELI'][los][1],crash.pozycja['HELI'][los][2],crash.pozycja['HELI'][los][3])
		local col = ColShape.Sphere(Vector3(crash_:getPosition()),4)
		crash_:setData("parent",col)
		col:setData("parent",crash_)
		col:setParent(crash.elements.heli)
		crash_:setParent(crash.elements.heli)
		crash_:setFrozen(true)
--		crash_:setLocked(true)
		Blip.createAttachedTo(crash_,5):setParent(crash.elements.heli)
		col:setData("heli",true)
		col:setData("MAX_Slots",0)
		col:setData("ItemDoLutowania",0)
	--	crash_:setDamageProof(true)
		for i,v in pairs(crash.itemy[typ]) do
			local macz = math.random(v[2],v[3])
			col:setData(v[1],macz)
		end
		end
	end
end


crash:createCrash("HELI")


setTimer(function()
restartResource(getThisResource())
end,5400000,0)
