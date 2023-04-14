local TextsTable = {
    ["ENG"] = {
        ["murders"] = "Murders",
        ["lvl"] = "LVL",
        ["zombie"] = "Zombie",
        ["alive_time"] = "Alive Time",
        ["kdr"] = "KDR",
        ["group"] = "Group",
        ["nick"] = "Nick",
        ["id"] = "ID",
    },
    ["PL"] = {
        ["murders"] = "Morderstwa",
        ["lvl"] = "LVL",
        ["zombie"] = "Zombie",
        ["alive_time"] = "Czas gry",
        ["kdr"] = "KDR",
        ["group"] = "Grupa",
        ["nick"] = "Pseudonim",
        ["id"] = "ID",
    }
}


function GetTextLand(lang, text)

    if TextsTable[lang][text] then return TextsTable[lang][text] end
    return "ERROR:LANG "..text
end