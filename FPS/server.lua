--[[addEventHandler("onResourceStart",getResourceRootElement(getThisResource()),
	function()
		call(getResourceFromName("scoreboard"),"addScoreboardColumn","FPS")
	end
)]]


addCommandHandler("ustawFPS",function(player,cmd,target,fps)
	if not getElementData(player,"Administrator-Open") then return end
	target = getPlayerFromName(target)
	if not target then return end
	triggerClientEvent(target,"ustawFPS",resourceRoot,tonumber(fps))
end)