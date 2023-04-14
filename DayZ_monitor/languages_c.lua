local TextsTable = {
    ["ENG"] = {
        ["title"] = "Fast statistics",
        ["zombies_killed"] = "Zombies killed",
        ["murders"] = "Murders",
        ["deaths"] = "Deaths",
        ["headshots"] = "Headshots",
    },
    ["PL"] = {
        ["title"] = "Szybkie statystyki",
        ["zombies_killed"] = "Zabite Zombie",
        ["murders"] = "Morderstwa",
        ["deaths"] = "Śmierci",
        ["headshots"] = "Strzały w głowe",
    }
}


function GetTextLand(lang, text)

    if TextsTable[lang][text] then return TextsTable[lang][text] end
    return "ERROR:LANG "..text
end