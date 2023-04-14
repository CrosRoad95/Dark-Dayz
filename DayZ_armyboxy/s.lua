

local db = dbConnect("sqlite","Armyboxy.db")
if db then
	--outputChatBox("* Pomyślnie połączono z armyboxami!",root,0,255,0)
	dbExec(db,"CREATE TABLE IF NOT EXISTS `Armybox` (`UID` INT NOT NULL , `End_time` INT NOT NULL ,typ,kordy,baza, wlasciciel, przedmioty, PRIMARY KEY (`UID`))");
end

local armyboxy = {
	["Militarny"] = {
		{"M4A1-S",{1,3}},
		{"G36C",{1,3}},
		{"AK-47",{2,4}},
		{"PKP Pepcheneg",{1,2}},
		{"AWP",{1,2}},
	},
	["Medyczny"] = {
		{"Medic kit",{3,5}},
		{"Morphine",{3,5}},
		{"Bandage",{5,7}},
		{"Painkiller",{5,5}},
		{"First Aid Kit",{5,5}},
		{"Medic Bag",{1,3}},
	
	},
	["Produkty"] = {
		{"Tire",{1,4}},
		{"Engine",{1,4}},
		{"Tank Parts",{1,4}},
		{"Glass",{0,2}},
		{"Full Gas Canister",{1,2}},
	},
}

local language = {
	["PL"] = {
		["Bought"] = "#FFDA21* Zakupiono: %s | Aby postawić armyboxa wpisz: /armybox.postaw [Militarny/Medyczny/Produkty]",
		["No pp"] = "#FF0000* Posiadasz niewystarczająco ilość PP",
	},
	['ENG'] = {
		["Bought"] = "#FFDA21* Purchased: %s | To put the army boxa Introduce: /armybox.postaw [Militarny/Medyczny/Produkty]",
		["No pp"] = "#FF0000* Not enought PP",
	},
}


function buyArmybox(typ,cost)
	local jezyk = getElementData(source,"Jezyk_Gry") or "PL"
	if getElementData(source,"PP") >= cost then
		local armyboxy = getElementData(source,"Armyboxy") or {["Militarny"] = 0, ["Medyczny"] = 0, ["Produkty"] = 0}
		armyboxy[typ] = armyboxy[typ] + 1
		setElementData(source,"PP",(getElementData(source,"PP") or 0) - cost)
		local msg = string.format(language[jezyk]["Bought"],"Armybox "..typ)
		outputChatBox(msg,source,255,255,255,true)
		setElementData(source,"Armyboxy",armyboxy)
	else
		outputChatBox(language[jezyk]["No pp"],source,255,0,0,true)
	end
end
addEvent("BuyArmybox",true)
addEventHandler("BuyArmybox",root,buyArmybox)


local weaponAmmoTable = {
	["M1911"] = {"M1911 Mag",22},
	["M9 SD"] = {"M9 SD Mag",23},
	["PDW"] = {"PDW Mag",28},
	["MP5A5"] = {"MP5A5 Mag",29},
	["AK-47"] = {"AK-47 Mag",31},
	["PKP Pecheneg"] = {"PKP Pecheneg Mag",30},
	["MG-34"] = {"MG-34 Mag",30},
	["M4A1-S"] = {"M4A1-S Mag",31},
	["G36C"] = {"G36C Mag",31},
	["Winchester 1866"] = {"1866 Slug",25},
	["Sawn-Off Shotgun"] = {"2Rnd. Slug",26},
	["SPAZ-12 Combat Shotgun"] = {"SPAZ-12 Pellet",27},
	["AWP"] = {"AWP Mag",34},
	["Lee Enfield"] = {"Lee Enfield Mag",33},
};

function getWeaponAmmoType(weaponName)
	if weaponAmmoTable[weaponName] then
		return weaponAmmoTable[weaponName][1]
	end
	return false
end

local typy = {
	["Militarny"] = function(player,kordy,uid,przedmioty,dni)
		local changed = 0
		local x, y, z
		if not isElement(player) then
			player = createElement("Gracz-"..(math.random(0,1000)))
			setElementPosition(player,kordy[1],kordy[2],kordy[3])
			changed = 1
			x,y,z = getElementPosition(player)
		else
			x, y, z = unpack(kordy)
		end
		
		local object = createObject(964,x,y,z - 0.95)
		local col = createColSphere(x,y,z,2)
		setElementData(col,"itemloot",true)
		setElementData(col,"lootname","Armybox")
		--setElementData(col,"ItemDoLutowania",true)
		setElementData(col,"Armybox-Typ","Militarny")
		setElementData(col,"Armybox-UID",tonumber(uid))
		setElementData(col,"Armybox-dni",dni)
		setElementData(col,"parent",object)
		setElementData(object,"parent",col)
		attachElements(col,object)
		if przedmioty then
			przedmioty = fromJSON(przedmioty) or {}
			for i,v in pairs(przedmioty) do
				setElementData(col,v[1],v[2])
			end
		end
		restartArmybox(col,"Militarny")
		if changed == 1 then
			destroyElement(player)
		end
		return col
	end,
	["Medyczny"] = function(player,kordy,uid,przedmioty,dni)
		local changed = 0
		local x, y, z
		if not isElement(player) then
			player = createElement("Gracz-"..(math.random(0,1000)))
			setElementPosition(player,kordy[1],kordy[2],kordy[3])
			changed = 1
			x,y,z = getElementPosition(player)
		else
			x, y, z = unpack(kordy)
		end
		local object = createObject(964, x, y, z - 0.95)
		local col = createColSphere(x, y, z, 2)
		setElementData(col,"itemloot",true)
		setElementData(col,"lootname","Armybox")
		--setElementData(col,"ItemDoLutowania",true)
		setElementData(col,"Armybox-Typ","Medyczny")
		setElementData(col,"Armybox-UID",tonumber(uid))
		setElementData(col,"Armybox-dni",dni)
		setElementData(col,"parent",object)
		setElementData(object,"parent",col)
		attachElements(col,object)
		if przedmioty then
			przedmioty = fromJSON(przedmioty) or {}
			for i,v in pairs(przedmioty) do
				setElementData(col,v[1],v[2])
			end
		end
		restartArmybox(col,"Medyczny")
		if changed == 1 then
			destroyElement(player)
		end
		return col
	end,
	["Produkty"] = function(player,kordy,uid,przedmioty,dni)
		local changed = 0
		local x, y, z
		if not isElement(player) then
			player = createElement("Gracz-"..(math.random(0,1000)))
			setElementPosition(player,kordy[1],kordy[2],kordy[3])
			changed = 1
			x,y,z = getElementPosition(player)
		else
			x, y, z = unpack(kordy)
		end
		local object = createObject(964,x,y,z - 0.95)
		local col = createColSphere(x,y,z,2)
		setElementData(col,"itemloot",true)
		setElementData(col,"lootname","Armybox")
		--setElementData(col,"ItemDoLutowania",true)
		setElementData(col,"Armybox-Typ","Produkty")
		setElementData(col,"Armybox-dni",dni)
		setElementData(col,"Armybox-UID",tonumber(uid))
		setElementData(col,"parent",object)
		setElementData(object,"parent",col)
		attachElements(col,object)
		if przedmioty then
			przedmioty = fromJSON(przedmioty) or {}
			for i,v in pairs(przedmioty) do
				setElementData(col,v[1],v[2])
			end
		end
		restartArmybox(col,"Produkty")
		if changed == 1 then
			destroyElement(player)
		end
		return col
	end,
}

function getAllItems(col)
	local tablica = {}
	local itemy = exports.DayZ_core:getItemTable()
	for i,v in pairs(itemy) do
		if (getElementData(col,v[1]) or 0) > 0 then
			table.insert(tablica,{v[1],getElementData(col,v[1])})
		end
	end
	return tablica
end

function restartArmybox(col,typ)
	for i,v in pairs(armyboxy[typ]) do 
		local data = getElementData(col,v[1]) or 0
		if data < 30 then
			local added_value = math.random(v[2][1],v[2][2])
			setElementData(col,v[1],data + added_value)
			local ammo = getWeaponAmmoType(v[1])
			if ammo then
				setElementData(col,ammo,(getElementData(col,ammo) or 0) + added_value)
			end
			local przedmioty = getAllItems(col)
			dbExec(db,"UPDATE `Armybox` SET `przedmioty` = ? WHERE UID = ?",toJSON(przedmioty),getElementData(col,"Armybox-UID"))
		end
	end
end


addEvent("ZrestartujItemy")
addEventHandler("ZrestartujItemy",root,function()
	for i,v in pairs(getElementsByType("colshape",resourceRoot)) do
		restartArmybox(v,getElementData(v,"Armybox-Typ"))
	end
end)

function policz_armyBoxes()
	local file = xmlLoadFile("meta.xml")
	local c = tonumber(xmlNodeGetAttribute(file,"uid-last")) + 1
	xmlNodeSetAttribute(file,"uid-last",c)
	xmlSaveFile(file)
	xmlUnloadFile(file)
	return c
end

function createArmybox(player,typ,kordy,grupa1,przedmioty,dni)
	if player and not getElementData(player,"Moze-Otwierac") then 
		outputChatBox("* Armyboxa możesz postawić tylko i wyłącznie w bazie! Upewnij się że masz dostęp do namiotów",player,255,0,0)
		return false
	end
	local ilosc_armyboxow = policz_armyBoxes()
	local do_func = typy[typ](player,kordy,ilosc_armyboxow + 1,przedmioty,dni);
	if grupa1 then
		setElementData(do_func,"Tent-Otwieranie",grupa1)
	end
	if do_func and isElement(player) then
		local cuboid,grupa = unpack(getElementData(player,'Moze-Otwierac'))
		setElementData(do_func,'Tent-Otwieranie',grupa)
		dbExec(db,"INSERT INTO `Armybox` VALUES(?,?,?,?,?,?,?)",ilosc_armyboxow + 1, 30,typ,grupa,toJSON(kordy),"UID: "..getElementData(player,"UID").. " | Login: "..getElementData(player,"logedin"),{})
		local armyboxy = getElementData(player,"Armyboxy") or {["Militarny"] = 0, ["Medyczny"] = 0, ["Produkty"] = 0}
		setElementData(do_func,"Armybox-dni",30)
		armyboxy[typ] = armyboxy[typ] - 1
		setElementData(player,"Armyboxy",armyboxy)
		triggerClientEvent(client, "stworz_notyfikacje", client, "sucess", "Pomyślnie stworzono armyboxa!")
	end
end

print("Armyboxów: "..policz_armyBoxes())

if db then
	local query = dbQuery(db,"SELECT * FROM `Armybox`")
	local paul = dbPoll(query,-1)
	dbFree(query)
	for i,v in pairs(paul) do
		createArmybox(nil,v["typ"],fromJSON(v["baza"]),v["kordy"],v["przedmioty"],v["End_time"])
	end
end

function destroyArmybox(uid)
	for i,v in pairs(getElementsByType("colshape",resourceRoot)) do
		if uid == getElementData(v,"Armybox-UID") then
			destroyElement(getElementData(v,"parent"))
			destroyElement(v)
		end
	end
end

function postawArmybox(typ, kordy)
	local armyboxy = getElementData(client,"Armyboxy") or {["Militarny"] = 0, ["Medyczny"] = 0, ["Produkty"] = 0}
	if armyboxy[typ] and armyboxy[typ] >= 1 then
		if getElementDimension(client) > 0 then
			triggerClientEvent(client, "stworz_notyfikacje", client, "error", "W greenzonie nie możesz rozstawiać armyboxów!")
			return
		end
		kordy[3] = kordy[3] + 0.95
		createArmybox(client, typ, kordy)
	end
end
addEvent("postawArmybox", true)
addEventHandler("postawArmybox", root, postawArmybox)

addCommandHandler("armybox.info",function(player)
	local armyboxy = getElementData(player,"Armyboxy") or {["Militarny"] = 0, ["Medyczny"] = 0, ["Produkty"] = 0}
	for k,v in pairs(armyboxy) do
		outputChatBox("#FFDA21* "..k.." : "..v,player,255,255,255,true)
	end
end)

local bylo_odjete = false

function odejmijCos()
	local time = getRealTime().hour
	if time == 0 and not bylo_odjete then
		bylo_odjete = true
		local query = dbQuery(db,"SELECT * FROM `Armybox`")
		local pool = dbPoll(query,-1)
		dbFree(query)
		if #pool > 0 then
			for i,v in pairs(pool) do
				local czas = v['End_time']
				if czas - 1 <= 0 then
					
					dbExec(db,"DELETE FROM `Armybox` Where UID=?",v['UID'])
				else
					dbExec(db,"UPDATE `Armybox` SET End_time=? Where UID =?",(czas - 1),v["UID"])
				end
			end
		end
		for i,v in pairs(getElementsByType("colshape", resourceRoot)) do
			local dni = getElementData(v, "Armybox-dni")
			if dni > 0 then 
				setElementData(v, "Armybox-dni", dni - 1)
			else
				destroyElement(getElementData(v,"parent"))
				destroyElement(v)
			end
		end
	elseif time ~= 0 and bylo_odjete then
		bylo_odjete = false
	end
end
setTimer(odejmijCos,60000,0)


addEventHandler("onPlayerLogin",root,function(_,curr)
	local armyboxy = getAccountData(curr,"Armyboxy") or toJSON({["Militarny"] = 0, ["Medyczny"] = 0, ["Produkty"] = 0})
	setElementData(source,"Armyboxy",fromJSON(armyboxy))
end)

addEventHandler("onPlayerQuit",root,function()
	if not getElementData(source,"logedin") then return end
	local acc = getPlayerAccount(source)
	local armyboxy = getElementData(source,"Armyboxy") or {["Militarny"] = 0, ["Medyczny"] = 0, ["Produkty"] = 0}
	setAccountData(acc,"Armyboxy",toJSON(armyboxy))
end)
