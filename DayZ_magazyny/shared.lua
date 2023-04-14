



function setCard(s)
	return "Code card #"..string.sub(s,21)
end

marker_info = {}

for i,v in pairs(getElementsByType("marker",resourceRoot)) do
	local blip = createBlipAttachedTo(v,63,2,255, 0, 0)
	setBlipVisibleDistance(blip,300)
	local brama = string.gsub(getElementID(v),"marker","brama")
	marker_info[v] = {
		wymagany = setCard(getElementID(v)),
		brama = getElementByID(brama),
		status = "Close",
		default_pos = {getElementPosition(getElementByID(brama))},
	}
end