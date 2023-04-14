-- FG EFFECT NOTIFICATION

sx,sy = guiGetScreenSize()
x,y =  (sx/1366), (sy/768)

font = exports.DayZ_font:GetFont("Roboto-Light", 15 * (sx/1920))

textura = dxCreateTexture( "img/menu.png", "argb", true)

function fgNotification( result, text )

    if result == "sucess" then
        addNotification( text, 46, 204, 113 )
    elseif result == "error" then
        addNotification( text, 231, 76, 60 )
    end

end
addEvent( "stworz_notyfikacje", true )
addEventHandler( "stworz_notyfikacje", root, fgNotification )

function addNotification( text, r, g, b, sound)

    if notifyData then 
        removeEventHandler( "onClientRender", root, renderNotification )
        notifyData = nil
    end
    
    notifyData = { text, r, g, b, getTickCount(), getTickCount() + 4000, false }
    addEventHandler( "onClientRender", root, renderNotification )

    
    if sound==3 then
        local soundy = playSound( sound..".wav" )
        setSoundVolume( soundy, 1 )
    end
end

function DrawNotification(text, r, g, b, sound)
    addNotification(text, r, g, b, sound)
end

addEvent( "onDrawNotification", true )
addEventHandler( "onDrawNotification", localPlayer, function(text, r, g, b, sound)
    addNotification(text, r, g, b, sound)
end)

function renderNotification( ) 

    if not notifyData then 
        return
    end 

    local now = getTickCount()
    
    local text, r, g, b = notifyData[1], notifyData[2], notifyData[3], notifyData[4]
    local notifyStart, notifyEnd = notifyData[5], notifyData[6]
    
    local progress = (now - notifyStart) / ((notifyEnd-3000) - notifyStart)

    if now > notifyEnd and not notifyData[7] then 
        notifyData[5] = now
        notifyData[6] = getTickCount()+1000
        notifyData[7] =  true -- fade
        notifyStart, notifyEnd = notifyData[5], notifyData[6]
    end 
    
    local interpolatedProgress = 0

    if notifyData[7] then 
         progress = (now - notifyStart) / (notifyEnd - notifyStart)
         interpolatedProgress = interpolateBetween(1, 0, 0, 0, 0, 0, progress, "InOutQuad")
         if interpolatedProgress <= 0 then 
            notifyData = nil
            removeEventHandler( "onClientRender", root, renderNotification )
            return
         end
    else 
        interpolatedProgress = interpolateBetween(0, 0, 0, 1, 0, 0, math.min(progress, 1), "InOutQuad")
    end

    local offsetY = (20*y) * interpolatedProgress
    dxDrawImage(x*460,y*90 + offsetY,x*460,y*50, textura, 0, 0, 0, tocolor(255,255,255,185*interpolatedProgress), true)
    dxDrawText(text, x*460,y*90 + offsetY,(x*460)*2,(y*50)+(y*90)+offsetY, tocolor(r, g, b, 255*interpolatedProgress), 1, font,"center","center",false,true,true,true)

end
