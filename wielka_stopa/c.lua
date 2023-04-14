
local strzelil = 0

setTimer(function()
	if strzelil>getTickCount() then return end
	triggerServerEvent('ZombieStartPlayer',resourceRoot,localPlayer)
end,1000,0)

setPedsLODDistance(300)
setVehiclesLODDistance(300)


local damage = {
	[31] = 3400,
	[30] = 3000,
	[29] = 2400,
	[34] = 12001,
	[33] = 9000,
	[9] = 700,
	[8] = 5000,
	[7] = 5000,
	[3] = 5000,
	[22] = 1500,
	[23] = 2000,
	[25] = 1000,
}

addEventHandler('onClientPedDamage',resourceRoot,function(atacker,weap,bp)
    cancelEvent()
	if atacker and getElementType(atacker) == "vehicle" then
        speedx, speedy, speedz = getElementVelocity ( atacker )
        actualspeed = (speedx^2 + speedy^2 + speedz^2)^(0.5) 
        kmh = actualspeed * 180
        if kmh >= 30 and getElementData(source, 'Zombie-Typ') == "Low-Zombie" then
            local vehkiller = getVehicleOccupant ( atacker )
            setElementData(source,"blood",getElementData(source,"blood")-50000)
                if getElementData(source,"blood") <= 0 then
			triggerServerEvent('killZombie',resourceRoot,source,weap,bp)
			else return
                end
        end
    end

	local headshot
	if getElementData(source,'deadzombie') then return end
	if bp==9 then
		headshot = true
	end
	local obrazenia = damage[weap] or 1500
	if headshot and not getElementData(source,"anty-headshot") then
		setElementData(source,'blood',-49)
	else
		setElementData(source,'blood',getElementData(source,'blood')-obrazenia)
	end
	if getElementData(source,'blood')<0 then
		if atacker==localPlayer then
			triggerServerEvent('killZombie',resourceRoot,source,weap,bp)
		end
	else
		--if attacker==localPlayer then
			--seachTarget(source,attacker)
		--end
	end
end)

local sounds = {
	'sounds/zombie_1.mp3',
	'sounds/zombie_2.mp3',
	'sounds/zombie_3.mp3',
}

local sound

addEvent('ZombieSound',true)
addEventHandler('ZombieSound',resourceRoot,function()
	if sound then return end
	sound = playSound(sounds[math.random(#sounds)])
	setTimer(function()
		sound = nil
	end,3000,1)
end)

addEventHandler('onClientPlayerWeaponFire',localPlayer,function(weapon,ammo,ClipAmmo,hitX,hitY,hitZ)
	if strzelil > getTickCount() then return end
	strzelil = getTickCount() + 1000
	triggerServerEvent('ZombieStartPlayer',resourceRoot,localPlayer,{hitX,hitY,hitZ})
end)


