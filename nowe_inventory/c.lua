
local inv = {window={},label={},grid={},col={},img={},button={},flagi={},background = {}, pseudogrid = {}};




inv.window[1] = guiCreateWindow(0.15, 0.28, 0.72, 0.63, "", true);

obraz = guiCreateStaticImage(0.0,0,1,1,'inventory1.png',true,inv.window[1])

guiSetAlpha(inv.window[1],0.85)

inv.flagi[1] = guiCreateStaticImage(0,0.95,0.05,0.05,'flaga_polski.png',true,obraz)
inv.flagi[2] = guiCreateStaticImage(0.06,0.95,0.05,0.05,'flaga_eng.png',true,obraz)

inv.label[1] = guiCreateLabel(0.03, 0.05, 0.34, 0.09, "Pusto", true, obraz);
inv.label[2] = guiCreateLabel(0.63, 0.05, 0.34, 0.09, "Ekwipunek", true, obraz);
inv.label[3] = guiCreateLabel(0.655, 0.94, 0.29, 0.04, "Sloty:",true, obraz);
inv.label[4] = guiCreateLabel(0.0535, 0.94, 0.29, 0.04, "Sloty:", true, obraz);
for i = 1,2 do
	guiLabelSetColor(inv.label[i],0,200,0)
end
--inv.grid[1] = guiCreateGridList(0.01, 0.10, 0.39, 0.83, true, obraz);
--inv.grid[2] = guiCreateGridList(0.60, 0.10, 0.39, 0.83, true, obraz);

--guiSetProperty(inv.grid[1],"InheritsAlpha","false")
--guiSetProperty(inv.grid[2],"InheritsAlpha","false")
inv.background[1] = guiCreateStaticImage(0.01, 0.10, 0.39, 0.83,"tlo.png",true,obraz)
guiSetAlpha(inv.background[1],0.7)
inv.background[2] = guiCreateStaticImage(0.60, 0.10, 0.39, 0.83,"tlo.png",true,obraz)
guiSetAlpha(inv.background[2],0.7)

inv.pseudogrid[1] = guiCreateScrollPane(0,0.03,1,0.95,true,inv.background[1])
inv.pseudogrid[2] = guiCreateScrollPane(0,0.03,1,0.95,true,inv.background[2])

inv.button[1] = guiCreateButton(0.4, 0.17, 0.07, 0.69, "»»", true, obraz);
inv.button[2] = guiCreateButton(0.53, 0.17, 0.07, 0.69, "««", true, obraz);
inv.button[3] = guiCreateButton(0, 0, 0.0, 0.0, "", true, obraz);
--guiSetProperty(inv.button[1],"InheritsAlpha","false")
--guiSetProperty(inv.button[2],"InheritsAlpha","false")

guiSetAlpha(inv.button[1],0.95)
guiSetAlpha(inv.button[2],0.95)


guiSetEnabled(inv.button[3],false)
inv.img[1] = guiCreateStaticImage(0, 0, 0.05, 0.0215, "images/scrollmenu.png", true);
inv.label[5] = guiCreateLabel(0, 0, 1, 1, "", true, inv.img[1]);
button_info = guiCreateLabel(0.42, 0.01, 0.15, 0.13, "", true,obraz)
guiLabelSetHorizontalAlign(button_info,'center',true)
guiLabelSetVerticalAlign(button_info,'center')
guiSetAlpha(inv.label[5],0.90)
guiSetAlpha(button_info,0.90)



local obiekty = {
	[1] = {
		{"M4A1-S \n", 0,image = "przedmioty/m4.png"},
		{"PKP Pecheneg \n", 0,image = "przedmioty/PKP.png"},
		{"AK-47 \n", 0, image = "przedmioty/ak47.png"},
		--{"M16A4 \n", 0},
		{"Winchester 1866 \n", 0, image = "przedmioty/winchester.png"},
		{"SPAZ-12 Combat Shotgun \n", 0,image = "przedmioty/m1014.png"},
		{"Sawn-Off Shotgun \n", 0,image = "przedmioty/sawn.png"},
		{"Lee Enfield \n", 0,image = "przedmioty/lee.png"},
		{"AWP \n", 0, image = "przedmioty/awp.png"},
		{"M4A1-S", 3,image = "przedmioty/m4.png"},
		{"PKP Pecheneg", 3,image = "przedmioty/PKP.png"},
		{"AK-47", 3, image = "przedmioty/ak47.png"},
		--{"M16A4", 3},
		{"Winchester 1866", 3,image = "przedmioty/winchester.png"},
		{"SPAZ-12 Combat Shotgun", 3,image = "przedmioty/m1014.png"},
		{"Sawn-Off Shotgun", 3,image = "przedmioty/sawn.png"},
		{"Lee Enfield", 3,image = "przedmioty/lee.png"},
		{"AWP", 3,image = "przedmioty/awp.png"},
	},
	[2] = {
		{"M1911 \n", 0,image = "przedmioty/colt.png"},
		{"M9 SD \n", 0,image = "przedmioty/m9.png"},
		{"PDW \n", 0,image = "przedmioty/pdw.png"},
		{"MP5A5 \n", 0,image = "przedmioty/mp5.png"},
		{"Desert Eagle \n", 0},
		{"Hunting Knife \n", 0,_,"Nóż Myśliwski",image = "przedmioty/knife.png"},
		{"Hatchet \n", 0,_,"Sikierka",image = "przedmioty/hatchet.png"},
		{"Baseball Bat \n", 0,_,"Kij Bejzbolowy",image = "przedmioty/bat.png"},
		{"Shovel \n", 0,_,"Łopata",image = "przedmioty/shovel.png"},
		{"Harvest Scythe \n", 0,_,'Kosa Stacha'},
		{"Chainsaw \n", 0,_,'Piła Mechaniczna'},
		{"Spray \n", 0,_,'Spray'},
		{"M1911", 2,image = "przedmioty/colt.png"},
		{"M9 SD", 2,image = "przedmioty/m9.png"},
		{"PDW", 2,image = "przedmioty/pdw.png"},
		{"MP5A5", 2,image = "przedmioty/mp5.png"},
		{"Desert Eagle", 2},
		{"Hunting Knife", 1,_,'Nóż Myśliwski',image = "przedmioty/knife.png"},
		{"Hatchet", 2,_,'Sikierka',image = "przedmioty/hatchet.png"},
		{"Parachute \n",0,_,"Spadochron",image = "przedmioty/parachute.png"},
		{'Parachute',1,_,"Spadochron",image = "przedmioty/parachute.png"},
		{"Baseball Bat", 1,_,"Kij Bejzbolowy",image = "przedmioty/bat.png"},
		{"Shovel", 1,_,"Łopata",image = "przedmioty/shovel.png"},
		{"Harvest Scythe", 1,_,'Kosa Stacha'},
		{"Chainsaw", 2,_,"Piła Mechaniczna"},
		{"Spray", 1,_,"Spray"},
	},
	[3] = {
		{"Tear Gas \n", 0,image = "przedmioty/gas.png"},
		{"Grenade \n", 0,_,"Granat",image = "przedmioty/grenade.png"},
		{"Binoculars \n", 0,_,"Lornetka", image = "przedmioty/binocular.png"},
		{"Tear Gas", 1,image = "przedmioty/gas.png"},
		{"Grenade", 1,_,"Granat",image = "przedmioty/grenade.png"},
		{"Binoculars", 1,_,"Lornetka", image = "przedmioty/binocular.png"}
	},
	[4] = {
		{"M1911 Mag", 0.085,image = "przedmioty/mag.png"},
		{"M9 SD Mag", 0.085,image = "przedmioty/mag.png"},
		{"Desert Eagle Mag", 0.085,image = "przedmioty/mag.png"},
		{"PDW Mag", 0.025,image = "przedmioty/mag.png"},
		{"MP5A5 Mag", 0.025,image = "przedmioty/mag.png"},
		{"1866 Slug", 0.067,image = "przedmioty/mag.png"},
		{"2Rnd. Slug", 0.067,image = "przedmioty/mag.png"},
		{"SPAZ-12 Pellet", 0.067,image = "przedmioty/mag.png"},
		{"M4A1-S Mag", 0.035,image = "przedmioty/mag.png"},
		{"PKP Pecheneg Mag", 0.035,image = "przedmioty/mag.png"},
		{"AK-47 Mag", 0.035,image = "przedmioty/mag.png"},
		{"M16A4 Mag", 0.035,image = "przedmioty/mag.png"},
		{"AWP Mag", 0.1,image = "przedmioty/mag.png"},
		{"Lee Enfield Mag", 0.1,image = "przedmioty/mag.png"}
	},
	[5] = {
		{"Water Bottle", 1,_,"Butelka Wody", image = "przedmioty/bottle.png"},
		{"Pasta Can", 1,_,"Makaron",  image = "przedmioty/can.png"},
		{"Beans Can", 1,_,"Fasolka", image = "przedmioty/can.png"},
		{"Kebab",1},
		{"Coca Cola",1, image = "przedmioty/bottle.png"},
		{"Burger", 1,_,"Burger",  image = "przedmioty/burger.png"},
		{"Pizza", 1,_,"Pizza",image = "przedmioty/pizza.png"},
		{"Soda Bottle", 1,_,"Napój Gazowany" ,image = "przedmioty/bottle.png"},
 		{"Milk", 1,_,"Mleko",  image = "przedmioty/bottle.png"},
		{"Cooked Meat", 1,_,"Upieczone mięso",image = "przedmioty/meat.png"}
	},
	[6] = {
		{"Assault Pack (ACU)", 1, "Equip Backpack","Plecak ACU", image = "przedmioty/acu.png"},
		{"Bag", 2, "Equip Backpack",'Torba'},
		{"Alice Pack", 3, "Equip Backpack",'Plecak Alice', image = "przedmioty/alice.png"},
		{"Mountain Backpack", 4, "Equip Backpack",'Plecak Górski'},
		{"Czech Backpack", 4, "Equip Backpack","Plecak Czech",image = "przedmioty/chezh.png"},
		{"Coyote Backpack", 4, "Equip Backpack","Plecak Kojot",image = "przedmioty/coyote.png"},
		{"Military Backpack", 5, "Equip Backpack","Plecak Militarny"},
	},
	[7] = {
		{"Camouflage Clothing", 1, "Put clothes on","Przebranie Kamuflujące",image = "przedmioty/clothes.png"},
		{"Civilian Clothing", 1, "Put clothes on","Przebranie Cywila",image = "przedmioty/clothes.png"},
		{"Survivor Clothing", 1, "Put clothes on","Przebranie Ocalałego",image = "przedmioty/clothes.png"},
		{"Ghillie Suit", 1, "Put clothes on","Kombinezon Ghillie",image = "przedmioty/clothes.png"},
		{"Reabel Clothing", 1, "Put clothes on",'Przebranie Rebelianta',image = "przedmioty/clothes.png"},
		{"Woman Clothing", 1, "Put clothes on",'Przebranie Ocalałego [F]',image = "przedmioty/clothes.png"},
		{"Military Clothing [F]",1,"Put clothes on","Przebranie Wojskowe [F]",image = "przedmioty/clothes.png"},
		{"Ghillie Suit [F]",1,"Put clothes on","Kombinezon Ghillie [F]",image = "przedmioty/clothes.png"},
		{"Kombinezon X",1,"Put clothes on","Kombinezon X",image = "przedmioty/clothes.png"},
		{"Diver Suit",1,"Put clothes on","Przebranie nurka",image = "przedmioty/clothes.png"},
		{"Armor",1,"Zaloz Armor","Pancerz",image = "przedmioty/clothes.png"},
	},
	[8] = {
		{"Bush", 1,"Put a bush","Krzak"},
		{"Safe", 3,"Put a safe","Sejf"},
		{"Wood Pile", 2,_,"Stos Drewna"},
		{"Trap",2,'Put a trap',"Pułapka",image = "przedmioty/trap.png"},
		{"Metal",2},
		{"Bandage", 1, "Bandage yourself","Bandaż",image = "przedmioty/bandage.png"},
		{"Empty Gas Canister", 2,_,"Pusty Karnister",image = "przedmioty/canister.png"},
		{"Full Gas Canister", 2,_,"Pełny Karnister",image = "przedmioty/canister.png"},
		{"Medic Kit", 2, "Use","Apteczka Medyczna",image = "przedmioty/chest.png"},
		{"First Aid Kit",1,"Use","Apteczka Pierwszej Pomocy",image = "przedmioty/chest.png"},
		{"Medic Bag",3,"Use","Torba Medyczna",image = "przedmioty/chest.png"},
		{"Painkiller", 1, "Use","Środki Przeciwbólowe"},
		{"Morphine", 1, "Use","Morfina",image = "przedmioty/morphine.png"},
		{"Blood Bag", 1,_,"Torebka Krwi", image = "przedmioty/blood.png"},
		{"Wire Fence", 1, "Build a wire fence","Drut kolczasty"},
		{"Sandbag",2,"Build a sandbag","Worki z Piastkiem"},
		{"Raw Meat", 1,_,"Surowe Mięso",image = "przedmioty/flesh.png"},
		{"Tire", 2,_,"Koło",image = "przedmioty/wheel.png"},
		{"Tank Parts", 2,_,"Zbiornik Paliwa",image = "przedmioty/engine_part.png"},
		{"Engine", 5,_,"Silnik",image = "przedmioty/engine.png"},
		{"Tent", 2, "Pitch a tent","Namiot",image = "przedmioty/tent.png"},
		{"Medium Tent", 3, "Pitch a tent","Namiot Średni",image = "przedmioty/tent.png"},
		{"Large Tent", 4, "Pitch a tent","Namiot Duży",image = "przedmioty/tent.png"},
		{"Empty Water Bottle", 1, "Fill bottle up","Pusta butelka wody", image = "przedmioty/bottle.png"}, 
		{"Empty Soda Cans", 1, image = "przedmioty/bottle.png"},
		{"Scruffy Burgers", 1,_,"Spleśniałe burgery"},
		{"Rope",2,'Pull down rope',"Lina"},
		{"Glass",1,_,"Szkło"},
		{"Bulletproof Glass",2,_,"Szyba Kuloodporna"},
	},
	[9] = {
		{"Night Vision Goggles", 0.1,_,"Google Noktowizyjne",image = "przedmioty/night.png"},
		{"Infrared Goggles", 0.1,_,"Google Podczerwieni",image = "przedmioty/night.png"},
		{"Map", 0.3,_,'Mapa',image = "przedmioty/map.png"},
		{"Box of Matches", 0.1, "Make a Fire","Zapałki",image = "przedmioty/matches.png"},
		{"Watch", 0.1,_,"Zegarek"},
		{"GPS", 0.3,image = "przedmioty/gps.png"},
		{"Toolbox", 0.5,_,"Zestaw Naprawczy",image = "przedmioty/tool.png"},
	}
}



local keyTable = {
	['PL'] = {
		[1] = "-> Broń główna",
		[2] = "-> Broń dodatkowa",
		[3] = "-> Broń specjalna",
		[4] = "-> Amunicja",
		[5] = "-> Jedzenie",
		[6] = "-> Plecaki",
		[7] = "-> Przebrania",
		[8] = "-> Inne",
		[9] = "-> Narzędzia"
	},
	['ENG'] = {
		[1] = "-> Primary Weapon",
		[2] = "-> Secondary Weapon",
		[3] = "-> Specially Weapon",
		[4] = "-> Ammo",
		[5] = "-> Food",
		[6] = "-> Backpacks",
		[7] = "-> Suits",
		[8] = "-> Items",
		[9] = "-> Toolbelt"
	},
};
local przedmioty = {
	["loot"] = {},
	["inventory"] = {},
}	

local texty = {
	["loot"] = {},
	["inventory"] = {},
}

local font = guiCreateFont("inventory_font.ttf",11)
local font2 = guiCreateFont("inventory_font.ttf",9)

guiSetVisible(inv.window[1],false)

function createInventory()
	local add_weight = 0
	local add_height = 0
	for k,_ in pairs({1,2,3,4,5,6,7,8,9}) do
		add_weight = 0
		add_height = add_height + 0.05 * k + 0.11
		texty["inventory"][k] = guiCreateLabel(0.03,add_height,0.5,0.15,keyTable["PL"][k],true,inv.pseudogrid[2])
		guiSetFont(texty["inventory"][k],font)
		for i,v in pairs(obiekty[k]) do
			if add_weight + (0.1 *2.8) > 0.94 then
				add_height = add_height + 0.17
				add_weight = 0
			end
			if v.image then
				przedmioty["inventory"][v[1]] = {}
				--przedmioty[v[1]].item = guiCreateButton(0.05 + add_weight,0.05 + add_height,0.1 * v[3],0.15,"",true,inv.pseudogrid[1])
				przedmioty["inventory"][v[1]].item = guiCreateButton(0,0.1,0,0,"",true,inv.pseudogrid[2])
				add_weight = add_weight + 0.1 * 2.8 + 0.03
				setElementData(przedmioty["inventory"][v[1]].item,"Inventory-Item",{v[1],"inventory"})
				if v[1]:find("\n") then
					przedmioty["inventory"][v[1]].tlo = guiCreateStaticImage(0,0,1,1,"items.png",true,przedmioty["inventory"][v[1]].item)
				else
					przedmioty["inventory"][v[1]].tlo = guiCreateStaticImage(0,0,1,1,"items.png",true,przedmioty["inventory"][v[1]].item)
				end
				outputChatBox(v[1])
				przedmioty["inventory"][v[1]].image = guiCreateStaticImage(0,0,1,1,v.image,true,przedmioty["inventory"][v[1]].tlo)
				if (jezyk or "PL") == "ENG" then
					przedmioty["inventory"][v[1]].nazwa = guiCreateLabel(0,0,1,0.95,v[1],true,przedmioty["inventory"][v[1]].image)
				else
					przedmioty["inventory"][v[1]].nazwa = guiCreateLabel(0,0,1,0.95,v[4] and v[4] or v[1],true,przedmioty["inventory"][v[1]].image)
				end
				guiLabelSetVerticalAlign(przedmioty["inventory"][v[1]].nazwa,"top")
				przedmioty["inventory"][v[1]].ilosc = guiCreateLabel(0,0,1,0.95,"",true,przedmioty["inventory"][v[1]].image)
				przedmioty["inventory"][v[1]].image_src = v.image
					
				guiSetFont(przedmioty["inventory"][v[1]].nazwa,font2)
				guiSetFont(przedmioty["inventory"][v[1]].ilosc,font2)
				guiLabelSetVerticalAlign(przedmioty["inventory"][v[1]].ilosc,"bottom")
				guiLabelSetHorizontalAlign(przedmioty["inventory"][v[1]].ilosc,"center")
				guiLabelSetHorizontalAlign(przedmioty["inventory"][v[1]].nazwa,"center")
				guiSetProperty(przedmioty["inventory"][v[1]].nazwa,"Disabled","True")
				guiSetProperty(przedmioty["inventory"][v[1]].ilosc,"Disabled","True")
				guiSetProperty(przedmioty["inventory"][v[1]].tlo,"Disabled","True")
			end
		end
	end
end
createInventory()

function createimages()
	local add_weight = 0
	local add_height = 0
	for k,_ in pairs({1,2,3,4,5,6,7,8,9}) do
		add_weight = 0
		add_height = add_height + 0.05 * k + 0.11
		texty["loot"][k] = guiCreateLabel(0.03,add_height,0.5,0.15,keyTable["PL"][k],true,inv.pseudogrid[1])
		guiSetFont(texty["loot"][k],font)
		for i,v in pairs(obiekty[k]) do
			if add_weight + (0.1 * 2.8) > 0.94 then
				add_height = add_height + 0.17
				add_weight = 0
			end
			if v.image then
				przedmioty["loot"][v[1]] = {}
				--przedmioty[v[1]].item = guiCreateButton(0.05 + add_weight,0.05 + add_height,0.1 * v[3],0.15,"",true,inv.pseudogrid[1])
				przedmioty["loot"][v[1]].item = guiCreateButton(0,0.1,0,0,"",true,inv.pseudogrid[1])
				add_weight = add_weight + 0.1 * 2.8 + 0.03
				setElementData(przedmioty["loot"][v[1]].item,"Inventory-Item",{v[1],"loot"})
				if v[1]:find("\n") then
					przedmioty["loot"][v[1]].tlo = guiCreateStaticImage(0,0,1,1,"items.png",true,przedmioty["loot"][v[1]].item)
				else
					przedmioty["loot"][v[1]].tlo = guiCreateStaticImage(0,0,1,1,"items.png",true,przedmioty["loot"][v[1]].item)
				end
				przedmioty["loot"][v[1]].image = guiCreateStaticImage(0,0,1,1,v.image,true,przedmioty["loot"][v[1]].tlo)
				if (jezyk or "PL") == "ENG" then
					przedmioty["loot"][v[1]].nazwa = guiCreateLabel(0,0,1,0.95,v[1],true,przedmioty["loot"][v[1]].image)
				else
					przedmioty["loot"][v[1]].nazwa = guiCreateLabel(0,0,1,0.95,v[4] and v[4] or v[1],true,przedmioty["loot"][v[1]].image)
				end
				guiLabelSetVerticalAlign(przedmioty["loot"][v[1]].nazwa,"top")
				przedmioty["loot"][v[1]].ilosc = guiCreateLabel(0,0,1,0.95,"",true,przedmioty["loot"][v[1]].image)
				przedmioty["loot"][v[1]].image_src = v.image
				guiSetFont(przedmioty["loot"][v[1]].nazwa,font2)
				guiSetFont(przedmioty["loot"][v[1]].ilosc,font2)
				guiLabelSetVerticalAlign(przedmioty["loot"][v[1]].ilosc,"bottom")
				guiLabelSetHorizontalAlign(przedmioty["loot"][v[1]].ilosc,"center")
				guiLabelSetHorizontalAlign(przedmioty["loot"][v[1]].nazwa,"center")
				guiSetProperty(przedmioty["loot"][v[1]].nazwa,"Disabled","True")
				guiSetProperty(przedmioty["loot"][v[1]].ilosc,"Disabled","True")
				guiSetProperty(przedmioty["loot"][v[1]].tlo,"Disabled","True")
			end
		end
	end
end
createimages()


function refreshLoot(loot,gearName)
	local add_weight = 0
	local add_height = 0
	local refrehed_itemy = {}
	local col = getElementData(localPlayer,"currentCol")
	if not col then
		--guiSetText(inv.label[1], jezyk_to_cos[jezyk]["Pusto"]);
		guiSetText(inv.label[4], "0/0");
	end
	for k,_ in pairs({1,2,3,4,5,6,7,8,9}) do
		add_weight = 0
		refrehed_itemy[k] = 0
		if k - 1 > 0 and refrehed_itemy[k - 1] == 0 then
			add_height = add_height + 0.05
		else
			add_height = add_height + 0.21 * (k == 1 and 0 or 1)
		end
		
		--guiCreateLabel(0.03,add_height,0.5,0.15,keyTable["PL"][k],true,inv.pseudogrid[1])
		guiSetPosition(texty["loot"][k],0.03,add_height,true)
		for i,v in pairs(obiekty[k]) do
			if v.image then
				if add_weight + (0.1 *2.8) > 0.94 then
					add_height = add_height + 0.17
					add_weight = 0
				end
				if col and (getElementData(col,v[1]) or 0) > 0 then
					--przedmioty[v[1]].item = guiCreateButton(0.05 + add_weight,0.05 + add_height,0.1 * v[3],0.15,"",true,inv.pseudogrid[1])
					guiSetPosition(przedmioty["loot"][v[1]].item,0.05 + add_weight,0.05 + add_height,true)
					guiSetSize(przedmioty["loot"][v[1]].item,0.1 * 2.8,0.15,true)
					guiSetText(przedmioty["loot"][v[1]].ilosc,getElementData(col,v[1]))
					guiBringToFront(przedmioty["loot"][v[1]].item)
					refrehed_itemy[k] = refrehed_itemy[k] + 1
					add_weight = add_weight + 0.1 * 2.8 + 0.03
				else
					guiSetSize(przedmioty["loot"][v[1]].item,0,0,true)
				end
			end
		end
	end
	--guiSetText(inv.label[4], jezyk_to_cos[jezyk]["Sloty"]..": "..getElementCurrentSlots(loot).."/"..getElementMaxSlots(loot) + data);
end

function refreshInventory()
	local add_weight = 0
	local add_height = 0
	local refrehed_itemy = {}
	for k,_ in pairs({1,2,3,4,5,6,7,8,9}) do
		add_weight = 0
		refrehed_itemy[k] = 0
		if k - 1 > 0 and refrehed_itemy[k - 1] == 0 then
			add_height = add_height + 0.05
		else
			add_height = add_height + 0.21 * (k == 1 and 0 or 1)
		end
		
		--guiCreateLabel(0.03,add_height,0.5,0.15,keyTable["PL"][k],true,inv.pseudogrid[1])
		guiSetPosition(texty["inventory"][k],0.03,add_height,true)
		for i,v in pairs(obiekty[k]) do
			if v.image then
				if add_weight + (0.1 * 2.8) > 0.94 then
					add_height = add_height + 0.17
					add_weight = 0
				end
				if (getElementData(localPlayer,v[1]) or 0) > 0 then
					--przedmioty[v[1]].item = guiCreateButton(0.05 + add_weight,0.05 + add_height,0.1 * v[3],0.15,"",true,inv.pseudogrid[1])
					guiSetPosition(przedmioty["inventory"][v[1]].item,0.05 + add_weight,0.05 + add_height,true)
					guiSetSize(przedmioty["inventory"][v[1]].item,0.1 * 2.8,0.15,true)
					guiSetText(przedmioty["inventory"][v[1]].ilosc,getElementData(localPlayer,v[1]))
					guiBringToFront(przedmioty["inventory"][v[1]].item)
					refrehed_itemy[k] = refrehed_itemy[k] + 1
					add_weight = add_weight + 0.1 * 2.8 + 0.03
				else
					guiSetSize(przedmioty["inventory"][v[1]].item,0,0,true)
				end
			end
		end
	end
	local data = getElementData(localPlayer,"Custom_Slots") or 0
	-- guiSetText(inv.label[3], jezyk_to_cos[jezyk]['Sloty']..": "..getElementCurrentSlots(localPlayer).."/"..getElementMaxSlots(localPlayer) + data);
end
refreshLoot()


bindKey("M","down",function()
	local state = not guiGetVisible(inv.window[1])
	
	if state then
		refreshLoot()
		refreshInventory()
	end
	guiSetVisible(inv.window[1],state)
	showCursor(state)
end)

--[[
addEventHandler("onClientMouseEnter",resourceRoot,function()
	if getElementData(source,"Inventory-Item") then
		--guiSetProperty(przedmioty[getElementData(source,"Inventory-Item")].image,"FrameEnabled","True")
		guiStaticImageLoadImage(przedmioty[getElementData(source,"Inventory-Item")].tlo,"items_hover.png")
		guiStaticImageLoadImage(przedmioty[getElementData(source,"Inventory-Item")].image,przedmioty[getElementData(source,"Inventory-Item")].image_src)
	end
end)
]]
local selected

addEventHandler("onClientGUIClick",resourceRoot,function(s)
	if s ~= "left" then return end
	local inv_item = getElementData(source,"Inventory-Item")
	if inv_item then
		--guiSetProperty(przedmioty[getElementData(source,"Inventory-Item")].image,"FrameEnabled","True")
		if selected and selected[1] ~= source then
			guiStaticImageLoadImage(przedmioty[selected[2]][selected[1]].tlo,"items.png")
			guiStaticImageLoadImage(przedmioty[selected[2]][selected[1]].image,przedmioty[selected[2]][selected[1]].image_src)
			selected = false
		end
		guiStaticImageLoadImage(przedmioty[inv_item[2]][inv_item[1]].tlo,"items_hover.png")
		guiStaticImageLoadImage(przedmioty[inv_item[2]][inv_item[1]].image,przedmioty[inv_item[2]][inv_item[1]].image_src)
		selected = inv_item
	end
end)
--[[
addEventHandler("onClientMouseLeave",resourceRoot,function()
	if getElementData(source,"Inventory-Item") then
		--guiSetProperty(przedmioty[getElementData(source,"Inventory-Item")].image,"FrameEnabled","False")
		guiStaticImageLoadImage(przedmioty[getElementData(source,"Inventory-Item")].tlo,"items.png")
		guiStaticImageLoadImage(przedmioty[getElementData(source,"Inventory-Item")].image,przedmioty[getElementData(source,"Inventory-Item")].image_src)
	end
end)]]

