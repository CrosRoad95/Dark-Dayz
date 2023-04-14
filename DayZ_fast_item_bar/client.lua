local sloty = {[1] = false, [2] = false, [3] = false}

local xml = xmlLoadFile("data.xml")

if not xml then
	xml = xmlCreateFile("data.xml","data")
	xmlNodeSetAttribute(xml,'data',toJSON({0, 0, 0}))
	xmlSaveFile(xml)
else
	local data = xmlNodeGetAttribute(xml, "data")
	if data then
		for i,v in pairs(fromJSON(data)) do
			if v == 0 then v = false end
			sloty[i] = v
		end
	end
	xmlSaveFile(xml)
end

function refreshXML()
	local zapis = {}
	zapis[1] = sloty[1] or 0
	zapis[2] = sloty[2] or 0
	zapis[3] = sloty[3] or 0
	xmlNodeSetAttribute(xml,'data',toJSON(zapis))
	xmlSaveFile(xml)
end


local weapon_table = {
	['Hunting Knife'] = "Hunting Knife \n",
	['Hunting Knife \n'] = "Hunting Knife",
	['M4 \n'] = "M4",
	['M4'] = "M4 \n",
	['AK-47 \n'] = "AK-47",
	['AK-47'] = "AK-47 \n",
	['Winchester 1866 \n'] = "Winchester 1866",
	['Winchester 1866'] = "Winchester 1866 \n",
	['SPAZ-12 Combat Shotgun \n'] = "SPAZ-12 Combat Shotgun",
	['SPAZ-12 Combat Shotgun'] = "SPAZ-12 Combat Shotgun \n",
	['Sawn-Off Shotgun \n'] = "Sawn-Off Shotgun",
	['Sawn-Off Shotgun'] = "Sawn-Off Shotgun \n",
	['Lee Enfield \n'] = "Lee Enfield",
	['Lee Enfield'] = "Lee Enfield \n",
	['CZ550 \n'] = "CZ550",--
	['CZ550'] = "CZ550 \n",
	['M1911 \n'] = "M1911",
	['M1911'] = "M1911 \n",
	['M9 SD \n'] = "M9 SD",
	['M9 SD'] = "M9 SD \n",
	['PDW \n'] = "PDW",
	['PDW'] = "PDW \n",
	['MP5A5 \n'] = "MP5A5",
	['MP5A5'] = "MP5A5 \n",
	['Desert Eagle \n'] = "Desert Eagle",
	['Desert Eagle'] = "Desert Eagle \n",
	['Hatchet \n'] = "Hatchet",
	['Hatchet'] = "Hatchet \n",
	['Baseball Bat \n'] = "Baseball Bat",
	['Baseball Bat'] = "Baseball Bat \n",
	['Shovel \n'] = "Shovel",
	['Shovel'] = "Shovel \n",
	['Golf Club \n'] = "Golf Club",
	['Golf Club'] = "Golf Club \n",
	['Chainsaw \n'] = "Chainsaw",
	['Chainsaw'] = "Chainsaw \n",
}

function isWeaponEquipped(item)
	if not item then return end

	local new_item = item:gsub(" \n","")

	if getElementData(localPlayer,item) > 0 then
		return item
	elseif getElementData(localPlayer,item)<=0 and (getElementData(localPlayer,item.." \n") or 0)>=1 then
		return item.." \n"
	elseif item:find(" \n") and getElementData(localPlayer,item)<=0 and (getElementData(localPlayer,new_item) or 0)>=1 then
		return item:gsub(" \n","")
	end

	return false
end

function getWeaponAfterDo(item)
	if weapon_table[item] then
		return weapon_table[item]
	end
	return false
end


function getWeaponSelected(item)
	if item:find(' \n') then
		return item:gsub(" \n")
	end
end

local timerson
local possible = true

addEventHandler("onClientPlayerNetworkStatus",root,function(status)
	if status == 0 then
		possible = false
	else
		possible = true
	end
end)

for i=1,3 do
	bindKey(tostring(i),'both',function(key,keyState)
		if getElementData(localPlayer,'Otwarte_Inv') then return end
		if keyState == "down" then
			local number = tonumber(key)
	
			if sloty[number] then
				if isTimer(timerson) then return end
				if not possible then return end
				timerson = setTimer(function() return end,1000,1)
				local item = isWeaponEquipped(sloty[number])
				if item then
				if getElementData(localPlayer, "GodMode") == true then outputChatBox ( "Nie mozesz wybrac broni w greenzone!", 255, 0, 0, true ) return end
				if getElementData(localPlayer, "block") == true then outputChatBox ( "Nie mozesz wybrac broni na evencie chowany!", 255, 0, 0, true ) return end
					exports.DayZ_Inventory:to_do_useItem(item)
					if getWeaponAfterDo(item) then
						sloty[number] = getWeaponAfterDo(item)
						refreshXML()
					else
						sloty[number] = item
						refreshXML()
					end
				else
					sloty[number] = false
					refreshXML()
				end
			end
		elseif keyState == "up" then
			ktore_klikniete = nil
		end		
	end)
end

function SetItemToFastBar(slot, item)
	if ((not slot) or (not item)) then return end

	if  item and (not isItemBinded(item)) then
		slot = tonumber(slot)
		sloty[slot] = item
		refreshXML()
	end
end

function isItemBinded(item)
	for i=1,3 do
		if item == sloty[i] then return true end
		if (item.." \n") == sloty[i] then return true end
	end

	return false
end

local screenW, screenH = guiGetScreenSize()
local font = exports.DayZ_font:GetFont("Roboto-Light", 9)

addEventHandler("onClientLogin", root, function()
addEventHandler("onClientRender", root,
	function()
		for k,v in pairs(sloty) do

			dxDrawRectangle(screenW * (0.3781+(0.05*k)), screenH * 0.9111, screenW * 0.0437, screenH * 0.0778, tocolor(0, 0, 0, 50), false)

			if v and ((getElementData(localPlayer, (v or "")) > 0) or ((getElementData(localPlayer, (isWeaponEquipped(v) or "")) or 0) > 0)) then
				if (v:find(' \n'))then
					v = string.gsub(v, " \n","")
				end

				if WeaponEquippedStatus(v) or getKeyState(k) then
					dxDrawRectangle(screenW * (0.3800+(0.05*k)), screenH * 0.9144, screenW * 0.0400, screenH * 0.0712, tocolor(255, 255, 255, 50), false)
				end

				local img = v
				if string.find(v, "Clothing") or string.find(v, "Suit") or string.find(v, "Kombinezon X")  or string.find(v, "Armor") then img = "Clothing" end
				if string.find(v, "Helmet") then img = "Helmet" end
				if string.find(v, "Vest") then img = "Vest" end
				
				if v ~= "" then dxDrawImage(screenW * (0.3800+(0.05*k)), screenH * 0.9144, screenW * 0.0400, screenH * 0.0711, "textures/"..img..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false) end
				local items_name = (GetTextLang(getElementData(localPlayer, "Jezyk_Gry"), v) or v)
				if string.len(items_name) > 9 then items_name = string.sub(items_name, 1,9) items_name = items_name.."..." end
				dxDrawText(items_name, screenW * (0.3800+(0.05*k)), screenH * 0.9144, screenW * 0.04700, screenH * 0.09856, tocolor(255, 255, 255, 255), 1.00, font, "left", "top", false, false, false, false, false)
			end
		end
    end
)
end)

function WeaponEquippedStatus(weapon)

	for i=1,3 do
		if getElementData(localPlayer, "currentweapon_"..i) == weapon then return true end
	end

	return false
end

setTimer(function()
	for k,v in pairs(sloty) do
		if tostring(v) == "true" then sloty[k] = false end
	end
end, 10000, 0)