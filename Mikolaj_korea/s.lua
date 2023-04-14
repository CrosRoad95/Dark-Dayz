
local radar = createColRectangle(2444.1748046875, -1720.850830078, 125, 125)

local pickup = createPickup(2489.9538574219, -1663.1547851563, 13.34375, 3, 1275, 1000, 0)

createBlipAttachedTo(pickup, 11, 2, 255, 0, 0, 255, 0)

createObject(2754, 2490.9670410156, -1666.9992675781, 12.3)

local ped = createPed(300, 2487.6171875, -1666.5942382813, 13.34375)
if ped then
	setTimer(function()
		setElementRotation(ped, 0, 0, 90)
		setElementCollisionsEnabled(ped, false)
		setPedAnimation ( ped, "DANCING", "dnce_M_b", -1, true, false )
	end, 1000, 1)
end

local serials_usage = {}

local xml = xmlLoadFile("Prezenty.xml")
serials_usage = fromJSON(xmlNodeGetAttribute(xml, "Gracze"))

function canUsePresentToday(player)
	if serials_usage[getPlayerSerial(player)] then
		return false
	end
	return true
end


local nagrody = {
	{
		przedmiot = "PP",
		szansa = 20,
		ilosc = function()
			return math.random(1, 5)
		end,
	},
	{
		przedmiot = "GP",
		szansa = 60,
		ilosc = function()
			return math.random(100, 500)
		end,
	},
	{
		przedmiot = "GP",
		szansa = 50,
		ilosc = function()
			return math.random(20, 150)
		end,
	},
}

function getNagroda()
	for i, v in pairs(nagrody) do
		if math.random(100) <= v.szansa then
			return v
		end
	end
	return false
end


function playerUsePresent(player)
	serials_usage[getPlayerSerial(player)] = true
	xmlNodeSetAttribute(xml, "Gracze", toJSON(serials_usage))
	xmlSaveFile(xml)
end

addEventHandler("onPickupHit", pickup, function(player)
	if not canUsePresentToday(player) then
		exports.DayZ_notification:DrawNotification("Odebrałeś już dzisiaj prezent!", 255, 0, 0, player)
		return
	end
	
	local nagroda = getNagroda()
	if getElementData(player, "Grupa") and getElementData(player, "Grupa").nazwa:find("family") then
		if math.random(1, 2) == 2 then
			nagroda = false
		end
	end
	
	if not nagroda then
		outputChatBox(getPlayerName(player):gsub("#%x%x%x%x%x%x", "").. " dostał rózgę od Papy Jokera!", root, 255, 255, 255, true)
	else
		local ammout = nagroda.ilosc()
		outputChatBox(getPlayerName(player):gsub("#%x%x%x%x%x%x", "").. " otrzymał "..ammout..nagroda.przedmiot.." od Papy Jokera!", root, 255, 255, 255, true)
		local data = getElementData(player, nagroda.przedmiot) or 0
		setElementData(player, nagroda.przedmiot, data + ammout)
	end
	exports.DayZ_notification:DrawNotification("Wróć po prezent jutro!", 0, 155, 0, player)
	playerUsePresent(player)
end)

local isRefreshed = false

setTimer(function()
	local h = getRealTime().hour
	if h == 0 then
		if not isRefreshed then
			serials_usage = {}
			xmlNodeSetAttribute(xml, "Gracze", toJSON(serials_usage))
			xmlSaveFile(xml)
			isRefreshed = true
		end
	else
		isRefreshed = false
	end
end, 60000, 0)












