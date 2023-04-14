addEvent("Pasek_re13",true)
addEventHandler("Pasek_re13",resourceRoot,function(player,item)
	triggerClientEvent(player,"to_do_useItem",player,item )
end)