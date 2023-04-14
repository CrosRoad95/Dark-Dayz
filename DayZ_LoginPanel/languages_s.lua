local TextsTable = {
    ["ENG"] = {
        ["acc_doesnt_exist"] = "Login or password is incorrect!",
        ["acc_exist"] = "This login is taken!",
        ["accs_max"] = "You have reached your account limit! (2 accounts)",
        ["acc_error"] = "You have not got authorization for this account.",
    },
    ["PL"] = {
        ["acc_doesnt_exist"] = "Login lub hasło jest niepoprawne!",
        ["acc_exist"] = "Ten login jest zajęty!",
        ["accs_max"] = "Osiągnąłeś limit kont! (2 konta)",
        ["acc_error"] = "Nie posiadasz autoryzacji do tego konta.",
    }
}


function GetTextLand(lang, text)
    if TextsTable[lang][text] then return TextsTable[lang][text] end
    return "ERROR:LANG "..text
end