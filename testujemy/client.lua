

function showtime ()
	local time = getRealTime()
	local hours = time.hour
	local minutes = time.minute
	local seconds = time.second
	-- Make sure to add a 0 to the front of single digits.
	if (hours == 13) and (minutes == 58) then
		outputChatBox ( "dziala")
		else 
		outputChatBox ( "wylaczone")
	end
	--[[if (minutes == 55) then
		outputChatBox ( "dziala")
		else 
		outputChatBox ( "wylaczone")
	end]]--
end
addCommandHandler("showtime", showtime)

function currentTime()
    local timehour, timeminute = getTime()
    outputChatBox( "The current game time is "..timehour..":"..timeminute )
	if timehour == 13 and timeminute == 55 then
	outputChatBox ( "dziala")
	end
end
addCommandHandler("gettime", currentTime)