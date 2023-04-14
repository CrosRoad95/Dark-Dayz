

local grupy_to_skin = {
	--"FAM v.3"] = 231, -- Oplacono do: 15.03.2020
	--["Team SuspecT"] = 231, -- Oplacono do: 01.05.2020
	--[" ☠ ☠  Zainfekowani   ☠ ☠"] = 232, -- Oplacono do: 16.03.2020
	
	--["Kluski"] = 232, -- Oplacono do: 04.04.2020
	--["Alesyf"] = 234, -- Oplacono do: 12.04.2020
	--["gengbeng"] = 240, -- Oplacono do: 12.04.2020
	--["4Fun"] = 241, -- Oplacono do: 12.09.2020
	["family content"] = 248, -- Oplacono do: 06.11.2020
	["G.R.O.M"] = 247, -- Oplacono do: 16.11.2020
	--["TeczoweKoniePDG"] = 247, -- Oplacono do: 22.05.2019
	--["BlackRose"] = 243, -- Oplacono do: 16.03.2020
	--["TaczkaSquad*~Legends"] = 243, -- Oplacono do: 16.03.20255
	--["NaPyrke"] = 248, -- Oplacono do: FOREVER
	--["PRO100wRYJ"] = 235, -- Oplacono do: 02.04.2020
	--["Czaszko-Głowi"] = 250, -- Oplacono do: 05.06.2020
	--["Liski"] = 251, -- Oplacono do: 12.05.2020
	["GOMBAO.33"] = 253, -- Oplacono do: FOREVER
	--["BlackRose"] = 254, -- Oplacono do: 13.05.2020
	--["WarriorS"] = 255, -- Oplacono do: 15.05.2020
	["MafiaDonAlvaro"] = 256, -- Oplacono do: 23.11.2020r.
	--["Opportunity"] = 258, -- Oplacono do: 12.10.2020 
	--["KonstruktywnaKrytyka"] = 259, -- Oplacono do: 23.05.2020 
	["Admin"] = 260, -- Oplacono do: FOREVER 
	--["4P1K3"] = 261, -- Oplacono do: 23.05.2020
	--["Thunder"] = 262, -- Oplacono do: 23.05.2020
	--["ForTheWin"] = 263, -- Oplacono do: 01.08.2020
	--["MonsterKill"] = 264, -- Oplacono do: 08.25.2020
	--["SZEF"] = 254, -- Oplacono do: 08.29.2020 // nowy old 77
	[">LuckyShot<"] = 200, -- Oplacono do: 26.11.2020
	--["PolandSkillPro"] = 201, -- Oplacono do: 09.09.2020
	["ThundeR"] = 210, -- Oplacono do: 05.11.2020
	["NoFear"] = 204, -- Oplacono do: 05.11.2020
	["Lajkonik"] = 207, -- Oplacono do: 04.11.2020
	--["PołudnieŻycieKot"] = 202, -- Oplacono do: 25.10.2020
	["TeczoweKonie"] = 264, -- Oplacono do: 19.11.2020
	--["Infrared Goggles"] = 205, -- Oplacono do: 20.10.2020
	[" Ghosts"] = 252, -- Oplacono do: 02.03.2021 | 2 marca 2021r.
	["Rebels"] = 212, -- Oplacono do: 04.11.2020
	["AngelsFromHell"] = 255, -- Oplacono do: 04.11.2020
	["We are good "] = 257, -- Oplacono do: 04.11.2020
	--212,252,205,203,210,207,204,202,200

} 

local language = {
	["PL"] = "Zalożyłeś skin grupowy!",
	["ENG"] = "You take a group skin!",
}

for i, v in pairs(getElementsByType("player")) do
	if getElementData(v,"Grupa") then
		local s = getElementData(v,"Grupa").nazwa
		if grupy_to_skin[s] then
			setElementData(v, "Have-Skin", grupy_to_skin[s])
		end
	end
end

function checkIsSkinInTable(player)
	if getElementData(player, "Grupa") then
		local s = getElementData(player,"Grupa").nazwa
		if grupy_to_skin[s] then
			return grupy_to_skin[s]
		end
	end
	return false
end

addEventHandler("onPlayerLogin", root, function()
	if getElementData(source, "Grupa") then
		local s = getElementData(source,"Grupa").nazwa
		if grupy_to_skin[s] then
			setElementData(source, "Have-Skin", grupy_to_skin[s])
		end
	end
end, true, "low")

addEvent("Zaloz_skin_grupowy", true)
addEventHandler("Zaloz_skin_grupowy", root, function()
	local player = client
	if not getElementData(player,"logedin") then return end
	if not getElementData(player,"Grupa") then return end
	if grupy_to_skin[getElementData(player,"Grupa").nazwa] then
		setElementData(player,"skin",grupy_to_skin[getElementData(player,"Grupa").nazwa])
		setElementModel(player,grupy_to_skin[getElementData(player,"Grupa").nazwa])
		local jezyk = getElementData(player,"Jezyk_Gry") or "PL"
		triggerClientEvent(player, "stworz_notyfikacje", player, "sucess", language[jezyk])
	end
end)
