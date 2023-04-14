local tag_font =  exports.DayZ_font:GetFont("Roboto-Bold", 12)



addEventHandler('onClientResourceStart',resourceRoot,function()
	for i = 355, 358 do
		if (i ~= 357) then
			local tex = engineLoadTXD("texture/alpha.txd", i);
			engineImportTXD(tex, i);
			local mod = engineLoadDFF("texture/alpha.dff", i);
			engineReplaceModel(mod, i);
		end
	end
	--[[local tex = engineLoadTXD("texture/alpha.txd", 351);
	engineImportTXD(tex, 351);
	local mod = engineLoadDFF("texture/alpha.dff", 351);
	engineReplaceModel(mod, 351);]]
	--[[for _,v in pairs(getElementsByType("object")) do
		engineSetModelLODDistance(getElementModel(v), 600);
	end]]
	local txd = engineLoadTXD("sniper"..'.txd');
	engineImportTXD(txd, 358);
end)

triggerServerEvent('GetFuckingRektBro',resourceRoot,localPlayer)


addEventHandler("onClientResourceStart", resourceRoot, function()
	local shader_1 = dxCreateShader("texture/tex_r.fx");
	local shader_2 = dxCreateShader("texture/tex_r.fx");
--	local shader_3 = dxCreateShader("texture/tex_r.fx");
	local shader_4 = dxCreateShader("texture/tex_r.fx");
	local texture_1 = dxCreateTexture("images/lights.png");
	local texture_2 = dxCreateTexture("images/radardisc.png");
	dxSetShaderValue(shader_1, "gTexture", texture_1);
	dxSetShaderValue(shader_2, "gTexture", texture_1);
	--dxSetShaderValue(shader_3, "gTexture", texture_2);
	dxSetShaderValue(shader_4, "gTexture", texture_1);
	engineApplyShaderToWorldTexture(shader_1, "shad_exp");
	engineApplyShaderToWorldTexture(shader_2, "coronastar");
	--engineApplyShaderToWorldTexture(shader_3, "radardisc");
	engineApplyShaderToWorldTexture(shader_4, "cameracrosshair");
	
	if ((getElementData(localPlayer,'GPS') or 0)>=1 and (getElementData(localPlayer,'Map') or 0)>=1) then
	toggleControl("radar", true);
	elseif (getElementData(localPlayer,'GPS') or 0)>=1 then
	elseif (getElementData(localPlayer,'Map') or 0)>=1 then
	toggleControl("radar", true);
	elseif (getElementData(localPlayer,'Watch') or 0)>=1 then
		setPlayerHudComponentVisible("clock", false);
	else
	toggleControl("radar", false);
	setPlayerHudComponentVisible("clock", false);
	end
	setPlayerHudComponentVisible("area_name", false);
	setPlayerHudComponentVisible("breath", false);
	setPlayerHudComponentVisible("money",false);
	setPlayerHudComponentVisible("health", false);
	setPlayerHudComponentVisible("vehicle_name", false);
	setPlayerHudComponentVisible("radio", false);
	setPlayerHudComponentVisible("weapon", false);
	setPlayerHudComponentVisible("ammo", false);
	setPlayerHudComponentVisible("crosshair", true);
	setAmbientSoundEnabled("general", false);
	setAmbientSoundEnabled("gunfire", false);
	--guiCreateLabel(0.01, 0.975, 0.5, 0.5, "github.com/mihayy5/mtadayz07", true);
end);

local blockedTasks =  {
	"TASK_SIMPLE_IN_AIR",
	"TASK_SIMPLE_JUMP",
	"TASK_SIMPLE_LAND",
	"TASK_SIMPLE_GO_TO_POINT",
	"TASK_SIMPLE_NAMED_ANIM",
	"TASK_SIMPLE_CAR_OPEN_DOOR_FROM_OUTSIDE",
	"TASK_SIMPLE_CAR_GET_IN",
	"TASK_SIMPLE_CLIMB",
	"TASK_SIMPLE_SWIM",
	"TASK_SIMPLE_HIT_HEAD",
	"TASK_SIMPLE_FALL",
	"TASK_SIMPLE_GET_UP"
};

local damageTable = {
	{"M4A1-S", 3100},
	{"M4A1", 3900},
	{"G36C", 5000},
	--{"MK 48 Mod 0", 3000},
	{"M60", 3300},
	--{"PKP", 3200},
	{"AK-47", 4000},
	{"Scar-L",5000},
	{"M16A4", 3300},
	--{"SA-58V ACOG", 3800},
	--{"DMR", 9200},
	{"AWP", 20000},
--	{"AS50", 37000},
--	{"AWP", 10000},
--	{"Mosin 9130", 9500},
--	{"M24", 5600},
--	{"M107", 50000},
--	{"SVD Dragunov Camo", 7500},
	{"Winchester 1866", 2000},
	{"AA-12", 6500},
--	{"AKS-74U", 2722},
	{"Lee Enfield", 9000},
	{"SPAZ-12 Combat Shotgun", 2500},
	{"Sawn-Off Shotgun", 4000},
	{"MP5A5", 2300},
	{"Parachute",0},
	{"Hunting Knife", 1500},
	{"Hatchet", 4000},
	{"M1911", 2189},
	{"M9 SD", 1900},
	{"PDW", 2500},
	{"Desert Eagle", 3189},
	{"Grenade", 20000},
	{"Baseball Bat", 953},
	{"Shovel", 853},
	{"Harvest Scythe", 7000}
};

--[[addEventHandler('onClientPlayerWeaponFire',localPlayer,function()
	local current = getElementData(localPlayer,'currentweapon_1')
	if current=="M16A4" then
		setTimer(function()
			setPedControlState(localPlayer,"fire",true)
			setPedControlState(localPlayer,"fire",false)
			setPedControlState(localPlayer,"fire",true)
			setPedControlState(localPlayer,"fire",false)
		end,200,1)
	end
end)]]


local weaponNoiseTable = {
	[22]=20,
	[23]= 0,
	[24]= 60,
	[28]= 40,
	[32]=40,
	[29]= 40,
	[30]= 60,
	[31]= 60,
	[25]= 40,
	[26]= 60,
	[27]= 60,
	[33]= 40,
	[34]= 60,
	[36]= 60,
	[35]= 60,
};

local weaponslots = {
	[25] = 1, [26] = 1, [27] = 1,
	[30] = 1, [31] = 1, [33] = 1,
	[34] = 1, [2]  = 2, [4]  = 2,
	[5]  = 2, [6]  = 2, [8]  = 2,
	[22] = 2, [23] = 2, [24] = 2,
	[29] = 2, [16] = 3, [17] = 2,
	[46] = 3, [43] = 3, [39] = 3
};

local boxSpace = dxGetFontHeight(1, "default-bold") + dxGetFontHeight(1, "default-bold") * 0.3;
local sW,sH = guiGetScreenSize();
local playerTarget = false;
local statsLabel = {};
local theTexts = {};
local theTextTimer = {};
local pingFails = 0;
local night = false;
local red = false;
local bpml = 0;
local blip = 12;
local sx,sy = sW, sH;
local worldW,worldH = 3072, 3072;



local font = dxCreateFont("font.ttf",11*math.max(sH/768,1))

local xFactor,yFactor = (sx/1366), (sy/768);

--bindKey("u", "down", "chatbox", "radiochat");
addEvent("onClientPlayerDeathInfo", true);
addEvent("checkVehicleInWaterClient", true);
addEvent("displayClientInfo", true);
addEvent("playPedSound", true);


bindKey("n", "down", function()
if getElementData(localPlayer, "magoogle2") == true then outputChatBox("Zdejmij google na podczerwień!", 255,0,0) return end
	if (night == false) then
		if (getElementData(localPlayer, "Night Vision Goggles") > 0) then
			setCameraGoggleEffect("nightvision");
			setElementData(localPlayer, "magoogle", true)
		end
		night = true;
	elseif (night == true) then
		setCameraGoggleEffect("normal");
		--setFarClipDistance(1000);
		night = false;
		setElementData(localPlayer, "magoogle", false)
	end
end);

bindKey("i", "down", function()
if getElementData(localPlayer, "magoogle") == true then outputChatBox("Zdejmij google noktowyzyjne!", 255,0,0) return end
	if (red == false) then
		if (getElementData(localPlayer, "Infrared Goggles") > 0) then
			setCameraGoggleEffect("thermalvision");
			setElementData(localPlayer, "magoogle2", true)
			red = true;
		end
	elseif (red == true) then
		setCameraGoggleEffect("normal");
		setElementData(localPlayer, "magoogle2", false)
		red = false;
	end
end);

--[[
local zanikanie = {}

zanikanie.timer = nil
zanikanie.pozycje = {}


zanikanie.good_models = {
	[77] = true,
	[285] = true,
}

setTimer(function()
	if zanikanie.good_models[getElementModel(localPlayer)] then
		if not isTimer(timer_2) then
			zanikanie.pozycje = {math.ceil(getElementPosition(localPlayer))}
			zanikanie.timer_2 = setTimer(function()
				local x,y,z = math.ceil(getElementPosition(localPlayer))
				if x == zanikanie.pozycje[1] and y == zanikanie.pozycje[2] and z == zanikanie.pozycje[3] and isPedDucked(localPlayer) and not isPedInVehicle(localPlayer) then
					triggerServerEvent("DayZ_Core:SetPlayerInvis",resourceRoot,localPlayer,150)
				else
					triggerServerEvent("DayZ_Core:SetPlayerInvis",resourceRoot,localPlayer,255)
				end
			end,5000,1)
		end
	else
		if getElementAlpha(localPlayer) ~= 255 then
			triggerServerEvent("DayZ_Core:SetPlayerInvis",resourceRoot,localPlayer,255)
		end
	end
end,1000,0)]]

bindKey("r", "down", function()
	setTimer(function()
		local ammo = getPedAmmoInClip(localPlayer);
		local clip = getWeaponProperty(getPedWeapon(localPlayer), "std", "maximum_clip_ammo");
		if (ammo ~= clip) then
			local task = getPedSimplestTask(localPlayer);
			for _,v in pairs(blockedTasks) do
				if (getPedSimplestTask(localPlayer) == v) then
					return;
				end
			end
			triggerServerEvent("relWep", resourceRoot,localPlayer);
		end
	end, 50, 1);
end);

--[[
local Cheytac M200_moze = true
local cz_moze = true
local dmr_moze = true

addEventHandler('onClientPlayerWeaponFire',localPlayer,function(weapon, ammor)
local slot = getSlotFromWeapon(weapon);
local slot_name = getElementData(localPlayer, "currentweapon_1")
local weapons = getElementData(localPlayer,'tohide1')

if slot_name:find("AWP") then
if not cz_moze then
cancelEvent()
	return
end
cz_moze = false
toggleControl('fire',false)
setTimer(function()
cz_moze = true
toggleControl('fire',true)
end,900,1)
elseif slot_name:find("Cheytac M200") then
if not Cheytac M200_moze then
cancelEvent()
	return
end
Cheytac M200_moze = false
toggleControl('fire',false)
setTimer(function()
Cheytac M200_moze = true
toggleControl('fire',true)
end,1100,1)
elseif slot_name:find("DMR") then
if not dmr_moze then
cancelEvent()
	return
end
dmr_moze = false
toggleControl('fire',false)
setTimer(function()
toggleControl('fire',true)
dmr_moze = true
end,300,1)
end
end)]]



function findRotation(x1, y1, x2, y2)
	local t = -math.deg(math.atan2(x2-x1, y2-y1));
	if (t < 0) then t = t + 360 end;
	return t;
end

function getPointFromDistanceRotation(x, y, dist, angle)
	local a = math.rad(90-angle);
	local dx = math.cos(a)*dist;
	local dy = math.sin(a)*dist;
	return x+dx, y+dy;
end

function math.percent(procent, number, limit)
	if not limit then limit = 100; end
	if (procent and number) then
		return (procent/limit)*number;
	end
	return false;
end

function isInBuilding(x, y, z)
	local hit,_,_,_,_,_,_,_,_ = processLineOfSight(x, y, z, x, y, (z+10), true, false, false, true, false, false, false, false, nil);
	if hit then
		return true;
	end
	return false;
end

function isObjectAroundPlayer(thePlayer, distance, height)
	local x,y,z = getElementPosition(thePlayer);
	for i = math.random(360), 360, 1 do
		local nx,ny = getPointFromDistanceRotation(x, y, distance, i);
		local _,hitX,hitY,hitZ,_,_,_,_,material = processLineOfSight(x, y, (z+height), nx, ny, (z+height));
		if (material == 0) then
			return 0, nx, ny, z;
		end
	end
	return false, false, false, false;
end

function getPointFromDistanceRotation(x, y, dist, angle)
	local a = math.rad(90-angle);
	return (x+(math.cos(a)*dist)), (y+(math.sin(a)*dist));
end

function math.round(number, decimals, method)
	local decimals = decimals or 0;
	local factor = 10^decimals;
	if (method == "ceil" or method == "floor") then 
		return math[method](number*factor)/factor;
	else 
		return tonumber(("%."..decimals.."f"):format(number));
	end
end


function startRollMessage(text, r, g, b)
	--outputChatBox("#FFFFFF["..exports.DayZ_Addons:getNazwaSerwera().."#FFFFFF] "..text.."!",255,255,255,true)
	if (#theTexts == 2) then
		table.remove(theTexts, 1);
	end
	table.insert(theTexts, {text, r, g, b});
	if isTimer(theTextTimer["destroy"]) then killTimer(theTextTimer["destroy"]); end
	theTextTimer["destroy"] = setTimer(function() table.remove(theTexts, 1); end, 8000, 4);
end

addEventHandler("displayClientInfo", localPlayer, startRollMessage);



local damageTable_nolagging = {
	["M4A1-S"]= 3100,
	["M4A1"]= 3900,
	["G36C"]= 3500,
	["MK 48 Mod 0"]= 3000,
	["M60"]= 3300,
	["PKP Pecheneg"]= 3000,
	["MG-34"]= 5000,
	["AK-47"]= 3800,
	["Scar-L"]=5000,
	["M16A4"]= 6400,
	["SA-58V ACOG"]= 3800,
	["DMR"]= 9200,
	["Cheytac M200"]= 15000,
	["AS50"]= 37000,
	["AWP"]= 20000,
	["SVD Dragunov"]= 7500,
	["Barrett M107"]= 20000,
	["Mosin 9130"]= 9500,
	["M24"]= 5600,
	["M107"]= 50000,
	['DMR']=4000,
	["SVD Dragunov Camo"]= 7500,
	["Winchester 1866"]= 1866,
	["AA-12"]= 4000,
	["AKS-74U"]= 2722,
	["Lee Enfield"]= 9000,
	["SPAZ-12 Combat Shotgun"]= 2500,
	["Sawn-Off Shotgun"]= 4000,
	["MP5A5"]= 2300,
	["Hunting Knife"]= 1500,
	["Hatchet"]= 4000,
	["M1911"]= 2189,
	["M9 SD"]= 1900,
	["PDW"]= 400,
	["Desert Eagle"]= 3189,
	["Grenade"]= 20000,
	["Baseball Bat"]= 953,
	["Shovel"]= 853,
	["Harvest Scythe"]= 7000,
	["Chainsaw"]=4000,
};



function getWeaponDamage(player, weapon)
	local slot = getSlotFromWeapon(weapon);
	if (slot == 3 or slot == 5 or slot == 6 or slot == 7) then
		--for _,v in pairs(damageTable) do
			if (getElementData(player, "currentweapon_1") and damageTable_nolagging[getElementData(player, "currentweapon_1")]) then
				return damageTable_nolagging[getElementData(player, "currentweapon_1")]
			end
		--end
	elseif (slot == 1 or slot == 2 or slot == 4) then
		--for _,v in pairs(damageTable) do
			if (getElementData(player, "currentweapon_2")) then
				--if (getElementData(player, "htype") == "Hero") then
					--if (v[1] == "M1911" or v[1] == "M9 SD" or v[1] == "PDW" or v[1] == "MP5A5") then
						--return v[2]*0.3;
					--end
				--end
				return damageTable_nolagging[getElementData(player, "currentweapon_2")];
			end
		--end
	else
		--for _,v in pairs(damageTable) do
			if (getElementData(player, "currentweapon_3")) then
				return damageTable_nolagging[getElementData(player, "currentweapon_3")]
			end
		--end
	end
end

addEvent('Zagrajze_dead',true)
addEventHandler('Zagrajze_dead',root,function()
playSound('KillS.mp3')
end)

--addBan("162.168.1.19",tostring(math.random(0,99999)),tostring(math.random(0,99999)),nil,tostring(math.random(0,99999)))
toggleControl("aim_weapon",true)
addEventHandler('onClientPlayerWeaponSwitch',localPlayer,function(prev,curr)
	local to_hide = getElementData(localPlayer,"tohide1")
	toggleControl("fire",true)
	toggleControl("aim_weapon",true)
	if getPedWeapon(getLocalPlayer(),newSlot)==4 then
		toggleControl("aim_weapon",false)
	elseif getPedWeapon(getLocalPlayer(),newSlot) == 43 then
		toggleControl("fire",false)
	elseif to_hide and to_hide ~= "NONE" then
		if weaponslots[getPedWeapon(getLocalPlayer(),prev)] then
			setElementAlpha(to_hide,0)
		end
	end
end)

addEventHandler('onClientPlayerWasted',localPlayer,function()
	toggleControl("aim_weapon",true)
end)

--[[
local unblocked_weapons = {
	[19] = true,
	[37] = true,
	[49] = true,
	[50] = true,
	[51] = true,
	[52] = true,
	[53] = true,
	[54] = true,
	[55] = true,
	[57] = true,
	[59] = true,
	[63] = true,
}

addEventHandler("onClientPlayerDamage",localPlayer,function(attacker,weapon)
	local veh = getPedOccupiedVehicle(localPlayer)
	if veh then
		if getElementData(veh,"Szyba-Kuloodporna") then
			if not unblocked_weapons[weapon] then
				cancelEvent();
			end
		end
	end
end)
]]

--[[addEventHandler("onClientPlayerDamage", localPlayer, function(attacker, weapon, bodypart, loss)
	cancelEvent();
	if getElementData(localPlayer,'god') then return end
		local ground = getGroundPosition(getElementPosition(localPlayer))
		headshot = false;
		if (weapon == 37) then
			return;
		end
		if (weapon == 53) then
			setElementData(localPlayer, "blood", getElementData(localPlayer, "blood")-15);
			return;
		end
	if (attacker and getElementType(attacker) == "ped") then
		if getElementModel(attacker)==80 then
			setElementData(localPlayer, "blood", (getElementData(localPlayer, "blood")-math.random(7000, 8000)));
		elseif getElementModel(attacker)==81 then
			setElementData(localPlayer, "blood", (getElementData(localPlayer, "blood")-math.random(4000, 5000)));
		else
			local dmg = getElementData(attacker,'damage') or math.random(0,400)
			setElementData(localPlayer, "blood", (getElementData(localPlayer, "blood")-dmg));
		end
		local number = math.random(1, 7);
		if (number == 4) then
			setElementData(localPlayer, "bleeding", getElementData(localPlayer, "bleeding")+math.floor(loss*10));
		end
		if getElementData(localPlayer,'blood')<=0 then
			triggerServerEvent("kilLDayZPlayer",getElementData(getElementByID('DayZ_Login'),'kilLDayZPlayer'), localPlayer, attacker, headshot,grunt);
			return
		end
	end
	if (weapon == 16) then
		setElementData(localPlayer, "blood", getElementData(localPlayer, "blood") - math.random(20000*0.75, 20000*1.25));
	elseif (weapon == 49) then
		if (loss > 30) then
			local x,y,z = getElementPosition(localPlayer);
			playSound3D("sounds/breakbone.mp3", x, y, z);
			setElementData(localPlayer, "brokenbone", true);
			setElementData(localPlayer, "blood", getElementData(localPlayer, "blood")-math.floor(loss*10));
		end
		setElementData(localPlayer, "blood", getElementData(localPlayer, "blood")-math.floor(loss*2));
	elseif (weapon == 63 or weapon == 51 or weapon == 19) then
		setElementData(localPlayer, "blood", 0);
		if (getElementData(localPlayer, "blood") <= 0) then
			if not getElementData(localPlayer, "isDead") then
				local grunt = getGroundPosition(getElementPosition(localPlayer))
				triggerServerEvent("kilLDayZPlayer",getElementData(getElementByID('DayZ_Login'),'kilLDayZPlayer'), localPlayer, attacker, headshot,grunt);
			end
		end
	elseif (weapon and weapon > 1 and weapon < 40 and attacker and getElementType(attacker) == "player") then
		if getElementData(attacker,'Grupa') and getElementData(localPlayer,'Grupa') and getElementData(attacker,'Grupa').nazwa == getElementData(localPlayer,'Grupa').nazwa then
			if not getElementData(attacker,'isDead') then
				return
			end
		end
		if isPedInVehicle(localPlayer) and getElementData(getPedOccupiedVehicle(localPlayer),"Szyba-Kuloodporna") then return end
	--exports["hitmarker"]:fgFuncHitMarker()
		triggerServerEvent('hitmarker_server',attacker,attacker)
		local number = math.random(1, 8);
		if (number >= 6 or number <= 8) then
			setElementData(localPlayer, "bleeding", getElementData(localPlayer, "bleeding") + math.floor(loss*10));
		end
		local number2 = math.random(1, 7);
		if (number2 == 2) then
			setElementData(localPlayer, "pain", true);
		end
		local damage = getWeaponDamage(attacker, weapon);
		if (bodypart == 9) then
			damage = damage*200;
			headshot = true;
		else
			local x1,y1,z1 = getElementPosition(localPlayer)
			local x2,y2,z2 = getElementPosition(attacker)
			local distance = getDistanceBetweenPoints3D(x1,y1,z1,x2,y2,z2)
			damage = math.ceil(damage-(distance*7))
		end
		if (bodypart == 7 or bodypart == 8) then
			setElementData(localPlayer, "brokenbone", true);
			local x,y,z = getElementPosition(localPlayer);
			playSound("sounds/breakbone.mp3");
		end
		if not isElementInWater(localPlayer) then
			playSound("sounds/hit"..math.random(1, 3)..".mp3");
		end
		setElementData(localPlayer, "blood", getElementData(localPlayer, "blood") - math.random(damage, damage*1.05));
		if (getElementData(localPlayer, "htype") ~= "Bandit") then
			setElementData(attacker, "humanity", getElementData(attacker, "humanity") - math.random(40, 200));
	-- if (getElementData(attacker, "humanity") < 0) then
	--	setElementData(attacker, "htype", "Bandit");
	--end
		elseif (getElementData(localPlayer, "htype") == "Bandit") then
			setElementData(attacker, "humanity", getElementData(attacker, "humanity") + math.random(40, 200));
			if (getElementData(attacker,"humanity") > 5000) then
				setElementData(attacker, "humanity", 5000);
	--	setElementData(attacker, "htype", "Hero");
			end
	--if (getElementData(attacker, "humanity") > 2000) then
	--	setElementData(attacker, "htype", "Survivor");
	--end
		end
		if (getElementData(localPlayer, "blood") <= 0) then
			if not getElementData(localPlayer, "isDead") then
				if attacker then
					triggerServerEvent("kilLDayZPlayer",getElementData(getElementByID('DayZ_Login'),'kilLDayZPlayer'), localPlayer, attacker, headshot, getWeaponNameFromID(weapon),ground);
					triggerServerEvent('DajDzwiekZabicia',resourceRoot,attacker)
				else
					triggerServerEvent("kilLDayZPlayer",getElementData(getElementByID('DayZ_Login'),'kilLDayZPlayer'), localPlayer, attacker, headshot, getWeaponNameFromID(weapon),ground);
	--setElementData(localPlayer, "isDead", true);
				end
				setElementData(localPlayer, "isDead", true);
			end
		end
	elseif (weapon == 54 or weapon == 63 or weapon == 49 or weapon == 51 or weapon == 19) then
		setElementData(localPlayer, "blood", getElementData(localPlayer, "blood") - math.random(100, 1000));
	--	local number = math.random(1, 5);
		if (loss > 30) then
			setElementData(localPlayer, "brokenbone", true);
			local x,y,z = getElementPosition(localPlayer);
			playSound("sounds/breakbone.mp3");
		end
		if (loss >= 100) then
			setElementData(localPlayer, "blood", -55);
			setElementData(localPlayer, "bleeding", 50);
		end
		local number = math.random(1, 15);
		if (number == 3) then
			setElementData(localPlayer, "pain", true);
		end
		if (getElementData(localPlayer, "blood") <= 0) then
			if not getElementData(localPlayer, "isDead") then
				if attacker then
					triggerServerEvent("kilLDayZPlayer",getElementData(getElementByID('DayZ_Login'),'kilLDayZPlayer'), localPlayer, attacker, headshot, getWeaponNameFromID(weapon),ground);
					triggerServerEvent('DajDzwiekZabicia',resourceRoot,attacker)
				else
					triggerServerEvent("kilLDayZPlayer",getElementData(getElementByID('DayZ_Login'),'kilLDayZPlayer'), localPlayer, attacker, headshot, getWeaponNameFromID(weapon),ground);
				end
				setElementData(localPlayer, "isDead", true);
			end
		end
	end
end);]]

local table_getHelmetAndVestInfo = {
	["Hełmy"] = {
		{"Mossy Helmet",30},
		{"Helmet",50},
	},
	["Kamizelki"] = {
		{"Tactical Vest",{change =  30, loss = 30}},
		{"Police Vest",{change = 40, loss = 80}}
	},
}

function getHelmOrVestInfo(c,z)
	for i,v in pairs(table_getHelmetAndVestInfo[c]) do
		if string.find(z,v[1]) then
			return v[2]
		end
	end
	return false
end

addEventHandler("onClientPlayerDamage", localPlayer, function(attacker, weapon, bodypart, loss)
	cancelEvent();

	if getElementData(source,'god') then cancelEvent() return end
		local ground = getGroundPosition(getElementPosition(source))
		headshot = false;
		if (weapon == 37) then
			return;
		end
		if (weapon == 53) then
			setElementData(source, "blood", getElementData(source, "blood")-15);
			return;
		end
	if (attacker and getElementType(attacker) == "ped") then
		if getElementModel(attacker)==80 then
			setElementData(source, "blood", (getElementData(source, "blood")-math.random(7000, 8000)));
		elseif getElementModel(attacker)==81 then
			setElementData(source, "blood", (getElementData(source, "blood")-math.random(4000, 5000)));
		else
			local dmg = getElementData(attacker,'damage') or math.random(0,400)
			setElementData(source, "blood", (getElementData(source, "blood")-dmg));
		end
		local number = math.random(1, 7);
		if (number == 4) then
			setElementData(source, "bleeding", getElementData(source, "bleeding")+math.floor(loss*10));
		end
		if getElementData(source,'blood')<=0 then
			triggerServerEvent("kilLDayZPlayer",getElementData(getElementByID('DayZ_Login'),'kilLDayZPlayer'), source, attacker, headshot,grunt);
			return
		end
	end
	if (weapon == 16) then
		setElementData(source, "blood", getElementData(source, "blood") - math.random(20000*0.75, 20000*1.25));
	elseif (weapon == 49) then
		if (loss > 30) then
			local x,y,z = getElementPosition(source);
			playSound3D("sounds/breakbone.mp3", x, y, z);
			setElementData(source, "brokenbone", true);
			setElementData(source, "blood", getElementData(source, "blood")-math.floor(loss*10));
		end
		setElementData(source, "blood", getElementData(source, "blood")-math.floor(loss*2));
	elseif (weapon == 63 or weapon == 51 or weapon == 19) then
		if getElementModel(source) == 244 then return end
		setElementData(source, "blood", 0);
		if (getElementData(source, "blood") <= 0) then
			if not getElementData(source, "isDead") then
				local grunt = getGroundPosition(getElementPosition(source))
				if attacker and getElementType(attacker) == "player" and getElementModel(attacker) == 244 then
					attacker = nil
				end
				triggerServerEvent("kilLDayZPlayer",getElementData(getElementByID('DayZ_Login'),'kilLDayZPlayer'), source, attacker, headshot,grunt);
			end
		end
	elseif (weapon and weapon > 1 and weapon < 40 and attacker and getElementType(attacker) == "player") then
		if getElementData(attacker,'Grupa') and getElementData(source,'Grupa') and getElementData(attacker,'Grupa').nazwa == getElementData(source,'Grupa').nazwa then
			if not getElementData(attacker,'isDead') then
				return
			end
		end
		if getElementData(source,"current_helm") and bodypart == 9 then
			return
		end
		if isPedInVehicle(source) and getElementData(getPedOccupiedVehicle(source),"Szyba-Kuloodporna") then return end
	--exports["hitmarker"]:fgFuncHitMarker()
		triggerServerEvent('hitmarker_server',attacker,attacker)
		local number = math.random(1, 8);
		if (number >= 6 or number <= 8) then
			setElementData(source, "bleeding", getElementData(source, "bleeding") + math.floor(loss*10));
		end
		local number2 = math.random(1, 7);
		if (number2 == 2) then
			setElementData(source, "pain", true);
		end
		local damage = getWeaponDamage(attacker, weapon);
		if (bodypart == 9) and getElementModel(source) ~= 244 then
			damage = damage*200;
			headshot = true;
		else
			local x1,y1,z1 = getElementPosition(source)
			local x2,y2,z2 = getElementPosition(attacker)
			local distance = getDistanceBetweenPoints3D(x1,y1,z1,x2,y2,z2)
			damage = math.ceil(damage-(distance*7))
		end
		if (bodypart == 7 or bodypart == 8) then
			setElementData(source, "brokenbone", true);
			local x,y,z = getElementPosition(source);
			playSound("sounds/breakbone.mp3");
		end
		if not isElementInWater(source) then
			playSound("sounds/hit"..math.random(1, 3)..".mp3");
		end
		if getElementData(source,"current_kamizelka") and bodypart ~= 9 then
			local szansa = getHelmOrVestInfo("Kamizelki",getElementData(source,"current_kamizelka")[1])
			local los = math.random(100)
			if los <= szansa.change then
				zbijKamizelke(source,getElementData(source,"current_kamizelka")[1])
			end
			damage = damage - damage * (1 - szansa.loss * 0.01)
		end
		setElementData(source, "blood", getElementData(source, "blood") - math.random(damage, damage*1.05));
		if (getElementData(source, "htype") ~= "Bandit") then
			setElementData(attacker, "humanity", getElementData(attacker, "humanity") - math.random(40, 200));
	-- if (getElementData(attacker, "humanity") < 0) then
	--	setElementData(attacker, "htype", "Bandit");
	--end
		elseif (getElementData(source, "htype") == "Bandit") then
			setElementData(attacker, "humanity", getElementData(attacker, "humanity") + math.random(40, 200));
			if (getElementData(attacker,"humanity") > 5000) then
				setElementData(attacker, "humanity", 5000);
	--	setElementData(attacker, "htype", "Hero");
			end
	--if (getElementData(attacker, "humanity") > 2000) then
	--	setElementData(attacker, "htype", "Survivor");
	--end
		end
		if (getElementData(source, "blood") <= 0) then
			if not getElementData(source, "isDead") then
				if attacker then
					triggerServerEvent("kilLDayZPlayer",getElementData(getElementByID('DayZ_Login'),'kilLDayZPlayer'), source, attacker, headshot, getWeaponNameFromID(weapon),ground);
					triggerServerEvent('DajDzwiekZabicia',resourceRoot,attacker)
				else
					triggerServerEvent("kilLDayZPlayer",getElementData(getElementByID('DayZ_Login'),'kilLDayZPlayer'), source, attacker, headshot, getWeaponNameFromID(weapon),ground);
	--setElementData(localPlayer, "isDead", true);
				end
				setElementData(source, "isDead", true);
			end
		end
	elseif (weapon == 54 or weapon == 63 or weapon == 49 or weapon == 51 or weapon == 19) then
		setElementData(source, "blood", getElementData(source, "blood") - math.random(100, 1000));
	--	local number = math.random(1, 5);
		if (loss > 30) then
			setElementData(source, "brokenbone", true);
			local x,y,z = getElementPosition(source);
			playSound("sounds/breakbone.mp3");
		end
		if (loss >= 100) then
			setElementData(source, "blood", -55);
			setElementData(source, "bleeding", 50);
		end
		local number = math.random(1, 15);
		if (number == 3) then
			setElementData(source, "pain", true);
		end
		if (getElementData(source, "blood") <= 0) then
			if not getElementData(source, "isDead") then
				if attacker then
					triggerServerEvent("kilLDayZPlayer",getElementData(getElementByID('DayZ_Login'),'kilLDayZPlayer'), source, attacker, headshot, getWeaponNameFromID(weapon),ground);
					triggerServerEvent('DajDzwiekZabicia',resourceRoot,attacker)
				else
					triggerServerEvent("kilLDayZPlayer",getElementData(getElementByID('DayZ_Login'),'kilLDayZPlayer'), source, attacker, headshot, getWeaponNameFromID(weapon),ground);
				end
				setElementData(source, "isDead", true);
			end
		end
	end
end);


local zbijanie_table = {
	["Police Vest"] = "Police Vest [75%]",
	["Police Vest [75%]"] = "Police Vest [50%]",
	["Police Vest [25%]"] = "Police Vest [25%]",
	["Tactical Vest"] = "Tactical Vest [80%]",
	["Tactical Vest [80%]"] = "Tactical Vest [60%]",
	["Tactical Vest [60%]"] = "Tactical Vest [40%]",
	["Tactical Vest [40%]"] = "Tactical Vest [20%]",
	["Tactical Vest [20%]"] = "Tactical Vest [10%]",
	["Helmet"] = "Helmet [50%]",
	--["Helmet"] = "Helmet [75%]",
	--["Helmet [75%]"] = "Helmet [50%]",
	--["Helmet [50%]"] = "Helmet [25%]",
	["Mossy Helmet"] = "Mossy Helmet [80%]",
	["Mossy Helmet [80%]"] = "Mossy Helmet [60%]",
	["Mossy Helmet [60%]"] = "Mossy Helmet [40%]",
	["Mossy Helmet [40%]"] = "Mossy Helmet [20%]",
	["Mossy Helmet [20%]"] = "Mossy Helmet [10%]",
}


function zbijHelm(hit,nju)
	if zbijanie_table[nju] then
		triggerServerEvent("ZbijHelm",resourceRoot,hit,nju,zbijanie_table[nju])
	else
		triggerServerEvent("ZbijHelm",resourceRoot,hit,nju,false)
	end
end
	
function zbijKamizelke(hit,nju)
	if zbijanie_table[nju] then
		triggerServerEvent("zbijKamizelke",resourceRoot,hit,nju,zbijanie_table[nju])
	else
		triggerServerEvent("zbijKamizelke",resourceRoot,hit,nju,false)
	end
end

addEventHandler("onClientPlayerWeaponFire",localPlayer,function(weapon,ammo,clip,hitX,hitY,hitZ,hitElement,startX,startY,startZ)
	if not hitElement or getElementType(hitElement) ~= "player" then return end
	if getElementData(hitElement,'god') then return end
	if getElementData(hitElement,"current_helm") then
		local change = getHelmOrVestInfo("Hełmy",getElementData(hitElement,"current_helm")[1])
		local los = math.random(100)
		if los <= change then
			zbijHelm(hitElement,getElementData(hitElement,"current_helm")[1])
		end
		return
	end
	local bone = {getPedBonePosition(hitElement,8)}
	if getDistanceBetweenPoints3D(bone[1],bone[2],bone[3],hitX,hitY,hitZ)<0.25 then
		if getElementData(source,'Grupa') and getElementData(hitElement,'Grupa') and getElementData(source,'Grupa').nazwa == getElementData(hitElement,'Grupa').nazwa then
			return
		end
		if getElementData(hitElement,'isDead') then
			return
		end
		if isPedInVehicle(hitElement) and getElementData(getPedOccupiedVehicle(hitElement),"Szyba-Kuloodporna") then return end
		triggerServerEvent("kilLDayZPlayer",getElementData(getElementByID('DayZ_Login'),'kilLDayZPlayer'), hitElement, source, true, getWeaponNameFromID(weapon));
		triggerServerEvent('DajDzwiekZabicia',resourceRoot,source)
	end
end,true,"high")

--
addEventHandler("onClientPlayerWeaponFire",localPlayer,function(weapon,ammo,clip,hitx,hity,hitz,hitElement)
	if weapon == 17 then
		local n = (getElementData(source, "Flara \n")-1)

		setElementData(source, "Flara \n", n)
	
		if (n < 1) then
			setElementData(source, "currentweapon_3", "");
		end
	end
end,true,"high")

--[[addEventHandler( "onClientProjectileCreation", root, function(creator)
	local n = (getElementData(creator, "Flara \n")-1)

	setElementData(creator, "Flara \n", n)

	if (n < 1) then
		setElementData(creator, "currentweapon_3", "");
	end
end)]]

--[[addEventHandler("onClientPlayerDamage", localPlayer, function(attacker, weapon, bodypart, loss)
	cancelEvent();
	if getElementData(source,'god') then return end
		local ground = getGroundPosition(getElementPosition(source))
		headshot = false;
		if (weapon == 37) then
			return;
		end
		if (weapon == 53) then
			setElementData(source, "blood", getElementData(source, "blood")-15);
			return;
		end
	if (attacker and getElementType(attacker) == "ped") then
		if getElementModel(attacker)==80 then
			setElementData(source, "blood", (getElementData(source, "blood")-math.random(7000, 8000)));
		elseif getElementModel(attacker)==81 then
			setElementData(source, "blood", (getElementData(source, "blood")-math.random(4000, 5000)));
		else
			local dmg = getElementData(attacker,'damage') or math.random(0,400)
			setElementData(source, "blood", (getElementData(source, "blood")-dmg));
		end
		local number = math.random(1, 7);
		if (number == 4) then
			setElementData(source, "bleeding", getElementData(source, "bleeding")+math.floor(loss*10));
		end
		if getElementData(source,'blood')<=0 then
			triggerServerEvent("kilLDayZPlayer",getElementData(getElementByID('DayZ_Login'),'kilLDayZPlayer'), source, attacker, headshot,grunt);
			return
		end
	end
	if (weapon == 16) then
		setElementData(source, "blood", getElementData(source, "blood") - math.random(20000*0.75, 20000*1.25));
	elseif (weapon == 49) then
		if (loss > 30) then
			local x,y,z = getElementPosition(source);
			playSound3D("sounds/breakbone.mp3", x, y, z);
			setElementData(source, "brokenbone", true);
			setElementData(source, "blood", getElementData(source, "blood")-math.floor(loss*10));
		end
		setElementData(source, "blood", getElementData(source, "blood")-math.floor(loss*2));
	elseif (weapon == 63 or weapon == 51 or weapon == 19) then
		if getElementModel(source) == 244 then return end
		setElementData(source, "blood", 0);
		if (getElementData(source, "blood") <= 0) then
			if not getElementData(source, "isDead") then
				local grunt = getGroundPosition(getElementPosition(source))
				if attacker and getElementType(attacker) == "player" and getElementModel(attacker) == 244 then
					attacker = nil
				end
				triggerServerEvent("kilLDayZPlayer",getElementData(getElementByID('DayZ_Login'),'kilLDayZPlayer'), source, attacker, headshot,grunt);
			end
		end
	elseif (weapon == 54 or weapon == 63 or weapon == 49 or weapon == 51 or weapon == 19) then
		setElementData(source, "blood", getElementData(source, "blood") - math.random(100, 1000));
	--	local number = math.random(1, 5);
		if (loss > 30) then
			setElementData(source, "brokenbone", true);
			local x,y,z = getElementPosition(source);
			playSound("sounds/breakbone.mp3");
		end
		if (loss >= 100) then
			setElementData(source, "blood", -55);
			setElementData(source, "bleeding", 50);
		end
		local number = math.random(1, 15);
		if (number == 3) then
			setElementData(source, "pain", true);
		end
		if (getElementData(source, "blood") <= 0) then
			if not getElementData(source, "isDead") then
				if attacker then
					triggerServerEvent("kilLDayZPlayer",getElementData(getElementByID('DayZ_Login'),'kilLDayZPlayer'), source, attacker, headshot, getWeaponNameFromID(weapon),ground);
					triggerServerEvent('DajDzwiekZabicia',resourceRoot,attacker)
				else
					triggerServerEvent("kilLDayZPlayer",getElementData(getElementByID('DayZ_Login'),'kilLDayZPlayer'), source, attacker, headshot, getWeaponNameFromID(weapon),ground);
				end
				setElementData(source, "isDead", true);
			end
		end
	end
end);]]
--[[
addEventHandler("onClientPlayerWeaponFire",localPlayer,function(weapon,ammo,clip,hitx,hity,hitz,hitElement)
	if hitElement and getElementType(hitElement) ~= "player" or not hitElement then return end
	if getElementData(hitElement,"god") then return end
	local attacker = source
	if (weapon and weapon > 1 and weapon < 40 and attacker and getElementType(attacker) == "player") then
		if getElementData(attacker,'Grupa') and getElementData(hitElement,'Grupa') and getElementData(attacker,'Grupa').nazwa == getElementData(hitElement,'Grupa').nazwa then
			if not getElementData(attacker,'isDead') then
				return
			end
		end
		local bone_head = Vector3(getPedBonePosition(hitElement,8))
		local bone_noga = Vector3(getPedBonePosition(hitElement,52))
		local bone_noga2 = Vector3(getPedBonePosition(hitElement,42))
		if getElementData(hitElement,"current_helm") and getDistanceBetweenPoints3D(bone_head.x,bone_head.y,bone_head.z,hitx,hity,hitz) < 0.2 then
			return
		end
		if isPedInVehicle(hitElement) and getElementData(getPedOccupiedVehicle(hitElement),"Szyba-Kuloodporna") then return end
		--exports["hitmarker"]:fgFuncHitMarker()
		triggerServerEvent('hitmarker_server',attacker,attacker)
		local number = math.random(1, 8);
		if (number >= 6 or number <= 8) then
			triggerServerEvent("setBleeding",resourceRoot,hitElement,math.floor(5*10))
		end
		local number2 = math.random(1, 7);
		if (number2 == 2) then
			--setElementData(hitElement, "pain", true);
			triggerServerEvent("setBrokeBoneOrPain",resourceRoot,hitElement,"pain",true)
		end
		local damage = getWeaponDamage(attacker, weapon);
		local x1,y1,z1 = getElementPosition(hitElement)
		local x2,y2,z2 = getElementPosition(attacker)
		local distance = getDistanceBetweenPoints3D(x1,y1,z1,x2,y2,z2)
		damage = math.ceil(damage-(distance*7))
		if getDistanceBetweenPoints3D(bone_noga.x,bone_noga.y,bone_noga.z,hitx,hity,hitz) < 0.2 or getDistanceBetweenPoints3D(bone_noga2.x,bone_noga2.y,bone_noga2.z,hitx,hity,hitz) < 0.2 then
			triggerServerEvent("setBrokeBoneOrPain",resourceRoot,hitElement,"brokenbone",true)
			triggerServerEvent("playSoundForPlayer",resourceRoot,hitElement,"sounds/breakbone.mp3")
		end
		if getElementData(hitElement,"current_kamizelka") and getDistanceBetweenPoints3D(bone_head.x,bone_head.y,bone_head.z,hitx,hity,hitz) > 0.2 then
			local szansa = getHelmOrVestInfo("Kamizelki",getElementData(hitElement,"current_kamizelka")[1])
			local los = math.random(100)
			if los <= szansa.change then
				zbijKamizelke(hitElement,getElementData(hitElement,"current_kamizelka")[1])
			end
			damage = damage - damage * (1 - szansa.loss * 0.01)
		end
		local blood = math.random(damage, damage*1.05)
		triggerServerEvent("setPlayerBlood",resourceRoot,hitElement,blood,getWeaponNameFromID(weapon))
		if (getElementData(hitElement, "htype") ~= "Bandit") then
			setElementData(attacker, "humanity", getElementData(attacker, "humanity") - math.random(40, 200));
	-- if (getElementData(attacker, "humanity") < 0) then
	--	setElementData(attacker, "htype", "Bandit");
	--end
		elseif (getElementData(hitElement, "htype") == "Bandit") then
			setElementData(attacker, "humanity", getElementData(attacker, "humanity") + math.random(40, 200));
			if (getElementData(attacker,"humanity") > 5000) then
				setElementData(attacker, "humanity", 5000);
	--	setElementData(attacker, "htype", "Hero");
			end
	--if (getElementData(attacker, "humanity") > 2000) then
	--	setElementData(attacker, "htype", "Survivor");
	--end
		end
	end
end,true,"high")]]

addEvent("playSoundForPlayer-C",true)
addEventHandler("playSoundForPlayer-C",resourceRoot,function(path,kordy)
	local sound = playSound3D(path,kordy[1],kordy[2],kordy[3])
	setSoundMinDistance(sound,15)
	setSoundMaxDistance(sound,20)
end)


local ticking
local radaros = 0


local drawRing = false
local drawing_points = 0

function dxDrawRing (posX, posY, radius, width, startAngle, amount, color, postGUI, absoluteAmount, anglesPerLine)
	if (type (posX) ~= "number") or (type (posY) ~= "number") or (type (startAngle) ~= "number") or (type (amount) ~= "number") then
		return false
	end
	
	if absoluteAmount then
		stopAngle = amount + startAngle
	else
		stopAngle = (amount * 360) + startAngle
	end
	
	anglesPerLine = type (anglesPerLine) == "number" and anglesPerLine or 1
	radius = type (radius) == "number" and radius or 50
	width = type (width) == "number" and width or 5
	color = color or tocolor (255, 255, 255, 255)
	postGUI = type (postGUI) == "boolean" and postGUI or false
	absoluteAmount = type (absoluteAmount) == "boolean" and absoluteAmount or false
	
	for i = startAngle, stopAngle, anglesPerLine do
		local startX = math.cos (math.rad (i)) * (radius - width)
		local startY = math.sin (math.rad (i)) * (radius - width)
		local endX = math.cos (math.rad (i)) * (radius + width)
		local endY = math.sin (math.rad (i)) * (radius + width)
		dxDrawLine (startX + posX, startY + posY, endX + posX, endY + posY, color, width, postGUI)
	end
	return math.floor ((stopAngle - startAngle)/anglesPerLine)
end

local sX, sY = guiGetScreenSize ()

addEvent('BrokeLegSound',true)
addEventHandler('BrokeLegSound',resourceRoot,function()
	playSound('sounds/breakbone.mp3')
end)

function renderRing()
	--dxDrawRing (sX/2, sY/2, sX*0.05, sY*0.01, 0, drawing_points,tocolor(200,0,0,200))
	dxDrawRectangle(sX/2.2, sY/2, sX*(1/10), sY*0.01,tocolor(0,0,0,200))
	dxDrawRectangle(sX/2.2, sY/2, sX*(0+drawing_points/10), sY*0.01,tocolor(0,200,0,230))
	if getKeyState('space') then
		if drawing_points<=1 then
			drawing_points = drawing_points + 0.005
			local anim1,anim2 = getPedAnimation(localPlayer)
			if not (anim1 and anim2) then
				setPedAnimation(localPlayer,'BOMBER','BOM_Plant_Loop',-1,true,false,false,false)
			end
		else
			removeEventHandler('onClientRender',root,renderRing)
			drawing_points = 0
			setPedAnimation(localPlayer,false)
			drawRing = false
			triggerServerEvent("UwolnijSieFromTrap",resourceRoot,localPlayer)
		end
	else
		setPedAnimation(localPlayer,false)
		if drawing_points>0.01 then
			drawing_points = drawing_points - 0.005
		end
	end
end

addEventHandler('onClientPlayerWasted',localPlayer,function()
	if drawRing then
		removeEventHandler('onClientRender',root,renderRing)
		drawing_points = 0
		setPedAnimation(localPlayer,false)
		drawRing = false
		triggerServerEvent("UwolnijSieFromTrap",resourceRoot,localPlayer)
	end
end)


function addRenderRing(state)
	if drawRing then
		removeEventHandler('onClientRender',root,renderRing)
	else
		playSound('sounds/trap.wav')
		addEventHandler('onClientRender',root,renderRing)
	end
	drawRing = not drawRing
end


addEvent('RingRender',true)
addEventHandler('RingRender',resourceRoot,function()
	addRenderRing()
end)

setRadioChannel(0)
--[[
addEventHandler("onClientPedDamage", root, function(attacker, weapon, bodypart, loss)
	cancelEvent();
	if (attacker and attacker == localPlayer) then
	if not isElement(source) then return end
		if getElementData(source, "zombie") then
			if (weapon == 37) then return; end
			if (weapon == 63 or weapon == 51 or weapon == 19) then
				--triggerServerEvent("onZombieGetsKilled", source, attacker, false);
				--setElementData(attacker,'TotalZombieKilled',(getElementData(attacker,'TotalZombieKilled') or 0)+1)
			elseif (weapon and weapon >= 2 and attacker and getElementType(attacker) == "player") then
				if (bodypart == 9) then
					if getElementModel(source)==81 or getElementModel(source)==80 then return end
					setPedHeadless(source, true);
					triggerServerEvent("onZombieGetsKilled", source, attacker, true);
					--setElementData(attacker,'TotalZombieKilled',(getElementData(attacker,'TotalZombieKilled') or 0)+1)
					return;
				end
				local damage = getWeaponDamage(attacker, weapon);
				setElementData(source, "blood", getElementData(source, "blood")-math.random(damage*0.75, damage*1.25));
				if (getElementData(source, "blood") <= 0 and not isPedDead(source)) then
				if getElementModel(source)==80 then
					triggerServerEvent("onLucynaGetsKilled", source, attacker, false);
				elseif getElementAlpha(source)==81 then
					triggerServerEvent("onDanDiGetsKilled",source,attacker,false)
				else
					triggerServerEvent("onZombieGetsKilled", source, attacker, false);
				end
					setElementData(attacker,'TotalZombieKilled',(getElementData(attacker,'TotalZombieKilled') or 0)+1)
				end
			end
		end
	end
end);]]

setTimer(function()
	if getElementData(localPlayer, "logedin") then
		if (getElementData(localPlayer, "bleeding") > 20) then
			setElementData(localPlayer, "blood", getElementData(localPlayer, "blood")-getElementData(localPlayer, "bleeding"));
		else
			setElementData(localPlayer, "bleeding", 0);
		end
		if getElementData(localPlayer, "brokenbone") then
			toggleControl("jump", false);
			toggleControl("sprint", false);
		else
			toggleControl("jump", true);
			toggleControl("sprint", true);
		end
		if getElementData(localPlayer, "pain") then
			local x,y,z = getElementPosition(localPlayer);
			createExplosion(x, y, (z+15), 8, false, 0.7, false);
		end
		if (getPlayerPing(localPlayer) > 300) then
		if isTransferBoxActive() then return end
			pingFails = pingFails + 1;
			if (pingFails == 5) then
				triggerServerEvent("kickPlayerOnHighPing",resourceRoot, localPlayer);
				return;
			end
			exports.DayZ_notification:DrawNotification("Twój ping przekracza limit ("..pingFails.."/5)!", 255, 255, 255);
			if isTimer(pingTimer) then return; end
			pingTimer = setTimer(function() pingFails = 0; end, 30000, 1);
		end
	end
	local plecak = getElementData(localPlayer,"tohide2")
	if isElement(plecak) and getElementAlpha(plecak) == 255 then
		local hide_backpack = getElementData(localPlayer,"Hide-Backpack")
		if hide_backpack then
			setElementAlpha(plecak,0)
		end
	end
end, 3000, 0);

local added_blood = 0

local refresh_max_blood = getTickCount()

local refreshVoiceAndVisiblity = getTickCount()

setTimer(function()
	if not getElementData(localPlayer,'logedin') then return end
	if (getElementData(localPlayer, "blood") <= 0) then
		if not getElementData(localPlayer, "isDead") then
			triggerServerEvent("kilLDayZPlayer",getElementData(getElementByID('DayZ_Login'),'kilLDayZPlayer'), localPlayer, false, false,false);
		end
	end
	if refresh_max_blood < getTickCount() then
		added_blood = exports["DayZ_poziomy"]:getMaxHealth(localPlayer)
		refresh_max_blood = getTickCount() + 5000
	end
	if (getElementData(localPlayer, "blood") > 12000 + added_blood) and getElementData(localPlayer,"UID") ~= 1 then
		setElementData(localPlayer, "blood", 12000 + added_blood);
	end
	value = 40
	if getPedMoveState (localPlayer) == "stand" then
		value = 20
	elseif getPedMoveState (localPlayer) == "walk" then
		value = 20
	elseif getPedMoveState (localPlayer) == "powerwalk" then
		value = 40
	elseif getPedMoveState (localPlayer) == "jog" then
		value = 80
	elseif getPedMoveState (localPlayer) == "sprint" then	
		value = 100
	elseif getPedMoveState (localPlayer) == "crouch" then	
		value = 20
	elseif getPedMoveState(localPlayer) == "jump" then
		value = 100
	elseif not getPedMoveState (localPlayer) then
		value = 20
	end
	if getElementData(localPlayer,"shooting") and getElementData(localPlayer,"shooting") > 0 then
		value = value+getElementData(localPlayer,"shooting")
	end
	if isPedInVehicle (localPlayer) then
		value = 200
	end	
	if value > 100 then
		value = 100
	end
	if (getElementData(localPlayer,"volume") or 0) ~= value then
		setElementData(localPlayer,"volume",value)
	end
	value = 20
	if getPedMoveState (localPlayer) == "stand" then
		value = 60
	elseif getPedMoveState (localPlayer) == "walk" then
		value = 60
	elseif getPedMoveState (localPlayer) == "powerwalk" then
		value = 60
	elseif getPedMoveState (localPlayer) == "jog" then
		value = 60
	elseif getPedMoveState (localPlayer) == "sprint" then	
		value = 60
	elseif getPedMoveState (localPlayer) == "crouch" then	
		value = 20
	elseif getPedMoveState(localPlayer) == "jump" then
		value = 100
	elseif not getPedMoveState (localPlayer) then	
		value = 20
	end
	if getElementData(localPlayer,"jumping") then
		value = 100
	end
	--[[if isObjectAroundPlayer (localPlayer,2, 4 ) then
		value = 0
	end]]
	if isPedInVehicle (localPlayer) then
		value = 100
	end	
	if (getElementData(localPlayer,"visibly") or 0) ~= value then
		setElementData(localPlayer,"visibly",value)
	end
end,500,0)

--[[setTimer(function()
	if getElementData(localPlayer, "logedin") then
		local x,y,z = getElementPosition(localPlayer)
		local col = createColSphere(x,y,z,50)
		setTimer(function(col)
			for _,v in ipairs(getElementsWithinColShape(col,'player')) do
				local bleeding = getElementData(v, "bleeding") or 0;
				if (bleeding > 0) then
					local px,py,pz = getPedBonePosition(v, 3);
					local pdistance = getDistanceBetweenPoints3D(x, y, z, px, py, pz);
					if (bleeding > 600) then number = 5;
					elseif (bleeding > 300) then number = 3;
					elseif (bleeding > 100) then number = 1;
					else number = 10; end
					if (pdistance <= 120) then
						fxAddBlood(px, py, pz, 0, 0, 0, number, 1);
					end
				end
			end
			destroyElement(col)
		end,50,1,col)
	end
end,2000, 0);]]

function getWeaponNoise(weapon)
	--for _,v in ipairs(weaponNoiseTable) do
		if (weaponNoiseTable[weapon]) then
			return weaponNoiseTable[weapon];
		end
	--end
	return 0;
end

function getElementSpeed(theElement, unit)
    -- Check arguments for errors
    assert(isElement(theElement), "Bad argument 1 @ getElementSpeed (element expected, got " .. type(theElement) .. ")")
    local elementType = getElementType(theElement)
    assert(elementType == "player" or elementType == "ped" or elementType == "object" or elementType == "vehicle" or elementType == "projectile", "Invalid element type @ getElementSpeed (player/ped/object/vehicle/projectile expected, got " .. elementType .. ")")
    assert((unit == nil or type(unit) == "string" or type(unit) == "number") and (unit == nil or (tonumber(unit) and (tonumber(unit) == 0 or tonumber(unit) == 1 or tonumber(unit) == 2)) or unit == "m/s" or unit == "km/h" or unit == "mph"), "Bad argument 2 @ getElementSpeed (invalid speed unit)")
    -- Default to m/s if no unit specified and 'ignore' argument type if the string contains a number
    unit = unit == nil and 0 or ((not tonumber(unit)) and unit or tonumber(unit))
    -- Setup our multiplier to convert the velocity to the specified unit
    local mult = (unit == 0 or unit == "m/s") and 50 or ((unit == 1 or unit == "km/h") and 180 or 111.84681456)
    -- Return the speed by calculating the length of the velocity vector, after converting the velocity to the specified unit
    return (Vector3(getElementVelocity(theElement)) * mult).length
end


local TargetrenderVehicleInfo = dxCreateRenderTarget(sx,sy,true)
local refresh_vehicleinfo = getTickCount()


function renderVehicleInfo()
	
	local w = 0
	local offset = dxGetFontHeight(0.9,font);
	local veh = getPedOccupiedVehicle(localPlayer);
	if not veh then return end
	if (getElementModel(veh) ~= 509) and refresh_vehicleinfo < getTickCount() then --[[If is not a bike]]
		refresh_vehicleinfo = getTickCount() + 1000
		dxSetRenderTarget(TargetrenderVehicleInfo,true)
		local col = getElementData(veh, "parent");
		local maxfuel = tonumber(getElementData(veh, "maxfuel")) or 0;
		local fuel = string.format('%.02f',(tonumber(getElementData(col, "fuel")) or 0))
		local needengine = tonumber(getElementData(veh, "needengines")) or 0;
		local needtires = tonumber(getElementData(veh, "needtires")) or 0;
		local needparts = tonumber(getElementData(veh, "needparts")) or 0;
		local engine = tonumber(getElementData(col, "Engine_inVehicle")) or 0;
		local tires = tonumber(getElementData(col, "Tire_inVehicle")) or 0;
		local parts = tonumber(getElementData(col, "Parts_inVehicle")) or 0;
		
		
		w = dxGetTextWidth(engine.."/"..needengine.." Engine", 1.00, "default-bold");
		if (engine == needengine) then r,g,b = 0, 255, 0; else r,g,b = 255, 0, 0; end
		dxDrawText_s(engine.."/"..needengine.." Engine", sW*0.48-w/2, sH*0, sW*0.5-w/2, sH*0, tocolor(r, g, b, 255), 1, font);
		w = dxGetTextWidth(tires.."/"..needtires.." Tires", 1.00, "default-bold");
		if (tires == needtires) then r,g,b = 0, 255, 0; else r,g,b = 255, 0, 0; end
		dxDrawText_s(tires.."/"..needtires.." Tires", sW*0.476-w/2, sH*0+offset, sW*0.5-w/2, sH*0+offset, tocolor(r, g, b, 255), 1, font);
		w = dxGetTextWidth(parts.."/"..needparts.." Tank Parts", 1.00, "default-bold");
		if (parts == needparts) then r,g,b = 0, 255, 0; else r,g,b = 255, 0, 0; end
		dxDrawText_s(parts.."/"..needparts.." Tank Parts", sW*0.47-w/2, sH*0+offset*2, sW*0.5-w/2, sH*0+offset, tocolor(r, g, b, 255), 1, font);
		w = dxGetTextWidth("Fuel: "..fuel.."/"..maxfuel, 1.00, "default-bold");
		local g = math.percent(math.percent(100, fuel, maxfuel), 255);
		dxDrawText_s("Fuel: "..fuel.."/"..maxfuel, sW*0.47-w/2, sH*0+offset*3, sW*0.5-w/2, sH*0+offset*2, tocolor(255-g, g, 0, 255), 1, font);
		w = dxGetTextWidth(engine.."/"..needengine.." Speed", 1.00, "default-bold");
		
		w = dxGetTextWidth(engine.."/"..needengine.." Vehicle Health", 1.00, "default-bold");
		dxDrawText_s("Vehicle Health: "..math.ceil(getElementHealth(veh)/10).."%", sW*0.463-w/2, sH*0+offset*5, sW*0.5-w/2, sH*0, tocolor(0,255,0, 255), 1, font);
		local szyba = (getElementData(veh,"Szyba-Kuloodporna") and 1 or 0)
		w = dxGetTextWidth(szyba.."/1 Glass", 1.00, "default-bold");
		local r,g,b = 255,0,0
		if szyba == 1 then
			r,g,b = 0,255,0
		end
		dxDrawText_s(szyba.."/1 Glass", sW*0.476-w/2, sH*0+offset*6, sW*0.5-w/2, sH*0, tocolor(r,g,b, 255), 1, font);
		
		local lista = (getElementData(veh,"lista-metalu") and 1 or 0)
		w = dxGetTextWidth(lista.."/1 Lista Metalu", 1.00, "default-bold");
		local r,g,b = 255,0,0
		if lista == 1 then
			r,g,b = 0,255,0
		end
		dxDrawText_s(lista.."/1 Lista metalu", sW*0.636-w/2, sH*0+offset*0, sW*0.5-w/2, sH*0, tocolor(r,g,b, 255), 1, font);
		dxSetRenderTarget()
	end
	local w = dxGetTextWidth("Chuje Speed", 1.00, "default-bold");
	dxDrawText_s("Speed: "..math.ceil(getElementSpeed(veh, 1)).. "KM/H", sW*0.473-w/2, sH*0+offset*4, sW*0.5-w/2, sH*0, tocolor(0,255,0, 255), 1, font);
	dxDrawImage(0,0,sx,sy,TargetrenderVehicleInfo)
end


function dxDrawText_s(...)
	local args = {...}
	dxDrawText(args[1], args[2]+1, args[3], args[4]+1, args[5], tocolor(0, 0, 0, 255), args[7], args[8] or "clear", args[9], args[10], args[11], args[12], args[13], args[14], args[15], args[16], args[17], args[18] )
	dxDrawText(args[1], args[2], args[3]+1, args[4], args[5]+1, tocolor(0, 0, 0, 255), args[7], args[8] or "clear", args[9], args[10], args[11], args[12], args[13], args[14], args[15], args[16], args[17], args[18] )
	dxDrawText(args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8] or "clear", args[9], args[10], args[11], args[12], args[13], args[14], args[15], args[16], args[17], args[18] )
	return true
end


if getPedOccupiedVehicle(localPlayer) then
	addEventHandler('onClientRender',root,renderVehicleInfo)
end

addEventHandler('onClientPlayerVehicleEnter',localPlayer,function(veh,seat)
	if getElementModel(veh)~=509 then
		removeEventHandler('onClientRender',root,renderVehicleInfo)
		addEventHandler('onClientRender',root,renderVehicleInfo)
	end
	if seat==0 then
		setVehicleEngineState(veh,false)
	end
end)



addEventHandler('onClientPlayerVehicleExit',localPlayer,function(veh)
	if getElementModel(veh)~=509 then
		removeEventHandler('onClientRender',root,renderVehicleInfo)
	end
end)


local tick_last_sprint = getTickCount()
local type_of_sprint
local przekroczyl = false

setElementData(localPlayer,'sprint',100)


local friend_image = dxCreateTexture("images/friend.png")

local menu_font = dxCreateFont("font2.ttf",9 * (sH/768) )

local kill_message_font = exports.DayZ_font:GetFont("Roboto-light", 10 * (sy/1080))

addEventHandler("onClientRender", root, function()
	if getElementData(localPlayer, "logedin") then
		local lang = getElementData(localPlayer, "Jezyk_Gry")
		for i,v in ipairs(theTexts) do
			if i%2==0 then
				color1,color2,color3 = 55,55,55
			else
				color1,color2,color3 = 19,19,19
			end

			local y = sy * (0.9901 - (0.0245*i))

			dxDrawImage(sx * 0.0131, y, sx * 0.0125, sy * 0.0222, "images/kill_image.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			dxDrawImage(sx * 0.0294, y, sx * 0.2162, sy * 0.0222, "images/kill_background.png", 0, 0, 0, tocolor(255, 255, 255, 70), false)
			dxDrawText(v[1], sx * 0.0308, sy * (0.9941 - (0.0245*i)), sx * 0.2450, sy * 0.9633, tocolor(255, 255, 255, 255), 1.00, kill_message_font, "left", "top", false, false, false, false, false)

		end
		if getElementModel(localPlayer) == 236 then
			setPedOxygenLevel(localPlayer,1000)
		end
		local x,y,z = getElementPosition(localPlayer);
		
		for _,v in ipairs(getElementsByType("player", root, true)) do
			local _, anim = getPedAnimation(v)
			if getElementData(v,"Lezy") and anim ~= "CS_Dead_Guy" then
				setPedAnimationProgress(v,"CS_Dead_Guy",0.99)
			end
			if not isPedDead(v) then
				local lx, ly, lz = getWorldFromScreenPosition ( sW/2, sH/2, 10 )
				setPedLookAt(v, lx, ly, lz)
			end 
			if (v ~= localPlayer) and getElementDimension(v)==getElementDimension(localPlayer) then
				local px,py,pz = getElementPosition(v);
				local odleglosc = 4
				local adist = 80
				if getElementData(v,'Grupa') and getElementData(localPlayer,'Grupa') and getElementData(v,'Grupa').nazwa==getElementData(localPlayer,'Grupa').nazwa then
					odleglosc = 200
				end
				if getDistanceBetweenPoints3D(x, y, z, px, py, pz) <= odleglosc and not getElementData(v,"god") then
					local sx,sy = getScreenFromWorldPosition(px, py, pz+0.95, 0.06);
					if (sx and sy) then
						local text = "#00FF00"..getPlayerName(v).." #00FF00("..(getElementData(v, "Grupa") and getElementData(v, "Grupa").nazwa or 'None' )..")"
						local text2 = text:gsub("#%x%x%x%x%x%x", "")
						local w = dxGetTextWidth(text2, 1.02, "default-bold");
						dxDrawText(text, sx-(w/2), sy-10, sx-(w/2), sy, tocolor(100, 255, 100, 200), 1, "default-bold","left","top",false,false,false,true);
					end
				end
				if getDistanceBetweenPoints3D(x, y, z, px, py, pz ) <= adist then
					local sx,sy = getScreenFromWorldPosition(px, py, pz+0.95, 0.06);
					if (sx and sy) then
						if getElementData(v, 'showAdmin') then
							local string = exports.DayZ_ranks:getRankFullName(getElementData(v, 'showAdmin'), lang, 2)
							local string2 = exports.DayZ_ranks:getRankFullName(getElementData(v, 'showAdmin'), lang, 1)
							local w = dxGetTextWidth(string2, 1.02, "default-bold")
							dxDrawText(string, sx-(w/2)-8, sy-33, sx-(w/2), sy, tocolor(200, 0, 0, 200), 1, tag_font,"left","top",false,false,false, true);
						end
					end
				end
			end
		end
		for i,v in pairs(getElementsByType("marker", root, true)) do
			local px,py,pz = getElementPosition(v)
			local opis = getElementData(v,"Marker-Opis")
			if getDistanceBetweenPoints3D(x, y, z, px, py, pz) <= 4 and opis then
				local sx,sy = getScreenFromWorldPosition(px, py, pz+1.3, 0.06);
				if sx and sy then
					local scale = 255 - ((getDistanceBetweenPoints3D(x, y, z, px, py, pz) / 2) * 122.5)
					local w = dxGetTextWidth(opis, 1, "pricedown");
					dxDrawText(opis,sx-(w/2), sy, sx-(w/2), sy,tocolor(29, 99, 20,scale), 2, "pricedown","left","top")
				end
			end
		end
		local weapon = getPedWeapon(localPlayer)
		if (weapon == 43) then
			local task = getPedTask(localPlayer, "secondary", 0);
			local control = getPedControlState("aim_weapon");
			if ((task == "TASK_SIMPLE_USE_GUN") and control) then
				dxDrawImage(0, 0, sW, sH, "texture/binoculars.png");
			end
		elseif weapon==34 then
			local tohide = getElementData(localPlayer, "tohide".."1") or "NONE";
			local task = getPedTask(localPlayer, "secondary", 0);
			local control = getPedControlState("aim_weapon");
			local kamizelka = getElementData(localPlayer,"Nalozona-Kamizelka")
			local helm = getElementData(localPlayer,"Nalozony-Helm")
			if kamizelka then
				if control and task=="TASK_SIMPLE_USE_GUN"  and isElement(kamizelka) then
					setElementAlpha(kamizelka,0)
				elseif isElement(kamizelka) then
					setElementAlpha(kamizelka,255)
				end
			end
			if helm then
				if control and task=="TASK_SIMPLE_USE_GUN" and isElement(helm) then
					setElementAlpha(helm,0)
				elseif isElement(helm) then
					setElementAlpha(helm,255)
				end
			end
			if isElement(tohide) then
				
				local tohide_2 = getElementData(localPlayer, "tohide".."2") or "NONE";
				if task=="TASK_SIMPLE_USE_GUN" and control then
					if isElement(tohide_2) then
						setElementAlpha(tohide_2,0)
					end
					setElementAlpha(tohide,0)
				else
					if isElement(tohide_2) then
						setElementAlpha(tohide_2,255)
					end
					setElementAlpha(tohide,255)
				end
			end
		end
	end
	local x,y,z = getElementPosition(getLocalPlayer())
		for i,veh in ipairs(getElementsByType("vehicle", root, true)) do
		local px,py,pz = getElementPosition (veh)
		local vehID = getElementModel(veh)
		local vehicle = getPedOccupiedVehicle(getLocalPlayer())
		if veh ~= vehicle then
			if vehID ~= 548 then
				local pdistance = getDistanceBetweenPoints3D ( x,y,z,px,py,pz )
				if pdistance <= 3 then
					--Get screenposition
					local sx,sy = getScreenFromWorldPosition ( px, py, pz+0.95, 0.06 )
					if sx and sy then
						--Draw Vehicle
						local w = dxGetTextWidth(getVehicleName(veh),1.02,"default-bold")
						local h = dxGetFontHeight(1, "default-bold")
						local alpha = pdistance * 85
						local id = getVehicleID(veh)
						if id == 426 then
							dxDrawText ("#fa6800Kałdi RS7", sx-(w/2), sy, sx-(w/2), sy, tocolor ( 100, 255, 100, 255 - alpha ), 1.02, "default-bold","left","top",false,false,false,true )	
						elseif id == 558 then
							dxDrawText ("#FFCC00Złomek Family", sx-(w/2), sy, sx-(w/2), sy, tocolor ( 100, 255, 100, 255 - alpha ), 1.02, "default-bold","left","top",false,false,false,true )
						elseif id == 573 then
							dxDrawText ("#bfff00RozkurwiatoR 3000", sx-(w/2), sy, sx-(w/2), sy, tocolor ( 100, 255, 100, 255 - alpha ), 1.02, "default-bold","left","top",false,false,false,true )	
						else
						dxDrawText ("#00FF00"..getVehicleName(veh), sx-(w/2), sy, sx-(w/2), sy, tocolor ( 100, 255, 100, 255 - alpha ), 1.02, "default-bold","left","top",false,false,false,true )	
						end
						if getElementData(veh, "Pojazd-Tymczasowy") then
							dxDrawText ("Tymczasowy", sx-(w/2) - w / 2, sy + h, sx-(w/2), sy, tocolor ( 25, 174, 194, 255 - alpha ), 1.02, "default-bold","left","top",false,false,false,true )	
						end
						if getElementData(veh, "Pojazd-Naczepa") then
							dxDrawText ("Naczepa z przedmiotami", sx-(w/2) - w / 2, sy + h, sx-(w/2), sy, tocolor ( 0, 157, 224, 255), 1.70, "default-bold","left","top",false,false,false,true )	
						end
						if getElementData(veh, "Buyed-Days") then
							local text = "ERROR:CAR_TYPE"

							if getElementData(veh, "car_type") == 1 then text = "Do wygaśnięcia: "..getElementData(veh, "Buyed-Days").. " dni."
							elseif getElementData(veh, "car_type") == 2 then text = "Do wygaśnięcia: "..getElementData(veh, "Buyed-Days").. " respawn/ów." end
								
							local w = dxGetTextWidth(text,1.02,"default-bold") / 2
							dxDrawText(text, sx-(w/2) - w / 2, sy + h, sx-(w/2), sy, tocolor ( 255, 255, 255, 255 - alpha ), 1.02, "default-bold","left","top",false,false,false,true )	
						end
					end
				end
			end
		end
	end
	if playerTarget and not getElementData(playerTarget,"god") then 
		local x,y,z = getElementPosition(playerTarget)
		local x,y,distance = getScreenFromWorldPosition (x,y,z+0.5)
		distance = 30
		text = string.gsub(getPlayerName(playerTarget), '#%x%x%x%x%x%x', '' )
		local w = dxGetTextWidth(text,distance*0.033,"default-bold")
		if w and x and y and text and distance then
		dxDrawText(text,x-(w/5),y,x-(w/5),y,tocolor(100, 255, 100, 200),distance*0.033,"default-bold","left","top",false,false,false,true);
		end
	end
	--[[if getPedControlState(localPlayer,'sprint') then
		type_of_sprint = 'sprint'
		if not tick_last_sprint then
			tick_last_sprint = getTickCount() + 1500
		end
	else
		type_of_sprint = 'odpoczywa'
		if not tick_last_sprint then
			tick_last_sprint = getTickCount() + 1000
		end
	end
	if type_of_sprint and type_of_sprint=="sprint" then
		if getTickCount()>tick_last_sprint then
			local data = getElementData(localPlayer,'sprint') or 100
			setElementData(localPlayer,'sprint',data-1)
			tick_last_sprint = getTickCount() + 1500
		end
	elseif type_of_sprint and type_of_sprint=='odpoczywa' then
		if getTickCount()>tick_last_sprint then
			local data = math.min((getElementData(localPlayer,'sprint') or 100),99)
			setElementData(localPlayer,'sprint',data+1)
			tick_last_sprint = getTickCount() + 1000
		end
	end
	if (getElementData(localPlayer,'sprint')<30) or przekroczyl then
		toggleControl('sprint',false)
		if not przekroczyl then
			przekroczyl = true
			setTimer(function()
				przekroczyl = false
			end,25000,1)
		end
	end]]
end);


addEventHandler('onClientPlayerRadioSwitch',localPlayer,function()
	cancelEvent()
end)

--[[
bindKey("aim_weapon", "both", function(key, press)
	if (getPedWeapon(localPlayer) == 34) then
		if (press == "down") then
			for i = 1, 4 do
				if (i ~= 3) then
					local tohide = getElementData(localPlayer, "tohide"..tostring(1)) or "NONE";
					if (tohide ~= "NONE") and not getElementData(localPlayer,'Backpack-Pokaz') then
						--setElementAlpha(tohide, 0);
					end
				end
			end
		elseif (press == "up") then
			for i = 1, 4 do
				if (i ~= 3) then
					local tohide = getElementData(localPlayer, "tohide"..tostring(1)) or "NONE";
					if (tohide ~= "NONE") and getElementData(localPlayer,'Backpack-Pokaz') then
					setTimer(function(zakyj)
						--setElementAlpha(zakyj, 255);
					end,50,1,tohide)
					end
				end
			end
		end
	end
end);]]

addEventHandler("onClientVehicleStartExit", localPlayer, function(plr)
	if (getElementModel(source) ~= 509) then
		if (getElementModel(source) ~= 468) then
			for i = 2, 4 do
				local tohide = getElementData(localPlayer, "tohide"..tostring(i)) or "NONE";
				if tohide~="NONE" and isElement(tohide) then
					setElementAlpha(tohide, 255);
				end
			end
		end
	end
end);

addEventHandler("onClientVehicleEnter", localPlayer, function(plr)
	if (getElementModel(source) ~= 509) then
		if (getElementModel(source) ~= 468) then
			for i = 2, 4 do
				local tohide = getElementData(localPlayer, "tohide"..tostring(i)) or "NONE";
				if (tohide ~= "NONE") and isElement(tohide) then
					setElementAlpha(tohide, 0);
				end
			end
		end
	end
	setRadioChannel(0);
end);

local network = {};
network.frozen = nil;

network.fnc = function( status )
  if (status == 0) then
  if getPlayerSerial(player)=="TWOJ SERIAL :)" then return end
    if not isElementFrozen(localPlayer) then
      --00('frag_notification_text', localPlayer, 'error', 'PACKET LOSS!');
      local veh = getPedOccupiedVehicle(localPlayer);
      if veh then
		outputChatBox("#c22d2d[#6b6b6b!#c22d2d] #ffffffMasz problemy z połączeniem!",255, 0, 0, true)
		setElementFrozen(veh, true);
		if getElementData(localPlayer, "intruz") == true then
			setElementData(localPlayer, "blood", -100000)
		end
      end
      setElementFrozen(localPlayer, true);
	  outputChatBox("#c22d2d[#6b6b6b!#c22d2d] #ffffffMasz problemy z połączeniem!",255, 0, 0, true)
      network.frozen = true;
    end
  elseif (status == 1) then
    if (network.frozen) then
      local veh = getPedOccupiedVehicle(localPlayer);
      if veh then
        setElementFrozen(veh, false);
      end
      setElementFrozen(localPlayer, false);
      network.frozen = nil;
    end
  end
end
addEventHandler('onClientPlayerNetworkStatus', root, network.fnc);



addEventHandler("onClientPlayerTarget", localPlayer, function(target)
	if (target and getElementType(target) == "player") then
		playerTarget = target;
	else
		playerTarget = false;
	end
end);

local koreanski = 1
local deadBackground = guiCreateStaticImage(0, 0, 1, 1, "images/dead.png", true);

local deathText = guiCreateLabel(0, 0.8, 1, 0.2, "", true,deadBackground);
guiSetVisible(deadBackground,false)
guiLabelSetHorizontalAlign(deathText, "center");
addEventHandler("onClientPlayerDeathInfo", root, function(killer)
	koreanski = 5
	local text = ""
	fadeCamera(false, 1.0, 0, 0, 0);
	if killer and getElementType(killer) == "player" then
		text =  "Zostałeś zabity przez "..getPlayerName(killer):gsub("#%x%x%x%x%x%x","").." \n Zrespisz się za %s sekund."
		guiSetText(deathText,string.format(text,koreanski));
	else
		text = "Zginąłeś! \n Zrespisz się za %s sekund."
		guiSetText(deathText,string.format(text,koreanski));
	end
	setTimer(function(text)
		koreanski = koreanski - 1
		guiSetText(deathText,string.format(text,koreanski))
	end,1000,5,text)
	guiSetVisible(deadBackground,true)
	setTimer(function()
		guiSetVisible(deadBackground,false)
	end,5050,1)
end);

setTimer(function()
	if getElementData(localPlayer, "logedin") then
		setElementData(localPlayer, "alivetime", getElementData(localPlayer, "alivetime") + 1);
		setElementData(localPlayer, "alivetimetotal", getElementData(localPlayer, "alivetimetotal") + 1);
	end 
end, 60000, 0);


setTimer(function()
	if getElementData(localPlayer, "logedin") then
		if getElementData(localPlayer, "pain") then
			exports.DayZ_notification:DrawNotification("Drżysz, musisz użyć painkillera!", 255, 255, 255);
		end
		if (getElementData(localPlayer, "food") < 5) then
			exports.DayZ_notification:DrawNotification("Jesteś głodny, musisz coś zjeść!", 255, 255, 255);
		end
		if (getElementData(localPlayer, "thirst") < 5) then
			exports.DayZ_notification:DrawNotification("Jesteś odwodniony, musisz się napić!", 255, 255, 255);
		end
		if (getElementData(localPlayer, "bleeding") > 0) then
			exports.DayZ_notification:DrawNotification("Krawisz, musisz użyć bandaża!", 255, 255, 255);
		end
		triggerServerEvent('ZabijajPoWoli',resourceRoot,localPlayer)
	end
end, 60000, 0);


local last_pozycja = nil

setTimer(function()
	if not getElementData(localPlayer,"logedin") then return end
	if getElementData(localPlayer,"Umiejetnosc_3") ~= "Opcja 2" then return end
	local current_position = {getElementPosition(localPlayer)}
	if last_pozycja then
		if getDistanceBetweenPoints3D(last_pozycja[1],last_pozycja[2],last_pozycja[3],current_position[1],current_position[2],current_position[3]) < 0.5 then
			local krew = getElementData(localPlayer,"blood")
			if krew < 7000 then
				local add_blood = math.random(20,200)
				setElementData(localPlayer,"blood",krew + add_blood)
				exports.DayZ_notification:DrawNotification("+"..add_blood,0,200,0)
			end
		end
	end
	last_pozycja = current_position
end,5000,0)


--[[

local sound = playSound3D("https://radioparty.pl/play/energy2000kat.m3u",68.321449279785,357.60882568359,4.3722305297852,true)
setSoundMaxDistance(sound,70)
setSoundMinDistance(sound,30)

]]

addEvent("odpalLatanko",true)
addEventHandler("odpalLatanko",resourceRoot,function()
	setWorldSpecialPropertyEnabled("aircars",true)
end)

--[[addEvent( "onPlayerDropFlara", true )
addEventHandler( "onPlayerDropFlara", localPlayer, function()
	outputChatBox("Test")
	local ammo = getPedTotalAmmo(localPlayer)
	local waepon = getPedWeapon(localPlayer)
	setWeaponAmmo(weapon, ammo-1)
end)]]



