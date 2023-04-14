local sw, sh = guiGetScreenSize()

scoreboardColumns = {
	{ name = "id", width = 50, data = function (element) return (getElementData(element, "id" ) or 0) end },
	{ name = "nick", width = 235, data = function (element)
	if not getElementData(element,'logedin') then
		return getPlayerName( element ):gsub("#%x%x%x%x%x%x","").."( Guest )"
	end
	return getPlayerName( element ):gsub("#%x%x%x%x%x%x","")
	end },
	{ name = "murders", width = 80, data = function (element) return ( getElementData ( element, "murders" ) or 0 ).. "/"..( getElementData ( element, "TotalMurders" ) or 0 ) end },
	{ name = "zombie", width = 80, data = function (element) return ( getElementData ( element, "zombieskilled" ) or 0 ).. "/"..( getElementData ( element, "TotalZombieKilled" ) or 0 ) end },
	{ name = "lvl", width = 50, data = function (element) return ( getElementData(element,'LVL') or 0) end },
	{ name = 'kdr', width = 50, data = function(element) return string.format('%.2f', (getElementData(element, 'KDR') or 0) ) end},
	{ name = "alive_time",width = 120,data = function(element) return formatTimeFromMinutes(getElementData(element,"alivetime") or 1).."/"..formatTimeFromMinutes(getElementData(element,"alivetimetotal") or 1) end},
	{ name = "group", width = 205, data = function (element) return (getElementData ( element, "Grupa" ) and getElementData ( element, "Grupa" ).nazwa or "") end },
}

function calculateWidth()
	local width = 0
	for key, value in ipairs( scoreboardColumns ) do
		width = width + value.width
	end
	return width + 60
end 

local serverName = "Dark-DayZ"
local max_players = 100
local topsize = 70
local playersize = topsize-35
local panelsize = playersize*10
local playersTable = {}

local ploff = 0
local width = calculateWidth()
local baseX = sw/2-width/2
local baseY = sh/2-(panelsize+topsize)/2

local font_cat = exports.DayZ_font:GetFont( "Roboto-Bold", 9.5*(sh/768) )
local font_rows = exports.DayZ_font:GetFont( "Roboto-Regular", 9.5*(sh/768) )
local number_of_players_font = exports.DayZ_font:GetFont( "Roboto-Light", 20*(sh/768) )
local font_server_name = exports.DayZ_font:GetFont( "Roboto-Light", 32*(sh/768), true )

local ticker = getTickCount()
local renderTarget = dxCreateRenderTarget(sw,sh,true)
local tick = getTickCount() + 3000

function renderScoreBoard()
		if getKeyState( "tab" ) == false then ploff = 0; return end
		if getElementData(getLocalPlayer(),"logedin") then
		if not playersTable[1] then return end

			local gps_channel = getElementData(localPlayer, "GPSchannel")
			local lang = getElementData(localPlayer, "Jezyk_Gry")

			local baseY = baseY * 2 / (1 + (#getElementsByType("player") > 10 and 10 or #getElementsByType("player")) * 0.1)
			local xoff = 0

			dxDrawRectangle ( baseX, baseY-40, width, topsize+40, tocolor(0,0,0,140) )
			dxDrawText ( serverName, baseX, baseY-38, baseX+width, baseY+topsize, tocolor(255, 255, 255,120), 1, font_server_name,"center" )
			dxDrawRectangle ( baseX, baseY+topsize, width, panelsize * (0.1 * (#getElementsByType("player") > 10 and 10 or #getElementsByType("player"))), tocolor(0,0,0,110) )

			dxDrawText (#playersTable.."/"..max_players, baseX+20, baseY-20, baseX+width-20, baseY+topsize, tocolor(255,255,255,120), 0.9, number_of_players_font, "right" )

			for i, v in ipairs ( scoreboardColumns ) do
				dxDrawText ( GetTextLand(lang, v.name), baseX+xoff, baseY+60, baseX+xoff+v.width, baseY+topsize-30, tocolor(255,255,255,120), 1.00, font_cat, "center", "center" )
				xoff = (xoff+v.width)+7.5
			end

			if getTickCount() > ticker then
				ticker = getTickCount() + 2000
				dxSetRenderTarget(renderTarget,true)

				local maxNum = #playersTable

				if maxNum > 10 then
					maxNum = 10
				end

				
				for i = 1, maxNum do
					if playersTable[i+ploff] ~= nil and getElementType(playersTable[i+ploff]) == "player" then
						

						local gps_player = getElementData(playersTable[i+ploff],"GPSchannel")
						
						if playersTable[i+ploff] == localPlayer then
							dxDrawRectangle ( baseX, baseY+topsize+playersize*(i-1), width, playersize, tocolor(0,0,0,180) )
						elseif getElementData(localPlayer,"Grupa") and getElementData(playersTable[i+ploff],"Grupa") and getElementData(localPlayer,"Grupa").nazwa == getElementData(playersTable[i+ploff],"Grupa").nazwa then
							dxDrawRectangle ( baseX, baseY+topsize+playersize*(i-1), width, playersize, tocolor(0,150,0,150) )
						elseif gps_channel and gps_player and (gps_channel == gps_player) then
							dxDrawRectangle ( baseX, baseY+topsize+playersize*(i-1), width, playersize, tocolor(0, 40, 150,150) )
						else
							if i%2 == 0 then
								dxDrawRectangle ( baseX, baseY+topsize+playersize*(i-1), width, playersize, tocolor(30,30,30,150) )	
							else
								dxDrawRectangle ( baseX, baseY+topsize+playersize*(i-1), width, playersize, tocolor(50,50,50,150) )		
							end
						end

						local xoff = 0
						for c, d in ipairs ( scoreboardColumns ) do
							local data = d.data(playersTable[i+ploff])
							local r,g,b = 255,255,255

							if playersTable[i+ploff] then
								if d.name == "group" then
									dxDrawText ( data, baseX+xoff, baseY+topsize+playersize*(i-1), baseX+xoff+d.width, baseY+topsize+playersize*i, tocolor(r,g,b, 220), 1, font_rows, "center", "center", true )
								else
									dxDrawText ( data, baseX+xoff, baseY+topsize+playersize*(i-1), baseX+xoff+d.width, baseY+topsize+playersize*i, tocolor(r,g,b, 220), 1, font_rows, "center", "center", true )
								end
							end
							
							xoff = (xoff+d.width)+7.5
						end
					end
				end
				dxSetRenderTarget()
			end
			
			dxDrawImage(0,0,sw,sh,renderTarget)
		end
end

bindKey ( "tab", "both", function(key,keyState)
	if getElementData(localPlayer, "logedin") then
		playersTable = exports.DayZ_id:GetPlayersSortID();
	end 
end, "down" )

function PlayerScrollMenu (key,keyState,arg)
	if getElementData(localPlayer,"logedin") and getKeyState( "tab" ) then
		if ( keyState == "down" ) then
			if arg == "up" then
				if ploff > 0 then
					ploff=ploff-1
					ticker = getTickCount() - 100
				end
			elseif arg == "down" then
				if ploff < #playersTable-1 then
					ploff = ploff+1
					ticker = getTickCount() - 100
				end
			end
		end
	end
end
bindKey ( "mouse_wheel_up", "down", PlayerScrollMenu, "up" )
bindKey ( "mouse_wheel_down", "down", PlayerScrollMenu, "down" )

function formatTimeFromMinutes(value)
	if value then
		local hours = math.floor(value/60)
		local minutes = math.round(((value/60) - math.floor(value/60))*100/(100/60))
		if minutes < 10 then minutes = "0"..minutes end
		value = hours..":"..minutes
		return value
	end
	return false
end

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

addEventHandler( "onClientRender", root, renderScoreBoard)

addEvent("ChangePlayers", true)
addEventHandler("ChangePlayers", localPlayer, function(data)
	removeEventHandler( "onClientRender", root, renderScoreBoard)
	playersTable = data
	addEventHandler( "onClientRender", root, renderScoreBoard)
end)
