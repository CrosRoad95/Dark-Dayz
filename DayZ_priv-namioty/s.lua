
local db = dbConnect("sqlite","Namioty.db")
if db then
	dbExec(db,"CREATE TABLE IF NOT EXISTS `Namioty`(Wlasciciel PRIMARY KEY, itemy)")
end

local greenzone = {
	{-842.68188476563,2751.8505859375,44.8},
}

local resp_namiotow = Vector3(-780.00537109375,3815.0344238281,-61.742092132568)

local tentColOwner = {}

for i,v in pairs(greenzone) do
	setElementData(createBlip(v[1],v[2],v[3],7,2,255,0,0,255,0,300),"PrivTentOpis","Prywatne namioty")
	local marker = createMarker(v[1],v[2],v[3],"cylinder",1.5,200,250,0,150)
end

local cole = {
	{-839.84197998047,2763.1579589844,46},
	{-850,2763,46}, 
	{-866,2763,46}, 
	{-879,2762,46}, 
	{-878.5,2747,46}, 
	{-865,2748,46}, 
	{-827,2752,46}, 
	{-815.5,2752,46}, 
	{-817,2767,46}, 
	{-828.5,2766,46}, 
}

local save_zone = {
	{-896.60949707031,2734.1088867188,40, cuboid_size = Vector3(100,70,30), radar_size = Vector2(100,70)},
}

for i,v in pairs(save_zone) do
	local radar = createRadarArea(v[1],v[2],v.radar_size.x,v.radar_size.y,0,255,0,200)
	local col = createColCuboid(v[1],v[2],v[3],v.cuboid_size.x,v.cuboid_size.y,v.cuboid_size.z)
	setElementData(col,"Safe-Zone",true,false)
end

for i,v in pairs(cole) do
	local col = createColSphere(v[1],v[2],v[3],2.5)
	setElementData(col,"tentCol",true,false)
end

local veh_to_owner = {}

addEventHandler("onColShapeHit",resourceRoot,function(element)
	if not getElementData(source,"Safe-Zone") then return end
	if getElementType(element) == "player" then
		toggleControl(element,"fire",false)
		setElementData(element,"GodMode",true)
		outputChatBox("* Wchodzisz do bezpiecznej strefy!",element,0,255,0)
	elseif getElementType(element) == "vehicle" then
		if getVehicleOccupant(element,0) then
			veh_to_owner[element] = getElementData(getVehicleOccupant(element,0),"logedin")
			setVehicleDamageProof(element,true)
		end
	end
end)

addEventHandler("onColShapeLeave",resourceRoot,function(element)
	if not getElementData(source,"Safe-Zone") then return end
	if getElementType(element) == "player" then
		setElementData(element,"GodMode",false)
		toggleControl(element,"fire",true)
		outputChatBox("* Wychoddzisz z bezpiecznej strefy!",element,255,0,0)
	elseif getElementType(element) == "vehicle" then
		veh_to_owner[element] = nil
		setVehicleDamageProof(element,false)
	end
end)

addEventHandler("onVehicleStartEnter",root,function(player)
	if veh_to_owner[source] then
		if getElementData(player,"logedin") ~= veh_to_owner[source] then
			cancelEvent() 
		end
	end
end)


addEventHandler("onColShapeHit",resourceRoot,function(player)
	if not getElementData(source,"tentCol") then return end
	if not getElementData(player,"logedin") then return end
	local acc = getElementData(player,"logedin") 
	if isPedInVehicle(player) then return end
	if tentColOwner[acc] then
		setElementData(player,"currentCol",tentColOwner[acc])
		setElementData(player,"loot",true)
		setElementData(player,"isLootingPrivTent",true)
	end
end)

addEventHandler("onColShapeLeave",resourceRoot,function(player)
	if not getElementData(source,"tentCol") then return end
	if not getElementData(player,"logedin") then return end
	if tentColOwner[getElementData(player,"logedin")] then
		setElementData(player,"isLootingPrivTent",false)
	end
end)


function stworzNamiot(wlasciciel,przedmioty)
	local col = createColSphere(resp_namiotow.x,resp_namiotow.y,resp_namiotow.z,3)
	setElementData(col,"lootname","Prywatny Namiot")
	setElementData(col,"itemloot",true)
	setElementData(col, "MAX_Slots", 500)
	tentColOwner[wlasciciel] = col
	for i,v in pairs(przedmioty) do
		setElementData(col,v[1],v[2])
	end
end

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

addEvent("PrivTentsreloadValues",true)
addEventHandler("PrivTentsreloadValues",root,function(col)
	local wlasciciel = getElementData(source,"logedin")
	local przedmioty = getAllItems(col)
	dbExec(db,"UPDATE `Namioty` SET `itemy` =  ? WHERE Wlasciciel = ?",toJSON(przedmioty),wlasciciel)
end)

addEvent("KupPrivTent",true)
addEventHandler("KupPrivTent",resourceRoot,function()
	local acc = getElementData(client,"logedin")
	if not acc then return end
	local q = dbQuery(db,"SELECT Wlasciciel FROM Namioty WHERE Wlasciciel = ?",acc)
	local p = dbPoll(q,-1)
	dbFree(q)
	if p[1] then
		outputChatBox("* Posiadasz już namiot prywatny!",client,255,0,0)
	else
		if getElementData(client,"PP") >= 10 then
			dbExec(db,"INSERT INTO `Namioty` VALUES(?,?)",acc,toJSON({}))
			setElementData(client,"PP",getElementData(client,"PP") - 10)
			stworzNamiot(acc,{})
			outputChatBox("* Pomyślnie kupiono namiot prywatny!",client,0,255,0)
		else
			outputChatBox("* Nie posiadasz wystarczająco Punktów Premium!",client,255,0,0)
		end
	end
end)

function loadTents()
	local q = dbQuery(db,"SELECT * FROM `Namioty`")
	local p = dbPoll(q,-1)
	dbFree(q)
	for i,v in pairs(p) do
		stworzNamiot(v["Wlasciciel"],fromJSON(v["itemy"]))
	end
end
loadTents()



