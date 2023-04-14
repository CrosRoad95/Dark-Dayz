


addEvent("setOznaczenie",true)
addEventHandler("setOznaczenie",resourceRoot,function(players,start)
	for i,v in pairs(players) do
		if isElement(v) then
			triggerClientEvent(v,"PokazOznaczenie",resourceRoot,start)
		end
	end
	triggerClientEvent(client,"PokazOznaczenieToOwner",resourceRoot)
end)