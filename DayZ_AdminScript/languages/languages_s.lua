local texts_languages = {
    ["ENG"] = {
        ["clear_chat"] = "The chat has been cleared",
        ["you_received"] = "You received",
        ["from"] = "from",
    },
    ["PL"] = {
        ["clear_chat"] = "Chat został wyczyszczony",
        ["you_received"] = "Otrzymałeś",
        ["from"] = "od",
    },
}

function getTextLang(lang, text)
     if texts_languages[lang][text] then return texts_languages[lang][text] end
    return "ERROR:LANG lang:"..lang.." text:"..text
end