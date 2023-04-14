local langTable = {
    ["ENG"] = {
        ["mute"] = "#decf9eError, you are muted!",
        ["syntax"] = "#decf9eError, Use like this: ./pm #b0abab<#c9c3c3id or nick#b0abab> <#c9c3c3messages>#decf9e.",
        ["search_error"] = "#decf9eError, player not found",
        ["myself"] = "#decf9eError, You cannot send messages to yourself!",
        ["send_to"] = "#decf9eSend to",
        ["received_from"] = "#decf9eReceived from",
        ["logedin"] = "#decf9eError, player is not logged in!",
    },
    ["PL"] = {
        ["mute"] = "#decf9eBłąd, jesteś wyciszony!",
        ["syntax"] = "#decf9eBłąd, użyj tak: ./pm #b0abab<#c9c3c3id lub nick#b0abab> <#c9c3c3wiadomość>#decf9e.",
        ["search_error"] = "#decf9eBłąd, nie znaleziono gracza",
        ["myself"] = "#decf9eBłąd, nie możesz do siebie wysyłać wiadomości.",
        ["send_to"] = "#decf9eWysłałeś do",
        ["received_from"] = "#decf9eOdebrałeś od",
        ["logedin"] = "#decf9eBłąd, gracz nie jest zalogowany!",
    }
}

function GetMessage(lang, key)
    if langTable[lang][key] then return langTable[lang][key]
    else return "ERROR TEXT" end
end

function privateMessage(thePlayer,commandName,sendToName,...)
    local langThePlayer = getElementData(thePlayer, "Jezyk_Gry") or "ENG"
    local pmWords = { ... }
    local pmMessage = table.concat( pmWords, " " )
    if sendToName then
        local idPlayer = exports.DayZ_Id:GetPlayerFromID(tonumber(sendToName))
        local NamePlayer = getPlayerFromParticalName (sendToName)
        
        if idPlayer then toPlayer = idPlayer
        elseif NamePlayer then toPlayer = NamePlayer end

        if not toPlayer then outputChatBox("#d63838[PM]#FFFFFF "..GetMessage(langThePlayer, "search_error").." - "..sendToName.."#decf9e.", thePlayer, 255, 255, 255, true) return end
        if not getElementData(toPlayer, "logedin") then outputChatBox("#d63838[PM]#FFFFFF "..GetMessage(langThePlayer, "logedin"), thePlayer, 255, 255, 255, true) return end

        if not (toPlayer == thePlayer) then
             if isPlayerMuted ( thePlayer ) then
                outputChatBox("#d63838[PM]#FFFFFF "..GetMessage(langThePlayer, "mute"), thePlayer, 255, 255, 255, true)
                return
            end    
            if not (pmMessage == "") then
                local toPlayerLang = getElementData(toPlayer, "Jezyk_Gry") or "ENG"
                outputChatBox("#d63838[PM]#FFFFFF "..GetMessage(langThePlayer, "send_to").." #dedede" .. getPlayerName(toPlayer) .. "#b0abab(#c9c3c3"..getElementData(toPlayer, "id").."#b0abab)#decf9e:#FFFFFF " .. pmMessage, thePlayer, 255, 255, 255, true)
                outputChatBox("#d63838[PM]#FFFFFF "..GetMessage(toPlayerLang, "received_from").." #dedede" .. getPlayerName(thePlayer) .. "#b0abab(#c9c3c3"..getElementData(thePlayer, "id").."#b0abab)#decf9e:#FFFFFF " .. pmMessage, toPlayer, 255, 255, 255, true)
            else
            outputChatBox("#d63838[PM]#FFFFFF "..GetMessage(langThePlayer, "syntax"), thePlayer, 255, 255, 255, true)
                return false
            end
        else
            outputChatBox("#d63838[PM]#FFFFFF "..GetMessage(langThePlayer, "myself"), thePlayer, 255, 255, 255, true)
            return false
        end
        
    else
        outputChatBox("#d63838[PM]#FFFFFF "..GetMessage(langThePlayer, "syntax"), thePlayer, 255, 255, 255, true)
        return false
    end
end
addCommandHandler("pm", privateMessage)

function getPlayerFromParticalName(thePlayerName)
    local thePlayer = getPlayerFromName(thePlayerName)
    if thePlayer then
        return thePlayer
    end
    for _,thePlayer in ipairs(getElementsByType("player")) do
        if string.find(string.gsub(getPlayerName(thePlayer):lower(),"#%x%x%x%x%x%x", ""), thePlayerName:lower(), 1, true) then
            return thePlayer
        end
    end
return false
end