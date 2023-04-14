local drawTimer
local isDrawing
local gBHitMarker = false
local iSize = 32

function fgCrateHitMarker( gBoolen )

    if isDrawing then 
        return
    end 

    isDrawing = true
	gBHitMarker = gBoolen

    local sound = playSound( "hitmarker_interface/fg_hitmarker.wav" )
    setSoundVolume( sound , 1 )
    addEventHandler( "onClientRender", root, drawHitMarker ) 
	
    if drawTimer and isTimer( drawTimer ) then
        killTimer( drawTimer )
    end

    drawTimer = setTimer( function( ) 
        isDrawing = false
        removeEventHandler( "onClientRender", root, drawHitMarker ) 
    end, 150, 1 )
	
end

function fgFuncHitMarker( )

    if isDrawing then 
        return
    end 

    fgCrateHitMarker( true )

end
addEvent( "fgFuncHitMarker", true )
addEventHandler( "fgFuncHitMarker", getRootElement( ), fgFuncHitMarker )

function onPlayerWeaponFireHitMarker( weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement )

    if hitElement then

        if getElementType( hitElement ) == "ped" or getElementType( hitElement ) == "vehicle" then

            screenX, screenY = getScreenFromWorldPosition( hitX, hitY, hitZ )

            if not screenX then
                return 
            end 
			
            fgCrateHitMarker( false )

        end
    end

end
addEventHandler( "onClientPlayerWeaponFire", localPlayer, onPlayerWeaponFireHitMarker )

function drawHitMarker( )

    local hX,hY,hZ = getPedTargetEnd( localPlayer )
    local screenX1, screenY1 = getScreenFromWorldPosition( hX,hY,hZ )
	
    if ( gBHitMarker ) then
        dxDrawImage( screenX1 - ( iSize / 2 ), screenY1 - ( iSize / 2 ), iSize, iSize, "hitmarker_interface/fg_hitmarker_white.png", 0,0,0 )
    else
        dxDrawImage( screenX1 - ( iSize / 2 ), screenY1 - ( iSize / 2 ), iSize, iSize, "hitmarker_interface/fg_hitmarker_yellow.png", 0,0,0 )
	end

end