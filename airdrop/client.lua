function createSignal(creator)
	if getProjectileType(source) == 17 then
		setTimer(function(source)
			local x, y, z = getElementPosition(source)
			destroyElement(source)
			createPopFX(x, y, z)
			if creator == localPlayer then
				triggerServerEvent("onSignalThrown", localPlayer, x, y, z)
			end
		end, 2400, 1, source)
	end
end
addEventHandler("onClientProjectileCreation", root, createSignal)

addEvent("setPackageProperties", true)
addEventHandler("setPackageProperties", resourceRoot, function(player, index, plane)
	local dist = getDistanceBetweenElements(localPlayer, plane)
	if dist < 550 then
		local x, y, z = getElementPosition(plane)
		local zPos = getGroundPosition(x, y, z)
		triggerServerEvent("onPackageLeavePlane", resourceRoot, player, index, x, y, z, zPos)
	end
end)

addEvent("setPlaneProperties", true)
addEventHandler("setPlaneProperties", resourceRoot, function(obj, flyTime, zRot)
	local x, y, z = getElementPosition(obj)
	attachSoundToElement("jet.wav", obj, flyTime)
	local modelID = getElementModel(obj)
	engineSetModelLODDistance(modelID, 300)
end)

function attachSoundToElement(path, elem, duration)
	local x, y, z = getElementPosition(elem)
	local sound = playSound3D(path, x, y, z, true)
	attachElements(sound, elem)
	setSoundVolume(sound, 1)
	setSoundMaxDistance(sound, 1500)
	setTimer(destroyElement, duration, 1, sound)
end

function createPopFX(x, y, z)
	local destroyEffectTime = 22000 -- ms
	local signalFX = createEffect("spraycan", x, y, z-0.1, 0, 0, 0, 8191)
	smokeFX = createEffect("riot_smoke", x, y, z, -90, 0, 0, 8191)
	setTimer(function()smokeFX = createEffect("riot_smoke", x, y, z, -90, 0, 0, 8191)end, destroyEffectTime/2, 1)
	createEffect("camflash", x, y, z, 0, 0, 0, 8191)
	createEffect("shootlight", x, y, z, -90, 0, 0, 8191)
	local teargasObj = createObject(343, x, y, z-0.2, 90, 0, math.random(0,360))
	setElementCollisionsEnabled(teargasObj,false)
	local popSnd = playSound3D("pop.mp3", x, y, z, false)
	setSoundMaxDistance(popSnd, 100)
	setTimer(function()
		destroyElement(signalFX)
		if isElement(smokeFX) then
			destroyElement(smokeFX)
		end
		destroyElement(teargasObj)
	end,destroyEffectTime,1)
end
addEvent("createPop", true)
addEventHandler("createPop", resourceRoot, createPopFX)

function replaceTextures()
	local TXD = engineLoadTXD("texture.txd")
	engineImportTXD(TXD,2903)
	engineImportTXD(TXD,1681)
	engineSetModelLODDistance(2903,300)
	engineSetModelLODDistance(1681,300)
end
addEventHandler("onClientResourceStart", resourceRoot, replaceTextures)

function getDistanceBetweenElements(elem1, elem2)
	local x, y, z = getElementPosition(elem1)
	local x2, y2, z2 = getElementPosition(elem2)
	local dist = getDistanceBetweenPoints3D(x, y, z, x2, y2, z2)
	return dist
end