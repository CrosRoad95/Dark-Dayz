

local rozpoczeta_gra = false
local pula = 0
local wyniki_za = nil
local dostepne_numerki = {}
local wplacil = {}
local timer
local godzina_ostatniego_losowania = nil

function rozpocznijTotolotka()
	rozpoczeta_gra = true
	triggerClientEvent(root,"Totolotek_pokaz",resourceRoot,true)
	outputChatBox("#cccccc[#28D0E2Totolotek#cccccc] Loteria rozpoczeła się! Wpisz /deposit [numer 1-100] aby wziąść udział! Koszt to 100 GP",root,255,255,255,true)
	wyniki_za = getTickCount() + 20000
	wplacil = {}
	dostepne_numerki = {}
	setElementData(resourceRoot,"Totolotek_Pula",pula)
	addEventHandler("onPlayerLogin",root,onLogged)
	timer = setTimer(function()
		if getTickCount() > wyniki_za then
			pokazWyniki()
		end
	end,1000,0)
end


setTimer(function()
	local haur = getRealTime().hour
	if haur >= 17 and haur <= 20 then
		if godzina_ostatniego_losowania ~= haur then
			rozpocznijTotolotka();
			godzina_ostatniego_losowania = haur
		end
	end
end,60000,0)

function pokazWyniki()
	rozpoczeta_gra = false
	local los = math.random(1,100)
	
	if not dostepne_numerki[los] then
		outputChatBox("#cccccc[#28D0E2Totolotek#cccccc] Szczęsliwy numerek to: #ff0000"..los.."#cccccc niestety nikomu nie udało się trafić!",root,255,255,255,true)
	else
		local konto_wygranego = dostepne_numerki[los][2]
		local wygrany_gracz = dostepne_numerki[los][1]
		if isElement(wygrany_gracz) then
			setElementData(wygrany_gracz,"GP",getElementData(wygrany_gracz,"GP")+pula)
		else
			konto_wygranego = getAccount(konto_wygranego)
			setAccountData(konto_wygranego,"GP",getAccountData(konto_wygranego,"GP")+pula)
		end
		outputChatBox("#cccccc[#28D0E2Totolotek#cccccc] Szczęsliwy numerek to: #ff0000"..los.."#cccccc Zwycięzcą zostaje: #ff0000"..konto_wygranego.."#cccccc Wygrywa on: "..pula.." GP!",root,255,255,255,true)
		pula = 0
	end
	
	triggerClientEvent(root,"Totolotek_pokaz",resourceRoot,false)
	killTimer(timer)
	removeEventHandler("onPlayerLogin",root,onLogged)
end

function onLogged()
	if rozpoczeta_gra then
		triggerClientEvent(source,"Totolotek_pokaz",resourceRoot,true)
	end
end


addCommandHandler("deposit",function(player,cmd,numerek)
	if not rozpoczeta_gra then
		outputChatBox("#cccccc[#28D0E2Totolotek#cccccc] Gra się nie rozpoczeła!",player,255,255,255,true)
		return
	end
	numerek = tonumber(numerek)
	if not getElementData(player,'logedin') then return end
	if not numerek then return end
	if (getElementData(player,"GP") or 0) < 100 then
		outputChatBox("#cccccc[#28D0E2Totolotek#cccccc] Nie posiadasz wystarczającej ilości GP!",player,255,255,255,true)
		return
	end
	if numerek >= 1 and numerek <= 100 then
		if dostepne_numerki[numerek] then
			outputChatBox("#cccccc[#28D0E2Totolotek#cccccc] Ten numerek jest już zajęty!",player,255,255,255,true)
			return
		end
		if wplacil[getElementData(player,"logedin")] then
			outputChatBox("#cccccc[#28D0E2Totolotek#cccccc] Zabrałeś już głos!",player,255,255,255,true)
			return
		end
		wyniki_za = wyniki_za + 500
		wplacil[getElementData(player,"logedin")] = true
		pula = pula + 100
		setElementData(player,"GP",(getElementData(player,"GP") or 0)-100)
		setElementData(resourceRoot,"Totolotek_Pula",pula)
		dostepne_numerki[numerek] = {getElementData(player,"logedin"),getPlayerName(player)}
	end
end)