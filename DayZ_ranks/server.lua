-- Saving dates

addEventHandler("onPlayerDayZLogin", root, function(player)
    local acc = getPlayerAccount(player)
    local rank = getAccountData(acc, "rank") or "newbie"
    
    setElementData(player, "rank", rank)     
end)

addEventHandler("onPlayerQuit", root, function()
    local acc = getPlayerAccount(source)
    local rank = getElementData(source, "rank") or "newbie"
    
    setAccountData(acc, "rank", rank)
end)


-- Change Rank

addEvent("onPlayerRankChange", true)
addEventHandler("onPlayerRankChange", root, function(player, rank) 

    if getElementData(player, "logedin") and getElementData(player, "rank") then
        local lang = getElementData(player, "Jezyk_Gry")
        if lang == "ENG" then
            exports.DayZ_notification:DrawNotification("Your rank change to "..getRankFullName(rank, lang, 2), 255, 255, 255, player)
        elseif lang == "PL" then
            exports.DayZ_notification:DrawNotification("Twoja ranga zmieniła się na "..getRankFullName(rank, lang, 2), 255, 255, 255, player)
        end

        for k, v in pairs(getElementsByType("player")) do
            local lang = getElementData(v, "Jezyk_Gry")
            if lang == "ENG" then
                outputChatBox("#d63838[!] #bdbdbd"..getPlayerName(player).."#ffffff's rank has changed to "..getRankFullName(rank, lang, 2).."#ffffff.", v, 255, 255, 255, true)
            elseif lang == "PL" then
                outputChatBox("#d63838[!] #ffffffRanga gracza #bdbdbd"..getPlayerName(player).."#ffffff zmieniła się na "..getRankFullName(rank, lang, 2).."#ffffff.", v, 255, 255, 255, true)
            end
        end
    end

    setElementData(player, "rank", rank)

end)



-- Get Rank Name

local RanksNames = {
    ["PL"] = 
    {
        ["newbie"] = {"Nowy", "#51b092Nowy", "#51b092[Nowy]"},
        ["player"] = {"Gracz", "#51b054Gracz", "#51b054[Gracz]"},
        ["guardian"] = {"Obrońca", "#bbc70eObrońca", "#bbc70e[Obrońca]"},
        ["sheriff"] = {"Szeryf", "#90b051Szeryf", "#90b051[Szeryf]"},
        ["elite"] = {"Elita", "#857b14Elita", "#857b14[Elita]"},
        ["champion"] = {"Czempion", "#a89a00Czempion", "#a89a00[Czempion]"},
        ["legend"] = {"Legenda", "#dbd800Legenda", "#dbd800[Legenda]"},
        ["Console"] = {"Właściciel", "#1B66E6Właściciel", "#1B66E6[Właściciel]"},
        ["Admin"] = {"Administrator", "#FF0000Administrator", "#FF0000[Administrator]"},
        ["Pomocnik"] = {"Pomocnik", "#f5691dPomocnik", "#f5691d[Pomocnik]"},
        ["Pomocnik2"] = {"Pomocnik", "#f5691dPomocnik", "#f5691d[Pomocnik]"},
        ["Moderator2"] = {"Moderator", "#FF3366Moderator", "#FF3366[Moderator]"},
        ["Vice Admin"] = {"Vice Admin", "#FF0000Vice Admin", "#FF0000[Vice Admin]"},
        ["ModChat"] = {"ModChat", "#97ff0fModChat", "#97ff0f[ModChat]"},
        ["Jutuber"] = {"Youtuber", "#FF00FFYoutuber", "#FF00FF[Youtuber]"},
        ["Zasluzony"] = {"Zasłużony", "#DAA520Zasłużony", "#DAA520[Zasłużony]"},
        ["Kasiasty"] = {"Kasiasty", "#4f92ffKasiasty", "#4f92ff[Kasiasty]"},
        ["Weteran"] = {"Weteran", "#562266Weteran", "#562266[Weterany]"},
        --["vip"] = {"VIP", "#ccd435VIP", "#ccd435★"},
    },
    ["ENG"] = 
    {
        ["newbie"] = {"Newbie", "#51b092Newbie", "#51b092[Newbie]"},
        ["player"] = {"Player", "#51b054Player", "#51b054[Player]"},
        ["guardian"] = {"Guardian", "#bbc70eGuardian", "#bbc70e[Guardian]"},
        ["sheriff"] = {"Sheriff", "#90b051Sheriff", "#90b051[Sheriff]"},
        ["elite"] = {"Elite", "#857b14Elite", "#857b14[Elite]"},
        ["champion"] = {"Champion", "#a89a00Champion", "#a89a00[Champion]"},
        ["legend"] = {"Legend", "#dbd800Legend", "#dbd800[Legend]"},
        ["Console"] = {"Owner", "#1B66E6Owner", "#1B66E6[Owner]"},
        ["Admin"] = {"Admin", "#FF0000Admin", "#FF0000[Admin]"},
        ["Pomocnik"] = {"Helper", "#f5691dHelper", "#f5691d[Helper]"},
        ["Pomocnik2"] = {"Helper", "#f5691dHelper", "#f5691d[Helper]"},
        ["Moderator2"] = {"Moderator", "#FF3366Moderator", "#FF3366[Moderator]"},
        ["Vice Admin"] = {"Vice Admin", "#FF0000Vice Admin", "#FF0000[Vice Admin]"},
        ["ModChat"] = {"ModChat", "#97ff0fModChat", "#97ff0f[ModChat]"},
        ["Jutuber"] = {"Youtuber", "#FF00FFYoutuber", "#FF00FF[Youtuber]"},
        ["Zasluzony"] = {"Deserved", "#DAA520Deserved", "#DAA520[Deserved]"},
        ["Kasiasty"] = {"Rich", "#4f92ffRich", "#4f92ff[Rich]"},
        ["Weteran"] = {"Veteran", "#562266Veteran", "#562266[Veteran]"},
        --["vip"] = {"VIP", "#ccd435VIP", "#ccd435★"},
    },
}

function getRankFullName(rank, lang, version)
    if not RanksNames[lang][rank][1] then return end
    return RanksNames[lang][rank][version]
end