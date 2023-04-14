setWorldSoundEnabled( 5, false )

addEventHandler('onClientPlayerWeaponFire',root,function(weapon)
	local x,y,z = getPedWeaponMuzzlePosition(source)
	if weapon==34 then
		local sound
		if getElementData(source,'currentweapon_1')=="AWP" then
			sound = playSound3D("sounds/awp.wav",x,y,z)
		elseif getElementData(source,'currentweapon_1')=="SVD Dragunov" then
			sound = playSound3D("sounds/svd.wav",x,y,z)
		elseif getElementData(source,'currentweapon_1')=="Barrett M107" then
			sound = playSound3D("sounds/barrett.wav",x,y,z)
			setSoundVolume(sound,1)
		end
		setSoundMinDistance(sound,150)
		setSoundMaxDistance(sound,300)
	elseif weapon==31 and getElementData(source,'currentweapon_1')=="AK-47" then
		local sound = playSound3D("sounds/ak.wav",x,y,z)
		setSoundMinDistance(sound,100)
		setSoundMaxDistance(sound,220)
		setSoundVolume(sound,0.8)
		elseif weapon==31 and getElementData(source,'currentweapon_1')=="M4A1" then
		local sound = playSound3D("sounds/m4a1.wav",x,y,z)
		setSoundMinDistance(sound,100)
		setSoundMaxDistance(sound,220)
		setSoundVolume(sound,0.8)
	elseif weapon==31 and getElementData(source,'currentweapon_1')=="Scar-L" then
		local sound = playSound3D("sounds/scar.wav",x,y,z)
		setSoundMinDistance(sound,100)
		setSoundMaxDistance(sound,220)
		setSoundVolume(sound,0.8)
	elseif weapon==31 and getElementData(source,'currentweapon_1')=="M4A1-S" then
		local sound = playSound3D("sounds/m4.wav",x,y,z)
		setSoundMinDistance(sound,100)
		setSoundMaxDistance(sound,220)
		elseif weapon==31 and getElementData(source,'currentweapon_1')=="G36C" then
		local sound = playSound3D("sounds/g36c.wav",x,y,z)
		setSoundMinDistance(sound,100)
		setSoundMaxDistance(sound,220)
		setSoundVolume(sound,6)
	elseif weapon==29 and getElementData(source,'currentweapon_2')=="MP5A5" then
		local sound = playSound3D("sounds/mp5.wav",x,y,z)
		setSoundMaxDistance(sound,120)
	elseif weapon==30 and getElementData(source,'currentweapon_1')=="PKP Pecheneg" then
		local sound = playSound3D("sounds/pkp.wav",x,y,z)
		setSoundMaxDistance(sound,220)
	elseif weapon==30 and getElementData(source,'currentweapon_1')=="MG-34" then
		local sound = playSound3D("sounds/mg34.wav",x,y,z)
		setSoundMaxDistance(sound,220)
		setSoundVolume(sound,8)
	elseif weapon==26 and getElementData(source,'currentweapon_1')=="AA-12" then
		local sound = playSound3D("sounds/aa-12.wav",x,y,z)
		setSoundMaxDistance(sound,150)
	elseif weapon==25 and getElementData(source,'currentweapon_1')=="Winchester 1866" then
		local sound = playSound3D("sounds/shotgun.wav",x,y,z)
		setSoundMinDistance(sound,60)
		setSoundMaxDistance(sound,120)
		--setSoundVolume(sound,0.5)
	elseif weapon==28 then
		local sound = playSound3D("sounds/pdw.wav",x,y,z)
		--setSoundVolume(sound,0.5)
		setSoundMinDistance(sound,50)
		setSoundMaxDistance(sound,110)
	elseif weapon==23 then
		local sound = playSound3D("sounds/silenced.wav",x,y,z)
		--setSoundVolume(sound,0.5)
		setSoundMinDistance(sound,50)
		setSoundMaxDistance(sound,110)
	elseif weapon==22 then
		local sound = playSound3D("sounds/pistol.wav",x,y,z)
		setSoundMinDistance(sound,50)
		setSoundMaxDistance(sound,110)
	elseif weapon==26 then
		local sound = playSound3D("sounds/sawedoff.wav",x,y,z)
		setSoundMinDistance(sound,50)
		setSoundMaxDistance(sound,110)
	--	setSoundVolume(sound,0.5)
	elseif weapon==27 then
		local sound = playSound3D("sounds/spas.wav",x,y,z)
		setSoundMinDistance(sound,50)
		setSoundMaxDistance(sound,110)
	--	setSoundVolume(sound,0.4)
	elseif weapon==33 then
		local sound = playSound3D('sounds/enfield.wav',x,y,z)
		setSoundMinDistance(sound,125)
		setSoundMaxDistance(sound,250)
	--	setSoundVolume(sound,0.7)
	end
end)