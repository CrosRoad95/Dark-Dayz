
local marker = createMarker(2315.431640625,33.5732421875,26.473955154419,"cylinder",1.5,200,200,0,180)
--createBlipAttachedTo(marker,27,0,0,0,0,0,0,300)

local bronie = {
	{"M4A1-S", 1},
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
		if item == "M4A1" then
			local check = getElementData(client,"M4A1-S")
			local check2 = getElementData(client,"Weapon parts")
			if not check == 0 and check2 == 0 or check2 == 1 or check2 == 2 or check2 == 3 or check2 == 4 or check2 == 5 or check2 == 6 or check2 == 7 or check2 == 8 or check2 == 9 or check2 == 10 or check2 == 11 or check2 == 12 or check2 == 13 or check2 == 14 or check2 == 15 or check2 == 16 or check2 == 17 or check2 == 18 or check2 == 19 or check2 == 20 or check2 == 21 or check2 == 22 or check2 == 23 or check2 == 24 or check2 == 25 or check2 == 26 or check2 == 27 or check2 == 28 or check2 == 29 then outputChatBox("Nie masz potrzebnych części!",client,255,0,0) return end
			setElementData(client,"M4A1-S", check-1)
			setElementData(client,"Weapon parts", check2-30)
		end
		setElementData(client,item,(getElementData(client,item) or 0) + ilosc)
		outputChatBox("* Zcraftowano pomyślnie! Otrzymujesz: "..item.." x"..ilosc,client,0,255,0)
	else
		outputChatBox("* Posiadasz za mało slotów!",client,255,0,0)
	end
end)