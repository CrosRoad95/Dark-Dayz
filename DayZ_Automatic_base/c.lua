

local gui = {}


gui["Window"] = guiCreateWindow(0.36, 0.30, 0.29, 0.53, "Baza id: -", true)
gui["tabPanel"] = guiCreateTabPanel(0, 0.05, 1, 1, true, gui["Window"])
guiWindowSetMovable(gui["Window"], false)
guiWindowSetSizable(gui["Window"], false)

local ujemna_wartosc = 0.05

gui["tab_1"] = guiCreateTab("Główne", gui["tabPanel"])

gui["tab_2"] = guiCreateTab("Limity", gui["tabPanel"])

gui["label_chuj_wie_ktory"] = guiCreateLabel(0.01, 0.01, 0.98, 0.31, "Ulepszanie bazy pozwala zwiększyć sloty pojazdów naziemnych, jak i pojazdów latająch, należy pamiętać że każde ulepszenie bazy więże się z dodatkową opłatą i podniesieniem ceny bazy. Przy zakupie ulepszenia zostanie automatycznie pobrana opłata za ulepszenie bazy. Koszt ulepszenia bazy wynosi 15 PP/ 10000 GP", true, gui["tab_2"])
guiLabelSetColor(gui["label_chuj_wie_ktory"], 0, 210, 35)
guiLabelSetHorizontalAlign(gui["label_chuj_wie_ktory"], "left", true)
guiLabelSetVerticalAlign(gui["label_chuj_wie_ktory"], "bottom")
gui["ktore_ulepszenie"] = guiCreateLabel(0.21, 0.44, 0.56, 0.04, "Ulepszenie: 0/3", true, gui["tab_2"])
guiLabelSetColor(gui["ktore_ulepszenie"], 6, 220, 172)
guiLabelSetHorizontalAlign(gui["ktore_ulepszenie"], "center", false)
gui["button_ulepsz"] = guiCreateButton(0.21, 0.56, 0.56, 0.06, "Ulepsz bazę", true, gui["tab_2"])
guiSetProperty(gui["button_ulepsz"], "NormalTextColour", "FFE9FB1B")
gui["label_chuj_wie_ktory2"] = guiCreateLabel(0.01, 0.66, 0.99, 0.33, "Każde ulepszenie, zwiększa limit pojazdów naziemnych o 2, oraz zwiększa limit pojazdów lotnych o 1", true, gui["tab_2"])
guiLabelSetColor(gui["label_chuj_wie_ktory2"], 218, 106, 7)
guiLabelSetHorizontalAlign(gui["label_chuj_wie_ktory2"], "center", true)
guiLabelSetVerticalAlign(gui["label_chuj_wie_ktory2"], "center")

gui['Label_1'] = guiCreateLabel(0.03, 0.07 - ujemna_wartosc, 0.95, 0.08, "Baza pozwala na przechowywanie namiotów, pojazdów w bezpiecznym miejscu, odizolowanym od innych niedobitków", true, gui["tab_1"])
guiLabelSetColor(gui['Label_1'], 229, 126, 25)
guiLabelSetHorizontalAlign(gui['Label_1'], "center", true)
guiCreateStaticImage(0.03, 0.19 - ujemna_wartosc, 0.11, 0.02, "uop.png", true, gui["tab_1"])
guiCreateStaticImage(0.165, 0.19 - ujemna_wartosc, 0.11, 0.02, "uop.png", true, gui["tab_1"])
guiCreateStaticImage(0.30, 0.19 - ujemna_wartosc, 0.11, 0.02, "uop.png", true, gui["tab_1"])
guiCreateStaticImage(0.44, 0.19 - ujemna_wartosc, 0.11, 0.02, "uop.png", true, gui["tab_1"])
guiCreateStaticImage(0.57, 0.19 - ujemna_wartosc, 0.11, 0.02, "uop.png", true, gui["tab_1"])
guiCreateStaticImage(0.71, 0.19 - ujemna_wartosc, 0.11, 0.02, "uop.png", true, gui["tab_1"])
guiCreateStaticImage(0.85, 0.19 - ujemna_wartosc, 0.11, 0.02, "uop.png", true, gui["tab_1"])
--
guiCreateStaticImage(0.03, 0.31 - ujemna_wartosc, 0.11, 0.02, "uop.png", true, gui["tab_1"])
guiCreateStaticImage(0.165, 0.31 - ujemna_wartosc, 0.11, 0.02, "uop.png", true, gui["tab_1"])
guiCreateStaticImage(0.30, 0.31 - ujemna_wartosc, 0.11, 0.02, "uop.png", true, gui["tab_1"])
guiCreateStaticImage(0.44, 0.31 - ujemna_wartosc, 0.11, 0.02, "uop.png", true, gui["tab_1"])
guiCreateStaticImage(0.57, 0.31 - ujemna_wartosc, 0.11, 0.02, "uop.png", true, gui["tab_1"])
guiCreateStaticImage(0.71, 0.31 - ujemna_wartosc, 0.11, 0.02, "uop.png", true, gui["tab_1"])
guiCreateStaticImage(0.85, 0.31 - ujemna_wartosc, 0.11, 0.02, "uop.png", true, gui["tab_1"])
--
guiCreateStaticImage(0.03, 0.63 - ujemna_wartosc, 0.11, 0.02, "uop.png", true, gui["tab_1"])
guiCreateStaticImage(0.165, 0.63 - ujemna_wartosc, 0.11, 0.02, "uop.png", true, gui["tab_1"])
guiCreateStaticImage(0.30, 0.63 - ujemna_wartosc, 0.11, 0.02, "uop.png", true, gui["tab_1"])
guiCreateStaticImage(0.44, 0.63 - ujemna_wartosc, 0.11, 0.02, "uop.png", true, gui["tab_1"])
guiCreateStaticImage(0.57, 0.63 - ujemna_wartosc, 0.11, 0.02, "uop.png", true, gui["tab_1"])
guiCreateStaticImage(0.71, 0.63 - ujemna_wartosc, 0.11, 0.02, "uop.png", true, gui["tab_1"])
guiCreateStaticImage(0.85, 0.63 - ujemna_wartosc, 0.11, 0.02, "uop.png", true, gui["tab_1"])

gui['Oplaca_bazy'] = guiCreateButton(0.02, 0.23 - ujemna_wartosc, 0.95, 0.05, "Opłac baze na 30 dni", true, gui["tab_1"])
gui['Label_2'] = guiCreateLabel(0.03, 0.86 - ujemna_wartosc, 0.94, 0.11, "W przypadku otrzymania statusu BAN, administracja nie przewiduje reklamacji. Przed zakupem przemyśl dwa razy!", true, gui["tab_1"])
guiLabelSetHorizontalAlign(gui['Label_2'], "center", true)
guiLabelSetVerticalAlign(gui['Label_2'], "bottom")
gui['Koszt_bazy'] = guiCreateLabel(0.04, 0.41 - ujemna_wartosc, 0.4, 0.04, "Koszt bazy: 10 PP", true, gui["tab_1"])

gui['Grupa_Bazy'] = guiCreateLabel(0.04, 0.46 - ujemna_wartosc, 0.40, 0.04, "Aktualna grupa:", true, gui["tab_1"])
gui['PP_gracza'] = guiCreateLabel(0.04, 0.51 - ujemna_wartosc, 0.26, 0.04, "Aktualne PP:", true, gui["tab_1"])
gui['N_L'] = guiCreateLabel(0.04, 0.46 - ujemna_wartosc, 0.5, 0.04, "Limity (N/L): ", true, gui["tab_1"])
gui['Dni_to_end'] = guiCreateLabel(0.04, 0.56 - ujemna_wartosc, 0.35, 0.04, "Dni do końca bazy:", true, gui["tab_1"])
gui['Typ_bazy'] = guiCreateLabel(0.04, 0.36 - ujemna_wartosc, 0.26, 0.04, "Typ bazy: Duża", true, gui["tab_1"])    
gui['Button_kup'] = guiCreateButton(0.48, 0.45 - ujemna_wartosc, 0.47, 0.05, "Kup baze", true, gui["tab_1"])
gui["Button_sell"] = guiCreateButton(0.48, 0.50 - ujemna_wartosc, 0.47, 0.05, "Sprzedaj baze", true, gui["tab_1"])
gui["Button_zamknij"] = guiCreateButton(0.48, 0.551 - ujemna_wartosc, 0.47, 0.05, "Zamknij", true, gui["tab_1"])
gui["Label_3"] = guiCreateLabel(0.03, 0.76 - ujemna_wartosc, 0.94, 0.13, "W przypadku sprzedawania bazy, cała baza zostanie wyczyszczona, czyli zostaną usunięte namioty i pojazdy z bazy, za sprzedasz bazy otrzymasz PP w wysokości: ~ (cena/30) * [Oplacona na ile dni]", true, gui["tab_1"])
guiLabelSetHorizontalAlign(gui["Label_3"], "center", true)
gui["Label_4"] = guiCreateLabel(0.04, 0.69 - ujemna_wartosc, 0.94, 0.04, "Koszt opłaty bazy wynośi: cena / 2", true, gui["tab_1"])
guiLabelSetColor(gui["Label_4"], 236, 214, 22)
guiLabelSetHorizontalAlign(gui["Label_4"], "center", true)    
guiSetVisible(gui['Grupa_Bazy'],false)
--guiLabelSetColor(gui['Label_3'], 253, 0, 0)
guiLabelSetColor(gui['Label_2'], 253, 0, 0)
guiSetProperty(gui['Button_sell'],"NormalTextColour", "FFFF0000")	
guiSetProperty(gui['Button_kup'],"NormalTextColour", "FF27C937")	
guiSetProperty(gui['Oplaca_bazy'],"NormalTextColour", "FF27C937")	
guiSetProperty(gui['Button_zamknij'],"NormalTextColour", "FFECD616")	

gui["tab_3"] = guiCreateTab("Radio", gui["tabPanel"])

gui["radio_edit"] = guiCreateEdit(0.15, 0.3, 0.7, 0.05, "Wpisz url", true, gui["tab_3"])
gui["radio_zsuwak"] = guiCreateScrollBar(0.15, 0.4, 0.7, 0.05, true, true, gui["tab_3"])
gui["radio_label"] = guiCreateLabel(0.15, 0.1, 0.7, 0.1, "Aktualnie gra: RockstarGame launcher \n", true, gui["tab_3"])
guiLabelSetVerticalAlign(gui["radio_label"], "center")
guiLabelSetHorizontalAlign(gui["radio_label"], "center")
gui["radio_zapis"] = guiCreateButton(0.395, 0.5, 0.2, 0.07, "Zapisz", true, gui["tab_3"])



local language = {
	["PL"] = {
		[gui['Oplaca_bazy']] = "Opłac baze na 30 dni",
		[gui['Label_1']] = "Baza pozwala na przechowywanie namiotów, pojazdów w bezpiecznym miejscu, odizolowanym od innych niedobitków",
		[gui['Label_2']] = "W przypadku otrzymania statusu BAN, administracja nie przewiduje reklamacji. Przed zakupem przemyśl dwa razy!",
		[gui['Label_3']] = "W przypadku sprzedawania bazy, cała baza zostanie wyczyszczona, czyli zostaną usunięte namioty i pojazdy z bazy, za sprzedasz bazy otrzymasz PP w wysokości: ~ ((cena/2)/30) * [Oplacona na ile dni]",
		[gui['Label_4']] = "Koszt opłaty bazy wynośi: cena / 2!",
		[gui['Button_kup']] = "Kup baze",
		[gui['Button_sell']] = "Sprzedaj baze",
		[gui['Button_zamknij']] = "Zamknij",
	},
	["ENG"] = {
		[gui['Oplaca_bazy']] = "Pay the base for 30 days",
		[gui['Label_1']] = "The base allows you to store tents and vehicles in a safe place, isolated from other survivors",
		[gui['Label_2']] = "If you receive the BAN status, the administration does not provide for a complaint. Think twice before buying!",
		[gui['Label_3']] = "If the base is sold, the whole base will be cleared, i.e. tents and vehicles will be removed from the base, for selling the base you will receive PP in the amount of: ~ ((price / 2) / 30) * [Days]",
		[gui['Label_4']] = "The cost of the base fee is: price / 2!",
		[gui['Button_kup']] = "Buy base",
		[gui['Button_sell']] = "Sell base",
		[gui['Button_zamknij']] = "Close",
	},
}

local language2 = {
	['PL'] = {
		['rozbudowa'] = "Rozbudowa bazy pozwala na zwiększenie slotów dla pojazdów naziemnych i statków powietrznych, pamiętaj, że każde ulepszenie bazy wiąże się z dodatkowym kosztem i podnosi cenę bazową. Przy zakupie uaktualnienia automatycznie zostanie naliczona podstawowa opłata za uaktualnienie.  Koszt ulepszenia bazy to 15 PP / 10 000 GP",
		['rozbudowa2'] = "Każde ulepszenie zwiększa limit pojazdów naziemnych o 2 i zwiększa limit pojazdów powietrznych o 1",
		['upgrade'] = "Ulepsz Bazę",
		['limit'] = "Limity",
		['glowne'] = "Główne",
		['radio'] = "Radio",
	},
	['ENG'] = {
		['rozbudowa'] = "Upgrading the base allows you to increase the slots of ground vehicles and aerial vehicles, remember that each upgrade of the base has an additional cost and increases the base price. When purchasing an upgrade, you will be charged a base upgrade fee automatically.  The cost to upgrade your base is 15 PP / 10,000 GP",
		['rozbudowa2'] = "Each upgrade increases the ground vehicle limit by 2, and increases the air vehicle limit by 1",
		['upgrade'] = "Upgrade Base",
		['limit'] = "Limits",
		['glowne'] = "Main",
		['radio'] = "Music",
	},
}

function refresz()
local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	 guiSetText(gui['label_chuj_wie_ktory'], language2[jezyk]['rozbudowa'])
	 guiSetText(gui['label_chuj_wie_ktory2'], language2[jezyk]['rozbudowa2'])
	 guiSetText(gui['button_ulepsz'], language2[jezyk]['upgrade'])
	 guiSetText(gui['tab_2'], language2[jezyk]['limit'])
	 guiSetText(gui['tab_1'], language2[jezyk]['glowne'])
	 guiSetText(gui['tab_3'], language2[jezyk]['radio'])
end
setTimer(refresz, 2000, 0)

local baza_edited_id = nil

guiSetVisible(gui['Window'],false)

function setTlumaczonko()
	local jezyk = getElementData(localPlayer,"Jezyk_Gry") or "PL"
	for k,v in pairs(language[jezyk]) do
		guiSetText(k,v)
	end
end

addEventHandler("onClientGUIClick", gui["radio_zapis"], function()
	local text = guiGetText(gui["radio_edit"])
	local volume = math.floor(guiScrollBarGetScrollPosition(gui["radio_zsuwak"])) / 10
	triggerServerEvent("setBazaRadio", resourceRoot, baza_edited_id, text, volume)
end, false)

local function odswiezFromDane(dane,lider_zgadza_sie, changePage)
local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	if not changePage then
		guiSetSelectedTab(gui["tabPanel"], gui["tab_1"])
	end
	if lider_zgadza_sie or getElementData(localPlayer, "duty") then
		guiSetEnabled(gui["tab_2"], true)
		if (dane["platnosc"] == "PP" and tonumber(dane["cena"]) >= 70) or (dane["platnosc"] == "GP" and tonumber(dane["cena"]) >= 70 * 250) then
			guiSetEnabled(gui["tab_3"], true)
		else
			guiSetEnabled(gui["tab_3"], false)
		end
	else
		guiSetEnabled(gui["tab_3"], false)
		guiSetEnabled(gui["tab_2"], false)
	end
	if guiGetEnabled(gui["tab_3"]) then
		if jezyk =="PL" then
			guiSetText(gui["ktore_ulepszenie"], "Ulepszenie: "..dane["baza_ulepszenie"].."/3")
		else
			guiSetText(gui["ktore_ulepszenie"], "Upgrade: "..dane["baza_ulepszenie"].."/3")
		end	
	end
	baza_edited_id = tonumber(dane["id"])
	if jezyk =="PL" then
			guiSetText(gui['Koszt_bazy'],"Koszt bazy: "..dane["cena"].." "..dane["platnosc"])
			guiSetText(gui['Typ_bazy'],"Typ bazy: "..dane["typ"])
			guiSetText(gui['Dni_to_end'],"Dni do wygaśnięcia: "..dane["dni"])
			guiSetText(gui['Grupa_Bazy'],"Aktualna grupa: "..dane["grupa"])
			guiSetText(gui['Window'],"Baza id: "..dane["id"])
			guiSetText(gui['PP_gracza'],"Aktualne "..dane["platnosc"]..": "..(getElementData(localPlayer,dane["platnosc"]) or 0))
		else
			guiSetText(gui['Koszt_bazy'],"Base cost: "..dane["cena"].." "..dane["platnosc"])
			guiSetText(gui['Typ_bazy'],"Base type: "..dane["typ"])
			guiSetText(gui['Dni_to_end'],"Days to expiry: "..dane["dni"])
			guiSetText(gui['Grupa_Bazy'],"Current group: "..dane["grupa"])
			guiSetText(gui['Window'],"Base id: "..dane["id"])
			guiSetText(gui['PP_gracza'],"Current "..dane["platnosc"]..": "..(getElementData(localPlayer,dane["platnosc"]) or 0))
		end	
	if dane["baza_ulepszenie"] > 0 then
		if jezyk =="PL" then
			guiSetText(gui['N_L'],"Limity (N/L): "..dane["limity"][1].." + "..(dane["baza_ulepszenie"] * 2).."/"..dane["limity"][2].." + "..(dane["baza_ulepszenie"]))
		else
			guiSetText(gui['N_L'],"Limits (Veh/Air): "..dane["limity"][1].." + "..(dane["baza_ulepszenie"] * 2).."/"..dane["limity"][2].." + "..(dane["baza_ulepszenie"]))
		end	
	else
		if jezyk =="PL" then
			guiSetText(gui['N_L'],"Limity (N/L): "..dane["limity"][1].."/"..dane["limity"][2])
		else
			guiSetText(gui['N_L'],"Limits (Veh/Air) "..dane["limity"][1].."/"..dane["limity"][2])
		end	
	end
	if not lider_zgadza_sie then
		guiSetEnabled(gui['Oplaca_bazy'],false)
		guiSetEnabled(gui['Button_sell'],false)
		guiSetEnabled(gui['Button_kup'],true)
	else
		guiSetEnabled(gui['Button_kup'],false)
		guiSetEnabled(gui['Oplaca_bazy'],true)
		guiSetEnabled(gui['Button_sell'],true)
	end
end


addEventHandler('onClientGUIClick',gui['Button_kup'],function(click)
	if click ~= "left" then return end
	triggerServerEvent("KupBaze",resourceRoot,localPlayer)
end,false)

addEventHandler('onClientGUIClick',gui['Oplaca_bazy'],function()
	triggerServerEvent("OplacBaze",resourceRoot,localPlayer)
end,false)

addEventHandler("onClientGUITabSwitched", gui["tab_3"], function()
	local marker = getElementByID("baza_marker_"..baza_edited_id,0)
	if marker then
		local url = getElementData(marker, "Muza-Radio")
		local curr_play = searchSound(url)
		
		
		if curr_play then
			guiSetText(gui["radio_edit"], curr_play[3])
			local meta = getSoundMetaTags(curr_play[2])
			guiSetText(gui["radio_label"], tostring(meta["title"]))
			outputChatBox(inspect(meta))
			guiScrollBarSetScrollPosition(gui["radio_zsuwak"], curr_play[4] * 10)
		end
	end
end,false)


addEventHandler('onClientGUIClick',gui['Button_zamknij'],function(click)
	if click ~= "left" then return end
	guiSetVisible(gui['Window'],false)
	showCursor(false)
	setElementData(localPlayer,"Dane_bazy",nil)
end,false)

addEventHandler('onClientGUIClick',gui['Button_sell'],function(click)
	if click ~= "left" then return end
	triggerServerEvent("SellBaze",resourceRoot,localPlayer)
	
end,false)



addEventHandler("onClientGUIClick", gui["button_ulepsz"], function()
	triggerServerEvent("UlepszBaze", resourceRoot, baza_edited_id)
end, false)


local function PokazGUI(arg,dane,lider_zgadza_sie, pageRefresh)
	if arg then
		setTlumaczonko()
		guiSetVisible(gui['Window'],true)
		
		odswiezFromDane(dane,lider_zgadza_sie, pageRefresh)
		showCursor(true,false)
		toggleControl("fire",false)
	else
		guiSetVisible(gui['Window'],false)
		showCursor(false)
		toggleControl("fire",true)
	end
end
addEvent("PokazGUI",true)
addEventHandler("PokazGUI",resourceRoot,PokazGUI)





bindKey("I","both",function(_,keyState)
	if keyState == "down" then
		for i,v in pairs(getElementsByType("marker",resourceRoot)) do
			if getElementData(v,"Blip_id") then
				local blip = createBlipAttachedTo(v,getElementData(v,"Blip_id"),2,255,0,0,255,0,300)
				setElementData(blip,"Marker-Opis",getElementData(v,"Marker-Opis"))
			end
		end
	elseif keyState == "up" then
		for i,v in pairs(getElementsByType('blip',resourceRoot)) do
			if getBlipIcon(v) ~= 35 then
				destroyElement(v)
			end
		end
	end
end)

-- tool
--[[
if getPlayerName(localPlayer) == "Chojrak" then
addEventHandler("onClientPlayerWeaponFire",localPlayer,function(weapon,ammo,clip,endx,endy,endz,hit)
	if hit then
		local x,y,z = getElementPosition(hit)
		outputChatBox(x..","..y..","..z)
	end
end)
end]]


local last_bases = {}


function gownoPsie()
	local bazy = getElementData(localPlayer,"Global_Base_Id") or toJSON({})
	bazy = fromJSON(bazy)
	for i,v in pairs(last_bases) do
		if isElement(v) then
			destroyElement(v)
		end
	end
	for i,v in pairs(bazy) do
		local marker = getElementByID("baza_marker_"..i)
		if marker then
			local blip = createBlipAttachedTo(marker,35,0,0,0,0,0,0,300)
			table.insert(last_bases,blip)
		end
	end
end
gownoPsie()
setTimer(gownoPsie,60000,0)

local muzykamenty = {}

setTimer(function()
	local checked = 0
	for i,v in pairs(getElementsByType("object",resourceRoot)) do
		if getElementModel(v) == 2226 then
			local muza = getElementData(v, "Muza-Radio")
			local glosnosc = getElementData(v, "Muza-glosnosc")
			local sound = playSound3D(muza, Vector3(getElementPosition(v)))
			setSoundVolume(sound, glosnosc)
			table.insert(muzykamenty, {v, sound, muza, glosnosc})
			setSoundMaxDistance(sound,50)
			setSoundMinDistance(sound,30)
			checked = checked + 1
		end
	end
	if checked == 0 then return end
	killTimer(sourceTimer)
end,1000,0)

function searchSound(url)
	for i, v in pairs(muzykamenty) do
		if v[3] == url then
			return v
		end
	end
	return false
end

setTimer(function()
	if muzykamenty == {} then return end
	for i, v in pairs(muzykamenty) do
		local muza = getElementData(v[1], "Muza-Radio")
		local glosnosc = getElementData(v[1], "Muza-glosnosc")
		if muza ~= v[3] or glosnosc ~= v[4] then
			table.remove(muzykamenty, i)
			destroyElement(v[2])
			local sound = playSound3D(muza, Vector3(getElementPosition(v[1])))
			setSoundVolume(sound, glosnosc)
			table.insert(muzykamenty, {v[1], sound, muza, glosnosc})
			setSoundMaxDistance(sound,50)
			setSoundMinDistance(sound,30)
		end
	end
end, 1000,0)

local shader_code = [[
texture Tex0;

technique simple
{
    pass P0
    {
        //-- Set up texture stage 0
        Texture[0] = Tex0;

        //-- Leave the rest of the states to the default settings
    }
}
]]
local texture = dxCreateTexture("chuj.png")
setTimer(function()
	local obj = getElementByID("vertanChuj obiekt (1)")
	if isElement(obj) then
		killTimer(sourceTimer)
		
		local shader = dxCreateShader(shader_code,0,0,true)
		dxSetShaderValue(shader,"Tex0",texture)
		engineApplyShaderToWorldTexture(shader,"door",obj,false)
	end
end,1000,0)



local rec = dxCreateRenderTarget(100,100,true)
function refreshRenderTarget()
	dxSetRenderTarget(rec,true)
	dxDrawRectangle(0,0,100,100,tocolor(150,0,0,255))
	dxSetRenderTarget()
end
refreshRenderTarget()

addEventHandler("onClientRestore",root,refreshRenderTarget)


local shader = dxCreateShader(shader_code,0,0,true)
dxSetShaderValue(shader,"Tex0",rec)
engineApplyShaderToWorldTexture(shader,"blugrad32")

--[[
addEventHandler("onClientPlayerNetworkStatus", root, function(status)
	if status == 0 then
		setElementFrozen(source,true)
	else
		setElementFrozen(source,false)
	end
end)]]

addEventHandler("onClientVehicleStartEnter", root, function(player,seat,door)
	if (player == localPlayer) then
		if getElementData(source, "inBase") then
			if not getElementData(player, "in_base") then cancelEvent(); end
		end
	end
end)

function isPlayerInBase(player, base_id)
	local json = getElementData(player, "Global_Base_Id") if not json then return false end

	local bases = fromJSON(json)

	base_id = tonumber(base_id)

	for k, v in pairs(bases) do
		if base_id == tonumber(k) then return true end
	end


	return false;
end
