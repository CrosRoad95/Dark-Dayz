npc_act_conv = false

npc_conv = {
    ["ENG"] = {
        [1] = {
            [1] = "Are you looking for a job?",
            [2] = "Do you want to do a task for me?",
            [3] = "Have you got some time for me?\nDo you want to do a task for me?",
            [4] = "I am looking for someone to work,\nare you signing up for it?",
        },
        [2] = {
            [1] = "Yeah, i'm in.",
            [2] = "Ok, i offer my help.",
            [3] = "Ok, what can I do for you?",
            [4] = "Yeah, what do you need?",
        },
        [3] = {
            [1] = "No, i have not got time for that.",
            [2] = "No, i can't now.",
            [3] = "No, it is not for me now.",
            [4] = "No, I have to get back to base.",
        },
    },
    ["PL"] = {
        [1] = {
            [1] = "Rozglądasz się za pracą?",
            [2] = "Chciałbyś zrobić dla mnie zadanie?",
            [3] = "Masz dla mnie trochę czasu?\nChciałbyś zrobić dla mnie zadanie?",
            [4] = "Szukam kogoś do pracy,\nbyłbyś chętny?",
        },
        [2] = {
            [1] = "Ta, wchodzę w to.",
            [2] = "Ok, oferuję ci mogą pomoc.",
            [3] = "Ok, co mam zrobić?",
            [4] = "Ta, czego potrzebujesz?",
        },
        [3] = {
            [1] = "Nie, nie mam na to czasu.",
            [2] = "Teraz nie mogę.",
            [3] = "To nie dla mnie.",
            [4] = "Nie, muszę wracać do bazy",
        },
    },
}

function getConv(lang, conv)
    local random = math.random(1,4)
    if npc_conv[lang][conv][random] then return npc_conv[lang][conv][random] end
    return "ERROR:LANG lang:"..lang.." conv:"..conv
end

function getNpcFromCol(col)
    for k, v in pairs(npcs) do
        if col == v[3] then return v[2] end
    end
    return false
end

function getNpcId(npc)
    for k, v in pairs(npcs) do
        if npc == v[2] then return v[1] end
    end
    return false
end

function getNpcCol(npc)
    for k, v in pairs(npcs) do
        if npc == v[2] then return v[3] end
    end
    return false
end

function getNpcName(npc)
    local id = getNpcId(npc)

    for k, v in pairs(npc_general_info) do
        if k == id then return v[2] end
    end
    return false
end

function getNpcFromActConv()
    if npc_act_conv then return npc_act_conv end
    return false
end

function getPlayerMissionValue()
    local find_m = 0
    local kill_p = 0
    local kill_z = 0
    local adv_find_m = 0
 
        for k,v in pairs(players_missions) do
            if v[7] ~= 0 then
                if v[1] == "find" then find_m = find_m+1
                elseif v[1] == "kill_players" then kill_p = 1
                elseif v[1] == "kill_zombies" then kill_z = 1
                elseif v[1] == "advanced_find" then adv_find_m = 1
                end
            end
        end
    
    return find_m, kill_p, kill_z, adv_find_m;
end

function getTimeFormat(timer, format)

    if not isTimer(timer) then return end

    local time = getTimerDetails(timer)
    local seconds = time / 1000
    seconds = math.floor(seconds)
    local minutes = seconds / 60
    minutes = math.floor(minutes)

    local hours = minutes / 60
    hours = math.floor(hours)

    local minutes2 = minutes - hours * 60
    minutes2 = math.floor(minutes2)

    local seconds2 = seconds - minutes * 60
    seconds2 = math.floor(seconds2)

    if hours <= 9 then hours = "0"..hours end
    if minutes2 <= 9 then minutes2 = "0"..minutes2 end
    if seconds2 <= 9 then seconds2 = "0"..seconds2 end

    if format == "m+s format" then
        return minutes2..":"..seconds2
    elseif format == "h+m+s datas" then
        return hours, minutes2, seconds2
    end
end
