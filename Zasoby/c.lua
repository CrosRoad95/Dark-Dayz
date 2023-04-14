

local screenW, screenH = guiGetScreenSize()

function sd123()
	if isTransferBoxActive() then
		if getElementData(localPlayer,'logedin') then
			setCameraTarget(localPlayer)
			removeEventHandler('onClientRender',root,sd123)
			return
		end
        dxDrawText("Trwa pobieranie zasobów serwera!", (screenW * 0.2943) - 1, (screenH * 0.4753) - 1, (screenW * 0.7086) - 1, (screenH * 0.7404) - 1, tocolor(0, 0, 0, 255), 1.00, "bankgothic", "center", "center", false, false, false, false, false)
        dxDrawText("Trwa pobieranie zasobów serwera!", (screenW * 0.2943) + 1, (screenH * 0.4753) - 1, (screenW * 0.7086) + 1, (screenH * 0.7404) - 1, tocolor(0, 0, 0, 255), 1.00, "bankgothic", "center", "center", false, false, false, false, false)
        dxDrawText("Trwa pobieranie zasobów serwera!", (screenW * 0.2943) - 1, (screenH * 0.4753) + 1, (screenW * 0.7086) - 1, (screenH * 0.7404) + 1, tocolor(0, 0, 0, 255), 1.00, "bankgothic", "center", "center", false, false, false, false, false)
        dxDrawText("Trwa pobieranie zasobów serwera!", (screenW * 0.2943) + 1, (screenH * 0.4753) + 1, (screenW * 0.7086) + 1, (screenH * 0.7404) + 1, tocolor(0, 0, 0, 255), 1.00, "bankgothic", "center", "center", false, false, false, false, false)
        dxDrawText("Trwa pobieranie zasobów serwera!", screenW * 0.2943, screenH * 0.6753, screenW * 0.7086, screenH * 0.5404, tocolor(6, 159, 139, 255), 1.00, "bankgothic", "center", "center", false, false, false, false, false)
    else
		if getElementData(localPlayer,'logedin') then
			setCameraTarget(localPlayer)
		end
		removeEventHandler('onClientRender',root,sd123)
	end
end
addEventHandler("onClientRender", root,sd123)

if not getElementData(localPlayer,'logedin') then
	setCameraMatrix(1457.5338134766,-902.70672607422,99.693496704102,1457.1456298828,-901.83770751953,99.386840820313)
	fadeCamera(true)
end

addEvent('returnToC-side',true)
addEventHandler('returnToC-side',resourceRoot,function(items)
	outputChatBox(items)
	pliki_real = items
end)