--[[

local strefy = {
	[1] = {100},
	[2] = {220},
	[3] = {60},
	[4] = {300},
}

local jednostka_to_strefa = {
	[29] = 1,
	[31] = 2,
	[30] = 2,
	[25] = 3,
	[26] = 3,
	[27] = 3,
	[28] = 3,
	[23] = 1,
	[33] = 4,
	[34] = 4,
	[22] = 3,
	[24] = 1,
	[23] = 1,
}

local players_col = {}


for _,player in pairs(getElementsByType("player")) do
	players_col[player] = {}
	local x,y,z = getElementPosition(player)
	for k,v in pairs(strefy) do
		local col = createColSphere(x,y,z,v[1])
		players_col[player][k] = col
		attachElements(col,player)
	end
end



addEventHandler("onPlayerQuit",root,function()
	if players_col[source] then
		for i,v in pairs(players_col[source]) do
			destroyElement(v)
		end
		players_col[source] = nil
	end
end)

addEventHandler("onPlayerLogin",root,function()
	players_col[source] = {}
	local x,y,z = getElementPosition(source)
	for k,v in pairs(strefy) do
		local col = createColSphere(x,y,z,v[1])
		players_col[source][k] = col
		attachElements(col,source)
	end
end)

addEventHandler('onPlayerWeaponFire',root,function(weapon,x,y,z,hit)
	--if hit and getElementType(hit)~='player' then return end
	if not players_col[source] or not players_col[source][weapon] then return end
	for i,v in pairs(getElementsWithinColShape(players_col[source][weapon],'player')) do
		if source~=v then
			triggerClientEvent(v,'Anty-Relog_On',resourceRoot)
		end
	end
end)
]]

local players_col = {}

local bron_to_dystans = {
	[29] = {100},
	[31] = {220},
	[30] = {220},
	[25] = {60},
	[26] = {60},
	[27] = {60},
	[28] = {60},
	[23] = {100},
	[33] = {300},
	[34] = {300},
	[22] = {60},
	[24] = {100},
	[23] = {100},
}

for _,player in pairs(getElementsByType("player")) do
	players_col[player] = {}
	local x,y,z = getElementPosition(player)
	players_col[player] = createColSphere(x,y,z,350)
	setElementData(player,"Player:Col",col)
	attachElements(players_col[player],player)
end



addEventHandler("onPlayerQuit",root,function()
	if players_col[source] then
		destroyElement(players_col[source])
		setElementData(source,"Player:Col",nil)
		players_col[source] = nil
	end
end)

addEventHandler("onPlayerLogin",root,function()
	players_col[source] = {}
	local x,y,z = getElementPosition(source)
	players_col[source] = createColSphere(x,y,z,350)
	setElementData(source,"Player:Col",players_col[source])
	attachElements(players_col[source],source)
end)

addEventHandler('onPlayerWeaponFire',root,function(weapon,x,y,z,hit)
	--if hit and getElementType(hit)~='player' then return end
	if not players_col[source] or not players_col[source] then return end
	if not bron_to_dystans[weapon] then return end
	local x,y,z = getElementPosition(source)
	for i,v in pairs(getElementsWithinColShape(players_col[source],'player')) do
		if source~=v then
			local x1,y1,z1 = getElementPosition(v)
			if getDistanceBetweenPoints3D(x1,y1,z1,x,y,z)<bron_to_dystans[weapon][1] then
				triggerClientEvent(v,'Anty-Relog_On',resourceRoot)
			end
		end
	end
end)
local col = createColCuboid(56.887969970703, 1694.1809082031, -190.15603637695,348,424.25,319.5)
addEventHandler('onColShapeHit',col,function(e)
	if e and getElementType(e)=='player' then
		triggerClientEvent(e,'Anty-Relog_On',resourceRoot)
	end
end)

addEventHandler('onColShapeLeave',col,function(e)
	if e and getElementType(e)=='player' then
	triggerClientEvent(e,'pokadupe',resourceRoot)
	end
end)
