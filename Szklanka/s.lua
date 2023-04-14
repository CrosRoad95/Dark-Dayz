local marker = createMarker(1778.6181640625,-1303.7880859375,130.734375,'cylinder',1.5,200,200,0,200)
setElementData(marker,'pozycja',{1792.7119140625,-1291.3046875,13.550712585449})
local marker_gora = createMarker(1787.46484375,-1295.9521484375,12.440645217896,'cylinder',1.5,200,200,0,200)
setElementData(marker_gora,'pozycja',{1782.7021484375,-1303.9833984375,131.734375})



-- setBlipVisibleDistance(createBlipAttachedTo(marker,44),350)

addEventHandler('onMarkerHit',resourceRoot,function(hit)
	if hit and getElementType(hit)~='player' then return end
	if not getElementData(source,'pozycja') then return end
	local x,y,z = unpack(getElementData(source,'pozycja'))
	setElementPosition(hit,x,y,z,false)
end)


