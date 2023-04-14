

local db = dbConnect("sqlite","Konta_VIP.db")
if db then
	--outputChatBox("* Pomyślnie połączono z kontami VIP!",root,0,255,0)
	dbExec(db,"CREATE TABLE IF NOT EXISTS `VIP` (`UID` INT NOT NULL , `End_time` INT NOT NULL , PRIMARY KEY (`UID`))");
end

local kategorie = {
	['Zestaw medyczny'] = {
		czas = 3600000*2,
		slownie = "2 godziny",
		itemy = {
			{"Medic Kit",2},
			{"Bandage",3},
			{"Morphine",2},
			{"Painkiller",1},
			{"Blood Bag",1},
		},
	},
	['Zestaw prowiantu'] = {
		czas = 3600000,
		slownie = "1 godzina",
		itemy = {
			{"Milk",5},
			{"Pizza",5},
		},
	},
	['Zestaw mechanika'] = {
		czas = 3600000*4,
		slownie = "4 godziny",
		itemy = {
			{"Tire",4},
			{"Toolbox",1},
			{"Engine",1},
			{"Tank Parts",1},
		},
	},
	['Plecak 32 sloty'] = {
		czas = 3600000,
		slownie = "1 godzina",
		itemy = {
			{"Alice Pack",1},
		},
	},

}
local kategorie2 = {
	['Medical kit'] = {
		czas = 3600000*2,
		slownie = "2 godziny",
		itemy = {
			{"Medic Kit",2},
			{"Bandage",3},
			{"Morphine",2},
			{"Painkiller",1},
			{"Blood Bag",1},
		},
	},
	['Provision set'] = {
		czas = 3600000,
		slownie = "1 godzina",
		itemy = {
			{"Milk",5},
			{"Pizza",5},
		},
	},
	['Mechanic kit'] = {
		czas = 3600000*4,
		slownie = "4 godziny",
		itemy = {
			{"Tire",4},
			{"Toolbox",1},
			{"Engine",1},
			{"Tank Parts",1},
		},
	},
	['Backpack 32 slots'] = {
		czas = 3600000,
		slownie = "1 godzina",
		itemy = {
			{"Alice Pack",1},
		},
	},

}


local anty_uzycie = {}

addEvent("VIP_GiveItem",true)
addEventHandler("VIP_GiveItem",resourceRoot,function(player,data)
local jezyk = getElementData(player,"Jezyk_Gry") or "PL"
	if not getElementData(player,"VIP") then return end
	local acc = getElementData(player,'logedin')
	if (anty_uzycie[acc] and anty_uzycie[acc][data] and getTickCount()-(anty_uzycie[acc][data].czas)<1) then
		outputChatBox("* Musisz odczekać "..anty_uzycie[acc][data].slownie,player,255,255,255,true)
		return
	end
	local napis = 0
	local ilosc = 0
	if jezyk =="PL" then
			for i,v in pairs(kategorie[data].itemy) do
			local item_slot = exports.DayZ_core:getItemSlots(v[1]);
			if exports.DayZ_core:getElementCurrentSlots(player) + (item_slot * v[2]) > getElementData(player,'MAX_Slots') + (getElementData(player,"Custom_Slots") or 0) then
				for i=1,v[2] do
					triggerEvent("playerDropAItem",player,v[1],1)
					ilosc = ilosc + 1
				end
				else
					local data = getElementData(player,v[1]) or 0
					setElementData(player,v[1],data+v[2])
					ilosc = ilosc + 1
				end
			end
			if ilosc > 0 then
				outputChatBox("* Wybrałeś usługę: "..data,player,255,255,255,true)
				if not anty_uzycie[acc] then
					anty_uzycie[acc] = {}
				end
				anty_uzycie[acc][data] = {}
				anty_uzycie[acc][data].czas = getTickCount() + kategorie[data].czas
				anty_uzycie[acc][data].slownie = kategorie[data].slownie
			end
		else
			for i,v in pairs(kategorie2[data].itemy) do
			local item_slot = exports.DayZ_core:getItemSlots(v[1]);
			if exports.DayZ_core:getElementCurrentSlots(player) + (item_slot * v[2]) > getElementData(player,'MAX_Slots') + (getElementData(player,"Custom_Slots") or 0) then
				for i=1,v[2] do
					triggerEvent("playerDropAItem",player,v[1],1)
					ilosc = ilosc + 1
				end
				else
					local data = getElementData(player,v[1]) or 0
					setElementData(player,v[1],data+v[2])
					ilosc = ilosc + 1
				end
			end
			if ilosc > 0 then
				outputChatBox("* You chose a service: "..data,player,255,255,255,true)
				if not anty_uzycie[acc] then
					anty_uzycie[acc] = {}
				end
				anty_uzycie[acc][data] = {}
				anty_uzycie[acc][data].czas = getTickCount() + kategorie2[data].czas
				anty_uzycie[acc][data].slownie = kategorie2[data].slownie
			end
		end	
end)

addEvent("KupVipa",true)
addEventHandler("KupVipa",resourceRoot,function(player)
	local pp = (getElementData(player,"PP") or 0)
	local jezyk = getElementData(player,"Jezyk_Gry") or "PL"
	if pp >= 10 then
		if jezyk =="PL" then
			outputChatBox("* Przedlużyłes konto VIP o 30 dni!",player,0,255,0)
		else
			outputChatBox("* You have extended your VIP account by 30 days!",player,0,255,0)
		end	
		setElementData(player,"VIP",(getElementData(player,"VIP") or 0) + 30)
		setElementData(player,"PP",pp-10)
		local query = dbQuery(db,"SELECT * From `VIP` WHERE UID=?",getElementData(player,"UID"))
		local select = dbPoll(query,-1)
		dbFree(query)
		if select[1] then
			dbExec(db,"UPDATE `VIP` SET `End_time`=? WHERE UID=?",select[1]["End_time"]+30,getElementData(player,"UID"))
		else
			dbExec(db,"INSERT INTO VIP VALUES(?,?)",getElementData(player,"UID"),30)
		end
	end
end)

addEventHandler("onPlayerLogin",root,function()
	local data = getAccountData(getPlayerAccount(source),'PP') or 0
	setElementData(source,'PP',data)
end)

addEventHandler("onPlayerQuit",root,function()
	if not isGuestAccount(getPlayerAccount(source)) then
		local data = getElementData(source,'PP') or 0 
		setAccountData(getPlayerAccount(source),"PP",data)
	end
end)

--[[
local STEP=100 -- po ile naraz przerabiamy

function liczymy()
  outputChatBox(" ")
  outputChatBox("Liczymy do miliona bez wieszania serwera")

  for i=1,1000000 do

    outputDebugString("i == " .. i)

    if i%STEP==0 then
        setTimer(function() coroutine.resume(coroutine_liczymy) end, 500, 1)
        coroutine.yield()
    end

  end

  outputChatBox("Policzone!")
end

coroutine_liczymy=coroutine.create(liczymy)
coroutine.resume(coroutine_liczymy)

]]
--[[
local bylo_odjete = false

function odejmijCos()
	local time = getRealTime().hour
	if time == 0 and not bylo_odjete then
		bylo_odjete = true
		local query = dbQuery(db,"SELECT * FROM `VIP`")
		local pool = dbPoll(query,-1)
		dbFree(query)
		if #pool > 0 then
			for i,v in pairs(pool) do
				local czas = v['End_time']
				if czas - 1 <= 0 then
					dbExec(db,"DELETE FROM `VIP` Where UID=?",v['UID'])
				else
					dbExec(db,"UPDATE `VIP` SET End_time=? Where UID =?",(czas - 1),v["UID"])
				end
			end
		end
	elseif time ~= 0 and bylo_odjete then
		bylo_odjete = false
	end
end
setTimer(odejmijCos,60000,0)]]

addEventHandler("onPlayerLogin",root,function(_,curr)
	local id = getAccountData(curr,"UID")
	local query = dbQuery(db,"SELECT * FROM `VIP` Where UID=?",id)
	local paul = dbPoll(query,-1)
        dbFree(query)
	if paul[1] then
		outputChatBox("* Pomyślnie wczytano konto VIP",source,0,255,0)
		setElementData(source,"VIP",paul[1]['End_time'])
	end
end)


addCommandHandler("daj.pp",function(player,cmd,target,amount)
local jezyk = getElementData(player,"Jezyk_Gry") or "PL"
	if not getElementData(player,"logedin") then return end
	if not target then return end
	if not amount or not tonumber(amount) then return end
	if isObjectInACLGroup ("user."..getElementData(player,"logedin"), aclGetGroup ( "Admin" ) ) then
		target = getPlayerFromName(target)
		if target then
			setElementData(target,"PP",(getElementData(target,"PP") or 0)+tonumber(amount))
			if jezyk =="PL" then
				outputChatBox("* Przelano!",player)
			else
				outputChatBox("* Transferred!",player)
			end
		end
	end
end)



-- 1000

function math.percentChance(percent, repeatTime)
	local los = math.random(0,100)
	if los <= percent then
		return 1
	end
	return 0
end

local szansa = {
	{"GP",1000,5},
	{"GP",100,1},
	{"GP",100,1},
	{"GP",100,1},
	{"GP",100,1},
	{"GP",100,1},
	{"GP",100,1},
	{"GP",100,1},
	{"GP",100,1},
	{"GP",100,1},
	{"GP",100,1},
	{"GP",200,1.5},
	{"GP",500,3},
	{"GP",500,3},
	{"GP",500,3},
	{"GP",500,3},
	{"GP",500,3},
	{"GP",500,3},
	{"GP",200,1.5},
	{"GP",200,1.5},
	{"GP",500,3},
	{"GP",700,4},
	{"GP",700,4},
	{"GP",700,30},
	{"GP",700,30},
	{"PP",10,7},
	{"PP",10,7},
	{"PP",20,5},
	{"PP",30,3},
	{"PP",40,1},
	{"PP",50,1},
}

function losuj()
	for i,v in pairs(szansa) do
		local value = math.percentChance(v[3],1);
		if value > 0  then
			--outputChatBox("Wygrałeś: "..v[2]..v[1])
			return v[1],v[2]
		end
	end
	return false
end
--[[
for i =1,999999 do
local jest = losuj()
if jest then
	outputChatBox(i)
	break
end
end]]


local wartosci = {
	["GP"] = 0,
	["PP"] = 0,
	["Wydane"] = 0,
}

local xml = xmlLoadFile("Zapis.xml")
if not xml then
	xml = xmlCreateFile("Zapis.xml","Dane")
end

function printToXML(tekst)
	local child = xmlCreateChild(xml,"Zapis")
	xmlNodeSetAttribute(child,"User",tekst[1])
	xmlNodeSetAttribute(child,"Typ-Wygranej",tekst[2])
	xmlNodeSetAttribute(child,"Wygrana",tekst[3])
	xmlSaveFile(xml)
end

addEvent("Skrzynka:losuj",true)
addEventHandler("Skrzynka:losuj",resourceRoot,function()
local jezyk = getElementData(client,"Jezyk_Gry") or "PL"
	if (getElementData(client,"PP") or 0) < 5 then return end
	local typ,ilosc = losuj()
	setElementData(client,"PP",(getElementData(client,"PP") or 0) - 5)
	
	if not typ then printToXML({getElementData(client,"logedin"),"POCIESZENIE",0})
		if jezyk =="PL" then
			outputChatBox("* Nic nie wygrałeś!",client,255,255,255)
		else
			outputChatBox("* You didn't win anything!",client,255,255,255)
		end return end
	setElementData(client,typ,(getElementData(client,typ) or 0) + ilosc)
		if jezyk =="PL" then
			outputChatBox("* Wygrałeś: "..ilosc..typ,client,255,255,255)
		else
			outputChatBox("* You won: "..ilosc..typ,client,255,255,255)
		end
	printToXML({getElementData(client,"logedin"),typ,ilosc})
end)


--outputChatBox("* Otrzymałeś konto VIP na okres 3 dni!",root,0,255,0)

for i,v in pairs(getElementsByType("player")) do
	setElementData(v,"VIP",true)
end
--[[
addEventHandler("onPlayerLogin",root,function()
    setElementData(source,"VIP",true)
end)]]


local bylo_odjete = false

function odejmijCos()
    local time = getRealTime().hour
    if time == 0 and not bylo_odjete then
        bylo_odjete = true
        local query = dbQuery(db,"SELECT * FROM `VIP`")
        local pool = dbPoll(query,-1)
        dbFree(query)
        if #pool > 0 then
            for i,v in pairs(pool) do
                local czas = v['End_time']
                if czas - 1 <= 0 then
                    dbExec(db,"DELETE FROM `VIP` Where UID=?",v['UID'])
                else
                    dbExec(db,"UPDATE `VIP` SET End_time=? Where UID =?",(czas - 1),v["UID"])
                end
            end
        end
    elseif time ~= 0 and bylo_odjete then
        bylo_odjete = false
    end
end
setTimer(odejmijCos,60000,0)
