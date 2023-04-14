


addEvent("playSoundVertan",true)
addEventHandler("playSoundVertan",resourceRoot,function(a,v)
	setSoundVolume(playSound(a),v)
end)

local sound = nil

local off = false

addEvent("playSoundFromLink",true)
addEventHandler("playSoundFromLink",resourceRoot,function(link)
	if not off then
		sound = playSound(link)
		setSoundVolume(sound, 0.5)
	end
end)

addEvent("stopSoundFromLink",true)
addEventHandler("stopSoundFromLink",resourceRoot,function()
	if isElement(sound) then
		destroyElement(sound)
	end
end)

addCommandHandler('off_music', function()
	off_music = not off_music
end)