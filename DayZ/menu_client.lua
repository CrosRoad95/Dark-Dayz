local sW,sH = guiGetScreenSize();
local theTableMenuScroll = {};
local isInFirePlace = false;
local newbieShow = false;
local newbieHead = "";
local newbieText = "";
local newbiePosition = 0, 0, 0;

addEvent("showClientMenuItem", true);
addEvent("disableMenu", true);

local h1, h2, h3 = debug.gethook()
debug.sethook()

debug.sethook( _, h1, h2, h3 )

function createScrollMenuMessage(text, r, g, b, data)
	table.insert(theTableMenuScroll, {text, r, g, b, data});
end
local scale = 1

if sH>768 then
	scale  = sH/768
end

local changed_name = {
	--[[["Mesa"] = "VAZ 2121 Niva",
	["Buffalo"] = "CHARGER SRT8",
	["Camper"] = "BAE JLTV",
	["S.W.A.T."] = "BTR-70",
	["Bobcat"] = "Ford F-150",
	["Sandking"] = "Ford Explorer",
	["Sunrise"] = "Mitsubishi Lancer",
	["Bullet"] = "Frankenstein",]]--
}

function getVehiclePseudoName(vehName)
	if changed_name[vehName] then
		return changed_name[vehName]
	end
	return vehName
end


local language = {
	['PL'] = {
		['Podnies'] = "Podnieś",
		['Przeszukaj'] = "Przeszukaj",
		['Napraw'] = "Napraw",
		['Usun Kolo'] = "Wymontuj koło",
		['Usun Silnik'] = "Wymontuj silnik",
		['Usun Zbiornik'] = "Wymontuj zbiornik",
		['Usun szybe'] = "Wymontuj szybe kuloodporna",
		['Dodaj Silnik'] = "Zamontuj silnik",
		['Dodaj Kolo'] = "Zamontuj koło",
		['Dodaj Zbiornik'] = "Zamontuj zbiornik paliwa",
		['Dodaj szklo'] = "Zamontuj szybę kuloodporne",
		['Zatankuj Pojazd'] = "Zatankuj pojazd",
		['Usun Namiot'] = "Złóż namiot",
		['Usun sejf'] = "Złóż sejf",
		['Usun'] = "Złóż",
		['Daj Bandaz'] = "Zabandażuj",
		['Daj torbe krwi'] = "Podaruj torebke z krwią",
		['Sprawdz ciało'] = "Szczegóły zgonu",
		['Ukryj Ciało'] = "Ukryj ciało",
		['Upiecz mieso'] = "Upiecz mięso",
		['Napełnij karnister'] = "Napełnij karnister",
		['Złóż kolczatke'] = "Złóż kolczatke",
		['Złóż wory z piachem'] = "Złóż worki z piaskiem",
		['Napełnij Butelkę'] = "Napełnij butelke",
		['Kliknij_napelnij karnister'] = "Klilnij 'Z' aby napełnić karnister!",
		['Kliknij_napelnij wode'] = "Klilnij 'Z' aby napełnić butelke wody!",
		['Kliknij_zloz Kolczatke'] = "Klilnij 'Z' aby złożyć kolczatkę!",
		['Kliknij_zloz Worki'] = "Klilnij 'Z' aby złożyć worki z piaskiem!",
		['Kliknij_zloz krzaka'] = "Klilnij 'Z' aby usunąć krzaka!",
		['Klilnij_upiecz'] = "Klilnij 'Z' aby upiec mięso!",
		['Klilnij_otworz inventory'] = "Kliknij J aby otworzyć inwentaż!",
		['Kliknij_podnies item'] = "Kliknij 'Z' aby podnieść item!",
		['Potwierdz_Tak'] = "Tak",
		['Potwierdz_Nie'] = "Nie",
		['Potwierdz_chcesz'] = "Na pewno chcesz złożyć namiot?",
		['Output_odmontowane kolo'] = "Odmontowałeś koło od pojazdu",
		['Ekwipunek jest pełny'] = "Ekwipunek jest pełny",
		['Output_odmontowany silnik'] = "Odmontowałeś silnik z pojazdu",
		['Output_odmontowany zbiornik'] = "Odmontowałeś zbiornik paliwa od pojazdu",
		['Output_odmontowany szyba'] = "Odmontowałeś kuloodporną szybe od pojazdu",
		['Output_zamontowany silnik'] = "Zamontowałeś silnik do pojazdu",
		['Output_zamontowane koło'] = "Zamontowałeś koło do pojazdu",
		['Output_bak pelny'] = "Bak paliwa jest pełny",
		['Output_pomyslnie zatankowano'] = "Zatankowałeś pojazd",
		['Output_zamontowany zbiornik'] = "Zamontowałeś zbiornik paliwa do pojazdu",
		['Output_zamontowany szyba'] = "Zamontowałeś szybe kuloodporna do pojazdu",
		['Output_napelniles karnister'] = "Napełniłeś karnister",
		['Output_napelniles wode'] = "Napełniłeś butelke wody",
		['Uzyj_Render'] = "Użyj klikając \"Z\" ",
		['Armybox_do_konca'] = "Do wygaśnięcia: ",
		['Sprawdz_item'] = "Item został wyrzucony o %s",
		['Header_sprawdz'] = "Sprawdz",
		['Zloz_krzak'] = "Usuń krzaka",
		["Ilosc paliwa"] = "Litrów paliwa: "
	},
	['ENG'] = {
		['Podnies'] = "Take",
		['Przeszukaj'] = "Gear",
		['Napraw'] = "Repair",
		['Usun Kolo'] = "Remove Tire",
		['Usun Silnik'] = "Remove Engine",
		['Usun szybe'] = "Remove Bulletproof Glass",
		['Dodaj szklo'] = "Add Bulletproof Glass",
		['Output_zamontowany szyba'] = "You added Bulletproof Glass to vehicle",
		['Output_odmontowany szyba'] = "You removed Bulletproof Glass from vehicle",
		['Usun Zbiornik'] = "Remove Parts",
		['Dodaj Silnik'] = "Add Engine",
		['Dodaj Kolo'] = "Add Tire",
		['Dodaj Zbiornik'] = "Add parts",
		['Zatankuj Pojazd'] = "Add fuel",
		['Usun Namiot'] = "Remove Tent",
		['Usun sejf'] = "Remove safe",
		['Usun'] = "Remove",
		['Daj Bandaz'] = "Give Bandage",
		['Daj torbe krwi'] = "Give Blood Bag",
		['Sprawdz ciało'] = "Check body",
		['Ukryj Ciało'] = "Hide body",
		['Upiecz mieso'] = "Cook Meat",
		['Napełnij karnister'] = "Refill Empty Gas Canister",
		['Złóż kolczatke'] = "Remove Wire Fence",
		['Złóż wory z piachem'] = "Remove Sandbags",
		['Napełnij Butelkę'] = "Refill Empty Water Bottle",
		['Kliknij_napelnij karnister'] = "Press 'Z' to refill a jerry can!",
		['Kliknij_napelnij wode'] = "Press 'Z' to refill a water bottle!",
		['Kliknij_zloz Kolczatke'] = "Press 'Z' to remove the fence!",
		['Kliknij_zloz Worki'] = "Press 'Z' to remove the sandbags!",
		['Kliknij_zloz krzaka'] = "Press 'Z' to remove the bush!",
		['Klilnij_upiecz'] = "Press 'Z' to cook meat!",
		['Klilnij_otworz inventory'] = "Press J to access the gear menu!",
		['Kliknij_podnies item'] = "Press 'Z' to pick this item up!",
		['Potwierdz_Tak'] = "Yes",
		['Potwierdz_Nie'] = "No",
		['Potwierdz_chcesz'] = "Are you sure?",
		['Output_odmontowane kolo'] = "You removed Tire from vehicle",
		['Ekwipunek jest pełny'] = "Inventory is full",
		['Output_odmontowany silnik'] = "You removed Engine from vehicle",
		['Output_odmontowany zbiornik'] = "You removed Tank parts from vehicle",
		['Output_zamontowany silnik'] = "You added engine to vehicle",
		['Output_zamontowane koło'] = "You added tire to vehicle",
		['Output_bak pelny'] = "Tank in the vehicle is full",
		['Output_pomyslnie zatankowano'] = "You added fuel to vehicle",
		['Output_zamontowany zbiornik'] ="You added Tank Parts to vehicle",
		['Output_napelniles karnister'] = "You filled the carnister",
		['Output_napelniles wode'] = "You filled the water bottle",
		['Uzyj_Render'] = "Select press \"Z\" ",
		['Armybox_do_konca'] = "Until it expires: ",
		['Sprawdz_item'] = "Item was drop at %s",
		['Header_sprawdz'] = "Check",
		['Zloz_krzak'] = "Remove a bush",
		["Ilosc paliwa"] = "Fuel: "
	},
}


local kolory = {
	['SREDNI'] = {255,255,0},
	['DOBRY'] = {0,255,0},
	['ZLY'] = {255,0,0},
}

function getKolor(procent)
	if procent<=30 then
		return kolory['ZLY']
	elseif procent>30 and procent<=60 then
		return kolory['SREDNI']
	elseif procent>60  then
		return kolory['DOBRY']
	end
	return {255,0,0}
end

function math.percent(percent,maxvalue)
    if tonumber(percent) and tonumber(maxvalue) then
        return (maxvalue*percent)/100
    end
    return false
end


function showClientMenuItem(arg1, arg2, arg3, arg4)
	if getElementData(localPlayer, "logedin") then
		theTableMenuScroll = {};
		setElementData(localPlayer, "usedItem", false,false);
		local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "ENG"
		numberMenuScroll = 1;
		if (arg1 == "Take") then
			createScrollMenuMessage( language[jezyk]['Podnies'].." ("..arg2..")", 255, 255, 255, arg2);
			--createScrollMenuMessage( string.format(language[jezyk]['Header_sprawdz'],arg2), 255, 255, 255, "Sprawdz_itemek");
			setElementData(localPlayer, "usedItem", true,false);
		end
		if (arg1 == "stop") then
			if getElementData(localPlayer,'currentCol') then
				disableMenu();
				triggerEvent('refreshLootManual',localPlayer,false)
			end
			--exports['DayZ_Inventory']:refreshLootManual(false)
		end
		if (arg1 == "Helicrashsite") then
			createScrollMenuMessage(language[jezyk]['Przeszukaj'].." (Helicrash)", 255, 255, 255, "helicrashsite");
			setElementData(localPlayer, "usedItem", true,false);
		end
		if (arg1 == "Small_armybox[D]") then
			createScrollMenuMessage(language[jezyk]['Przeszukaj'].." (armybox)", 255, 255, 255, "small_armybox[D]");
			setElementData(localPlayer, "usedItem", true,false);
		end
		if (arg1 == "Kontener") then
			createScrollMenuMessage(language[jezyk]['Przeszukaj'].." (Kontener)", 255, 255, 255, "kontener");
			setElementData(localPlayer, "usedItem", true,false);
		end
		if (arg1 == "AirDrop") then
			createScrollMenuMessage(language[jezyk]['Przeszukaj'].." (AirDrop)", 255, 255, 255, "AirDrop");
			setElementData(localPlayer, "usedItem", true,false);
		end
		if (arg1 == 'Small_armybox[B]') then
		createScrollMenuMessage(language[jezyk]['Przeszukaj'].." (armybox)", 255, 255, 255, "small_armybox[B]");
			setElementData(localPlayer, "usedItem", true,false);
		end
		if (arg1=="large Armybox [D]") then 
		createScrollMenuMessage(language[jezyk]['Przeszukaj'].." (armybox)", 255, 255, 255, "Large Armybox [D]");
			setElementData(localPlayer, "usedItem", true,false);
		end
		if arg1=="large Armybox [B]" then
		createScrollMenuMessage(language[jezyk]['Przeszukaj'].." (armybox)", 255, 255, 255, "Large Armybox [B]");
			setElementData(localPlayer, "usedItem", true,false);
		end
		if (arg1 == "Heli") then
			createScrollMenuMessage(language[jezyk]['Przeszukaj'].." (Helicrash)", 255, 255, 255, "heli");
			setElementData(localPlayer, "usedItem", true,false);
		end
		if (arg1 == "Train") then
			createScrollMenuMessage(language[jezyk]['Przeszukaj'].." (Traincrash)", 255, 255, 255, "heli");
			setElementData(localPlayer, "usedItem", true,false);
		end
		if (arg1 == "Hospitalbox") then
			createScrollMenuMessage(language[jezyk]['Przeszukaj'].." Hospitalbox",255,255,255,"hospitalbox")
			setElementData(localPlayer,"usedItem",true)
		end
		if (arg1 == "Vehicle") then
			local tires,engine,parts,_ = exports['DayZ_Inventory']:getVehicleAddonInfos(getElementModel(getElementData(source, "parent")))
			local maxfuel = exports['DayZ_Inventory']:getVehicleMaxFuel(source)
			if (getElementModel(getElementData(source, "parent")) ~= 509) then
				createScrollMenuMessage(language[jezyk]['Przeszukaj'].." ("..arg2..")", 255, 255, 255, "vehicle");
				--createScrollMenuMessage("Gear ("..arg2..")", 255, 255, 255, "vehicle");
				setElementData(localPlayer, "usedItem", true,false);
				if (getElementHealth(arg3) <= 999 and getElementData(localPlayer, "Toolbox") >= 1) then
					local procent = math.percent(getElementHealth(arg3)/100,1000)
					local r,g,b =  255,255,255 -- unpack(getKolor(procent))
					createScrollMenuMessage(language[jezyk]['Napraw'].." ("..arg2..")", r,g,b, "repairvehicle");
					--createScrollMenuMessage("Repair ("..arg2..")", 255, 255, 255, "repairvehicle");
					setElementData(localPlayer, "usedItem", true,false);
				end
				
				if (getElementData(localPlayer, "Toolbox") and getElementData(localPlayer, "Toolbox") >= 1) then
				if  (getElementData(source, "Tire_inVehicle") or 0)>=1 then 
					
					--createScrollMenuMessage("Remove Tire ("..arg2..")", 255, 255, 255, "removetire");
					local procent = math.percent((getElementData(source, "Tire_inVehicle") or 0),10*(1000/tires))
					local r,g,b =  255,255,255 -- unpack(getKolor(procent))
					createScrollMenuMessage(language[jezyk]['Usun Kolo'].." ("..(getElementData(source, "Tire_inVehicle") or 0).."/"..tires..")", r,g,b, "removetire");
					setElementData(localPlayer, "usedItem", true,false);
					end
				end
				
				if (getElementData(localPlayer, "Toolbox") and getElementData(localPlayer, "Toolbox") >= 1) then
				if  (getElementData(source, "Engine_inVehicle") or 0)>=1 then 
					local procent = math.percent((getElementData(source, "Engine_inVehicle") or 0),10*(1000/engine))
					local r,g,b =  255,255,255 -- unpack(getKolor(procent))
					createScrollMenuMessage(language[jezyk]['Usun Silnik'].." ("..(getElementData(source, "Engine_inVehicle") or 0).."/"..engine..")", r,g,b, "removeengine");
					setElementData(localPlayer, "usedItem", true,false);
					end
				end
				if (getElementData(localPlayer, "Toolbox") and getElementData(localPlayer, "Toolbox") >= 1) then
				if  (getElementData(source, "Parts_inVehicle") or 0)>=1 then 
					local procent = math.percent((getElementData(source, "Parts_inVehicle") or 0),10*(1000/parts))
					local r,g,b =  255,255,255 -- unpack(getKolor(procent))
					createScrollMenuMessage(language[jezyk]['Usun Zbiornik'].." ("..(getElementData(source, "Parts_inVehicle") or 0).."/"..parts..")", r,g,b, "removeparts");
					setElementData(localPlayer, "usedItem", true,false);
					end
				end
				
				if (getElementData(localPlayer, "Toolbox") and getElementData(localPlayer, "Toolbox") >= 1) then
				if  getElementData(getElementData(source,"parent"), "Szyba-Kuloodporna") then 
					createScrollMenuMessage(language[jezyk]['Usun szybe'].." ("..(getElementData(source, "Parts_inVehicle") or 0).."/"..parts..")", 255,255,255, "removeglass");
					setElementData(localPlayer, "usedItem", true,false);
					end
				end
				
				if (getElementData(localPlayer, "Toolbox") and getElementData(localPlayer, "Toolbox") >= 1) then
					if  (getElementData(localPlayer, "Engine")>=1) then 
						if  (getElementData(source, "Engine_inVehicle") or 0) <=engine-1 then 
							local procent = math.percent((getElementData(source, "Engine_inVehicle") or 0),10*(1000/engine))
							local r,g,b =  255,255,255 --unpack(getKolor(procent))
							createScrollMenuMessage(language[jezyk]['Dodaj Silnik'].." ("..(getElementData(source, "Engine_inVehicle") or 0).."/"..engine..")", r,g,b, "addengine");
							setElementData(localPlayer, "usedItem", true,false);
						end
					end
				end
				if (getElementData(localPlayer, "Toolbox") and getElementData(localPlayer, "Toolbox") >= 1) then
				if  (getElementData(localPlayer, "Tire")>=1) then 
				if  (getElementData(source, "Tire_inVehicle") or 0) <=tires-1 then 
					local procent = math.percent((getElementData(source, "Tire_inVehicle") or 0),10*(1000/tires))
					local r,g,b = unpack(getKolor(procent))
					createScrollMenuMessage(language[jezyk]['Dodaj Kolo'].." ("..(getElementData(source, "Tire_inVehicle") or 0).."/"..tires..")", r,g,b, "addtire");
					setElementData(localPlayer, "usedItem", true,false);
					end
					end
				end
				if (getElementData(localPlayer, "Toolbox") and getElementData(localPlayer, "Toolbox") >= 1) then
					if  (getElementData(localPlayer, "Tank Parts")>=1) then 
						if  (getElementData(source, "Parts_inVehicle") or 0) <=parts-1 then 
							local procent = math.percent((getElementData(source, "Parts_inVehicle") or 0),10*(1000/parts))
							local r,g,b = unpack(getKolor(procent))
							createScrollMenuMessage(language[jezyk]['Dodaj Zbiornik'].." ("..(getElementData(source, "Parts_inVehicle") or 0).."/"..parts..")", r,g,b, "addparts");
							--createScrollMenuMessage("Add parts ("..arg2..")", 255, 255, 255, "addparts");
							setElementData(localPlayer, "usedItem", true,false);
						end
					end
				end
				if (getElementData(localPlayer, "Toolbox") and getElementData(localPlayer, "Toolbox") >= 1) then
				if  (getElementData(localPlayer, "Bulletproof Glass") or 0) >=1 then
				if not getElementData(getElementData(source,"parent"), "Szyba-Kuloodporna") then
					
					createScrollMenuMessage(language[jezyk]['Dodaj szklo'].." ("..(getElementData(getElementData(source,"parent"), "Szyba-Kuloodporna") or 0).."/".."1"..")", 255, 255, 255, "addglass");
					setElementData(localPlayer, "usedItem", true,false);
					end
					end
				end
				if  (getElementData(localPlayer, "Full Gas Canister")>=1) then 
					--createScrollMenuMessage("Add fuel ("..arg2..")", 255, 255, 255, "addfuel");
					createScrollMenuMessage(language[jezyk]['Zatankuj Pojazd'], 255, 255, 255, "addfuel");
					setElementData(localPlayer, "usedItem", true,false);
					end
				end
			end
		if (arg1 == "Tent") then 
		
		if getElementData(source,'Tent-Otwieranie') then
			if getElementData(localPlayer,'Moze-Otwierac') and getElementData(source,'Tent-Otwieranie')==getElementData(localPlayer,'Moze-Otwierac')[2] or getElementData(localPlayer,'Administrator-Open') then
			createScrollMenuMessage(language[jezyk]['Przeszukaj'].." ("..arg2..")", 255, 255, 255, "vehicle");
			setElementData(localPlayer, "usedItem", true,false);
			if getElementData(getElementData(arg3, "parent"), "tent") then
				createScrollMenuMessage(language[jezyk]['Usun Namiot'], 255, 255, 255, "tent");
				return;
			end
			end
			else
			createScrollMenuMessage(language[jezyk]['Przeszukaj'].." ("..arg2..")", 255, 255, 255, "vehicle");
			setElementData(localPlayer, "usedItem", true,false);
			if getElementData(getElementData(arg3, "parent"), "tent") then
				createScrollMenuMessage(language[jezyk]['Usun Namiot'], 255, 255, 255, "tent");
				
			end
				--createScrollMenuMessage("Set Tent Header", 255, 255, 255, "Tent-Changer");
				return;
			end
		
		
			
		end
		if (arg1 == "Fabryka") then 
			createScrollMenuMessage(language[jezyk]['Przeszukaj'].." ("..arg2..")", 255, 255, 255, "vehicle");
			setElementData(localPlayer, "usedItem", true,false);
			if  (getElementData(localPlayer, "Full Gas Canister")>=1) then 
				--createScrollMenuMessage("Add fuel ("..arg2..")", 255, 255, 255, "addfuel");
				createScrollMenuMessage(language[jezyk]['Zatankuj Pojazd'], 255, 255, 255, "addfuel");
				setElementData(localPlayer, "usedItem", true,false);
				end
			return;
		end
		if (arg1 == "safe") then 
		if getElementData(source,'Tent-Otwieranie') then
			if getElementData(localPlayer,'Moze-Otwierac') and getElementData(source,'Tent-Otwieranie')==getElementData(localPlayer,'Moze-Otwierac')[2] or getElementData(localPlayer,'Administrator-Open') then
			createScrollMenuMessage(language[jezyk]['Przeszukaj'].." ("..arg2..")", 255, 255, 255, "vehicle");
			setElementData(localPlayer, "usedItem", true,false);
			if getElementData(getElementData(arg3, "parent"), "safe") then
				createScrollMenuMessage(language[jezyk]['Usun sejf'], 255, 255, 255, "safe");
				return;
			end
			end
			else
			createScrollMenuMessage(language[jezyk]['Przeszukaj'].." ("..arg2..")", 255, 255, 255, "vehicle");
			setElementData(localPlayer, "usedItem", true,false);
			if getElementData(getElementData(arg3, "parent"), "safe") then
				createScrollMenuMessage(language[jezyk]['Usun sejf'], 255, 255, 255, "safe");
				
			end
				--createScrollMenuMessage("Set Tent Header", 255, 255, 255, "Tent-Changer");
				return;
			end
		end
		if (arg1 == "Small_armybox[D]") then
			--createScrollMenuMessage("Gear ("..arg2..")", 255, 255, 255, "vehicle");
			setElementData(localPlayer, "usedItem", true,false);
			if getElementData(getElementData(arg3, "parent"), "small_armybox[D]") then
				createScrollMenuMessage(language[jezyk]['Usun'].." armybox", 255, 255, 255, "RozpierdolKurwe");
				return;
			end
		end
		if (arg1 == "large Armybox [D]") then
			--createScrollMenuMessage("Gear ("..arg2..")", 255, 255, 255, "vehicle");
			if getElementData(source,'Tent-Otwieranie') then
			if getElementData(localPlayer,'Moze-Otwierac') and getElementData(source,'Tent-Otwieranie')==getElementData(localPlayer,'Moze-Otwierac')[2] then
			setElementData(localPlayer, "usedItem", true,false);
			if getElementData(getElementData(arg3, "parent"), "large Armybox [D]") then
				createScrollMenuMessage(language[jezyk]['Usun'].." armybox", 255, 255, 255, "RozpierdolKurwe");
				return;
			end
			end
			else
			setElementData(localPlayer, "usedItem", true,false);
			if getElementData(getElementData(arg3, "parent"), "large Armybox [D]") then
				createScrollMenuMessage(language[jezyk]['Usun'].." armybox", 255, 255, 255, "RozpierdolKurwe");
				return;
			end
			end
			
		end
		if (arg1 == "Kontener") then
			--createScrollMenuMessage("Gear ("..arg2..")", 255, 255, 255, "vehicle");
			setElementData(localPlayer, "usedItem", true,false);
			if getElementData(getElementData(arg3, "parent"), "kontener") then
			if getElementData(source,'Tent-Otwieranie') then
			if getElementData(localPlayer,'Moze-Otwierac') and getElementData(source,'Tent-Otwieranie')==getElementData(localPlayer,'Moze-Otwierac')[2] or getElementData(localPlayer,'Administrator-Open') then
			createScrollMenuMessage(language[jezyk]['Usun'].." Kontener", 255, 255, 255, "UsunKontener");
				return;
			end
			else
			--createScrollMenuMessage(language[jezyk]['Usun'].." Kontener", 255, 255, 255, "UsunKontener");
			return;
			end
				
			end
		end
		if (arg1 == "Player") then
			if getElementData(localPlayer,'Nearly-Dead') then return end
			if (arg2 and getElementType(arg2) == "player" and arg2 ~= localPlayer) then
				if ( getElementData(arg2, "bleeding") >= 1 and  getElementData(localPlayer, "Bandage") >= 1) or getElementData(arg2,'Nearly-Dead') then
					createScrollMenuMessage(language[jezyk]['Daj Bandaz'], 255, 255, 255, "givebandage");
					local sound_bandage = playSound3D("bandage_1",Vector3(getElementPosition(localPlayer)))
					setSoundMaxDistance(sound_bandage,10)
					setElementData(localPlayer, "usedItem", true,false);
				end
				if (getElementData(arg2, "blood") <= 11500 and getElementData(localPlayer, "Blood Bag") >= 1) or getElementData(arg2,'Nearly-Dead') then
					createScrollMenuMessage(language[jezyk]['Daj torbe krwi'], 255, 255, 255, "giveblood");
					setElementData(localPlayer, "usedItem", true,false);
				end
			end
		end
		if (arg1 == "Dead") then
			createScrollMenuMessage(language[jezyk]['Przeszukaj'].." ("..arg2..")", 255, 255, 255, "dead");
			createScrollMenuMessage(language[jezyk]['Sprawdz ciało'], 255, 255, 255, "deadreason");
			setElementData(localPlayer, "usedItem", true,false);
			if (getElementData(localPlayer, "Bandage") >= 1) then
				createScrollMenuMessage(language[jezyk]['Ukryj Ciało'], 255, 255, 255, "hidebody");
				setElementData(localPlayer, "usedItem", true,false);
			end
		end
		if (arg1 == "Fire Place") then
			if (getElementData(localPlayer,"Raw Meat") >= 1) then
				createScrollMenuMessage(language[jezyk]['Upiecz mieso'], 255, 255, 255, "fireplace");
				setElementData(localPlayer, "usedItem", true,false);
			end
		end
		if (arg1 == "patrol") then
			if (getElementData(localPlayer,"Empty Gas Canister") >= 1) and getElementData(source,"patrolstation")[2] >= 1 then
				createScrollMenuMessage(language[jezyk]['Napełnij karnister'], 255, 255, 255, "patrolstation");
				setElementData(localPlayer, "usedItem", "patrolstation");
			end 
		end
		--[[if (arg1 == "hydrant") then
			if (getElementData(localPlayer,"Empty Water Bottle") >= 1) then
				createScrollMenuMessage("Refill Empty Water Bottle", 255, 255, 255, "hydrant");
				setElementData(localPlayer, "usedItem", "hydrant");
			end 
		end
		if (arg1 == "hydrant") then
			if (getElementData(localPlayer,"thirst") <= 95) then
				createScrollMenuMessage("Drink a water", 255, 255, 255, "hydrant-pij");
				setElementData(localPlayer, "usedItem", "hydrant-pij");
			end 
		end]]
		if (arg1 == "Wirefence") then
			if (getElementData(localPlayer,"Toolbox") >= 1) then
				createScrollMenuMessage(language[jezyk]['Złóż kolczatke'], 255, 255, 255, "wirefence");
				setElementData(localPlayer, "usedItem", "wirefence");
			end 
		end
		if (arg1 == "sandbag") then
			if (getElementData(localPlayer,"Toolbox") or 0) >= 1 then
				createScrollMenuMessage(language[jezyk]['Złóż wory z piachem'], 255, 255, 255, "sandbag");
				setElementData(localPlayer, "usedItem", "sandbag");
			end 
		end
		if (arg1 == "bush") then
			if (getElementData(localPlayer,"Toolbox") or 0) >= 1 then
				createScrollMenuMessage(language[jezyk]['Zloz_krzak'], 255, 255, 255, "bush");
				setElementData(localPlayer, "usedItem", "bush");
			end 
		end
		if (arg1 == "Bottle") then
			if (getElementData(localPlayer,"Empty Water Bottle") >= 1) then
				createScrollMenuMessage(language[jezyk]['Napełnij Butelkę'], 255, 255, 255, "bottle");
				setElementData(localPlayer, "usedItem", true,false);
			end   
		end
		if (arg1 == "Gear") then
			createScrollMenuMessage(language[jezyk]['Przeszukaj'], 255, 255, 255, "itemloot");
			setElementData(localPlayer, "usedItem", "itemloot");
		end
		if (arg1 == "findbox") then
			createScrollMenuMessage("Take mission bag", 255, 255, 255, "findbox");
			setElementData(localPlayer, "usedItem", "findbox");
		end
		numberMenuScroll = 1;
	end
end
addEventHandler("showClientMenuItem", root, showClientMenuItem)

function startScrollMenu(key, keyState, arg)
	if getElementData(localPlayer, "usedItem") then
		if (keyState == "down") then
			if (arg == "up") then
				numberMenuScroll = numberMenuScroll-1;
				if (numberMenuScroll < 1) then
					numberMenuScroll = #theTableMenuScroll;
				end
			elseif (arg == "down") then
				numberMenuScroll = numberMenuScroll+1;
				if (numberMenuScroll > #theTableMenuScroll) then
					numberMenuScroll = 1;
				end
			end
		end
	end
end
bindKey("mouse_wheel_up", "down", startScrollMenu, "up");
bindKey("mouse_wheel_down", "down", startScrollMenu, "down");


function disableMenu()
	theTableMenuScroll = {};
	setElementData(localPlayer, "usedItem", false,false);
	setNewbieInfo(false, "", "");
end
addEventHandler("disableMenu", root, disableMenu);

function getPlayerInCol(tab)
    for theKey,thePlayer in ipairs(tab) do
        if thePlayer ~= getLocalPlayer() then
            return true
        end
    end
    return false
end

function setData(element,data,new)
	local old_data = getElementData(element,data)
	if old_data == new then return end
	setElementData(element,data,new)
end

local OnPlayerTargetPickup_function = {
	{"player",function(colshape,jezyk)
		local source= colshape
		if getElementData(source, "player") and #getElementsWithinColShape(source,'player')==2 then
			if getElementData(source,'parent')==localPlayer then return end
			showClientMenuItem("Player", getElementData(source, "parent"));
			--setNewbieInfo(true, "Empty Gas Canister", "Press 'Z' to refill a jerry can! \nREQUIRE: Empty Gas Canister", source);
			setData(localPlayer, "currentCol", source);
			setData(localPlayer, "loot", false);
		end
	end},
	{"patrolstation",function(colshape,jezyk)
		local source = colshape
		if getElementData(source, "patrolstation") and getElementData(localPlayer,'Empty Gas Canister') >= 0 then
			showClientMenuItem("patrol");
			setData(localPlayer, "currentCol", source);
			setData(localPlayer, "loot", false);
			setNewbieInfo(true, "Empty Gas Canister", language[jezyk]['Ilosc paliwa']..getElementData(source,"patrolstation")[2].."L", source);
		end
	end},
	{"hydrant",function(colshape,jezyk)
		local source = colshape
		if getElementData(source, "hydrant") and getElementData(localPlayer,'Empty Water Bottle') >= 0 then
			showClientMenuItem("hydrant");
			setData(localPlayer, "currentCol", source);
			setData(localPlayer, "loot", false);
			setNewbieInfo(true, "", language[jezyk]['Kliknij_napelnij wode'], source);
		end
	end},
	{"wirefence",function(colshape,jezyk)
		local source = colshape
		if getElementData(source, "wirefence") and getElementData(localPlayer,'Toolbox') > 0 then
			showClientMenuItem("Wirefence");
			setData(localPlayer, "currentCol", source);
			setData(localPlayer, "loot", false);
			setNewbieInfo(true, "", language[jezyk]['Kliknij_zloz Kolczatke'], source);
		end 
	end},
	{"sandbag",function(colshape,jezyk)
		local source = colshape
		if getElementData(source, "sandbag") and getElementData(localPlayer,'Toolbox') > 0 then
			showClientMenuItem("sandbag");
			setData(localPlayer, "currentCol", source);
			setData(localPlayer, "loot", false);
			setNewbieInfo(true, "",language[jezyk]['Kliknij_zloz Worki'], source);
		end 
	end},
	{"bush",function(colshape,jezyk)
		local source = colshape
		if getElementData(source, "bush") and getElementData(localPlayer,'Toolbox') > 0 then
			showClientMenuItem("bush");
			setData(localPlayer, "currentCol", source);
			setData(localPlayer, "loot", false);
			setNewbieInfo(true, "",language[jezyk]['Kliknij_zloz krzaka'], source);
		end 
	end},
	{"fireplace",function(colshape,jezyk)
		local source= colshape
		if getElementData(source, "fireplace") and getElementData(localPlayer,'Raw Meat') > 0 then
			showClientMenuItem("Fire Place");
			setData(localPlayer, "currentCol", source);
			setData(localPlayer, "loot", false);
			setNewbieInfo(true, "",language[jezyk]['Klilnij_upiecz'], source);
			isInFirePlace = true;
		end
	end},
	{"deadman",function(colshape,jezyk)
		local source = colshape
		if getElementData(source, "deadman") then
			showClientMenuItem("Dead", getElementData(source, "playername"));
			setData(localPlayer, "currentCol", source);
			setData(localPlayer, "loot", true)
			setElementData(localPlayer, "lootname", "Gear ("..getElementData(source,"playername")..")");
			setNewbieInfo(true, "", language[jezyk]['Klilnij_otworz inventory'], source);
			return;
		end
	end},
	{"item",function(colshape,jezyk)
		local source = colshape
		if getElementData(source, "item") then
			showClientMenuItem("Take", getElementData(source, "item"));
			--showClientMenuItem("Sprawdz_Cialo", (getElementData(source, "itemCooldown") or 0));
			setData(localPlayer, "currentCol", source);
			setData(localPlayer, "loot", false);
			setNewbieInfo(true, "", "", source);
		end
	end},
	{"helicrash",function(colshape,jezyk)
		local source = colshape
		if getElementData(source, "helicrash") then
			showClientMenuItem("Helicrash", "helicrash");
			setData(localPlayer, "currentCol", source);
			setData(localPlayer, "loot", true)
			setElementData(localPlayer, "lootname", "Gear (Helicrash)");
			setNewbieInfo(true, "", language[jezyk]['Klilnij_otworz inventory'], source);
		end
	end},
	{"hospitalbox",function(colshape,jezyk)
		local source = colshape
		if getElementData(source, "hospitalbox") then
			showClientMenuItem("Hospitalbox", "hospitalbox");
			setData(localPlayer, "currentCol", source);
			setData(localPlayer, "loot", true)
			setElementData(localPlayer, "lootname", "Gear (Hospitalbox)");
			setNewbieInfo(true, "", language[jezyk]['Klilnij_otworz inventory'], source);
		end
	end},
	{"heli",function(colshape,jezyk)
		local source = colshape
		if getElementData(source, "heli") then
			showClientMenuItem("Heli", "heli");
			setData(localPlayer, "currentCol", source);
			setData(localPlayer, "loot", true)
			setElementData(localPlayer, "lootname", "Gear (HeliCrash)");
			setNewbieInfo(true, "Gear HeliCrash",language[jezyk]['Klilnij_otworz inventory'], source);
		end
	end},
	{"train",function(colshape,jezyk)
		local source = colshape
		if getElementData(source, "train") then
			showClientMenuItem("Train", "train");
			setData(localPlayer, "currentCol", source);
			setData(localPlayer, "loot", true)
			setElementData(localPlayer, "lootname", "Gear (Traincrash)");
			setNewbieInfo(true, "Gear Traincrash",language[jezyk]['Klilnij_otworz inventory'], source);
		end
	end},
	{"vehicle",function(colshape,jezyk)
	if getElementData(localPlayer, "GodMode") == true then return end
		local source = colshape
		if (getElementData(source, "vehicle") and getElementModel(getElementData(source, "parent")) ~= 509) then
			if (not getElementData(source, "deadVehicle")) then
				showClientMenuItem("Vehicle", getVehiclePseudoName(getVehicleName(getElementData(source, "parent"))), getElementData(source, "parent"));
				setData(localPlayer, "currentCol", source);
				setData(localPlayer, "loot", true)
				setElementData(localPlayer, "lootname", "Gear ("..getVehicleName(getElementData(source, "parent"))..")");
				setNewbieInfo(true, "Gear",language[jezyk]['Klilnij_otworz inventory'], source);
				return;
			end
		end
	end},
	{"tent",function(colshape,jezyk)
		local source = colshape
		if not getElementData(source,'hide-tent') then
			showClientMenuItem("Tent", "Tent", getElementData(source, "parent"));
		end
		setData(localPlayer, "currentCol", source);
		setData(localPlayer, "loot", true)
		if not getElementData(source,'hide-tent') then
			setElementData(localPlayer, "lootname", "Gear (Tent)");
			setNewbieInfo(true,(getElementData(source,'Opis') or language[jezyk]['Przeszukaj']),language[jezyk]['Klilnij_otworz inventory'], source);
		end
	end},
	{"Fabryka",function(colshape,jezyk)
		local source = colshape
		if not getElementData(source,'hide-tent') then
			showClientMenuItem("Fabryka", "Fabryka");
		end
		setData(localPlayer, "currentCol", source);
		setData(localPlayer, "loot", true)
	end},
	{"safe",function(colshape,jezyk)
		local source = colshape
		setData(localPlayer, "currentCol", source);
		setData(localPlayer, "loot", true)
		setElementData(localPlayer, "lootname", "Gear (Safe)");
		setNewbieInfo(true,(getElementData(source,'Opis') or language[jezyk]['Przeszukaj']),language[jezyk]['Klilnij_otworz inventory'], source);
	end},
	{"small_armybox[B]",function(colshape,jezyk)
		local source = colshape
		showClientMenuItem("Small_armybox[B]", "Small_armybox[B]", getElementData(source, "parent"));
		setData(localPlayer, "currentCol", source);
		setData(localPlayer, "loot", true)
		setElementData(localPlayer, "lootname", "Gear (armybox)");
		setNewbieInfo(true, "Gear", language[jezyk]['Klilnij_otworz inventory'], source);
	end},
	{"small_armybox[D]",function(colshape,jezyk)
		local source = colshape
		showClientMenuItem("Small_armybox[D]", "Small_armybox[D]", getElementData(source, "parent"));
		setData(localPlayer, "currentCol", source);
		setData(localPlayer, "loot", true)
		setElementData(localPlayer, "lootname", "Gear (armybox)");
		setNewbieInfo(true, "Gear", language[jezyk]['Klilnij_otworz inventory'], source);
	end},
	{"large Armybox [D]",function(colshape,jezyk)
		local source = colshape
		showClientMenuItem("large Armybox [D]", "large Armybox [D]", getElementData(source, "parent"));
		setData(localPlayer, "currentCol", source);
		setData(localPlayer, "loot", true)
		setElementData(localPlayer, "lootname", "Gear (armybox)");
		setNewbieInfo(true, "Gear", language[jezyk]['Klilnij_otworz inventory'], source);
	end},
	{"large Armybox [B]",function(colshape,jezyk)
		local source = colshape
		showClientMenuItem("large Armybox [D]", "large Armybox [B]", getElementData(source, "parent"));
		setData(localPlayer, "currentCol", source);
		setData(localPlayer, "loot", true)
		setElementData(localPlayer, "lootname", "Gear (armybox)");
		setNewbieInfo(true, "Gear", language[jezyk]['Klilnij_otworz inventory'], source);
	end},
	{"kontener",function(colshape,jezyk)
		local source = colshape
		showClientMenuItem("Kontener", "Kontener", getElementData(source, "parent"));
		setData(localPlayer, "currentCol", source);
		setData(localPlayer, "loot", true)
		setElementData(localPlayer, "lootname", "Gear (Kontener)");
		setNewbieInfo(true, "Gear", language[jezyk]['Klilnij_otworz inventory'], source);
	end},
	{"AirDrop",function(colshape,jezyk)
		local source = colshape
		showClientMenuItem("AirDrop", "AirDrop", getElementData(source, "parent"));
		setData(localPlayer, "currentCol", source);
		setData(localPlayer, "loot", true)
		setElementData(localPlayer, "lootname", "Gear (AirDrop)");
		setNewbieInfo(true, "Gear", language[jezyk]['Klilnij_otworz inventory'], source);
	end},
	{"itemloot",function(colshape,jezyk)
		local source = colshape
		showClientMenuItem("Gear");
		setData(localPlayer, "loot", true)
		setElementData(localPlayer, "lootname", "Gear");
		setData(localPlayer, "currentCol", source);
		setNewbieInfo(true, "Gear", language[jezyk]['Klilnij_otworz inventory'], source);
	end},
	{"findbox",function(colshape,jezyk)
		local source = colshape
		showClientMenuItem("findbox");
		setData(localPlayer, "loot", true)
		setData(localPlayer, "currentCol", source);
		setNewbieInfo(true, "Mission bag", "Press Z to take Mission Bag", source);
	end},
}

function onPlayerTargetPickup(theElement,m)
	if getElementData(source,'Zombie-Col') then return end
	if (theElement == localPlayer and getElementData(localPlayer, "logedin")) then
		if not m then return end
		
		if getElementData(localPlayer,"currentCol") and getElementData(source, "parent") and getElementType(getElementData(source, "parent")) == "player" then return; end		
		if getPedOccupiedVehicle(localPlayer) then
			return;
		end
		isInFirePlace = false;
		local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
		for i,v in pairs(OnPlayerTargetPickup_function) do
			if getElementData(source,v[1]) then 
				v[2](source,jezyk)
				return
			end
		end
		--showClientMenuItem("stop");
	end 
end
addEventHandler("onClientColShapeHit", root, onPlayerTargetPickup);

function onPlayerTargetPickupLeave (theElement,dimension)
    if theElement == localPlayer then
		if not dimension then return end
		if getElementData(localPlayer,'currentCol') == source and getElementData(source, "findbox") then
			showClientMenuItem("stop")
			disableMenu();
		end
    end
end
addEventHandler("onClientColShapeLeave",getRootElement(),onPlayerTargetPickupLeave)

function setNewbieInfo(show, head, text, element)
	newbieShow = show;
	newbieHead = "";
	newbieText = text;
	newbiePosition = element;
end


function dxDrawLinedRectangle( x, y, width, height, color, _width, postGUI )
	_width = _width or 1
	dxDrawLine ( x, y, x+width, y, color, _width, postGUI ) -- Top
	dxDrawLine ( x, y, x, y+height, color, _width, postGUI ) -- Left
	dxDrawLine ( x, y+height, x+width, y+height, color, _width, postGUI ) -- Bottom
	return dxDrawLine ( x+width, y, x+width, y+height, color, _width, postGUI ) -- Right
end

local ticking = getTickCount()

local armyboxToImg = {
	["Medyczny"] =  dxCreateTexture("images/armybox/medyczny.png"),
	["Produkty"] =  dxCreateTexture("images/armybox/produkty.png","argb",true,"clamp"),
	["Militarny"] =  dxCreateTexture("images/armybox/militarny.png","argb",true,"clamp"),
}

addEventHandler("onClientRender", root, function()
	local boxSpace = dxGetFontHeight(1, "default-bold") + dxGetFontHeight(1, "default-bold") * 0.1;
	local veh = getPedOccupiedVehicle(localPlayer);
	local col = getElementData(localPlayer,'currentCol')
	--[[if isElement(col) and not isElementWithinColShape(localPlayer,col) and not getElementData(localPlayer,"isLootingPrivTent") then
		showClientMenuItem("stop")
        setElementData(getLocalPlayer(),"loot",false)
        setElementData(getLocalPlayer(),"currentCol",false)
        setNewbieInfo (false,"","")
        isInFirePlace = false
	elseif col and not isElement(col) and not getElementData(localPlayer,"isLootingPrivTent") then
		showClientMenuItem("stop")
        setElementData(getLocalPlayer(),"loot",false)
        setElementData(getLocalPlayer(),"currentCol",false)
        setNewbieInfo (false,"","")
        isInFirePlace = false
	end]]
	if ticking < getTickCount() then
		ticking = ticking + 4000
		if col and isElement(col) and not isElementWithinColShape(localPlayer,col) and not getElementData(localPlayer,"isLootingPrivTent") then
			showClientMenuItem("stop")
			setElementData(getLocalPlayer(),"loot",false)
			setElementData(getLocalPlayer(),"currentCol",false)
			setNewbieInfo (false,"","")
			isInFirePlace = false
		end
	end
	if col and not isElement(col) then
		showClientMenuItem("stop")
        setElementData(getLocalPlayer(),"loot",false)
        setElementData(getLocalPlayer(),"currentCol",false)
        setNewbieInfo (false,"","")
        isInFirePlace = false
	end
	if getElementData(localPlayer,'Otwarte_Inv') then return end
	 if veh and #theTableMenuScroll > 0 then
        disableMenu()
    else
        for id, value in pairs(theTableMenuScroll) do
            if id == numberMenuScroll then
                r1menu,g1menu,b1menu = 109,163,61
				dxDrawLinedRectangle(sW*0.05, sH*0.50+id*boxSpace, sW*0.15, boxSpace,tocolor(0, 102, 204,255),1,true)
            else
                r1menu,g1menu,b1menu = 19,19,19
            end
            dxDrawRectangle ( sW*0.05, sH*0.50+id*boxSpace, sW*0.15, boxSpace, tocolor(0,0,0,230) )
            --dxDrawingColorTextMenuScroll(value[1],6, 250+id*boxSpace, 6, 250+(id+1)*boxSpace, tocolor(value[2],value[3],value[4],170),255, 1, "default-bold", "center", "center")
            --dxDrawingColorTextMenuScroll(value[1],6, 250+id*boxSpace, 6, 250+(id+1)*boxSpace, tocolor(value[2],value[3],value[4],170),255, 1, "default-bold", "center", "center")
			
			dxDrawText(value[1],sW*0.1, sH*0.50+id*boxSpace, sW*0.15, sH*0.50+(id+1)*boxSpace,tocolor(255,255,255,200),1,'default-bold','center')
        end
		if #theTableMenuScroll>0 then
			dxDrawRectangle ( sW*0.05, sH*0.50+(#theTableMenuScroll+1)*boxSpace, sW*0.15, boxSpace, tocolor(0,0,0,255))
			local jezyk = getElementData(localPlayer,"Jezyk_Gry") or "PL"
			dxDrawText(language[jezyk]['Uzyj_Render'],sW*0.1, sH*0.50+(#theTableMenuScroll+1)*boxSpace, sW*0.15, sH*0.50+(#theTableMenuScroll+1)*boxSpace,tocolor(0, 102, 204,200),1,'default-bold','center')
			if col and getElementData(col,"Armybox-dni") then
				dxDrawRectangle ( sW*0.05, sH*0.50+(#theTableMenuScroll+2)*boxSpace, sW*0.15, boxSpace, tocolor(0,0,0,255))
				dxDrawText(language[jezyk]['Armybox_do_konca']..getElementData(col,"Armybox-dni").."D",sW*0.1, sH*0.50+(#theTableMenuScroll+2)*boxSpace, sW*0.15, sH*0.50+(#theTableMenuScroll+2)*boxSpace,tocolor(0, 102, 204,200),1,'default-bold','center')
				local typ = getElementData(col,"Armybox-Typ") 
				if armyboxToImg[typ] then
					dxDrawImage(sW*0.1 + (sW * 0.02)/2, sH*0.505+(#theTableMenuScroll+3)*boxSpace, sH * 0.04, sH * 0.04,armyboxToImg[typ])
				end
			end
		end
	end
	  if newbieShow == false then return end
	if(newbiePosition)then
		local x,y,z = getElementPosition(newbiePosition)
		local x1,y1 = getScreenFromWorldPosition(x,y,z)
		local length = dxGetTextWidth(newbieText,1,"default-bold")
		if(x1 and y1)then
			--dxDrawImage(x1-length/2-sW*0.01,y1,sW*0.02+length,sH*0.1,"images/Loot.png",0,0,0,tocolor(255,255,255,100	))
			if length ~= 0 then
				dxDrawRectangle(x1-length/2-sW*0.01,y1,sW*0.02+length,sH*0.1,tocolor(0,0,0,200))
				
				dxDrawingColorText(newbieHead,x1-length/2-sW*0.01,y1,x1+length/2+sW*0.01,y1+sH*0.03,tocolor(255,255,255,255),0.5,1.1,"default-bold","center","center")
				dxDrawingColorText(newbieText,x1-length/2-sW*0.01,y1+sH*0.03,x1+length/2+sW*0.01,y1+sH*0.07,tocolor(255,255,255,255),0.5,1,"default-bold","center","center")
			end
		end
	end
end);

addCommandHandler("wypiszGowno123",function()
	outputChatBox(getElementData(resourceRoot,"RefreshedDane"))
end)

--[[setTimer(function()
	if isInFirePlace then
		if (getElementData(localPlayer, "temperature") <= 48) then
			setElementData(localPlayer, "temperature", getElementData(localPlayer, "temperature")+0.25);
		end
	end
end, 17000, 0);]]

local tent_slots = {
[500] = 'Large Tent',
[250] = 'Medium Tent',
[100] = 'Tent',
}

local skladany_typ
local skladany_col

local GUIEditor = {
    button = {},
    window = {},
    label = {}
}

        GUIEditor.window[1] = guiCreateWindow(0.43, 0.41, 0.14, 0.18, "Dark-DayZ", true)
        guiWindowSetSizable(GUIEditor.window[1], false)

        GUIEditor.button[1] = guiCreateButton(0.05, 0.64, 0.40, 0.29, "Tak", true, GUIEditor.window[1])
        guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FFAAAAAA")
        GUIEditor.button[2] = guiCreateButton(0.55, 0.64, 0.39, 0.29, "Nie", true, GUIEditor.window[1])
        guiSetProperty(GUIEditor.button[2], "NormalTextColour", "FFAAAAAA")
        GUIEditor.label[1] = guiCreateLabel(0.04, 0.15, 0.90, 0.21, "Na pewno chcesz złożyć s?", true, GUIEditor.window[1])
		guiLabelSetHorizontalAlign(GUIEditor.label[1],'center',true)
        guiLabelSetColor(GUIEditor.label[1], 32, 173, 165)    
		guiSetVisible(GUIEditor.window[1],false)

addEventHandler('onClientGUIClick',GUIEditor.button[2],function()
	guiSetVisible(GUIEditor.window[1],false)
	showCursor(false)
end,false)

addEventHandler('onClientGUIClick',GUIEditor.button[1],function()
	local col = skladany_col
	if not col or not isElement(col) then return end
	if #getElementsWithinColShape(col,'player')>=2 then exports['DayZ_core']:startRollMessage("Nie mozesz tego zrobic gdy jest kolo Ciebie gracz!",255,0,0) return end
	if skladany_typ == "tent" then
		triggerServerEvent("removeTent", localPlayer, getElementData(col, "parent"),tent_slots[getElementData(col,'MAX_Slots')]);
	elseif skladany_typ == "kontener" then
		triggerServerEvent("removeKontener", localPlayer, getElementData(col, "parent"), "Kontener");
	end
end,false)

addEvent("SuccesfullTentRemove",true)
addEventHandler("SuccesfullTentRemove",root,function()
	playSound("item_sounds/tentunpack.mp3")
	
	guiSetVisible(GUIEditor.window[1],false)
	showCursor(false)
end)

addEventHandler('onClientPlayerWasted',localPlayer,function()
guiSetVisible(GUIEditor.window[1],false)
showCursor(false)
end)



Window_Change = guiCreateWindow(0.35, 0.35, 0.29, 0.30, "Changer", true)
guiWindowSetMovable(Window_Change, false)
guiWindowSetSizable(Window_Change, false)
Change_exit = guiCreateButton(0.79, 0.77, 0.19, 0.18, "Exit", true, Window_Change)
guiSetProperty(Change_exit, "NormalTextColour", "FFAAAAAA")
Changer_edit = guiCreateEdit(0.29, 0.30, 0.45, 0.09, "", true, Window_Change)
Changer_change = guiCreateButton(0.29, 0.43, 0.45, 0.07, "Set Tent Description", true, Window_Change)
guiSetProperty(Changer_change, "NormalTextColour", "FFAAAAAA")    
guiSetVisible(Window_Change,false)


local Changer_col = nil

addEventHandler('onClientGUIClick',Change_exit,function()
	guiSetVisible(Window_Change,false)
	showCursor(false)
end,false)

addEventHandler('onClientGUIClick',Changer_change,function()
	guiSetVisible(Window_Change,false)
	showCursor(false)
	local text = guiGetText(Changer_edit)
	if text=="" then
		text = false
	end
	if not Changer_col then return end
	setElementData(Changer_col,'Opis',text)
	Changer_col = nil
end,false)

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
     if type( sEventName ) == 'string' and isElement( pElementAttachedTo ) and type( func ) == 'function' then
          local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
          if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
               for i, v in ipairs( aAttachedFunctions ) do
                    if v == func then
        	         return true
        	    end
	       end
	  end
     end
     return false
end

local repair_vehicle = {}

repair_vehicle.car = nil
repair_vehicle.car_timer = nil

function repair_vehicle.text()
	local x,y,z = getElementPosition(repair_vehicle.car)
	local coords = { getScreenFromWorldPosition ( x,y,z) }
	if coords[1] and coords[2] then
		local hp = math.ceil(getElementHealth(repair_vehicle.car)) / 10
		dxDrawText ( "Stan pojazdu: "..tostring(hp).."%", coords[1], coords[2], coords[1], coords[2], tocolor(0,255,0,255), 1, "default-bold" )
	end
end

function repair_vehicle.stopRepair(f)
	triggerServerEvent("stopRepair",resourceRoot,repair_vehicle.car,localPlayer,f)
	if isTimer(repair_vehicle.car_timer) then
		killTimer(repair_vehicle.car_timer)
	end
	if isEventHandlerAdded("onClientRender",root,repair_vehicle.text) then
		removeEventHandler("onClientRender",root,repair_vehicle.text)
	end
	setElementFrozen(localPlayer,false)
	unbindKey("enter","down",repair_vehicle.stopRepair)
	setPedAnimation(localPlayer)
	setTimer(function()
		toggleControl("enter_exit",true)
	end,100,1)
	
	repair_vehicle.car = nil
end

addEventHandler("onClientPlayerWasted",localPlayer,function()
	if repair_vehicle.car then
		repair_vehicle.stopRepair()
	end
end)

addEvent("rozpocznijNaprawe",true)
addEventHandler("rozpocznijNaprawe",resourceRoot,function(veh)
	repair_vehicle.startRepair(veh)
end)

function repair_vehicle.startRepair(car)
	repair_vehicle.car = car
	toggleControl("enter_exit",false)
	if isEventHandlerAdded("onClientRender",root,repair_vehicle.text) then
		removeEventHandler("onClientRender",root,repair_vehicle.text)
	else
		addEventHandler("onClientRender",root,repair_vehicle.text)
	end
	bindKey("enter","down",repair_vehicle.stopRepair)
	setElementFrozen(localPlayer,true)
	
	repair_vehicle.car_timer = setTimer(function()
		if not isElement(repair_vehicle.car) or isVehicleBlown(repair_vehicle.car) then
			repair_vehicle.stopRepair()
			return
		end
		if getElementHealth(repair_vehicle.car) >= 999 then
			repair_vehicle.stopRepair("full")
			return
		end
		triggerServerEvent("ChangeVehHPState",resourceRoot,repair_vehicle.car,(getElementData(localPlayer,"Wrench") > 0 and true or false))
	end,1000,0)
end


local onPlayerPressMiddleMouse_function = {
	['helicrashsite'] = function(jezyk)
		local col = getElementData(localPlayer, "currentCol");
		local gearName = language[jezyk]['Przeszukaj'].." (Helicrash)";
		exports['DayZ_Inventory']:showInventoryManual();
		triggerEvent('refreshLootManual',localPlayer,col,gearName)
	end,
	['Sprawdz_itemek'] = function(jezyk)
		local col = getElementData(localPlayer, "currentCol");
		local gearName = language[jezyk]['Sprawdz_item'];
		outputChatBox("* "..string.format(gearName,(getElementData(col,'itemCooldown') or "-")),255,255,255)
		--exports['DayZ_Inventory']:showInventoryManual();
		--triggerEvent('refreshLootManual',localPlayer,col,gearName)
	end,
	['itemloot'] = function(jezyk)
		local col = getElementData(localPlayer, "currentCol");
		local gearName = language[jezyk]['Przeszukaj'];
		
		exports['DayZ_Inventory']:showInventoryManual();
		triggerEvent('refreshLootManual',localPlayer,col,gearName)
	end,
	['wirefence'] = function(jezyk)
		local col = getElementData(localPlayer, "currentCol");
		local gearName = language[jezyk]['Złóż kolczatke'];
		triggerServerEvent("removeWirefence", localPlayer, getElementData(col, "parent"));
		setPedAnimation(localPlayer, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
		disableMenu();
	end,
	['sandbag'] = function(jezyk)
		local col = getElementData(localPlayer, "currentCol");
		local gearName = language[jezyk]['Złóż wory z piachem'];
		triggerServerEvent("removeSandbag", localPlayer, getElementData(col, "parent"),'Sandbag');
		setPedAnimation(localPlayer, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
		disableMenu();
	end,
	['bush'] = function(jezyk)
		local col = getElementData(localPlayer, "currentCol");
		local gearName = language[jezyk]['Złóż wory z piachem'];
		triggerServerEvent("removeBush", localPlayer, getElementData(col, "parent"),'Bush');
		setPedAnimation(localPlayer, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
		disableMenu();
	end,
	['hospitalbox'] = function(jezyk)
		local col = getElementData(localPlayer, "currentCol");
		local gearName = language[jezyk]['Przeszukaj'].." (Hospitalbox)";
		exports['DayZ_Inventory']:showInventoryManual();
		triggerEvent('refreshLootManual',localPlayer,col,gearName)
	end,
	['heli'] = function(jezyk)
		local col = getElementData(localPlayer, "currentCol");
		local gearName = language[jezyk]['Przeszukaj'].." (HeliCrash)";
		exports['DayZ_Inventory']:showInventoryManual();
		triggerEvent('refreshLootManual',localPlayer,col,gearName)
	end,
	['kontener'] = function(jezyk)
		local col = getElementData(localPlayer, "currentCol");
		local gearName = language[jezyk]['Przeszukaj'].." (Kontener)";
		exports['DayZ_Inventory']:showInventoryManual();
		triggerEvent('refreshLootManual',localPlayer,col,gearName)
	end,
	['AirDrop'] = function(jezyk)
		local col = getElementData(localPlayer, "currentCol");
		local gearName = language[jezyk]['Przeszukaj'].." (AirDrop)";
		exports['DayZ_Inventory']:showInventoryManual();
		triggerEvent('refreshLootManual',localPlayer,col,gearName)
	end,
	['Large Armybox [D]'] = function(jezyk)
		local col = getElementData(localPlayer, "currentCol");
		local gearName = language[jezyk]['Przeszukaj'].." (armybox)";
		exports['DayZ_Inventory']:showInventoryManual();
		triggerEvent('refreshLootManual',localPlayer,col,gearName)
	end,
	['Large Armybox [B]'] = function(jezyk)
		local col = getElementData(localPlayer, "currentCol");
		local gearName = language[jezyk]['Przeszukaj'].." (armybox)";
		exports['DayZ_Inventory']:showInventoryManual();
		triggerEvent('refreshLootManual',localPlayer,col,gearName)
	end,
	['vehicle'] = function(jezyk)
	if getElementData(localPlayer, "GodMode") == true then return end
		local col = getElementData(localPlayer, "currentCol");
		if getElementType(getElementData(col, "parent"))=='vehicle' then
			local gearName = language[jezyk]['Przeszukaj'].." ("..getVehiclePseudoName(getVehicleName(getElementData(col, "parent")))..")";
		else
			local gearName = language[jezyk]['Przeszukaj'];
		end
		exports['DayZ_Inventory']:showInventoryManual();
		triggerEvent('refreshLootManual',localPlayer,col,gearName)
	end,
	['repairvehicle'] = function(jezyk)
		local col = getElementData(localPlayer, "currentCol");
		--triggerServerEvent("repairVehicle",getElementData(getElementByID('Dayz_Vehicle'),'repairVehicle'), localPlayer, getElementData(col, "parent"));
		triggerServerEvent("startRepair",resourceRoot,getElementData(col, "parent"))
		--repair_vehicle.startRepair(getElementData(col, "parent"))
		disableMenu();
	end,
	['removetire'] = function(jezyk)
		local col = getElementData(localPlayer, "currentCol");
		if getElementData(getElementData(col, "parent"), "Pojazd-Tymczasowy") then
			exports.DayZ_notification:DrawNotification('Nie możesz wykonać tej akcji!', 255, 255, 255)
			return
		end
		if (getElementData(col, "Tire_inVehicle") >= 1 and getElementData(localPlayer,"Toolbox") >= 1) then
			local data = getElementData(localPlayer,"Custom_Slots") or 0
			if (exports['DayZ_Inventory']:getElementCurrentSlots(localPlayer)+exports['DayZ_Inventory']:getItemSlots("Tire")) <= exports['DayZ_Inventory']:getElementMaxSlots(localPlayer) + data  then
				triggerServerEvent( "onVehicleOperation", localPlayer, "removetire")
				disableMenu();
			else
				exports.DayZ_notification:DrawNotification(language[jezyk]["Ekwipunek jest pełny"], 255, 255, 255) 
			end
		end
	end,
	
	['removeengine'] = function(jezyk)
		local col = getElementData(localPlayer, "currentCol");
		if getElementData(getElementData(col, "parent"), "Pojazd-Tymczasowy") then
			exports.DayZ_notification:DrawNotification('Nie możesz wykonać tej akcji!', 255, 255, 255) 
			return
		end
		if (getElementData(col, "Engine_inVehicle") >= 1 and getElementData(localPlayer, "Toolbox") >= 1) then
			local data = getElementData(localPlayer,"Custom_Slots") or 0
			if ((exports['DayZ_Inventory']:getElementCurrentSlots(localPlayer)+exports['DayZ_Inventory']:getItemSlots("Engine")) <= exports['DayZ_Inventory']:getElementMaxSlots(localPlayer) + data) then
				triggerServerEvent( "onVehicleOperation", localPlayer, "removeengine")
				disableMenu();
			else
				exports.DayZ_notification:DrawNotification(language[jezyk]["Ekwipunek jest pełny"], 255, 255, 255) 
			end
		end
	end,
	['removeparts'] = function(jezyk)
		local col = getElementData(localPlayer, "currentCol");
		if getElementData(getElementData(col, "parent"), "Pojazd-Tymczasowy") then
			exports.DayZ_notification:DrawNotification('Nie możesz wykonać tej akcji!', 255, 255, 255)  
			return
		end
		if (getElementData(col, "Parts_inVehicle") >= 1 and getElementData(localPlayer, "Toolbox") >= 1) then
			local data = getElementData(localPlayer,"Custom_Slots") or 0
			if ((exports['DayZ_Inventory']:getElementCurrentSlots(localPlayer)+exports['DayZ_Inventory']:getItemSlots("Tank Parts")) <= exports['DayZ_Inventory']:getElementMaxSlots(localPlayer) + data) then
				triggerServerEvent( "onVehicleOperation", localPlayer, "removeparts")
				disableMenu();
			else
				exports.DayZ_notification:DrawNotification(language[jezyk]["Ekwipunek jest pełny"], 255, 255, 255)  
			end
		end
	end,
	['removeglass'] = function(jezyk)
	local col = getElementData(localPlayer, "currentCol");
	if getElementData(getElementData(col, "parent"), "Pojazd-Tymczasowy") then
		exports.DayZ_notification:DrawNotification('Nie możesz wykonać tej akcji!', 255, 255, 255) 
		return
	end
	local parent = getElementData(col,"parent")
		if (getElementData(parent, "Szyba-Kuloodporna") and getElementData(localPlayer, "Toolbox") >= 1) then
			local data = getElementData(localPlayer,"Custom_Slots") or 0
			if ((exports['DayZ_Inventory']:getElementCurrentSlots(localPlayer)+exports['DayZ_Inventory']:getItemSlots("Bulletproof Glass")) <= exports['DayZ_Inventory']:getElementMaxSlots(localPlayer) + data) then
				triggerServerEvent( "onVehicleOperation", localPlayer, "removeglass")
				disableMenu();
			else
				exports.DayZ_notification:DrawNotification(language[jezyk]["Ekwipunek jest pełny"], 255, 255, 255) 
			end
		end
	end,
	['addengine'] = function(jezyk)
		local col = getElementData(localPlayer, "currentCol");
		local tires,engine,parts,_ = exports['DayZ_Inventory']:getVehicleAddonInfos(getElementModel(getElementData(col, "parent")))
		if (getElementData(col, "Engine_inVehicle") or 0) <= engine-1 and getElementData(localPlayer, "Toolbox") >= 1 then
			triggerServerEvent ( "onVehicleOperation", localPlayer, "addengine")
			disableMenu();
		end
	end,
	['addtire'] = function(jezyk)
		local col = getElementData(localPlayer, "currentCol");
		local tires,engine,parts,_ = exports['DayZ_Inventory']:getVehicleAddonInfos(getElementModel(getElementData(col, "parent")))
		if (getElementData(col, "Tire_inVehicle") or 0) <= tires-1 and getElementData(localPlayer, "Toolbox") >= 1 then
			triggerServerEvent ( "onVehicleOperation", localPlayer, "addtire")
			disableMenu();
		end
	end,
	['addglass'] = function(jezyk)
		local col = getElementData(localPlayer, "currentCol");
		local parent = getElementData(col,"parent")
		-- local tires,engine,parts,_ = exports['DayZ_Inventory']:getVehicleAddonInfos(getElementModel(getElementData(col, "parent")))
		if not getElementData(parent, "Szyba-Kuloodporna") and getElementData(localPlayer, "Toolbox") >= 1 then
			triggerServerEvent ( "onVehicleOperation", localPlayer, "addglass")
			disableMenu();
		end
	end,
	['addfuel'] = function(jezyk)
		local col = getElementData(localPlayer, "currentCol");
		if (getElementData(col, "fuel") or 0) + 20 < exports['DayZ_Inventory']:getVehicleMaxFuel(col) then
			addingfuel = 20;
		elseif (getElementData(col, "fuel") or 0) + 20 > (exports['DayZ_Inventory']:getVehicleMaxFuel(col) + 15) then
			exports.DayZ_notification:DrawNotification(getTextLang(jezyk, 'Output_bak peln'), 255, 255, 255)  
			return;
		else
			addingfuel = exports['DayZ_Inventory']:getVehicleMaxFuel(col)-getElementData(col, "fuel");
		end
		triggerServerEvent ( "onVehicleOperation", localPlayer, "addfuel", addingfuel)
		disableMenu();
	end,
	['addparts'] = function(jezyk)
		local col = getElementData(localPlayer, "currentCol");
		local tires,engine,parts,_ = exports['DayZ_Inventory']:getVehicleAddonInfos(getElementModel(getElementData(col, "parent")))
		if (getElementData(col, "Parts_inVehicle") or 0) <=parts-1 and getElementData(localPlayer, "Toolbox") >= 1 then
			triggerServerEvent ( "onVehicleOperation", localPlayer, "addparts")
			disableMenu();
		end
	end,
	['hidebody'] = function(jezyk)
		if (getElementData(localPlayer, "Shovel \n") >= 1) then
			triggerServerEvent("onPlayerHideBody", localPlayer);
			setPedAnimation(localPlayer, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
			disableMenu();
		end
	end,
	['tent'] = function(jezyk)
		if not getElementData(exports['DayZ_Inventory']:isPlayerInLoot(),'hide-tent') then
			--local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
			guiSetText(GUIEditor.button[1],language[jezyk]['Potwierdz_Tak'])
			guiSetText(GUIEditor.button[2],language[jezyk]['Potwierdz_Nie'])
			--guiSetText(GUIEditor.label[1],language[jezyk]['Potwierdz_chcesz'])
			skladany_typ = 'tent'
			guiSetText(GUIEditor.label[1], "Na pewno chcesz złożyć namiot?")
			guiSetVisible(GUIEditor.window[1],true)
			skladany_col = getElementData(localPlayer, "currentCol");
			local r = {guiGetScreenSize()}
			setCursorPosition(r[1]/2,r[2]/2)
			showCursor(true)
			disableMenu();
		end
	end,
	['Tent-Changer'] = function(jezyk)
		if not getElementData(exports['DayZ_Inventory']:isPlayerInLoot(),'hide-tent') then
			Changer_col = getElementData(localPlayer, "currentCol");
			guiSetVisible(Window_Change,true)
			if not isCursorShowing() then
				showCursor(true)
			end
			disableMenu()
		end
	end,
	['RozpierdolKurwe'] = function(jezyk)
		local col = getElementData(localPlayer, "currentCol");
	--	if #getElementsWithinColShape(col,'player')>=2 then startRollMessage("Nie mozesz tego zrobic gdy jest kolo Ciebie gracz!",255,0,0) return end
		if getElementData(col,'Usuwa') then
			--exports['DayZ_core']:startRollMessage("Kontener już się usuwa!",255,0,0)
			disableMenu();
			return
		end
		setElementData(col,'Usuwa',true)
		triggerServerEvent("removeArmybox", localPlayer, getElementData(col, "parent"));
		setPedAnimation(localPlayer, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
		disableMenu();
	end,
	['UsunKontener'] = function(jezyk)
		guiSetText(GUIEditor.button[1],language[jezyk]['Potwierdz_Tak'])
		guiSetText(GUIEditor.button[2],language[jezyk]['Potwierdz_Nie'])
		--guiSetText(GUIEditor.label[1],language[jezyk]['Potwierdz_chcesz'])
		skladany_typ = 'kontener'
		skladany_col = getElementData(localPlayer, "currentCol");
		guiSetText(GUIEditor.label[1], "Na pewno chcesz złożyć kontener?")
		guiSetVisible(GUIEditor.window[1],true)
		local r = {guiGetScreenSize()}
		setCursorPosition(r[1]/2,r[2]/2)
		showCursor(true)
		disableMenu();
	end,
	['fireplace'] = function(jezyk)
		local col = getElementData(localPlayer, "currentCol");
		triggerServerEvent("addPlayerCookMeat", localPlayer);
		disableMenu();
	end,
	['givebandage'] = function(jezyk)
		local col = getElementData(localPlayer, "currentCol");
		triggerServerEvent("onPlayerGiveMedicObject", localPlayer, 'givebandage', getElementData(col, "parent"));
		disableMenu();
	end,
	['giveblood'] = function(jezyk)
		local col = getElementData(localPlayer, "currentCol");
		triggerServerEvent("onPlayerGiveMedicObject", localPlayer, 'giveblood', getElementData(col, "parent"));
		disableMenu();
	end,
	['dead'] = function(jezyk)
		local col = getElementData(localPlayer, "currentCol");
		local gearName = language[jezyk]['Przeszukaj'].." ("..getElementData(col, "playername")..")";
		triggerEvent('refreshLootManual',localPlayer,col,gearName)
		exports['DayZ_Inventory']:showInventoryManual();
	end,
	['deadreason'] = function(jezyk)
		local col = getElementData(localPlayer, "currentCol");
		outputChatBox(getElementData(col, "deadreason"), 255, 255, 255, true);
	end,
	['patrolstation'] = function(jezyk)
		local col = getElementData(localPlayer, "currentCol");
		local data = getElementData(col,'patrolstation')
		local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
		if data[2] <= 0 then
			if jezyk == "PL" then
				outputChatBox("* Brak paliwa!",255,255,255)
			else
				outputChatBox("* The patrol is empty!",255,255,255)
			end
			return
		end
		setElementData(localPlayer, "Empty Gas Canister", getElementData(localPlayer, "Empty Gas Canister") - 1);
		setElementData(localPlayer, "Full Gas Canister", getElementData(localPlayer, "Full Gas Canister") + 1);
		setElementData(col,"patrolstation",{true,data[2] - 1})
		triggerServerEvent("playPlayerAnim",resourceRoot,localPlayer,{"BOMBER", "BOM_Plant", -1, false, false, nil, false})
		exports['DayZ_core']:startRollMessage(language[jezyk]['Output_napelniles karnister'], 255, 255, 255);
		playSound("item_sounds/refuel.mp3")
		disableMenu();
	end,
	--[[['hydrant-pij'] = function()
		local los = math.random(10,30)
		if (getElementData(localPlayer,'thirst')+getElementData(localPlayer,'thirst')+los)>=100 then
			setElementData(localPlayer,'thirst',100)
		else
			setElementData(localPlayer,'thirst',getElementData(localPlayer,'thirst')+los)
		end
		setPedAnimation(localPlayer, "VENDING", "VEND_Drink2_P", -1, false, false, nil, false);
		exports['DayZ_core']:startRollMessage("Napiłeś się", 255, 255, 255);
		playSound("item_sounds/drink_0.mp3")
		disableMenu();
	end,]]
	--[[['hydrant'] = function()
		setElementData(localPlayer, "Empty Water Bottle", getElementData(localPlayer, "Empty Water Bottle") - 1);
		setElementData(localPlayer, "Water Bottle", getElementData(localPlayer, "Water Bottle") + 1);
		setPedAnimation(localPlayer, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
		exports['DayZ_core']:startRollMessage("Napełniłeś Butelkę Wody", 255, 255, 255);
		playSound("item_sounds/fillwater.mp3")
		disableMenu();
	end,]]
	['bottlestation'] = function(jezyk)
		setElementData(localPlayer, "Empty Water Bottle", getElementData(localPlayer, "Empty Water Bottle") - 1);
		setElementData(localPlayer, "Water Bottle", getElementData(localPlayer, "Water Bottle") + 1);
		setPedAnimation(localPlayer, "BOMBER","BOM_Plant", -1, false, false, nil, false);
		exports['DayZ_core']:startRollMessage(language[jezyk]['Output_napelniles wode'], 255, 255, 255);
		disableMenu();
	end,
}


function onPlayerPressMiddleMouse(key, keyState)
	if (keyState == "down") then
		if getElementData(localPlayer,'Otwarte_Inv') then return end
		if not getElementData(localPlayer, "usedItem") then return; end
		local itemName = getMenuMarkedItem();
		local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
		local col = getElementData(localPlayer, "currentCol");

		if (itemName:find("small_armybox")) then
			
			local gearName = language[jezyk]['Przeszukaj'].." (armybox)";
			triggerEvent('refreshLootManual',localPlayer,col,gearName)
			exports['DayZ_Inventory']:showInventoryManual();
			return;
		end
		if onPlayerPressMiddleMouse_function[itemName] then
			if key:upper()=="Z" then
				--[[if getElementData(col,"Anty-Kopiarstwo",false) then
					outputChatBox("* ... *",255,0,0)
					--return
				end
				setElementData(col,"Anty-Kopiarstwo",true,false)]]
				onPlayerPressMiddleMouse_function[itemName](jezyk);
				--[[setTimer(function(col)
					if isElement(col) then
						setElementData(col,"Anty-Kopiarstwo",nil,false)
					end
				end,2500,1,col)]]
			end
			return
		end

		local col = getElementData(localPlayer, "currentCol");

		if getElementData(col, "findbox") then
			triggerServerEvent("onPlayerTakeMissionBag", localPlayer, localPlayer)
			disableMenu(); 
			return 
		end
	
		if exports['DayZ_Inventory']:isToolbeltItem(itemName) then
			if not col then return end
			if (#getElementsWithinColShape(col, "player") > 1) then return; end
			local x,y,z = getElementPosition(localPlayer)
			triggerServerEvent("onPlayerTakeItemFromGround", localPlayer, itemName, col);
			disableMenu();
			return;
		end
		if ((exports['DayZ_Inventory']:getElementCurrentSlots(localPlayer) + exports['DayZ_Inventory']:getItemSlots(itemName)) <= exports['DayZ_Inventory']:getElementMaxSlots(localPlayer)) then
			if (#getElementsWithinColShape(col, "player") > 1) then return; end
			local x,y,z = getElementPosition(localPlayer);
			local x1,y1,z1 = getElementPosition(localPlayer);
			if not col then return end
			triggerServerEvent("onPlayerTakeItemFromGround", localPlayer, itemName, col);
			disableMenu();
		else
			exports.DayZ_notification:DrawNotification(language[jezyk]["Ekwipunek jest pełny"], 255, 255, 255) 
		end
	end
end 
bindKey("mouse3", "down", onPlayerPressMiddleMouse);
bindKey("Z", "down", onPlayerPressMiddleMouse);
bindKey("-", "down", onPlayerPressMiddleMouse);

function getMenuMarkedItem()
	for i,v in pairs(theTableMenuScroll) do
		if (i == numberMenuScroll) then
			return v[5];
		end
	end
end
