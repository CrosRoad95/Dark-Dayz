

local discord_webhooks = {
	[1] = "https://discordapp.com/api/webhooks/698286321516544000/pGAPtpuNJDaaBBWgEHfAuAQ5xxbvmcjoaBzc1LRbNJhhlyCzsV_sp-YsebWAxc7wwkvQ",
	[2] = "https://discordapp.com/api/webhooks/698283957145567314/7ByhqeeMDAUroaH78nM-Zoi7Cm1G6FZ4SutIBilmQc_W4zSrY1wbMVayn-u-k2WmduIl",
}

function sendDiscordMessage(message)
	if getServerPort() == 22003 then return end
	sendOptions = {
		queueName = "dcq",
		connectionAttempts = 3,
		connectTimeout = 5000,
		formFields = {
			content="```"..message.."```"
		},
	}
   	xpcall(fetchRemote ( discord_webhooks[1], sendOptions, callback ),debug.traceback)
end

function sendDiscordMessageBonus(message)
	if getServerPort() == 22003 then return end
	sendOptions = {
		queueName = "dcq",
		connectionAttempts = 3,
		connectTimeout = 5000,
		formFields = {
			content=""..message..""
		},
	}
	xpcall(fetchRemote ( discord_webhooks[2], sendOptions, callback ),debug.traceback)
end

function sendDiscordMessageFromZgetek(message)
	if getServerPort() == 22003 then return end
	sendOptions = {
		queueName = "dcq",
		connectionAttempts = 3,
		connectTimeout = 5000,
		formFields = {
			content=""..message..""
		},
	}
	fetchRemote ( discord_webhooks[2], sendOptions, callback )
end

function sendMessage(p,cmd,...)
	if not getElementData(p,"Administrator-Open") then return end
	local tekst = table.concat ( { ... }, " " )
	xpcall(sendDiscordMessageFromZgetek,debug.traceback,tekst)
end
addCommandHandler("wyslijDiscord",sendMessage)

function callback()
	--outputDebugString("Message sent!")
end



local allowed = { { 48, 57 }, { 65, 90 }, { 97, 122 } } -- numbers/lowercase chars/uppercase chars

function generateString ( len )
    
    if tonumber ( len ) then
        math.randomseed ( getTickCount () )

        local str = ""
        for i = 1, len do
            local charlist = allowed[math.random ( 1, 3 )]
            str = str .. string.char ( math.random ( charlist[1], charlist[2] ) )
        end

        return str
    end
    
    return false
    
end






local bonus
local players = {}

local items = {
	{"Medium Tent",1},
	{"Burger",1},
	{"Water Bottle",1},
	{"Alice Pack",1},
	{"Hatchet",1},
	{"Medic Kit",1},
	{"Medic Bag",1},
	{"First Aid Kit",1},
}

function newBonus()
	players = {}
	local v = items[math.random(#items)]
	bonus = {generateString(5),v[1],v[2]}
	sendDiscordMessageBonus(string.format("Po wpisaniu w grze **/bonus %s** otrzymasz: %s x%s",bonus[1],bonus[2],bonus[3]))
	setTimer(newBonus,10800000,1)
end
newBonus()

addCommandHandler("bonus",function(player,cmd,arg)
	if players[player] then
		outputChatBox("* Użyłeś już bonusu!",player,255,0,0)
		return
	end
	if arg ~= bonus[1] then
		outputChatBox("* Niepoprawny kod!",player,255,0,0)
		return
	end
	if exports['DayZ_core']:getElementCurrentSlots(player) + exports['DayZ_core']:getItemSlots(bonus[2]) * bonus[3] < getElementData(player,'MAX_Slots') + (getElementData(player,"Custom_Slots") or 0) then
		local data = getElementData(player,bonus[2]) or 0
		setElementData(player,bonus[2],data + bonus[3])
		outputChatBox("* Pomyślnie użyłeś bonusu!",player,0,255,0)
		players[player] = true
	else
		outputChatBox("* Nie posiadasz miejsca w ekwipunku!",player,255,0,0)
	end
end)


