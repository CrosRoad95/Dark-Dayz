addEvent('setPedRun',true)
addEventHandler('setPedRun',root,function(arg,angle)
	--setPedControlState(source,'forwards',arg)
	setPedControlState(source,'sprint',arg)
	setPedCameraRotation(source, 360-angle)
end)

addEvent('startFight',true)
addEventHandler('startFight',root,function(arg,angle)
	setPedControlState(source,'fire',false)
	setPedControlState(source,'fire',true)
	setTimer ( function (ped) if ( isElement ( ped ) ) then setPedControlState ( ped, "fire", false) end end, 300, 1, source )
		setTimer ( function (ped) if ( isElement ( ped ) ) then setPedControlState ( ped, "fire", true) end end, 700, 1, source )
	setPedCameraRotation(source, 360-angle)
end)

addEvent("zombieJump",true)
addEventHandler("zombieJump",root,function()
	setPedControlState(source,"jump",true)
	setTimer(setPedControlState,100,1,source,"jump",false)
end)

addEventHandler('onClientPedDamage',resourceRoot,function(at)
	if not at then
		cancelEvent()
	end
end)

--[[

addEventHandler("onClientRender",root,function()
	for i,v in pairs(getElementsByType("ped",resourceRoot)) do
		local distance = getDistanceBetweenPoints3D(Vector3(getElementPosition(localPlayer)),Vector3(getElementPosition(v)))
		if distance < 50 then
			local x,y,z = unpack(getElementData(v,"rsp"))
			local coords = { getScreenFromWorldPosition ( x,y,z ) }
			if coords[1] and coords[2] and x and y and z then
				dxDrawText(inspect({x,y,z}),coords[1],coords[2])
			end
		end
	end
end)]]