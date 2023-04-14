function DrawNotification(text, r, g, b, player, sound)
	triggerClientEvent(player, "onDrawNotification", player, text, r, g, b, sound)
end