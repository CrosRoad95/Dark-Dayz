local TextsTable = {
    ["ENG"] = {
        ["login_in"] = "Login",
        ["create_new_acc"] = "Create New Account",
        ["welcome"] = "Welcome",
        ["remember_password"] = "Remember password",
        ["password"] = "Password     ",
        ["register"] = "Register",
        ["back_login"] = "Back to login panel",
        ["register_panel"] = "Register Panel",
        ["repeat_password"] = "Repeat password     ",
        ["fields_empty"] = "The field/s are empty!",
        ["passwords_wrong"] = "Passwords are not to same!",
        ["anty_spam"] = "Wait one moment!",
        ["acc_doesnt_exist"] = "This account does not exist!",
        ["acc_exist"] = "This account exists!",
    },
    ["PL"] = {
        ["login_in"] = "Zaloguj",
        ["create_new_acc"] = "Stwórz nowe konto",
        ["welcome"] = "Witaj",
        ["remember_password"] = "Zapamiętaj hasło",
        ["password"] = "Hasło     ",
        ["register"] = "Zarejestruj",
        ["back_login"] = "Wróć do lowania",
        ["register_panel"] = "Rejestracja",
        ["repeat_password"] = "Powtórz hasło     ",
        ["fields_empty"] = "Pole/a są puste",
        ["passwords_wrong"] = "Hasłą nie są takie same.",
        ["anty_spam"] = "Poczekaj chwilę!",
        ["acc_doesnt_exist"] = "Takie konto nie istnieje!",
        ["acc_exist"] = "Takie konto istnieje!",
    }
}


function GetTextLand(lang, text)

    if TextsTable[lang][text] then return TextsTable[lang][text] end
    return "ERROR:LANG "..text
end