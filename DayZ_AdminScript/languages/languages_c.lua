local texts_languages = {
    ["ENG"] = {
        ["admins_on_duty"] = "Admins on duty",
    },
    ["PL"] = {
        ["admins_on_duty"] = "Administratorzy na służbie",
    },
}

function getTextLang(lang, text)
    if texts_languages[lang][text] then return texts_languages[lang][text] end
    return "ERROR:LANG lang:"..lang.." text:"..text
end