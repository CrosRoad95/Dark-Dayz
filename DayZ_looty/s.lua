function math.percentChance(percent, repeatTime)
	local hits = 0;
	for i = 1, repeatTime do
		local number = math.random(0, 10000)
		if (number <= percent) then hits = hits + 1; end
	end
	return hits;
end
local luty = 120
local lutowiska = createElement('lutowiska')

function getWeaponAmmoType(weaponName)
	--[[for _,v in ipairs(weaponAmmoTable["Weapons"]) do
		if (weaponName == v[2]) then return v[1], v[3]; end
	end
	for _,v in ipairs(weaponAmmoTable["others"]) do
		if (weaponName == v[1]) then return v[1], v[2]; end
	end]]
	--[[for i=1,#weaponAmmoTable["Weapons"] do
		if (weaponName == weaponAmmoTable["Weapons"][i][2]) then return weaponAmmoTable["Weapons"][i][1], weaponAmmoTable["Weapons"][i][3]; end
	end
	for i=1,#weaponAmmoTable["others"] do
		if (weaponName == weaponAmmoTable["others"][i][1]) then return weaponAmmoTable["others"][i][1], weaponAmmoTable["others"][i][2]; end
	end]]
	if weaponAmmoTable["Weapons"][weaponName] then
		return weaponAmmoTable["Weapons"][weaponName][1]
	end
end


function Class(tbl)
	setmetatable(tbl,{
		__call = function(cls, ...)
			local self = {}
			
			setmetatable(self,{
				__index = cls
			})
			self:constructor(...)
			return self
		end
	})
	return tbl
end

local LootTable = Class({
	constructor = function(self, name, szansa)
		self.setItemName(self, name)
		self.chance = szansa
		return self
	end;
	
	setItemName = function(self, name)
		self.name = name
	end;
	
	getItemName = function(self)
		return self.name
	end;
	
	getItemChange = function(self)
		return self.chance
	end;
})

local Loots_objects = {}

function sprawdzPozycje(x,y,zajeta_pozycja)
	local new_x = x + math.random(-1,1)
	local new_y = y + math.random(-1,1)
	if zajeta_pozycja[toJSON({new_x ,new_y})] then
		return sprawdzPozycje(x,y,zajeta_pozycja)
	else
		return new_x,new_y
	end
end


local zablokowane_odswiezanie = {}
local licznik_odswiezen = {}
local wyzalowane_piniondze = {}


local minus_z = {
	[1997] = 0.5,
	[2012] = 0.2,
	[2050] = 0.6,
	[2049] = 0.6,
}

function refreshItemLoot(col,place,itemy)
	local counter = 0;
	
	if zablokowane_odswiezanie[col] then wyzalowane_piniondze[col] = {place,itemy} return end
	place = place or "other"
	if getElementData(col,"lootname") == "Box" or getElementData(col,"lootname") == "Armybox" or getElementData(col,"lootname") == "Prywatny Namiot" then return end
	local obejctItem = {};
	local objects = Loots_objects[col]
	itemy = itemy or itemTable
	local itelator = #itemy[place] or #itemTable[place]
	if objects then
		for i = 1, 8 do
			if (isElement(objects[i])) then destroyElement(objects[i]); end
		end
	end
	for i=1,itelator do
		if (counter == 8) then break; end
		if  (getElementData(col, itemy[place][i][1]) or 0) > 0 then
			counter = counter + 1;
			local x,y,z = getElementPosition(col);
			if not item_to_dane[itemy[place][i][1]] then
				outputChatBox{item_to_dane[itemy[place][i][1]]}
			end
			local id,scale,rot = item_to_dane[itemy[place][i][1]][1],item_to_dane[itemy[place][i][1]][2],item_to_dane[itemy[place][i][1]][3]
			x,y =  x + math.random(-1,1), y + math.random(-1,1)
			if minus_z[id] then
				z = z - minus_z[id]
			end
			obejctItem[counter] = createObject(id, x + math.random(-5, 5) / 12, y + math.random(-5, 5) / 12, z-0.875,rot);
			setObjectScale(obejctItem[counter],scale);
			setElementCollisionsEnabled(obejctItem[counter], false);
			setElementFrozen(obejctItem[counter], true);
		end
	end
	if not licznik_odswiezen[col] then
		licznik_odswiezen[col] = 1
	elseif licznik_odswiezen[col] >= 10 then
		zablokowane_odswiezanie[col] = true
		licznik_odswiezen[col] = 0
		wyzalowane_piniondze[col] = {place,itemy}
		setTimer(function(col)
			zablokowane_odswiezanie[col] = nil
			refreshItemLoot(col,wyzalowane_piniondze[col][1],wyzalowane_piniondze[col][2])
		end,5000,1,col)
	else
		licznik_odswiezen[col] = licznik_odswiezen[col] + 1
	end
	--setElementData(col, "objectsINloot", {obejctItem[1], obejctItem[2], obejctItem[3],obejctItem[4], obejctItem[5], obejctItem[6]});
	Loots_objects[col] = obejctItem
end
addEventHandler("refreshItemLoot", root, refreshItemLoot);

setTimer(function()
	licznik_odswiezen = {}
end,10000,0)


local ilosc_broni = {
	['AWP'] = 0,
	['AK-47'] = 0,
	['M4A1-S'] = 0,
	['M4A1'] = 0,
	['G36C'] = 0,
	['PKP Pecheneg'] = 0,
	['MG-34'] = 0,
	['Silencer'] = 0,
	['AA-12'] = 0,
	--['Barrett M107'] = 0,
	['SVD Dragunov'] = 0,
	--[[['Code card #1'] = 0,
	['Code card #2'] = 0,
	['Code card #3'] = 0,
	['Code card #4'] = 0,]]
	
}



function getPercentForPlayers()
	local players = getPlayerCount()
	return players/80 * 1 --1/80 * 5
end

function createItemLoot(lootPlace, x, y, z)
local col = createColSphere(x, y, z, 1.25);
	if lootPlace == "Boxy" then
		local object = createObject(2912,x,y,z)
		setElementData(col,"lootname","Box")
		setElementFrozen(object,true)
	end
	setElementData(col, "itemloot", true);
	setElementData(col, "DayZ_Looty_Lootowisko", lootPlace,false);
	setElementData(col,'ItemDoLutowania',true)
	--setElementData(col, "parent", lootPlace);
	setElementData(col, "MAX_Slots", 0);
	local itemy = {}
	itemy[lootPlace] = {}
	for i=1,#itemTable[lootPlace] do
		local co = itemTable[lootPlace][i][6]
		if not co then
			co = math.random(1,2)
		end
		local przedmiot = LootTable(itemTable[lootPlace][i][1], itemTable[lootPlace][i][5])
		local value = przedmiot:getItemChange();
		if ilosc_broni[przedmiot.name] then
			value = math.percentChance(value * 100 + getPercentForPlayers(), co);
		else
			value = math.percentChance(value * 100, co);
		end
		if value>0 then
			if ilosc_broni[przedmiot.name] then
				ilosc_broni[przedmiot.name] = ilosc_broni[przedmiot.name] + 1
			end
			-- bronie_for_all[itemTable[lootPlace][i][1]] = (bronie_for_all[itemTable[lootPlace][i][1]] or 0) +1
			setElementData(col, przedmiot.name, (getElementData(col,przedmiot.name) or 0) + value);
			local ammoData = getWeaponAmmoType(przedmiot.name);
			if (ammoData) then
				--setElementData(col, ammoData,math.random(1,2))
				setElementData(col, ammoData, math.random(1,2));
				table.insert(itemy[lootPlace],{ammoData})
			end
			table.insert(itemy[lootPlace],{itemTable[lootPlace][i][1]})
		end
	end
	if lootPlace ~= "Boxy" then
		refreshItemLoot(col, lootPlace,itemy);
	end
end 

local itemy = {
	{"Military","military"},
	{"SuperMarket","supermarket"},
	{"Farm","farm"},
	{"Residential","residential"},
	{"Industrial","industrial"},
}

local item_cords = {}
local pierwszy = false
local point_lutowiska = {}
local ilosc_1 = 0
for k,z in pairs(pickupPositions) do
	for i,v in pairs(pickupPositions[k]) do
		--if not point_lutowiska[z[2]] then
		--	point_lutowiska[z[2]] = {}
		--end
		local pos = {v[1],v[2],v[3]}
		table.insert(point_lutowiska,{{pos[1],pos[2],pos[3]},k})
	end
	ilosc_1 = ilosc_1 + #pickupPositions[k]
end

local STEP=100

local coroutine_looty

col_shape_baz = nil


function stworzLooty()
	for i=1,#point_lutowiska do
		createItemLoot(point_lutowiska[i][2],point_lutowiska[i][1][1],point_lutowiska[i][1][2],point_lutowiska[i][1][3],point_lutowiska[i][1][4])
		if i%STEP == 0 then
			triggerClientEvent(root,"Looty_setDane",resourceRoot,i)
			setTimer(function() coroutine.resume(coroutine_looty) end,50,1)
			coroutine.yield()
		end
	end
	--print(toJSON(bronie_for_all),getPlayerFromName("Mandaryn"))

	for i,v in pairs(ilosc_broni) do
		print(i.." na mapie: "..v)
	end
	--outputChatBox("#ff2200UWAGA! #ffffff - RESTART ITEMÓW ZAKOŃCZYŁ SIĘ !", getRootElement(), 255, 255, 255, true)
	triggerEvent("ZrestartujItemy",root)
	triggerClientEvent(root, "dxPickupsText", root, "Restart itemów zakończył się!", 255,255,255)
	exports.DayZ_Integracja:sendDiscordMessage("RESTART ITEMÓW ZAKOŃCZYŁ SIĘ !")
	luty = 120
	setTimer(createPikap,7200000,1)
	setElementData(resourceRoot,"Luty-Odswiezanie",nil)
end

function createPikap()
	if pierwszy then
		restartResource(getThisResource())
		return
	end
	--outputChatBox("#ff2200UWAGA! #ffffff - ZA 1 MINUTE NASTĄPI RESTART ITEMÓW, MOŻLIWE LAGI !", getRootElement(), 255, 255, 255, true)
	 exports.DayZ_notification:DrawNotification("#d63838[!] #FFFFFFZa 1 minute nastąpi restart itemów!", 255, 255, 255, root)
	exports.DayZ_Integracja:sendDiscordMessage("ZA 1 MINUTE NASTĄPI RESTART ITEMÓW !")
	setTimer(function()
		local tick = getTickCount()
		outputChatBox("#ffaa00UWAGA! #ffffff - NASTĄPIŁ RESTART ITEMÓW, MOŻLIWE LAGI !", getRootElement(), 255, 255, 255, true)
		setElementData(resourceRoot,"Luty-Odswiezanie",0)
		coroutine_looty = coroutine.create(stworzLooty)
		coroutine.resume(coroutine_looty)
		pierwszy = true
	end,60000,1)
end

createPikap()
setTimer(createPikap,7200000,1)


setTimer(function()
	if luty<=0 then
		luty = 120
	else
		luty = luty - 1
	end
end,60000,0)

local language = {
	['PL'] = {
		['Odswieżanie'] = "Odswieżanie lutowisk nastąpi za",
		['Minut'] = "minut",
	},
	['ENG'] = {
		['Odswieżanie'] = "Loot refresh will take place in ",
		['Minut'] = "minutes",
	},

}

addCommandHandler('checkref',function(p)
	local jezyk = getElementData(p,'Jezyk_Gry') or "PL"
	outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] "..language[jezyk]['Odswieżanie']..": #FF0000"..luty.." #FFFFFF"..language[jezyk]['Minut'],p,255,255,255,true)
end)

function createLoot()
	if not fileExists('Looty.db') then
		outputChatBox("Nie można się połączyć z baza danych!")
		return
	end
	createMilitaryLoot()
end


function deleteAllLutowiska()
	local timer
	local tick = getTickCount()
	local courtine
	local ilosc = 0
	local paul = getElementsByType('colshape',resourceRoot)
	courtine = coroutine.create(function()
		for i,v in pairs(paul) do
			local objects = getElementData(v, "objectsINloot");
			if objects then
				for z=1,9 do
					if isElement(objects[z]) then destroyElement(objects[z]) end
				end
			end
			destroyElement(v)
			ilosc = ilosc + 1
			coroutine.yield(courtine)
		end
	end)
	timer = setTimer(function()
		if #paul==ilosc then
			outputChatBox("#ddddddZakonczono usuwanie "..ilosc.." lutowisk w czasie #FF0000"..string.format('%.01f',(getTickCount()-tick)/1000).."s",root,0,200,0,true)
			killTimer(timer)
			createLoot()
			return
		end
		for i=1,3 do
			if ilosc==#paul then return end
			coroutine.resume(courtine)
		end
	end,50,#paul)
end

--addCommandHandler('usun',deleteAllLutowiska)

--deleteAllLutowiska()