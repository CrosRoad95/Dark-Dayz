

local col_unbug = {}
local timer_unbug = {}
local col = createColCuboid(-299.5537109375, -167.9739074707, -32.253288269043,303.75, 54.75, 13.75)

local spawny = {
	{-372,2853,115}, 
	{-1110,2049,145}, 
	{306,633,13}, 
	{2449,1765,12}, 
	{928,405,22}, 
	{-814,132,20}, 
	{-2503,-635,136}, 
	{-2808,1164,22}, 
	{1206,-167,44}, 
	{1159,-2052,70}, 
	{2674,-64,50}, 
}

addCommandHandler("unbug",function(p)
	if col_unbug[p] then return end
	
	if isElementWithinColShape(p,col) or (getElementData(p, "GodMode") == true) then outputChatBox("* W greenzone nie mozesz uzyc komendy /unbug!",p,255,0,0) return end
	outputChatBox("* Za 1 minutę zostaniesz przeniesiony!",p,255,255,255)
	local pozycja = {getElementPosition(p)}
	col_unbug[p] = {createColSphere(pozycja[1],pozycja[2],pozycja[3],1),p}
	timer_unbug[p] = setTimer(function(p)
		if isElement(p) then
			destroyElement(col_unbug[p][1])
			col_unbug[p] = nil
			local x,y,z = unpack(spawny[math.random(#spawny)])
			setElementData(p,'GodMode',false)
			while ( isElement(p) and getElementAttachedTo(p) ) do
				triggerEvent("ungluePlayer", p)
			end
			setElementDimension(p, 0)
			setElementPosition(p,x,y,z)
			triggerClientEvent(p,"renderEnd",resourceRoot,pozycja)
		end
	end,10000,1,p)
	triggerClientEvent(p,"renderFirst",resourceRoot,pozycja)
end)


addEventHandler("onColShapeLeave",resourceRoot,function(hit)
	if col_unbug[hit] then
		triggerClientEvent(hit,"renderEnd",resourceRoot,pozycja)
		killTimer(timer_unbug[hit])
		destroyElement(source)
		col_unbug[hit] = nil
	end
end)
