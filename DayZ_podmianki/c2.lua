txd = engineLoadTXD ( "files/weapons/m4a13.txd" )
engineImportTXD ( txd, 1901 )
dff = engineLoadDFF ( "files/weapons/m4a13.dff" )
engineReplaceModel ( dff, 1901 )

local black = dxCreateTexture("files/black.png")

addEventHandler("onClientResourceStart", resourceRoot, function()
	local myShader = dxCreateShader("shader.fx", 0, 0, false, "all") -- create shader from raw data
	if isElement(myShader) then
		if isElement(black) then
			-- apply image to world texture via shader
			dxSetShaderValue(myShader, "tex", black)
			engineApplyShaderToWorldTexture(myShader, "sto_gz_*")
		else
			outputDebugString("Unable to load texture", 1)
		end
	else
		outputDebugString("Unable to create shader", 1)
	end
end)