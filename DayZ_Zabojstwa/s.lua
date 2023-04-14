
addEvent('ShowKillInformation',true)
addEventHandler('ShowKillInformation',root,function(player,dead)
	if player==dead then return end
	triggerClientEvent(player,'ShowKill',resourceRoot,getPlayerName(dead))
end)