
local marker = createMarker(2604,2845,10,"cylinder",1.5,200,200,0,180)

local text=createElement('text')
setElementPosition(text,2604,2845,10.5)
setElementData(text,"name","Rozmontowywanie\nBroni")

local bronie = {
	{"M4A1-S", 1},
	{"Scar-L", 1},
	{"G36C", 1},
	{"PKP Pecheneg", 3},
	{"MG-34", 3},
	{"AK-47", 1},
	{"M16A4",1},
	{"Winchester 1866", 0.2},
	{"SPAZ-12 Combat Shotgun", 0.2},
	{"Sawn-Off Shotgun", 0.2},
	{"Lee Enfield", 0.2},
	{"AWP", 1},
	{"M1911", 0.1},
	{"M9 SD", 0.1},
	{"PDW", 0.1},
	{"MP5A5", 0.1},
	{"Desert Eagle", 0.1},
}

function zabierzLosowePrzedmoty(player,ilosc)
	local metal = 0
	local przedmioty = {}
	for i,v in pairs(bronie) do
		
		if (getElementData(player,v[1]) or 0) >= 1 then
			--metal = metal + v[2] * (getElementData(client,v[1]) or 0)
			przedmioty[v[1]] = 0
			local curr_metal = 0
			
			for i=1,getElementData(player,v[1]) do
				curr_metal = v[2] * i
				przedmioty[v[1]] = i
				local modff = curr_metal + metal
				if modff >= ilosc then
					for i,v in pairs(przedmioty) do
						setElementData(player,i,(getElementData(player,i) or 0) - v)
					end
					return true
				end
				
			end
			metal = metal + curr_metal
		end
	end
	return false
end

addEvent("giveSomething",true)
addEventHandler("giveSomething",resourceRoot,function(item,ilosc)
	if not item or not ilosc then return end
	local item_slot = exports.DayZ_core:getItemSlots(item) or 0;
	if exports.DayZ_core:getElementCurrentSlots(client) + (item_slot * ilosc) <= getElementData(client,'MAX_Slots') + (getElementData(client,"Custom_Slots") or 0) then
		if item == "Weapon parts" then
			local check = zabierzLosowePrzedmoty(client,1)
			if not check then return end
		end
		setElementData(client,item,(getElementData(client,item) or 0) + ilosc)
		outputChatBox("* Zcraftowano pomyślnie! Otrzymujesz: "..item.." x"..ilosc,client,0,255,0)
	else
		outputChatBox("* Posiadasz za mało slotów!",client,255,0,0)
	end
end)