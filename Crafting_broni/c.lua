
local sx,sy = guiGetScreenSize()

local tick = getTickCount()

local typ_zanikania


local font = dxCreateFont("font.ttf",18*sy/768)
local font2 = dxCreateFont("font.ttf",10*sy/768)
local font3 = dxCreateFont("font.ttf",7*sy/768)

local checkGrid
local clickGrid

local uslugi = {
	{"M4A1","Możesz wytworzyć: ","30 weaponparts,M4A1-S"},
	--{"Metal","Możesz wytworzyć: "},
}

local kordy_grid = {}
local timer_zanikanie 

local bronie = {
	{"M4A1-S", 1},
}


function getWeaponToMetal()
	local metal = 0
	for i,v in pairs(bronie) do
		if (getElementData(localPlayer,v[1]) or 0) >= 1 then
			metal = metal + v[2] * getElementData(localPlayer,v[1])
		end
	end
	local co = math.modf(metal)
	return co
end

function fromColor(color)
	if color then
		local blue = bitExtract(color, 0, 8)
		local green = bitExtract(color, 8, 8)
		local red = bitExtract(color, 16, 8)
		local alpha = bitExtract(color, 24, 8)
		return { red, green, blue, alpha }
	end
end

function dxAddGridRow(x,y,w,h,offset,color,text_color,teksty)
	local pos = sy * (y + 0.07 * (offset - 1))
	dxDrawRectangle(sx * x, pos, sx * w, sy * 0.07,color)
	dxDrawLinedRectangle(sx * x, pos, sx * w, sy * 0.07,tocolor(0,0,0,text_color),1,true)
	kordy_grid[offset] = nil
	kordy_grid[offset] = {sx * x, pos, sx * w, sy * 0.07,offset}
	dxDrawText(teksty.naglowek,sx * (x + 0.01), pos + sy * 0.01, sx * w + (sx * x) , sy * 0.07 + pos,tocolor(255,255,255,text_color),1,font2,"center","top")
	dxDrawText(teksty.wymagane,sx * (x + 0.01), pos, sx * w + (sx * x) , sy * 0.055 + pos,tocolor(255,255,255,text_color),1,font3,"left","bottom")
	--dxDrawText(teksty.glowny,sx * (x + 0.01), pos, sx * w + (sx * x) , sy * 0.07 + pos,tocolor(255,255,255,text_color),1,font3,"left","bottom")
end

function isMouseInPosition ( x, y, width, height )
	if ( not isCursorShowing( ) ) then
		return false
	end
    local sx, sy = guiGetScreenSize ( )
    local cx, cy = getCursorPosition ( )
    local cx, cy = ( cx * sx ), ( cy * sy )
    if ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) then
        return true
    else
        return false
    end
end

function dxDrawLinedRectangle( x, y, width, height, color, _width, postGUI )
	_width = _width or 1
	dxDrawLine ( x, y, x+width, y, color, _width, postGUI ) -- Top
	dxDrawLine ( x, y, x, y+height, color, _width, postGUI ) -- Left
	dxDrawLine ( x, y+height, x+width, y+height, color, _width, postGUI ) -- Bottom
	return dxDrawLine ( x+width, y, x+width, y+height, color, _width, postGUI ) -- Right
end



addEventHandler("onClientRender",root,function()
	if not wlaczone then return end
	local interpolacja
	if typ_zanikania == 1 then
		interpolacja = interpolateBetween(0,0,0,180,0,0,(getTickCount()-tick)/200,"InQuad")
	else
		interpolacja = interpolateBetween(180,0,0,0,0,0,(getTickCount()-tick)/200,"Linear")
	end
	--dxDrawImage(sx * 0.25,sy * 0.3,sx*0.5,sy*0.5,texture,0,0,0,tocolor(255,255,255,interpolacja))
	dxDrawRectangle(sx * 0.3,sy * 0.3,sx*0.4,sy*0.5,tocolor(0,0,0,interpolacja))
	dxDrawRectangle(sx * 0.425,sy * 0.73,sx*0.15,sy*0.05,tocolor(51,255,255,interpolacja > 150 and 150 or interpolacja))
	dxDrawText("Craft",sx * 0.425,sy * 0.73,sx * 0.575,sy * 0.78,tocolor(255,255,255,interpolacja > 170 and interpolacja + 50 or interpolacja),1,font,"center","center",false,false,true)
	dxDrawLinedRectangle(sx * 0.425,sy * 0.73,sx*0.15,sy*0.05,tocolor(0,0,0,interpolacja * 1.4))
	dxDrawRectangle(sx * 0.32,sy * 0.32,sx*0.35,sy*0.2,tocolor(0,0,0,interpolacja))
	dxDrawRectangle(sx * 0.7 - sx * 0.025,sy * 0.3,sx*0.025,sy*0.03, tocolor(255, 0, 0, interpolacja))
	
	checkGrid = false
	if isMouseInPosition(sx * 0.7 - sx * 0.025,sy * 0.3,sx*0.025,sy*0.03) then
		dxDrawText("X", sx * 0.7 - sx * 0.025, sy * 0.3, sx * 0.7, sy * 0.3 + sy*0.03, tocolor(255, 255, 255, interpolacja > 170 and 255 or interpolacja), 1, font, "center", "center", false, false, true)
		dxDrawText("X", sx * 0.7 - sx * 0.025, sy * 0.3, sx * 0.7, sy * 0.3 + sy*0.03, tocolor(255, 255, 255, interpolacja > 170 and 255 or interpolacja), 1.1, font, "center", "center", false, false, true)
	else
		dxDrawText("X", sx * 0.7 - sx * 0.025, sy * 0.3, sx * 0.7, sy * 0.3 + sy*0.03, tocolor(255, 255, 255, interpolacja > 170 and 255 or interpolacja), 1, font, "center", "center", false, false, true)
	end
	for i,v in pairs(kordy_grid) do
		if isMouseInPosition(v[1],v[2],v[3],v[4]) then
			checkGrid = v[5]
		end
	end
	for i,v in pairs(uslugi) do
		local v = {v[1],v[2],v[3]}
		v[2] = v[2]..getWeaponToMetal()
		v[3] = "Wymagane: "..v[3]
		if clickGrid == i then
			dxAddGridRow(0.32,0.32,0.35,0.2,i,tocolor(191,191,191,interpolacja > 50 and 50 or interpolacja),interpolacja * 1.4,{naglowek = v[1], wymagane = v[3]})
		elseif checkGrid == i then
			dxAddGridRow(0.32,0.32,0.35,0.2,i,tocolor(131,131,131,interpolacja > 50 and 50 or interpolacja),interpolacja * 1.4,{naglowek = v[1],wymagane = v[3]})
		else
			dxAddGridRow(0.32,0.32,0.35,0.2,i,tocolor(101,101,101,interpolacja > 50 and 50 or interpolacja),interpolacja * 1.4,{naglowek = v[1], wymagane = v[3]})
		end
	end
end)


local dane_to_func = {
	[1] = function()
		local bronie = getWeaponToMetal();
		if bronie >= 1 then
			triggerServerEvent("giveSomething",resourceRoot,"M4A1",1)
		end
	end,
}

addEventHandler("onClientClick",root,function(btn,state)
	if not wlaczone then return end
	if btn ~= "left" or state ~= "down" then return end
	for i,v in pairs(kordy_grid) do
		if isMouseInPosition(v[1],v[2],v[3],v[4]) then
			if clickGrid == v[5] then
				clickGrid = false
			else
				clickGrid = v[5]
			end
		end
	end
	if clickGrid and isMouseInPosition(sx * 0.425,sy * 0.73,sx*0.15,sy*0.05) then
		dane_to_func[clickGrid]();
	end
	if isMouseInPosition(sx * 0.7 - sx * 0.025,sy * 0.3,sx*0.025,sy*0.03) then
		tick = getTickCount()
		typ_zanikania = 0
		showCursor(false)
		timer_zanikanie = setTimer(function()
			wlaczone = false
			toggleControl("fire",true)
		end,200,1)
	end
end)

addEventHandler("onClientMarkerHit",resourceRoot,function(e)
	if e ~= localPlayer then return end
	typ_zanikania = 1
	if isTimer(timer_zanikanie) then killTimer(timer_zanikanie) end
	showCursor(true,false)
	toggleControl("fire",false)
	tick = getTickCount()
	wlaczone = true
end)

addEventHandler("onClientMarkerLeave",resourceRoot,function(e)
	if e ~= localPlayer then return end
	tick = getTickCount()
	typ_zanikania = 0
	showCursor(false)
	timer_zanikanie = setTimer(function()
		wlaczone = false
		toggleControl("fire",true)
	end,200,1)
end)