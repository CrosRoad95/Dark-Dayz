



local screenW, screenH = guiGetScreenSize()

local font = dxCreateFont("font.ttf",13*(screenH/768))

local luty_odswiezone = 0

addEventHandler("onClientRender", root,
    function()
		local odsw = getElementData(resourceRoot,"Luty-Odswiezanie")
		if odsw then
			dxDrawText("Odswiezanie lutow: #FF0000"..luty_odswiezone.."/3400", screenW * 0.6105, screenH * 0.0339, screenW * 0.7833, screenH * 0.0716, tocolor(255, 255, 255, 255), 1.00,font, "left", "top", false, false, false, true, false)
		end
	end
)


addEvent("Looty_setDane",true)
addEventHandler("Looty_setDane",resourceRoot,function(a_cos)
	luty_odswiezone = a_cos
end)