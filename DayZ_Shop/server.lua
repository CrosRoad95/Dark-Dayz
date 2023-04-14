local language = {
	["PL"] = {
		['Nie stać Cie'] = "#d63838[!]#FFFFFF Nie stać cię na ten przedmiot na ten przedmiot!",
		['Sloty'] = "#d63838[!]#FFFFFF Posiadasz za mało slotów, aby kupić ten przedmiot!",
		['BUY'] = "#d63838[!]#FFFFFF Kupiłeś przedmiot: ",
		['SELL'] = "#d63838[!]#FFFFFF Sprzedałeś przedmiot: ",
		['Uzycie'] = "#d63838[!]#FFFFFF Użycie: /paygp #b0abab<#c9c3c3id lub nick#b0abab> <#c9c3c3gp>#decf9e.",
		['Uzycie PP'] = "#d63838[!]#FFFFFF Użycie: /paypp #b0abab<#c9c3c3id lub nick#b0abab> <#c9c3c3pp>#decf9e.",
		['Not find'] = "#d63838[!]#FFFFFF Nie znaleziono gracza!",
		['Yourself Money'] = "#d63838[!]#FFFFFF Nie możesz sobie wysłać pieniędzy!",
		['Przelales'] = "#d63838[!]#FFFFFF Przelałeś %s - %s GP!",
		['Przelales PP'] = "#d63838[!]#FFFFFF Przelałeś %s - %s PP!",
		['Otrzymane'] = "#d63838[!]#FFFFFF Otrzymałeś %s GP od %s!",
		['Otrzymane PP'] = "#d63838[!]#FFFFFF Otrzymałeś %s PP od %s!",
	},
	['ENG'] = {
		['Nie stać Cie'] = "#d63838[!]#FFFFFF You don't have enought GP!",
		['Sloty'] = "#d63838[!]#FFFFFF You don't have enought slots!",
		['BUY'] = "#d63838[!]#FFFFFF You bought: ",
		['SELL'] = "#d63838[!]#FFFFFF You sold: ",
		['Uzycie'] = "#d63838[!]#FFFFFF Use: /paygp #b0abab<#c9c3c3id or nick#b0abab> <#c9c3c3gp>#decf9e.",
		['Uzycie PP'] = "#d63838[!]#FFFFFF Use: /paypp #b0abab<#c9c3c3id or nick#b0abab> <#c9c3c3pp>#decf9e.",
		['Not find'] = "#d63838[!]#FFFFFF Couldn't find the player!",
		['Yourself Money'] = "#d63838[!]#FFFFFF You can't pay yourself!",
		['Przelales'] = "#d63838[!]#FFFFFF You pay %s a %s GP!",
		['Przelales PP'] = "#d63838[!]#FFFFFF You pay %s a %s PP!",
		['Otrzymane'] = "#d63838[!]#FFFFFF You has got %s GP from %s!",
		['Otrzymane PP'] = "#d63838[!]#FFFFFF You has got %s PP from %s!",
	},
}



addEvent('KupPrzedmiot',true)
addEventHandler('KupPrzedmiot',resourceRoot,function(player,item)
	local jezyk = getElementData(player,'Jezyk_Gry') or "PL"
	if (getElementData(player,"GP") or 0)<tonumber(item[1]) then
		outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] "..language[jezyk]['Nie stać Cie'],player,255,255,255,true)
		return
	end
	if exports['DayZ_core']:getElementCurrentSlots(player) + exports['DayZ_core']:getItemSlots(item[2])*tonumber(item[4])>getElementData(player,'MAX_Slots') + (getElementData(player,"Custom_Slots") or 0) then
		outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] "..language[jezyk]['Sloty'],player,255,255,255,true)
		return
	end
	local data = getElementData(player,item[2]) or 0
	setElementData(player,item[2],data+tonumber(item[4]))
	--if item[2]=="Custom_Slots" then
		--setElementData(player,'MAX_Slots',getElementData(player,'MAX_Slots')+tonumber(item[4]))
	--end
	--takePlayerMoney(player,tonumber(item[1]))
	setElementData(player,"GP",(getElementData(player,"GP") or 0)-tonumber(item[1]))
	outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] "..language[jezyk]['BUY']..item[3].."!",player,255,255,255,true)
	triggerClientEvent(player,"DayZ_Shop:showMeGunMenu",resourceRoot)
end)


addEventHandler('onPlayerQuit',root,function()
	local acc = getPlayerAccount(source)
	if not isGuestAccount(acc) then
		local data = getElementData(source,"GP") or 0
		setAccountData(acc,'GP',data)
	end
end)


addEventHandler('onPlayerLogin',root,function()
	local acc = getPlayerAccount(source)
	if not isGuestAccount(acc) then
		local data = getAccountData(acc,'GP') or 0
		setElementData(source,"GP",data)
	end
end)




function gp_payments(player,cmd,target,ilosc)
	local jezyk = getElementData(player,"Jezyk_Gry") or "PL"
	if not target then outputChatBox("#dddddd"..language[jezyk]['Uzycie'],player,255,255,255,true) return end
	if not ilosc then outputChatBox("#dddddd"..language[jezyk]['Uzycie'],player,255,255,255,true) return end
	if not tonumber(ilosc) then outputChatBox("#dddddd"..language[jezyk]['Uzycie'],player,255,255,255,true) return end

	local FromID = exports.DayZ_Id:GetPlayerFromID(tonumber(target))
	local FromNick = getPlayerFromName(target)

	local target_2

	if FromID then
		target_2 = FromID
	elseif FromNick then
		target_2 = FromNick
	end

	ilosc = math.floor(tonumber(ilosc))

	if not target_2 then
		outputChatBox("#dddddd"..language[jezyk]['Not find'],player,255,255,255,true)
		return
	end
	if target_2 == player then
		outputChatBox("#dddddd"..language[jezyk]['Yourself Money'],player,255,255,255,true)
		return
	end
	if (getElementData(player,"GP") or 0) < ilosc then
		outputChatBox("* Błąd!",player,255,0,0)
		return
	end
	if ilosc <= 0 then
		outputChatBox("* Błąd!",player,255,0,0)
		return
	end
	outputChatBox("#dddddd"..string.format(language[jezyk]['Przelales'],getPlayerName(target_2),ilosc),player,255,255,255,true)
	outputChatBox("#dddddd"..string.format(language[jezyk]['Otrzymane'],ilosc,getPlayerName(player)),target_2,255,255,255,true)
	--givePlayerMoney(target_2,tonumber(ilosc))
	setElementData(target_2,"GP",(getElementData(target_2,"GP") or 0)+ilosc)
	setElementData(player,"GP",(getElementData(player,"GP") or 0)-ilosc)
	--takePlayerMoney(player,tonumber(ilosc))
end
("paygp", gp_payments)
addCommandHandler("gp.przelej", gp_payments)


function pp_payments(player,cmd,target,ilosc)
	local jezyk = getElementData(player,"Jezyk_Gry") or "PL"
	if not target then outputChatBox("#dddddd"..language[jezyk]['Uzycie PP'],player,255,255,255,true) return end
	if not ilosc then outputChatBox("#dddddd"..language[jezyk]['Uzycie PP'],player,255,255,255,true) return end
	if not tonumber(ilosc) then outputChatBox("#dddddd"..language[jezyk]['Uzycie PP'],player,255,255,255,true) return end

	local FromID = exports.DayZ_Id:GetPlayerFromID(tonumber(target))
	local FromNick = getPlayerFromName(target)

	local target_2

	if FromID then
		target_2 = FromID
	elseif FromNick then
		target_2 = FromNick
	end

	ilosc = math.floor(tonumber(ilosc))


	if not target_2 then
		outputChatBox("#dddddd"..language[jezyk]['Not find'],player,255,255,255,true)
		return
	end
	if target_2 == player then
		outputChatBox("#dddddd"..language[jezyk]['Yourself Money'],player,255,255,255,true)
		return
	end
	if (getElementData(player,"PP") or 0) < ilosc then
		outputChatBox("* Błąd!",player,255,0,0)
		return
	end
	if tonumber(ilosc) <= 0 then
		outputChatBox("* Błąd!",player,255,0,0)
		return
	end
	outputChatBox("#dddddd"..string.format(language[jezyk]['Przelales PP'],getPlayerName(target_2),ilosc),player,255,255,255,true)
	outputChatBox("#dddddd"..string.format(language[jezyk]['Otrzymane PP'],ilosc,getPlayerName(player)),target_2,255,255,255,true)
	--givePlayerMoney(target_2,tonumber(ilosc))
	setElementData(target_2,"PP",(getElementData(target_2,"PP") or 0)+ilosc)
	setElementData(player,"PP",(getElementData(player,"PP") or 0)-ilosc)
	--takePlayerMoney(player,tonumber(ilosc))
	
end
addCommandHandler("paypp", pp_payments)
addCommandHandler("pp.przelej", pp_payments)

local gp_sell_limit = {}
local limit_na_dzien = 4000

function f_gpLimit(p)
	if not gp_sell_limit[p] then
		gp_sell_limit[p] = {sprzedano = 0, reset = getTickCount() + 86400000}
		return 0
	elseif gp_sell_limit[p] and gp_sell_limit[p].reset < getTickCount() then
		gp_sell_limit[p] = {sprzedano = 0, reset = getTickCount() + 86400000}
		return 0
	else
		return gp_sell_limit[p].sprzedano
	end
end

function f_addLimit(p, add)
	if gp_sell_limit[p] then
		gp_sell_limit[p].sprzedano = gp_sell_limit[p].sprzedano  + add
		return true
	end
	return false
end

addEvent("SellPrzedmiot",true)
addEventHandler("SellPrzedmiot",resourceRoot,function(player,item)
	local jezyk = getElementData(player,'Jezyk_Gry') or "PL"
	if (getElementData(player,item[2]) or 0)<1 then
		outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] Nie posiadasz tego przedmiotu!",player,255,255,255,true)
		return
	end
	if f_gpLimit(getElementData(player, "logedin")) >= limit_na_dzien then
		triggerClientEvent(player, "stworz_notyfikacje", player, "error", "Możesz sprzedać jedynie 4k gp na dzień!")
		return
	end
	local data = getElementData(player,item[2]) or 0
	setElementData(player,item[2],data-tonumber(item[4]))
	f_addLimit(getElementData(player, "logedin"), tonumber(item[1]))
	setElementData(player,"GP",(getElementData(player,"GP") or 0)+tonumber(item[1]))
	--outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] "..language[jezyk]['SELL']..item[3].."!",player,255,255,255,true)
	triggerClientEvent(player, "stworz_notyfikacje", player, "sucess", language[jezyk]['SELL']..item[3].."!")
	triggerClientEvent(player,"DayZ_Shop:showMeGunMenu",resourceRoot)
end)





