-- -- -- -- -- -- -- -- -- -- ---
-- Collision Editor bei MuLTi. --
-- -- -- -- -- -- -- -- -- -- ---

addEvent("onCollisionSpeichere", true)
addEventHandler("onCollisionSpeichere", getRootElement(),
function(x, y, z, w, h, d)
	local newfile
	if not(fileExists("collisions.txt")) then newfile = fileCreate("collisions.txt") end
	local file = fileOpen("collisions.txt")
	local text = fileRead(file, 99999)
	--fileDelete(file) -- Dont Use
	newfile = fileCreate("collisions.txt")
		local time = getRealTime()
		local day = time.monthday
		local month = time.month+1
		local year = time.year+1900
		local hour = time.hour
		local minute = time.minute
	fileWrite(newfile, text.."\n\n-- -- -- -- -- "..day.."."..month.."."..year.." at "..hour..":"..minute..", Creator: "..getPlayerName(source).."\nmyCollision = createColCuboid("..x..", "..y..", "..z..", "..w..", "..h..", "..d..")")
	fileFlush(newfile)
	fileClose(newfile)
end)