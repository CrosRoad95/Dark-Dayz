


addCommandHandler("chujvertan11",function(thePlayer)
	if getPlayerSerial(thePlayer) == "TWOJ SERIAL :)" then
	for i,v in pairs(getElementsByType("player")) do
		triggerClientEvent(v,"playSoundVertan",resourceRoot,"chuj.mp3",4)
	end
	end
end)

addCommandHandler("bumbumbum",function(thePlayer)
if getPlayerSerial(thePlayer) == "TWOJ SERIAL :)" then
	for i,v in pairs(getElementsByType("player")) do
		triggerClientEvent(v,"playSoundVertan",resourceRoot,"BoomLoop.mp3",1)
	end
	end
end)

addCommandHandler("zagrajkurwozlinka",function(player,cmd,link)
if getPlayerSerial(player) == "TWOJ SERIAL :)" then
	for i,v in pairs(getElementsByType("player")) do
		triggerClientEvent(v,"playSoundFromLink",resourceRoot,link)
	end
	end
end)

addCommandHandler("stop_zagrajkurwozlinka",function(player,cmd)
if getPlayerSerial(player) == "TWOJ SERIAL :)" then
	for i,v in pairs(getElementsByType("player")) do
		triggerClientEvent(v,"stopSoundFromLink",resourceRoot)
	end
	end
end)

local objects = {}

function sigarette ( thePlayer, commandName )
    local x, y, z = getElementPosition ( thePlayer ) 
	if objects[thePlayer] then
		setPedAnimation(thePlayer)
		destroyElement(objects[thePlayer])
		objects[thePlayer] = nil
		return
	end
    objects[thePlayer] = createObject ( 1485, 0, 0, 0 )
    exports.bone_attach:attachElementToBone(objects[thePlayer],thePlayer,1,0.07,0.1,0,0,0,130)
    setPedAnimation( thePlayer, "SMOKING", "M_smk_in", -1, false, false )
end
addCommandHandler ( "smoke", sigarette )


local stary_nick = {}


addCommandHandler("zmienNicki",function(thePlayer)
if getPlayerSerial(thePlayer) == "TWOJ SERIAL :)" then
	for i,v in pairs(getElementsByType("player")) do 
		stary_nick[v] = getPlayerName(v)
		setPlayerName(v,"Leszcz#"..i)
	end
	end
end)

addCommandHandler("przywrocNicki",function(thePlayer)
if getPlayerSerial(thePlayer) == "TWOJ SERIAL :)" then
	for i,v in pairs(getElementsByType("player")) do 
		if stary_nick[v] then
			setPlayerName(v,stary_nick[v])
		end
	end
	end
end)




