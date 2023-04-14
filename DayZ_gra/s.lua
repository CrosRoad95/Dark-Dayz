



local dzialania = {
	[" - "] = function(a,b)
		return a - b;
	end,
	[" + "] = function(a,b)
		return a + b;
	end,
}

function getDzialanie()
	local t = {}
	for k,v in pairs(dzialania) do
		table.insert(t,k)
	end
	return t[math.random(1,#t)]
end

local gp
local realNumber
local timer_endgame

function getHightValue(l1,l2)
	if l1 > l2 then
		return {l1,l2}
	end
	return {l2,l1}
end

function rozpocznijGre()
	outputChatBox("#FA9A0A--------------------------------------------------------------------------------",root,255,255,255,true)
	gp = math.random(20,50)
	outputChatBox("#FA9A0ARozpoczyna konkurs matematyczny do wygrania: #72FA0A"..gp.." GP",root,255,255,255,true)
	local liczba = getHightValue(unpack({math.random(0,200),math.random(0,200)}))
	local dzialanie = getDzialanie()
	realNumber = dzialania[dzialanie](liczba[1],liczba[2])
	outputChatBox("#72FA0AIle wynosi działanie: "..liczba[1]..dzialanie..liczba[2],root,255,255,255,true)
	outputChatBox("#FA9A0A--------------------------------------------------------------------------------",root,255,255,255,true)
	timer_endgame = setTimer(endGame,45000,1)
end




function endGame(jest)
	if jest then
		outputChatBox("#FA9A0AZwycięża: #72FA0A"..getPlayerName(jest),root,255,255,255,true)
		if isTimer(timer_endgame) then
			killTimer(timer_endgame)
		end
		setElementData(jest,"GP",(getElementData(jest,"GP") or 0) + gp)
		gp = nil
		realNumber = nil
		
	else
		outputChatBox("#FA9A0ADarkDayZ Poprawna odpowiedz to: #72FA0A"..realNumber,root,255,255,255,true)
		realNumber = nil
	end
	setTimer(rozpocznijGre,60000*10,1)
end
rozpocznijGre()

addCommandHandler("globalchat",function(p,cmd,num)
	if not realNumber then return end
	if not getElementData(p,'logedin') then return end
	if not num or not tonumber(num) then return end
	if realNumber == tonumber(num) then
		endGame(p)
	end
end)

