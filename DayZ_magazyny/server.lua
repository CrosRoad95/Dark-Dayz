


local zamykane_gejty = {}

addEvent("OpenGate",true)
addEventHandler("OpenGate",resourceRoot,function(marker)
	local dane = marker_info[marker]
	local x,y,z = getElementPosition(dane.brama)
	if (getElementData(client,dane.wymagany) or 0) <= 0 then return end
	local pos = dane.default_pos
	if dane.status == "Close" then
		moveObject(dane.brama,60000,x,y,pos[3] - 9)
		setElementData(client,dane.wymagany,(getElementData(client,dane.wymagany) or 0) - 1)
		marker_info[marker].status = "Open"
		triggerClientEvent(client,"ChangeBramaText",resourceRoot,"Zamknij brame")
		triggerClientEvent(root,"SetSomething",resourceRoot,marker_info)
		zamykane_gejty[marker] = getTickCount() + 60000*3
	--[[else
		moveObject(dane.brama,5000,x,y,pos[3])
		marker_info[marker].status = "Close"
		triggerClientEvent(client,"ChangeBramaText",resourceRoot,"Otwórz brame",marker_info[marker].status)
		triggerClientEvent(root,"SetSomething",resourceRoot,marker_info)
		zamykane_gejty[marker] = nil]]
	end
end)

addEventHandler("onPlayerLogin",root,function()
	triggerClientEvent(source,"SetSomething",resourceRoot,marker_info)
end)


local magazin_col = {}

local respy_aut = {
	["Magazyn 1"] = {2590.0888671875,-1474.7680664063,16.696537017822,0,0,-90},
	["Magazyn 2"] = {2552.2456054688,-471.23797607422,84.861602783203,0,0,-180},
	["Magazyn 3"] = {-245.25611877441,-2232.0161132813,28.663095474243,0,0,110},
	["Magazyn 4"] = {-2028.3126220703,-1514.4494628906,125.53146362305,0,0,0},
	["Magazyn 5"] = {2903.6831054688,1054.9140625,10.8984375,0,0,90},
	["Magazyn 6"] = {2107.2436523438,2809.5634765625,10.8203125,0,0,-90},
}

setTimer(function()
	for k, v in pairs(respy_aut) do
		magazin_col[k] = createColSphere(v[1], v[2],v[3], 5)
		respy_aut_i = string.sub(k, 8)
		respy_aut_i = tonumber(respy_aut_i)
		if #getElementsWithinColShape(magazin_col[k], "vehicle") <= 0 then
			for i, marker in pairs(getElementsByType("marker", resourceRoot)) do
				if i == respy_aut_i then
					if marker_info[marker] then
						local x, y, z = unpack(marker_info[marker].default_pos)
						moveObject(marker_info[marker].brama, 1000, x , y, z - 9)
						marker_info[marker].status = "Open"
					end
				end
			end
		end
	end
end, 1000, 1)

local losowe_auta = {
	"Hotring Racer",
	"Hotring Racer 2",
	"Hotring Racer 3",
}

function createPojazd(car_id,kordy,rotacja,spawn,czesci,id, check)
	local pojazd = createVehicle(car_id,kordy[1],kordy[2],kordy[3],rotacja[1],rotacja[2],rotacja[3])
	local col = createColSphere(kordy[1],kordy[2],kordy[3],2.5)
	setElementData(pojazd,"Veh-Rotacja",rotacja)
	attachElements(col,pojazd)
	setElementData(col,"vehicle",true)
	setElementData(col, "Veh-Spawn", {(spawn and spawn[1] or kordy[1]), (spawn and spawn[2] or kordy[2]), (spawn and spawn[3] or kordy[3])});
	setElementData(col,"parent",pojazd)
	setElementData(pojazd,"parent",col)
	setElementData(pojazd,"fuel",30)
	if czesci then
		for i,v in pairs(czesci) do
			setElementData(col,v[1],v[2])
		end
	end
	if check then
		for k, v in pairs(respy_aut) do
		respy_aut_i = string.sub(k, 8)
		respy_aut_i = tonumber(respy_aut_i)
		if #getElementsWithinColShape(magazin_col[k], "vehicle") <= 0 then
			for i, marker in pairs(getElementsByType("marker", resourceRoot)) do
				if i == respy_aut_i then
					if marker_info[marker] then
						local x, y, z = unpack(marker_info[marker].default_pos)
						moveObject(marker_info[marker].brama, 1000, x , y, z)
						marker_info[marker].status = "Close"
					end
				end
			end
		end
	end
	end
end

addEventHandler("onVehicleExplode",resourceRoot,function()
	local car_id = getVehicleModelFromName(losowe_auta[math.random(#losowe_auta)])
	if getElementData(source,"parent") then
		createPojazd(car_id,getElementData(getElementData(source,"parent"),"Veh-Spawn"),getElementData(source,"Veh-Rotacja"), nil, nil, nil, true)
		destroyElement(getElementData(source,"parent"))
	end
	destroyElement(source)
end)

local db = dbConnect("sqlite","Auta.db")
if db then
	dbExec(db,"CREATE TABLE IF NOT EXISTS `Auta` (model,kordy,rotacja,spawn,czesci)");
	outputChatBox("* Połączono z magazynami!",root,0,255,0)
end

function dobackup()
	local zapis = 0
	dbExec(db,"DELETE FROM `Auta`")
	for i,v in pairs(getElementsByType("vehicle",resourceRoot)) do
		local x,y,z = getElementPosition(v)
		local spawn = getElementData(getElementData(v,"parent"),"Veh-Spawn")
		local rotacja = getElementData(v,"Veh-Rotacja")
		local czesci = {
			{"Szyba-Kuloodporna",getElementData(getElementData(v,"parent"),"Szyba-Kuloodporna")},
			{"Tire_inVehicle",getElementData(getElementData(v,"parent"),"Tire_inVehicle")},
			{"Engine_inVehicle",getElementData(getElementData(v,"parent"),"Engine_inVehicle")},
			{"Parts_inVehicle",getElementData(getElementData(v,"parent"),"Parts_inVehicle")},
		}
		dbExec(db,"INSERT INTO `Auta` VALUES(?,?,?,?,?)",getElementModel(v),toJSON({x,y,z}),toJSON(rotacja),toJSON(spawn),toJSON(czesci))
		zapis = zapis + 1
	end
	print("* Zapisano magazynow: "..zapis)
end

function loadCars()
	local wczytane = 0
	local q = dbQuery(db,"SELECT * FROM `Auta`")
	local p = dbPoll(q,-1)
	dbFree(q)
	for i,v in pairs(p) do
		local kordy = fromJSON(v["kordy"])
		local rotacja = fromJSON(v["rotacja"])
		local spawn = fromJSON(v["spawn"])
		local model = tonumber(v["model"])
		local czesci = v["czesci"] and fromJSON(v["czesci"]) or {}
		createPojazd(model,kordy,rotacja,spawn,czesci)
		wczytane = wczytane + 1
	end
	if wczytane == 0 then
		for i,v in pairs(respy_aut) do
			local car_id = getVehicleModelFromName(losowe_auta[math.random(#losowe_auta)])
			createPojazd(car_id,{v[1],v[2],v[3]},{v[4],v[5],v[6]})
		end
	elseif wczytane ~= #respy_aut then
		for i,v in pairs(respy_aut) do
			local znaleziono = false
			for _,pojazd in pairs(getElementsByType("vehicle",resourceRoot)) do
				local spawn = getElementData(getElementData(pojazd,"parent"),"Veh-Spawn")
				if spawn[1] == v[1] and spawn[2] == v[2] and spawn[3] == v[3] then
					znaleziono = true
				end
			end
			if not znaleziono then
				local car_id = getVehicleModelFromName(losowe_auta[math.random(#losowe_auta)])
				createPojazd(car_id,{v[1],v[2],v[3]},{v[4],v[5],v[6]})
			end
		end
	end
	print("Załadowano: "..wczytane.. " pojazdy!")
end
setTimer(loadCars, 200, 1)



setTimer(function()
	for i,v in pairs(getElementsByType("vehicle",resourceRoot)) do
		if isElementInWater(v) then
			local car_id = getVehicleModelFromName(losowe_auta[math.random(#losowe_auta)])
			if getElementData(v,"parent") then
				createPojazd(car_id,getElementData(getElementData(v,"parent"),"Veh-Spawn"),getElementData(v,"Veh-Rotacja"), nil, nil, nil, true)
				destroyElement(getElementData(v,"parent"))
			end
			destroyElement(v)
		end
	end
	dobackup()
end,60000*5,0)

addCommandHandler("dobackup",function(z)
	if not getElementData(z,"logedin") then return end
	if not isObjectInACLGroup("user."..getElementData(z,"logedin"),aclGetGroup("Admin")) then return end
	dobackup()
end)


--[[
addEventHandler("onPlayerJoin",root,function()
	resendPlayerModInfo(source)
end)

addEventHandler("onPlayerModInfo",root,function(file,tabl)
	for i,v in pairs(tabl) do
		if v.id == 3095 then
			kickPlayer(source,"Podmieniony model: 3095")
		end
	end
end)

]]

