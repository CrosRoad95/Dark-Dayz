addEventHandler( "onClientResourceStart", getResourceRootElement ( ),
	function ( )
		bindKey ( 'x', "down", "chatbox", "globalchat" )
	end
)

-- Output and translate function

addEvent( "onPlayerUseGlobalChat", true )
addEventHandler( "onPlayerUseGlobalChat", localPlayer, function(player, mess, acl_rank, vip_rank, id)
	local rank = getElementData(player, "rank")
	local lang = getElementData(localPlayer, "Jezyk_Gry")

	local tag;

	if acl_rank then
		tag = exports.DayZ_ranks:getRankFullName(acl_rank, lang, 3)
	else
		tag = exports.DayZ_ranks:getRankFullName(rank, lang, 3)
	end

	if vip_rank then id = "#e8e113"..id.." [★]"
	else id = "#b0b5b0"..id.." " end

	mess = id..""..tag..""..mess

	outputChatBox(mess, 255, 255, 255, true)
end)