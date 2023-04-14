createBlip(-497.7001953125,-111.90000152588,87.900001525879,52)


local col = createColCuboid(-580.49017333984,-185.02024841309,50.312812805176,147.25,177.75,38.25)


local elements_in_col = {
	['group'] = {},
	['player'] = {},
}

local punkty = {
	['group'] = {},
	['player'] = {},
}


local top_15 = {
	['group'] = {},
	['player'] = {},
}

function isTable(arg)
	if type(arg)=='table' then
		if #arg>=1 then
			return true
		end
		return false
	end
	return true
end


setTimer(function()
	for k,_ in pairs(elements_in_col) do
		for i,v in pairs(elements_in_col[k]) do
			if isTable(elements_in_col[k][i]) then
				if not punkty[k][i] then
					punkty[k][i] = 1
				else
					if type(elements_in_col[k][i])=='table' then
						punkty[k][i] = punkty[k][i] + #elements_in_col[k][i]
					else
						punkty[k][i] = punkty[k][i] + 1
					end
				end
			end
		end
	end
	local topka = {}
	topka.gracze = {}
	topka.grupy = {}
	for i,v in pairs(punkty['group']) do
		table.insert(topka.grupy,{i,v})
	end
	for i,v in pairs(punkty['player']) do
		table.insert(topka.gracze,{i,v})
	end
	table.sort(topka.gracze,function(a,b)
		return a[2]>b[2]
	end)
	table.sort(topka.grupy,function(a,b)
		return a[2]>b[2]
	end)
	local new_topka = {}
	if #topka.gracze>=15 then
		for i=1,15 do
			table.insert(new_topka,{topka.gracze[i][1],topka.gracze[i][2]})
		end
	else
		new_topka = topka.gracze
	end
	top_15['player'] = new_topka
	new_topka = {}
	new_topka = topka.grupy

	top_15['group'] = new_topka
end,60000,0)


function getPlayerFromSerial(player)
	for i,v in pairs(getElementsByType('player')) do
		if player==getPlayerSerial(v) then
			return getPlayerName(v)
		end
	end
	return player
end

function removeWartoscFromTabela(tabela,wartosc)
	for i,v in pairs(tabela) do
		if v==wartosc then
			table.remove(tabela,i)
		end
	end
end

addEventHandler('onColShapeHit',col,function(hit)
	if hit and getElementType(hit)=='player' then
		if getElementData(hit,"Grupa") then
			if not elements_in_col['group'][getElementData(hit,'Grupa').nazwa] then
				elements_in_col['group'][getElementData(hit,'Grupa').nazwa] = {}
			end
			table.insert(elements_in_col['group'][getElementData(hit,'Grupa').nazwa],getPlayerSerial(hit))
		end
		elements_in_col['player'][getPlayerSerial(hit)] = true
		Matmathing_dimension[getPlayerSerial(hit)] = getPlayerName(hit)
	end
end)


function znajdzWartoscWTablicy(tablica,wartosc)
	for i,v in pairs(tablica) do
		if v==wartosc then
			return true
		end
	end
	return false
end

addEventHandler('onPlayerWasted',root,function(weapon,killer)
	if killer and getElementType(killer)=='player' then
		if isElementWithinColShape(killer,col) then
			if elements_in_col['player'][getPlayerSerial(killer)] then
				if not punkty['player'][getPlayerSerial(killer)] then
					punkty['player'][getPlayerSerial(killer)] = 1
				else
					punkty['player'][getPlayerSerial(killer)] = punkty['player'][getPlayerSerial(killer)] + 1
				end
			end
			if getElementData(killer,'Grupa') then
				if elements_in_col['group'][getElementData(killer,'Grupa').nazwa] then
					punkty['group'][getElementData(killer,'Grupa').nazwa] = punkty['group'][getElementData(killer,'Grupa').nazwa] + 1
				end
			end
		end
	end
end)




addEventHandler('onPlayerChangeNick',root,function()
	if wasEventCancelled() then
		return
	end
	Matmathing_dimension[getPlayerSerial(source)] = getPlayerName(source)
end)


addEventHandler('onColShapeLeave',col,function(hit)
	if hit and getElementType(hit)=='player' then
		if getElementData(hit,'Grupa') then
			if elements_in_col['group'][getElementData(hit,'Grupa').nazwa] then
				removeWartoscFromTabela(elements_in_col['group'][getElementData(hit,'Grupa').nazwa],getPlayerSerial(hit))
			end
			elements_in_col['player'][getPlayerSerial(hit)] = nil
		end
	end
end)

function refreshTable(old_table)
	local nju_table = {}
	for i,v in pairs(old_table) do
		if Matmathing_dimension[v[1]] then
			nju_table[Matmathing_dimension[v[1]]] = {Matmathing_dimension[v[1]],v[2]}
		else
			nju_table[i] = {v[1],v[2]}
		end
	end
	return nju_table
end


local anty_ddos = {}

function openPanel(player)
	if getElementData(player,'PanelOtwarty') then
		triggerClientEvent(player,'openPanel',resourceRoot,refreshTable(top_15['player']),top_15['group'])
		return
	end
	if anty_ddos[player] and anty_ddos[player]-getTickCount()>1 then
		outputChatBox("Poczekaj chwilę!",player,255,0,0)
		return
	else
		anty_ddos[player] = getTickCount() + 0
	end
	triggerClientEvent(player,'openPanel',resourceRoot,refreshTable(top_15['player']),top_15['group'])
end

for i,v in pairs(getElementsByType('player')) do
	bindKey(v,'f9','down',openPanel)
end

addEventHandler('onPlayerJoin',root,function()
	bindKey(source,'f9','down',openPanel)
end)

addEventHandler('onPlayerQuit',root,function()
	if isElementWithinColShape(source,col) then
		if getPlayerAccount(source) then
			setAccountData(getPlayerAccount(source),'isDead',true)
		end
	end
end)


for _,v in ipairs(getElementsByType("player")) do
		local jezyk = getElementData(v,'Jezyk_Gry') or "PL"
		if jezyk =="PL" then
			outputChatBox ("#ff0000HANGAR ZOSTAL ZRESPIONY!",v,255,255,255,true)
			outputChatBox ("#ff0000Ranking hangaru jest pod F9",v,255,255,255,true)
			outputChatBox ("#ff0000Szukaj Dolara na mapie!",v,255,255,255,true)
			outputChatBox ("#ff0000Hangar trwa od 18:00 do 19:00!",v,255,255,255,true)
			outputChatBox ("#ff0000Życzymy powodzenia!",v,255,255,255,true)
		else
			outputChatBox ("#ff0000HANGAR HAS BEEN CREATED!",v,255,255,255,true)
			outputChatBox ("#ff0000The hangar ranking is under F9",v,255,255,255,true)
			outputChatBox ("#ff0000Look for dollar on the map!",v,255,255,255,true)
			outputChatBox ("#ff0000The hangar is open from 6 p.m. to 7 p.m.!",v,255,255,255,true)
			outputChatBox ("#ff0000Good luck!",v,255,255,255,true)
		end
end

most_state = 0 -- pozycja bramy / 0 zamknieta / 1 otwarta
most_obiekt = createObject(10828,-505.400390625,-184.900390625,88.199996948242,0,0,0) -- tworzymy obiekt bramy
most_obiekt2 = createObject(10828,-433,-81.099609375,65.099998474121,0,0,90) -- tworzymy obiekt bramy
most_obiekt3 = createObject(10828,-506.7001953125,-7.900390625,65.099998474121,0,0,0) -- tworzymy obiekt bramy

addCommandHandler("openhangarkurwa123", function (p, c) -- rozpoczynamy pisanie komendy dodaj
	if most_state == 0 then															-- j
		moveObject(most_obiekt, 60000, -505.400390625,-184.900390625,72.699996948242) 	-- wtedy otwieramy otiwerame baze
		moveObject(most_obiekt2, 60000, -433,-81.099609375,56.700000762939) 	-- wtedy otwieramy otiwerame baze
		moveObject(most_obiekt3, 60000, -506.7001953125,-7.900390625,53.299999237061) 	-- wtedy otwieramy otiwerame baze
		most_state = 1
	else																				-- jenak jest otwarta to...
		moveObject(most_obiekt,60000, -505.400390625,-184.900390625,88.199996948242) 		-- zamykamy
		moveObject(most_obiekt2,60000, -433,-81.099609375,65.099998474121) 		-- zamykamy
		moveObject(most_obiekt3,60000, -506.7001953125,-7.900390625,65.099998474121) 		-- zamykamy
		most_state = 0
	end
end)




