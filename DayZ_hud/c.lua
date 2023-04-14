

local sx, sy = guiGetScreenSize()

local scale = 1

if sy > 768 then
	scale = sy/768
end

local weaponslots = {
	[25] = 1, [26] = 1, [27] = 1,
	[30] = 1, [31] = 1, [33] = 1,
	[34] = 1, [2]  = 2, [4]  = 2,
	[5]  = 2, [9] = 2,	[6]  = 2, [8]  = 2,
	[22] = 2, [23] = 2, [24] = 2,
	[29] = 2, [16] = 3, [17] = 3, [28] = 2,
	[46] = 3, [43] = 3, [39] = 3, [41] = 2
};

local badSlots = {[0]=1, [1]=1, [9]=1, [10]=1, [11]=1, [12]=1};

local weaponname = ""


local hand_weapon = {
	[0] = true,
	[1] = true,
	[2] = true,
	[3] = true,
	[4] = true,
	[5] = true,
	[6] = true,
	[7] = true,
	[8] = true,
	[9] = true,
	--[16] = true,
}

local weapons = {
	["Harvest Scythe"] = {"images/kosa.png","Kosa Stacha"},
	["AK-47"] = {"images/ak-47.png","AK-47"},
	["AWP"] = {"images/awp.png","AWP"},
	["PKP Pecheneg"] = {"images/PKP.png","PKP Pecheneg"},
	["MG-34"] = {"images/mg34.png","MG-34"},
	["M4A1-S"] = {"images/M4.png","M4A1-S"},
	["G36C"] = {"images/G36C.png","G36C"},
	["Hunting Knife"] = {"images/knife.png","Nóż Myśliwski"},
	["Shovel"] = {"images/lopata.png","Łopata"},
	["Chainsaw"] = {"images/pila.png","Piła Spalinowa"},
	["Grenade"] = {"images/grenade.png","Granat"},
	["Winchester 1866"] = {"images/winchester.png","Winchester 1866"},
	["MP5A5"] = {"images/mp5.png","MP5A5"},
	["PDW"] = {"images/pdw.png","PDW"},
	["Baseball Bat"] = {"images/bat.png","Kij Bejzbolowy"},
	["Hatchet"] = {"images/hatchet.png","Siekiera"},
	["SPAZ-12 Combat Shotgun"] = {"images/spaz.png","SPAZ-12 Combat Shotgun"},
	["AA-12"] = {"images/aa12.png","AA-12"},
	["Barrett M107"] = {"images/Barrett.png","Barrett M107"},
	["M9 SD"] = {"images/m9sd.png","M9 SD"},
	["Lee Enfield"] = {"images/leenfield.png","Lee Enfield"},
	["Spray \n"] = {"images/Spray.png","Spray"},
	["M1911"] = {"images/M1119.png","M1911"},
	["SVD Dragunov"] = {"images/dragunov.png","SVD Dragunov"},
	["Scar-L"] = {"images/scar.png","Scar-L"},
	["M4A1"] = {"images/m4a1.png","M4A1"},
	["Parachute"] = {"images/m4a1.png","Spadochron"},
}

local WeaponNames = {
	["ENG"] = {
		["parachute"] = "Parachute",
	},
	["PL"] = {
		["parachute"] = "Spadochron",
	}
}

local font = exports.DayZ_font:GetFont("Roboto-Light", 14 * (sx/1920))

addEvent("onClientLogin", true)
addEventHandler("onClientLogin", root, function()
	addEventHandler("onClientRender",root,function()
		if not getElementData(localPlayer,'logedin') then return end
		local weapon = getPedWeapon(localPlayer);
		if weapon then
			local clip = getPedAmmoInClip(localPlayer);
			local ammo = (getPedTotalAmmo(localPlayer)-clip);
			if (weaponslots[weapon] == 1) then
				weaponname = getElementData(localPlayer, "currentweapon_1");
				if weapon == 34 then
				end
			elseif (weaponslots[weapon] == 2) then
				weaponname = getElementData(localPlayer, "currentweapon_2");
			elseif (weaponslots[weapon] == 3) then
				weaponname = getElementData(localPlayer, "currentweapon_3");
			else
				return
			end
			if hand_weapon[weapon] then
				clip = false
				ammo = ""
			end
			if weaponname then
				
				local image = weapons[weaponname] and weapons[weaponname][1]


				if weapons[weaponname] then
					local jezyk = getElementData(localPlayer,'Jezyk_Gry')
					if jezyk == "PL" then
						weaponname = weapons[weaponname][2]
					end
				elseif weapon == 46 then
					image = "images/parachute.png"
				elseif weapon == 17 then
					--image = "images/flara.png"
				elseif weapon == 24 then
					image = "images/suszara.png"
					weaponname = "Admin Suszarka"
					elseif weapon == 41 then
					image = "images/Spray.png"
					weaponname = "Spray"
				end

				local text

				if weapon == 16 then
					text = clip
				elseif weapon == 34 then
					text = ammo + clip
				elseif weapon == 46 then
					text = ammo
					weaponname = WeaponNames[getElementData(localPlayer, "Jezyk_Gry") or "ENG"]["parachute"]
				elseif clip then
					text = clip.." | "..ammo
				else
					text = ammo
				end
				
				dxDrawRectangle(sx * 0.8456, sy * 0.0111, sx * 0.1481, sy * 0.0778, tocolor(0, 0, 0, 50), false)
				dxDrawRectangle(sx * 0.8456, sy * 0.1000, sx * 0.1481, sy * 0.0233, tocolor(0, 0, 0, 50), false)
				dxDrawText(weaponname, sx * 0.8496, sy * 0.1000, sx * 0.9206, sy * 0.1233, tocolor(255, 255, 255, 175), 1.00, font, "left", "center", false, false, false, false, false)
				dxDrawText(text, sx * 0.9206, sy * 0.1000, sx * 0.9898, sy * 0.1233, tocolor(255, 255, 255, 175), 1.00, font, "right", "center", false, false, false, false, false)
				if weapon == 17 then return end
				dxDrawImage(sx * 0.8496, sy * 0.0151, sx * 0.1421, sy * 0.0738, image, 0, 0, 0, tocolor(255, 255, 255, 180), false)
			end
		end
	end)
end)