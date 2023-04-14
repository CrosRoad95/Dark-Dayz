function Latanie(thePlayer)
accountname = getAccountName(getPlayerAccount(thePlayer))
if isObjectInACLGroup("user." .. accountname, aclGetGroup("Admin")) or isObjectInACLGroup("user." .. accountname, aclGetGroup("Console")) or isObjectInACLGroup("user." .. accountname, aclGetGroup("Pomocnik"))  then
setElementData(thePlayer,"Ryjek",true)
outputChatBox("Teraz możesz latać!",thePlayer,255,0,0)
end
end
addCommandHandler("fly", Latanie)