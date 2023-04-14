local customBlockName = "Rifle"

-- load the IFP file
local IFP = engineLoadIFP( "rifle.ifp", customBlockName )

-- let us know if IFP failed to load
if not IFP then
    outputChatBox( "Failed to load 'rifle.ifp'" )
end

-- replace the crouch animation
engineReplaceAnimation( localPlayer, "Rifle", "RIFLE_crouchfire", customBlockName, "RIFLE_crouchfire" )
