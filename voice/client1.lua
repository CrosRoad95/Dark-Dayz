local voiceCols = {}
local broadcoastTo = {}
 
addEventHandler("onPlayerVoiceStart", root,
    function()
        local voiceSource = source
        local sx, sy, sz = getElementPosition(voiceSource)
        voiceCols[voiceSource] = createColSphere(sx, sy, sz, 100)
        attachElements(voiceCols[voiceSource], voiceSource)
        broadcoastTo[voiceSource] = getElementsWithinColShape(voiceCols[voiceSource], "player")
        setPlayerVoiceBroadcastTo(voiceSource, broadcoastTo[voiceSource])
        addEventHandler("onColshapeHit", voiceCols[voiceSource],
            function(element)
                if (getElementType(element) == "player") then
                    table.insert(broadcoastTo[voiceSource], element)
                    setPlayerVoiceBroadcastTo(voiceSource, broadcoastTo[voiceSource])
                end
            end
        )
       
        addEventHandler("onColshapeLeave", voiceCols[voiceSource],
            function(element)
                if (getElementType(element) == "player") then
                    for key, player in pairs(broadcoastTo[voiceSource]) do
                        if (element == player) then
                            table.remove(broadcoastTo[voiceSource], key)
                            break
                        end
                    end
                    setPlayerVoiceBroadcastTo(voiceSource, broadcoastTo[voiceSource])
                end
            end
        )
    end
)      
 
addEventHandler("onPlayerVoiceStop", root,
    function()
        if isElement(voiceCols[source]) then
            destroyElement(voiceCols[source])
        end
       
        if (broadcoastTo[source]) then
            table.remove(broadcoastTo, source)
        end
 
        setPlayerVoiceBroadcastTo(source)
    end
)