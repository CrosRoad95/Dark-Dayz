
local helpMessage = "F7"
local helpMessageTime = 4000
local helpMessageY = 0.2

local bEffectEnabled
local noiseTexture
local snowShader
local treeShader
local naughtyTreeShader


addEventHandler( "onClientResourceStart", resourceRoot,
	function()
		triggerEvent( "switchGoundSnow", resourceRoot, true )
	end
)


local incognitoTable = {
	[false] = "#32c732ON",
	[true] ="#c73e32OFF",
	["ENG"] = "Winter mode",
	["PL"] = "Status zimy",
}

function toggleGoundSnow()
	if not getElementData(localPlayer,"logedin") then return end
	SnowStatus(bEffectEnabled)
	triggerEvent( "switchGoundSnow", resourceRoot, not bEffectEnabled )
end
addCommandHandler('snow',toggleGoundSnow)

function switchGoundSnow( bOn )
	local lang = getElementData(localPlayer, "Jezyk_Gry")
	if bOn then
		enableGoundSnow()
	else
		disableGoundSnow()
	end
	outputChatBox("#d63838[!] #ffffff"..incognitoTable[lang]..": "..incognitoTable[bOn], 255, 255, 255, true)
end
addEvent( "switchGoundSnow", true )
addEventHandler( "switchGoundSnow", resourceRoot, switchGoundSnow )


local maxEffectDistance = 250		--Максимальная дистанция шейдера


local snowApplyList = {
						"*",						
				}

local snowRemoveList = {
						"",												

						"vehicle*", "?emap*", "?hite*",					
						"*92*", "*wheel*", "*interior*",				
						"*handle*", "*body*", "*decal*",				
						"*8bit*", "*logos*", "*badge*",					
						"*plate*", "*sign*",							
						"headlight", "headlight1",						
						"shad*",										
						"coronastar",									
						"tx*",											
						"lod*",											
						"cj_w_grad",									
						"*cloud*",										
						"*smoke*",										
						"sphere_cj",									
						"particle*",									
						"*water*", "sw_sand", "coral",					
					}

local treeApplyList = {
						"sm_des_bush*", "*tree*", "*ivy*", "*pine*",	
						"veg_*", "*largefur*", "hazelbr*", "weeelm",
						"*branch*", "cypress*",
						"*bark*", "gen_log", "trunk5",
						"bchamae", "vegaspalm01_128",
						"ak74_by_Condizition",

	}

local naughtyTreeApplyList = {
						"planta256", "sm_josh_leaf", "kbtree4_test", "trunk3",					
						"newtreeleaves128", "ashbrnch", "pinelo128", "tree19mi",
						"lod_largefurs07", "veg_largefurs05","veg_largefurs06",
						"fuzzyplant256", "foliage256", "cypress1", "cypress2","ak74_by_Condizition",
	}


addEventHandler( "onClientResourceStart", resourceRoot,
	function()
	nightTimer = setTimer(night_check, 5000, 0)
	IceFiller.create ()
	end
)

function night_check()
	local hours, minutes = getTime()
		setSkyGradient(94,194,83,100,100,100)
		--setFarClipDistance(350)-----Расстояник до тумана днём
		--setFogDistance(25)
	if hours >= 5 and hours < 12 then
		setSkyGradient(65,80,83,100,100,100)
		setWeather (12)
	elseif hours >= 12 and hours < 18 then
		setSkyGradient(65,80,83,100,100,100)
		setWeather (12)
	elseif hours >= 18 and hours < 21 then
		setSkyGradient(65,80,83,100,100,100)
		setWeather (12)
	elseif hours >= 21 and hours < 5 then
		setSkyGradient(65,80,83,100,100,100)
		setWeather (12)
	else
		fading = true
		setSkyGradient( 0, 0, 0, 10, 10, 10 )
		--setFarClipDistance(100)
		--setFogDistance(35)
	end
end

function enableGoundSnow()
	if bEffectEnabled then return end
	if getVersion ().sortable < "1.1.1-9.03285" then
		--outputChatBox( "Resource is not compatible with this client." )
		return
	end

	snowShader = dxCreateShader ( "shaders/snow_ground.fx", 0, maxEffectDistance )
	treeShader = dxCreateShader( "shaders/snow_trees.fx" )
	naughtyTreeShader = dxCreateShader( "shaders/snow_naughty_trees.fx" )
	sNoiseTexture = dxCreateTexture( "single.fantastical" )

	if not snowShader or not treeShader or not naughtyTreeShader or not sNoiseTexture then
		return nil
	end


	dxSetShaderValue( treeShader, "sNoiseTexture", sNoiseTexture )
	dxSetShaderValue( naughtyTreeShader, "sNoiseTexture", sNoiseTexture )
	dxSetShaderValue( snowShader, "sNoiseTexture", sNoiseTexture )
	dxSetShaderValue( snowShader, "sFadeEnd", maxEffectDistance )
	dxSetShaderValue( snowShader, "sFadeStart", maxEffectDistance/2 )


	for _,applyMatch in ipairs(snowApplyList) do
		engineApplyShaderToWorldTexture ( snowShader, applyMatch )
	end

	for _,removeMatch in ipairs(snowRemoveList) do
		engineRemoveShaderFromWorldTexture ( snowShader, removeMatch )
	end


	for _,applyMatch in ipairs(treeApplyList) do
		engineApplyShaderToWorldTexture ( treeShader, applyMatch )
	end


	for _,applyMatch in ipairs(naughtyTreeApplyList) do
		engineApplyShaderToWorldTexture ( naughtyTreeShader, applyMatch )
	end


	doneVehTexRemove = {}
	vehTimer = setTimer( checkCurrentVehicle, 100, 0 )
	removeVehTextures()


	bEffectEnabled = true

	--showHelp()
end

function disableGoundSnow()
	if not bEffectEnabled then return end


	destroyElement( sNoiseTexture  )
	destroyElement( treeShader )
	destroyElement( naughtyTreeShader )
	destroyElement( snowShader )

	killTimer( vehTimer )


	bEffectEnabled = false
end


local nextCheckTime = 0
local bHasFastRemove = getVersion().sortable > "1.1.1-9.03285"

addEventHandler( "onClientPlayerVehicleEnter", root,
	function()
		removeVehTexturesSoon ()
	end
)


function checkCurrentVehicle ()
	local veh = getPedOccupiedVehicle(localPlayer)
	local id = veh and getElementModel(veh)
	if lastveh ~= veh or lastid ~= id then
		lastveh = veh
		lastid = id
		removeVehTexturesSoon()
	end
	if nextCheckTime < getTickCount() then
		nextCheckTime = getTickCount() + 5000
		removeVehTextures()
	end
end

function removeVehTexturesSoon ()
    nextCheckTime = getTickCount() + 200
end


function removeVehTextures ()
	if not bHasFastRemove then return end

	local veh = getPedOccupiedVehicle(localPlayer)
	if veh then
		local id = getElementModel(veh)
		local vis = engineGetVisibleTextureNames("*",id)
		if vis then	
			for _,removeMatch in pairs(vis) do
				if not doneVehTexRemove[removeMatch] then
					doneVehTexRemove[removeMatch] = true
					engineRemoveShaderFromWorldTexture ( snowShader, removeMatch )
				end
			end
		end
	end
end


-- function showHelp()
	-- if bShowHelp ~= nil then return end
	-- bShowHelp = true
	-- helpStartTime = getTickCount()
	-- setTimer( function() bShowHelp=false end, helpMessageTime, 1 )
-- end

-- addEventHandler( "onClientRender", root,
	-- function ()
		-- if bShowHelp then
			-- local age = getTickCount() - helpStartTime
			-- if ( age > helpMessageTime - 256 ) then
				-- age = helpMessageTime - age
			-- end
			-- age = math.min(math.max(0,age),255)
			-- local sx, sy = guiGetScreenSize()
			-- dxDrawText(helpMessage, sx/2-3, sy*helpMessageY, sx/2+2, 0, tocolor(0, 0, 0, age), 3, 'default', 'center' )
			-- dxDrawText(helpMessage, sx/2+3, sy*helpMessageY, sx/2+2, 0, tocolor(0, 0, 0, age), 3, 'default', 'center' )
			-- dxDrawText(helpMessage, sx/2, sy*helpMessageY, sx/2, 0, tocolor(255, 255, 0, age), 3, 'default', 'center' )
		-- end
	-- end
-- )



_dxCreateShader = dxCreateShader
function dxCreateShader( filepath, priority, maxDistance, bDebug )
	priority = priority or 0
	maxDistance = maxDistance or 0
	bDebug = bDebug or false

	local build = getVersion ().sortable:sub(9)
	local fullscreen = not dxGetStatus ().SettingWindowed
	if build < "03236" and fullscreen then
		maxDistance = 0
	end

	return _dxCreateShader ( filepath, priority, maxDistance, bDebug )
end
