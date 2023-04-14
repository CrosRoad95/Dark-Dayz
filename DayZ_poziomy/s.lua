

addEventHandler('onPlayerLogin',root,function(_,theCurrentAccount)
	local exp = getAccountData(theCurrentAccount,"EXP") or 0
	local lvl = getAccountData(theCurrentAccount,"LVL") or 1
	setElementData(source,"EXP",exp)
	setElementData(source,"LVL",lvl)
	sprawdzLVL(source)
end)

addEventHandler("onPlayerQuit",root,function()
	if not getElementData(source,"logedin") then return end
	local exp = getElementData(source,"EXP") or 0
	local lvl = getElementData(source,"LVL") or 1
	setAccountData(getPlayerAccount(source),"EXP",exp)
	setAccountData(getPlayerAccount(source),"LVL",lvl)
	sprawdzLVL(source)
end)

local nastepny_poziom_exp = {
	[1] = 0,
	[2] = 300,
	[3] = 600,
	[4] = 1100,
	[5] = 1650,
	[6] = 2300,
	[7] = 3000,
	[8] = 3900,
	[9] = 4900,
	[10] = 6000,
	[11] = 7200,
	[12] = 9500,
	[13] = 11350,
	[14] = 12850,
	[15] = 14450,
	[16] = 16200,
	[17] = 18100,
	[18] = 20300,
	[19] = 23300,
}

local nastepny_poziom_gp = {
	[1] = 100,
	[2] = 200,
	[3] = 300,
	[4] = 400,
	[5] = 500,
	[6] = 600,
	[7] = 700,
	[8] = 800,
	[9] = 900,
	[10] = 1000,
	[11] = 1100,
	[12] = 1300,
	[13] = 1300,
	[14] = 1400,
	[15] = 1500,
	[16] = 1600,
	[17] = 1700,
	[18] = 1800,
	[19] = 1900,
}

local language = {
	["PL"] = {
		['Wbite'] = "#c4c4c4Gratulacje! #ffffffWbiłeś #c4c4c4%s #ffffffpoziom!",
	},
	["ENG"] = {
		['Wbite'] = "#c4c4c4Congratulations! #ffffffYou get #c4c4c4%s #fffffflevel!",
	},
}

function giveEXP(ilosc)
	if not ilosc then return end
	if getElementData(source,"VIP") then
		ilosc = math.floor(ilosc * 1.6)
	end
	setElementData(source,"EXP",(getElementData(source,"EXP") or 0) + ilosc)
	sprawdzLVL(source)
end
addEvent("giveEXP",true)
addEventHandler("giveEXP",root,giveEXP)


function sprawdzLVL(player)
	if not isElement(player) then return end
	local exp = getElementData(player,"EXP") or 0
	local lvl = getElementData(player,"LVL") or 1

		if not (exp > nastepny_poziom_exp[19]) then
			for i=1, #nastepny_poziom_exp do				
				if (exp >= nastepny_poziom_exp[i]) and (exp < nastepny_poziom_exp[i+1]) then

					if getElementData(player, "LVL") == i then return end

					setElementData(player, "LVL", i)

					local jezyk = getElementData(player,"Jezyk_Gry") or "PL"
					local msg = string.format(language[jezyk]["Wbite"],i)

					if nastepny_poziom_gp[i] then
						setElementData(player, "GP", getElementData(player, "GP") + nastepny_poziom_gp[i])
					end

					setElementData(player, "", getElementData(player, "GP") + nastepny_poziom_gp[i])

					exports.DayZ_notification.DrawNotification(nil, msg, 255, 255, 255, player)

					return
				end
			end
		elseif (exp - nastepny_poziom_exp[19]) > 0 then
			setElementData(player, "EXP", (exp - nastepny_poziom_exp[19]))
			sprawdzLVL(player)
			return
		end
end

local zawodnik = {
	"Umiejetnosc_1",
	"Umiejetnosc_2",
	"Umiejetnosc_3",
	"Umiejetnosc_4",
}

addEventHandler("onPlayerLogin",root,function(_,curr)
	local globalne_umiejetnosci = {}
	local umiejetnosci = getAccountData(curr,"umiejetnosci")
	if umiejetnosci then
		for i,v in pairs(fromJSON(umiejetnosci)) do
			setElementData(source,i,v)
		end
	end
end)

addEventHandler("onPlayerQuit",root,function()
	if not getElementData(source,"logedin") then return end
	local acc = getPlayerAccount(source)
	local umiejetnosci = {}
	for i,v in pairs(zawodnik) do
		umiejetnosci[v] = getElementData(source,v)
	end
	setAccountData(acc,"umiejetnosci",toJSON(umiejetnosci))
end)

local rzeczy_na_start = {
	[5] = {
		["Opcja 1"] = {"Hunting Knife",1},
		["Opcja 2"] = {"MAX_Slots",14},
	},
	[10] = {
		["Opcja 1"] = {"blood",500},
		["Opcja 2"] = {"MAX_Slots",20},
	},
	[15] = {
		["Opcja 1"] = {"Medic Kit",1},
	},
	[20] = {
		["Opcja 1"] = {"blood",300},
	},
}

function getMaxHealth(player)
	if not player then return end
	local added_blood = 0
	if getElementData(player,"Umiejetnosc_2") ==  "Opcja 1" then
		added_blood = added_blood + 500
	end
	if getElementData(player,"Umiejetnosc_4") ==  "Opcja 1" then
		added_blood = added_blood + 300
	end
	return added_blood
end

local lvl_to_umiejetnosci = {
	[5] = "Umiejetnosc_1",
	[10] = "Umiejetnosc_2",
	[15] = "Umiejetnosc_3",
	[20] = "Umiejetnosc_4",
}


function getCosNaStart(player)
	local poziom = getElementData(player,"LVL") or 1
	for key,v in pairs(rzeczy_na_start) do
		if poziom >= key then
			local umiejetnosc = getElementData(player,lvl_to_umiejetnosci[key])
			if v[umiejetnosc] then
				if v[umiejetnosc][1] ~= "MAX_Slots" then
					setElementData(player,v[umiejetnosc][1],getElementData(player,v[umiejetnosc][1])+v[umiejetnosc][2])
				else
					setElementData(player,v[umiejetnosc][1],v[umiejetnosc][2])
				end
			end
		end
	end
end



local pedy = {
	{-1506,1376,4},
	{1090,1074,11},
	{1225,-2415,11},
}

for i,v in pairs(pedy) do
	local ped = createPed(244,v[1],v[2],v[3])
	setElementFrozen(ped,true)
	setBlipVisibleDistance(createBlipAttachedTo(ped,21),300)
	local col = createColSphere(v[1],v[2],v[3],2)
end

local check_col = {}

addEventHandler("onColShapeHit", resourceRoot, function(e)
local jezyk = getElementData(e,"Jezyk_Gry") or "PL"
	if getElementType(e) == "player" and not isPedInVehicle(e) then
		if jezyk =="PL" then
			outputChatBox("#d63838[!] #ffffffWpisz /wymien.lvl \n Po wpisaniu otrzymasz 15 PP oraz zostanie zabrane Ci 10 poziomów.",e,255,150,0, true)
		else
			outputChatBox("#d63838[!] #ffffffWrite /replace.lvl \n After writting, you will receive 15 PP and 10 levels will be taken from you.",e,255,150,0, true)
		end
		check_col[e] = source
	end
end)

addEventHandler("onColShapeLeave", resourceRoot, function(e)
	check_col[e] = nil
end)

function replaceLevel(e)
	local jezyk = getElementData(e,"Jezyk_Gry") or "PL"
	if not check_col[e] then return end
	if isElementWithinColShape(e, check_col[e]) then
		if (getElementData(e,"LVL") or 0) >= 10 then
			local lvl = getElementData(e, "LVL") or 0
			local exp_ = DecreaseLevel(e, lvl, 10)
			
			setElementData(e,"EXP",exp_)
			setElementData(e, "LVL", 1)
			setElementData(e,"PP",(getElementData(e,"PP") or 0) + 15)
			sprawdzLVL(e)

			if jezyk =="PL" then
				triggerClientEvent(e, "stworz_notyfikacje", e, "sucess", "Pomyślnie dokonano transakcji!")
			else
				triggerClientEvent(e, "stworz_notyfikacje", e, "sucess", "The transaction was successful!")
			end
		else
			--outputChatBox("* Posiadasz za niski poziom!",e,255,0,0)
			if jezyk =="PL" then
				triggerClientEvent(e, "stworz_notyfikacje", e, "error", "Nie posiadasz wystarczającego poziomu!")
			else
				triggerClientEvent(e, "stworz_notyfikacje", e, "error", "You don't have a sufficient level!")
			end
		end
	end
end

addCommandHandler("wymien.lvl", replaceLevel)
addCommandHandler("replace.lvl", replaceLevel)

function DecreaseLevel(player, lvl, value)
	return (nastepny_poziom_exp[lvl-value]) or 0;
end