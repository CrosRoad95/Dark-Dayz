

local walizka = nil
local strefa = nil
local ilosc = 0
local uid_tworcy = 0


addCommandHandler("eventWalizkapp",function(player,cmd,money,size)
	if not money or not size then return end
	if isObjectInACLGroup("user."..getElementData(player,"logedin"),aclGetGroup("Admin")) or isObjectInACLGroup("user."..getElementData(player,"logedin"),aclGetGroup("Moderator2"))or isObjectInACLGroup("user."..getElementData(player,"logedin"),aclGetGroup("Pomocnik")) then 
		local x,y,z = getElementPosition(player)
		walizka = createPickup(x,y,z,3,1210,0,1)
		ilosc = tonumber(money)
		uid_tworcy = getElementData(player,"UID")
		outputChatBox("=== Administrator upuścił walizkę ===",root,255,255,255)
		outputChatBox("=== W walizce znajduje się "..money.."PP ===",root,255,255,255)
		outputChatBox("=== Strefa, w której znajduje się walizka została zaznaczona na mapie ===",root,255,255,255)
		strefa = createRadarArea(x + math.random(-size,size) - size,y + math.random(-size,size) - size,size * 2,size * 2,255, 153, 51,150)
               triggerClientEvent("ShowCaseGui", getRootElement(), "Administrator upuścił walizkę, w walizce znajduje się "..money.."PP")
		setRadarAreaFlashing(strefa,true)
	end
end)

addEventHandler("onPickupHit",resourceRoot,function(player)
	if getElementData(player,"UID") == uid_tworcy then return end
	outputChatBox(getPlayerName(player).."#FFFFFF Podnosi walizkę i otrzymuje nagrodę w wysokości "..ilosc.."PP!",root,255,255,255,true)
	setElementData(player,"PP",(getElementData(player,"PP") or 0) + ilosc)
	ilosc = 0
	destroyElement(source)
	destroyElement(strefa)
	triggerClientEvent(root, "HideCaseGui", getRootElement())


end)

addCommandHandler("koniecEventuWalizka",function(player)
	if isObjectInACLGroup("user."..getElementData(player,"logedin"),aclGetGroup("Admin")) or isObjectInACLGroup("user."..getElementData(player,"logedin"),aclGetGroup("Moderator2")) then 
		if isElement(strefa) then
			destroyElement(strefa)
			destroyElement(walizka)
                        triggerClientEvent( player, "HideCaseGui", getRootElement())

		end
	end
end)