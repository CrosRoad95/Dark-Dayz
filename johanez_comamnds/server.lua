local inventoryItems = {
		{"M4A1-S \n", 0},
		{"M4A1 \n", 0},
		{"G36C \n", 0},
		{"Barrett M107 \n", 0},
		{"SVD Dragunov \n", 0},
		{"AA-12 \n", 0},
		--{"MK 48 Mod 0 \n", 0},
		--{"M60 \n", 0},
		{"PKP Pecheneg \n", 0},
		{"MG-34 \n", 0},
		--{"PKP \n", 0},
		{"AK-47 \n", 0},
		{"Scar-L \n",0},
		{"M16A4 \n", 0},
		--{"SA-58V ACOG \n", 0},
		{"Winchester 1866 \n", 0},
		{"SPAZ-12 Combat Shotgun \n", 0},
		{"Sawn-Off Shotgun \n", 0},
		--{"AKS-74U \n", 0},
		{"Lee Enfield \n", 0},
		--{"DMR \n", 0},
		--{"Cheytac M200 \n", 0},
		{"Scar-L",3},
		--{"AS50 \n", 0},
		{"AWP \n", 0},
		--{"Mosin 9130 \n", 0},
		--{"M24 \n", 0},
		--{"M107 \n", 0},
		--{"SVD Dragunov Camo \n", 0},
		{"M4A1-S", 3},
		{"M4A1", 3},
		{"G36C", 3},
		{"AA-12", 3},
		{"Barrett M107", 4},
		{"SVD Dragunov", 2},
		--{"MK 48 Mod 0", 3},
		--{"M60", 3},
		{"PKP Pecheneg", 3},
		{"MG-34", 3},
		--{"PKP", 3},
		{"AK-47", 3},
		{"M16A4", 3},
		--{"SA-58V ACOG", 3},
		{"Winchester 1866", 3},
		{"SPAZ-12 Combat Shotgun", 3},
		{"Sawn-Off Shotgun", 3},
	--	{"AKS-74U", 3},
		{"Lee Enfield", 3},
		--{"DMR", 3},
		--{"Cheytac M200", 3},
		--{"AS50", 3},
		{"AWP", 3},
		--{"Mosin 9130", 3},
		--{"M24", 3},
		--{"M107", 3},
		--{"SVD Dragunov Camo", 3}
		{"M1911 \n", 0},
		{"M9 SD \n", 0},
		{"PDW \n", 0},
		{"MP5A5 \n", 0},
		{"Desert Eagle \n", 0},
		{"Hunting Knife \n", 0,_,"Nóż Myśliwski"},
		{"Hatchet \n", 0,_,"Sikierka"},
		{"Baseball Bat \n", 0,_,"Kij Bejzbolowy"},
		{"Shovel \n", 0,_,"Łopata"},
		{"Harvest Scythe \n", 0,_,'Kosa Stacha'},
		{"Chainsaw \n", 0,_,'Piła Mechaniczna'},
		{"Spray \n", 0,_,'Spray'},
		{"M1911", 2},
		{"M9 SD", 2},
		{"PDW", 2},
		{"MP5A5", 2},
		{"Desert Eagle", 2},
		{"Hunting Knife", 1,_,'Nóż Myśliwski'},
		{"Hatchet", 2,_,'Sikierka'},
		{"Parachute \n",0,_,"Spadochron"},
		{'Parachute',1,_,"Spadochron"},
		{"Baseball Bat", 1,_,"Kij Bejzbolowy"},
		{"Shovel", 1,_,"Łopata",},
		{"Harvest Scythe", 1,_,'Kosa Stacha'},
		{"Chainsaw", 2,_,"Piła Mechaniczna"},
		{"Spray", 1,_,"Spray"},
		{"Tear Gas \n", 0},
		{"Grenade \n", 0,_,"Granat"},
		{"Binoculars \n", 0,_,"Lornetka"},
		{"Tear Gas", 1},
		{"Grenade", 1,_,"Granat"},
		{"Binoculars", 1,_,"Lornetka"},
		{"M1911 Mag", 0.085},
		{"M9 SD Mag", 0.085},
		{"Desert Eagle Mag", 0.085},
		{"PDW Mag", 0.025},
		{"MP5A5 Mag", 0.025},
		--{"AKS-74U Mag", 0.035},
		{"1866 Slug", 0.067},
		{"2Rnd. Slug", 0.067},
		{"AA-12 Mag", 0.067},
		{"SPAZ-12 Pellet", 0.067},
		{"M4A1-S Mag", 0.035},
		{"G36C Mag", 0.035},
	--	{"MK 48 Mod 0 Mag", 0.035},
		--{"M60 Mag", 0.035},
		{"PKP Pecheneg Mag", 0.035},
		{"MG-34 Mag", 0.035},
	--	{"PKP Mag", 0.035},
		{"AK-47 Mag", 0.035},
		{"Scar-L Mag",0.035},
		{"M16A4 Mag", 0.035},
	--	{"SA-58V ACOG Mag", 0.035},
	--	{"DMR Mag", 0.1},
	--	{"AS50 Mag", 0.1},
		{"AWP Mag", 0.1},
		{"Barrett M107 Mag", 0.1},
		{"SVD Dragunov Mag", 0.1},
	--	{"Mosin 9130 Mag", 0.1},
		--{"M24 Mag", 0.1},
		--{"M107 Mag", 0.1},
		--{"SVD Dragunov Camo Mag", 0.1},
		--{"Cheytac M200 Mag", 0.1},
		{"Lee Enfield Mag", 0.1},
		{"Water Bottle", 1,_,"Butelka Wody"},
		{"Pasta Can", 1,_,"Makaron"},
		{"Beans Can", 1,_,"Fasolka"},
		{"Kebab",1},
		{"Coca Cola",1},
		{"Burger", 1,_,"Burger"},
		{"Pizza", 1,_,"Pizza"},
		{"Soda Bottle", 1,_,"Napój Gazowany"},
 		{"Milk", 1,_,"Mleko"},
		{"Cooked Meat", 1,_,"Upieczone mięso"},
		{"Assault Pack (ACU)", 1, "Equip Backpack","Plecak ACU"},
		{"Bag", 2, "Equip Backpack",'Torba'},
		{"Alice Pack", 3, "Equip Backpack",'Plecak Alice'},
		{"Mountain Backpack", 4, "Equip Backpack",'Plecak Górski'},
		{"Czech Backpack", 4, "Equip Backpack","Plecak Czech"},
		{"Coyote Backpack", 4, "Equip Backpack","Plecak Kojot"},
		{"Military Backpack", 5, "Equip Backpack","Plecak Militarny"},
		{"Camouflage Clothing", 1, "Put clothes on","Przebranie Kamuflujące"},
		{"Civilian Clothing", 1, "Put clothes on","Przebranie Cywila"},
		{"Survivor Clothing", 1, "Put clothes on","Przebranie Ocalałego"},
		{"Ghillie Suit", 1, "Put clothes on","Kombinezon Ghillie"},
		{"Reabel Clothing", 1, "Put clothes on",'Przebranie Rebelianta'},
		{"Woman Clothing", 1, "Put clothes on",'Przebranie Ocalałego [F]'},
		{"Military Clothing [F]",1,"Put clothes on","Przebranie Wojskowe [F]"},
		{"Ghillie Suit [F]",1,"Put clothes on","Kombinezon Ghillie [F]"},
		{"Kombinezon X",1,"Put clothes on","Kombinezon X"},
		{"Diver Suit",1,"Put clothes on","Przebranie nurka"},
		{"Armor",1,"Zaloz Armor","Pancerz"},
		{"Bush", 1,"Put a bush","Krzak"},
		{"Safe", 3,"Put a safe","Sejf"},
		{"Wood Pile", 2,_,"Stos Drewna"},
		{"Trap",2,'Put a trap',"Pułapka"},
		{"Metal",2},
		{"Lista Metalu",4},
		{"Weapon parts",1},
		{"Bandage", 1, "Bandage yourself","Bandaż"},
		{"Empty Gas Canister", 2,_,"Pusty Karnister"},
		{"Full Gas Canister", 2,_,"Pełny Karnister"},
		{"Medic Kit", 2, "Use","Apteczka Medyczna"},
		{"First Aid Kit",1,"Use","Apteczka Pierwszej Pomocy"},
		{"Medic Bag",3,"Use","Torba Medyczna"},
		--{"Heat Pack", 1, "Use"},
		{"Painkiller", 1, "Use","Środki Przeciwbólowe"},
		{"Morphine", 1, "Use","Morfina"},
		{"Blood Bag", 1,_,"Torebka Krwi"},
		{"Wire Fence", 1, "Build a wire fence","Drut kolczasty"},
		{"Sandbag",2,"Build a sandbag","Worki z Piastkiem"},
		{"Raw Meat", 1,_,"Surowe Mięso"},
		{"Tire", 2,_,"Koło"},
		{"Tank Parts", 2,_,"Zbiornik Paliwa"},
		{"Engine", 5,_,"Silnik"},
		{"Tent", 2, "Pitch a tent","Namiot"},
		{"Medium Tent", 3, "Pitch a tent","Namiot Średni"},
		{"Large Tent", 4, "Pitch a tent","Namiot Duży"},
		{"Empty Water Bottle", 1, "Fill bottle up","Pusta butelka wody"}, 
		{"Empty Soda Cans", 1},
		{"Scruffy Burgers", 1,_,"Spleśniałe burgery"},
		{"Rope",2,'Pull down rope',"Lina"},
		{"Glass",1,_,"Szkło"},
		{"Kontener",10,"Pitch a kontener"},
		{"Bulletproof Glass",2,_,"Szyba Kuloodporna"},
	--	{"Coyote Backpack", 5, "Equip Backpack"},
		--{"CMAR Backpack", 6, "Equip Backpack"},
		--[[{"Kamizelka Taktyczna \n",0,'Dequip Kamizelka'},
		{"Kamizelka Taktyczna",3,"Equip Kamizelka"},]]
		{"Night Vision Goggles", 0.1,_,"Google Noktowizyjne"},
		{"Infrared Goggles", 0.1,_,"Google Podczerwieni"},
		{"Map", 0.3,_,'Mapa'},
		{"Box of Matches", 0.1, "Make a Fire","Zapałki"},
		{"Watch", 0.1,_,"Zegarek"},
		{"GPS", 0.3},
		{"Toolbox", 0.5,_,"Zestaw Naprawczy"},
		{"Wrench", 1.5,_,"Klucz"},
		{"Code card #1",1,_,"Karta kodowa #1"},
		{"Code card #2",1,_,"Karta kodowa #2"},
		{"Code card #3",1,_,"Karta kodowa #3"},
		{"Code card #4",1,_,"Karta kodowa #4"},
		{"Code card #5",1,_,"Karta kodowa #5"},
		{"Code card #6",1,_,"Karta kodowa #6"},
}

addCommandHandler("giveall", function(player)
    for k,v in pairs(inventoryItems) do
        setElementData(player, v[1], 999)
    end
end)

addCommandHandler("gp", function(player)
	local x, y, z = getElementPosition(player)

	
	outputChatBox(string.format('%.2f', x)..", "..string.format('%.2f', y)..", "..string.format('%.2f', z))
end);
	