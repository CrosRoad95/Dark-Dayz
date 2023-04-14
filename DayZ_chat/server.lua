-- Configuration
local onlyLatinCharacters = true
local links = true
local CapitalLetters = true

-- Tables
local timeBetweenMessages = tonumber ( get ( "messagedelay" ) ) or 1000
local playerTickTable = {}
local ukryty = {}

-- Functions

function removeHex (text)
    return text:gsub("#%x%x%x%x%x%x", "") 
end

function playeGlobalChat ( playersource, cmd, ... )
	if cmd == "globalchat" then

		if isGuestAccount(getPlayerAccount(playersource)) then return end

		if getElementType(playersource) == "player" and isPlayerMuted ( playersource ) or getPlayerSerial(playersource) == "TWOJ SERIAL :)" or getPlayerSerial(playersource) == "TWOJ SERIAL :)" then
			local lang = getElementData(playersource, "Jezyk_Gry")

			if lang == "ENG" then
				outputChatBox ("You can not use chat, because you are muted.", playersource, 255, 128, 22, true)
			elseif lang == "PL" then
				outputChatBox ("Nie możesz korzystać z chatu, ponieważ posiadasz nalożoną karę!", playersource, 255, 128, 22, true)
			end

			return
		end


		local colors = {}
		local msg = removeHex( table.concat ( {...} , " " ) )
		
		--Anti-spam checks
		if CapitalLetters then
			local onlyLettersMsg = string.gsub ( msg , "%A", "" )
			if onlyLettersMsg == string.upper ( onlyLettersMsg ) and #onlyLettersMsg > 6 then
				local lang = getElementData(playersource, "Jezyk_Gry")

				if lang == "ENG" then
					outputChatBox ("Stop typing capital letters!", playersource, 255, 128, 22, true)
				elseif lang == "PL" then
					outputChatBox ("Przestań pisać wielkimi literami!", playersource, 255, 128, 22, true)
				end

				return
			end
		end
		
		if links then
			if string.find(msg,"http://") or string.find(msg,"http:/") or string.find(msg,"http//") or string.find(msg,"http/") or string.find(msg,"www.") then
				local lang = getElementData(playersource, "Jezyk_Gry")

				if lang == "ENG" then
					outputChatBox ("Stop typing links!", playersource, 255, 128, 22, true)
				elseif lang == "PL" then
					outputChatBox ("Przestań wysyłać linki!", playersource, 255, 128, 22, true)
				end
				
				return
			end
		end

		if onlyLatinCharacters then
			local noSpacesMsg = string.gsub ( msg, " ", "" )
			local onlySpecCharMsg = string.gsub( noSpacesMsg, "[%a%d]", "")
			if #onlySpecCharMsg > 10 then
				local lang = getElementData(playersource, "Jezyk_Gry")

				if lang == "ENG" then
					outputChatBox ("Do not spam the chat with special (language) characters!", playersource, 255, 128, 22, true)
				elseif lang == "PL" then
					outputChatBox ("Przestań spamić specjalnymi znakami!", playersource, 255, 128, 22, true)
				end
				
				return
			end
		end
		

		local var, spacesCount = string.gsub( msg, " ", "")

		if playerTickTable[playersource] then --check if a table entry for the player exists
			local tick = getTickCount ( ) --get the current tick count in ms
			local timePassed = tick - playerTickTable[playersource] --calculate the time that passed between two messages
			if timePassed <= timeBetweenMessages then
				outputChatBox ( "Please refrain from chat spam!", playersource, 255, 0, 0 )
				return
			end
		else
			playerTickTable[playersource] = getTickCount ( ) 
		end


		local message = msg
		local group_tag = exports.system_grup:getTag(playersource)

		if group_tag then
			msg = group_tag.."#ffffff "..getPlayerName(playersource).."#ffffff: "..msg
		else
			msg = getPlayerName(playersource).."#ffffff: "..msg
		end

	
		local ranks = {"Console", "Admin", "Administrator", "Pomocnik", "Pomocnik2", "Moderator2", "Vice Admin", "ModChat", "Jutuber", "Zasluzony", "Kasiasty", "Weteran"}

		local additional_rank = false
		local vip_rank = false
		if not ukryty[playersource] then
			for i,v in pairs(ranks) do
				if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playersource)),aclGetGroup(v)) then
					additional_rank = v
					break
				end
			end
		end

		if not additional_rank then
			if getElementData(playersource, "VIP") then
				vip_rank = true;
			end
		end

		local id = getElementData(playersource, "id") or 1

		triggerClientEvent(root, "onPlayerUseGlobalChat", root, playersource, msg, additional_rank, vip_rank, id)
		outputServerLog(getPlayerName(playersource)..": "..removeHex(message))
		
		playerTickTable[playersource] = getTickCount ( ) 
	end
end
addCommandHandler ( "globalchat", playeGlobalChat )

addEventHandler ( "onPlayerQuit", root,
	function ( )
		playerTickTable[source] = nil --remove a leaving player from our cached table
	end
)

local incognitoTable = {
	[true] = "#32c732ON",
	[false] ="#c73e32OFF",
}

("inco",function(p)
	if not getElementData(p,"logedin") then return end
	if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(p)),aclGetGroup("Moderator")) or isObjectInACLGroup("user."..getAccountName(getPlayerAccount(p)),aclGetGroup("Admin")) or isObjectInACLGroup("user."..getAccountName(getPlayerAccount(p)),aclGetGroup("ModChat")) then
		ukryty[p] = not ukryty[p]
		outputChatBox("#d63838[!] #ffffffTryb incognito: "..incognitoTable[ukryty[p]], p, 255, 255, 255, true)
	end
end)
-- For future


--[[

		if ( #msg / spacesCount ) > 20 and #msg > 20 then --check if there is at least one space per 20 or less characters
			outputChatBox ( "Do not spam the chat with long words!", playersource, 255, 0, 0 )
			return
		end

local upomnienia = {}
local upomnienia_timer = {}

local bad_words = {
	"jebac",
	"spierdalaj",
	"cipa",
	"pizda",
	"dziwka",
	"chuj",
	"kutas",
	"zjeb",
	"twojastara",
	"twojamatka",
	"twojamama",
	"twojtata",
	"twojstary",
	"twojojciec",
	"choj",
	"cwel",
}

function CheckIfItWordIsBad(word)
	word = word:gsub("%s","")
	for i,v in pairs(bad_words) do
		if word:find(v) then
			return true
		end
	end
	return false
end

		if CheckIfItWordIsBad(msg) then
			outputChatBox ( "Nie przeklinaj!", playersource, 255, 0, 0 )
			return
		end
		local zakazane = CheckIfItWordIsBad(msg)
		if zakazane then
			
			if not upomnienia[playersource] then
				upomnienia[playersource] = 1
				outputChatBox("#FF0000[Wielki Brat] Upomniał "..getPlayerName(playersource):gsub("#%x%x%x%x%x%x","").." powód: przekleństwa!",root,255,255,255,true)
			elseif upomnienia[playersource]>=3 then
				setPlayerMuted(playersource,5)
				upomnienia[playersource] = 0
				exports.admin:aSetPlayerMuted(playersource,true,300)
				outputChatBox("#FF0000[Wielka Siostra] zmutowła gracza "..getPlayerName(playersource):gsub("#%x%x%x%x%x%x","").." na 5 minut!",root,255,255,255,true)
			else
				upomnienia[playersource] = upomnienia[playersource] + 1
				outputChatBox("#FF0000[Wielki Brat] Upomniał "..getPlayerName(playersource):gsub("#%x%x%x%x%x%x","").." powód: przekleństwa!",root,255,255,255,true)
			end
			if isTimer(upomnienia_timer[playersource]) then
				killTimer(upomnienia_timer[playersource])
			end
			upomnienia_timer[playersource] = setTimer(function(player)
				if isElement(player) then
					if upomnienia[playersource]>=1 then
						upomnienia[playersource] = upomnienia[playersource] - 1
					end
				end
			end,3000,upomnienia[playersource],playersource)
			return
		end

]]