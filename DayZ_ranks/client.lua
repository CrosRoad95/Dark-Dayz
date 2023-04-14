-- Check Progress

local RanksRequirements = {
    --{string name, number time, number kdr},
    {"legend", 6000, 4.5}, -- 100h
    {"champion", 4200, 2.75}, -- 70h
    {"elite", 2400, 2.0}, -- 40h
    {"sheriff", 1500, 1.5}, -- 25h
    {"guardian", 900, 1.0}, -- 15h
    {"player", 600, 0}, -- 10h
    {"newbie", 0, 0}, -- 0h
}

setTimer(function()
    if not getElementData(localPlayer, "logedin") then return end
    
    local KDR = getElementData(localPlayer, "KDR") or 0
    local TT = getElementData(localPlayer, "alivetimetotal") or 0

    for k,v in pairs(RanksRequirements) do
        if TT >= v[2] and KDR >= v[3] then
            if getElementData(localPlayer, "rank") == v[1] then return end
            triggerServerEvent("onPlayerRankChange", localPlayer, localPlayer, v[1])
            break
        end
    end


end, 5000, 0)

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