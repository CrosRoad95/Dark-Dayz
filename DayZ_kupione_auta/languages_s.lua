local texts_languages = {
    ["ENG"] = {
        ["vehicle_is_in_base"] = "You can't restore vehicle, because the car is already in your base!",
        ["restore_vehicle"] = "Vehicle has been restored!",
        ["vehicle_is_not_in_base"] = "You can't restore vehicle, because the car isn't in any base!",
        ["base_spawns_limits"] = "You can't create more base spawns in this base!",
        ["vehicle_has_not_respawns"] = "You can't restore vehicle, because the car is worn out!",
    },
    ["PL"] = {
        ["vehicle_is_in_base"] = "Nie możesz przywrócić pojazdu, ponieważ jest już w twojej bazie!",
        ["restore_vehicle"] = "Pojazd został przywrócony!",
        ["vehicle_is_not_in_base"] = "Nie możesz przywrócić pojazdu, ponieważ nie ma go w żadnej bazie!",
        ["base_spawns_limits"] = "Nie możesz utworzyć więcej base spawnów w tej bazie!",
        ["vehicle_has_not_respawns"] = "Nie możesz przywołać pojazdu, ponieważ został zużyty!",
    },
}

function getTextLang(lang, text)
    if texts_languages[lang][text] then return texts_languages[lang][text] end
    return "ERROR:LANG lang:"..lang.." text:"..text
end