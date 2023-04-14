local texts_languages = {
    ["ENG"] = {
        ["undertook_mission"] = "You undertook mission! Check progress on /checkm.",
        ["mission_completed"] = "You completed your mission. Reward:",
        ["mission_not_completed"] = "Mission is not completed!",
        ["mission_advanced_find"] = "Go to the yellow area and look for the gray box!",
        ["mission_canceled"] = "Mission has been canceled!",
    },
    ["PL"] = {
        ["undertook_mission"] = "Podjąłeś się misji! Sprawdź postęp pod /sprawdzm.",
        ["mission_completed"] = "Ukończyłeś misję. Nagroda:",
        ["mission_not_completed"] = "Misja nie jest ukończona!",
        ["mission_advanced_find"] = "Udaj się do żółtej strefy i poszukaj szarej skrzynki.",
        ["mission_canceled"] = "Misja została anulowana!",
    },
}

function getTextLang(lang, text)
    if texts_languages[lang][text] then return texts_languages[lang][text] end
    return "ERROR:LANG lang:"..lang.." text:"..text
end