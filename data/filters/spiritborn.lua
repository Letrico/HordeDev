local filter = {}

filter.helm_affix_filter = {
    { sno_id = 1834105, affix_name = "Maximum Resource" },  -- Valid for Helm
    { sno_id = 1829592, affix_name = "Maximum Life" },
    { sno_id = 1829554, affix_name = "Armor" },
    { sno_id = 1829562, affix_name = "Dexterity" },
}

filter.chest_affix_filter = {
    { sno_id = 1829578, affix_name = "All Stats" },  -- For 111 All Stats
    { sno_id = 1829592, affix_name = "Maximum Life" },
    { sno_id = 1829664, affix_name = "Resource Generation" },
}

filter.gloves_affix_filter = {
    { sno_id = 1829592, affix_name = "Maximum Life" },
    { sno_id = 1829556, affix_name = "Attack Speed" },
    { sno_id = 1925873, affix_name = "Lucky Hit to Restore Primary Resources" },
    { sno_id = 1928753, affix_name = "Ranks to Core Skills" },
    { sno_id = 2014537, affix_name = "Ranks to Quill Volley" },
}

filter.pants_affix_filter = {
    { sno_id = 1829592, affix_name = "Maximum Life" },
    { sno_id = 1829562, affix_name = "Dexterity" },
    { sno_id = 1829554, affix_name = "Armor" },
    { sno_id = 1928751, affix_name = "Ranks to Basic Skills" },
}

filter.boots_affix_filter = {
    { sno_id = 1829592, affix_name = "Maximum Life" },
    { sno_id = 1829562, affix_name = "Dexterity" },
    { sno_id = 1829598, affix_name = "Movement Speed" },
}

filter.amulet_affix_filter = {
    { sno_id = 1829592, affix_name = "Maximum Life" },
    { sno_id = 1829600, affix_name = "Overpower Damage" },
    { sno_id = 1829556, affix_name = "Attack Speed" },
    { sno_id = 1928753, affix_name = "Ranks to Core Skills" },
}

filter.ring_affix_filter = {
    { sno_id = 1915409, affix_name = "Resource Cost Reduction" },  -- Ring 1
    { sno_id = 1829592, affix_name = "Maximum Life" },
    { sno_id = 1829556, affix_name = "Attack Speed" },
    { sno_id = 1829614, affix_name = "Fire Resistance" },  -- Ring 1 Fire Resistance
    { sno_id = 1966841, affix_name = "Unique Affix" },  -- Ring of Midnight Sun
    { sno_id = 2124067, affix_name = "Ranks to Mirage" },  -- Ring of Midnight Sun
    { sno_id = 1829560, affix_name = "Cooldown Reduction" }  -- Ring of Midnight Sun
}

filter.one_hand_weapons_affix_filter = {
    { sno_id = 1834105, affix_name = "Maximum Vigor" },  -- Closest match for Vigor
    { sno_id = 1829582, affix_name = "Critical Strike Chance" },
    { sno_id = 1928753, affix_name = "Ranks to Core Skills" },
}

filter.two_hand_weapons_affix_filter = {
    { sno_id = 2123784, affix_name = "Ranks to Velocity" },  -- Rod of Kepeleke
    { sno_id = 2123788, affix_name = "Chance for Core Skills to Hit Twice" },  -- Rod of Kepeleke
    { sno_id = 2093164, affix_name = "Unique Affix" },  -- Rod of Kepeleke
}

filter.focus_weapons_affix_filter = {
}

filter.dagger_weapons_affix_filter = {
}

filter.shield_weapons_affix_filter = {
}

-- Color coding logic
function get_color(affix_count)
    if affix_count >= 3 then
        return "green"
    elseif affix_count == 2 then
        return "yellow"
    else
        return "red"
    end
end

function filter_items(item, affix_filter)
    local match_count = 0
    for _, affix in ipairs(affix_filter) do
        if item:has_affix(affix.sno_id) then
            match_count = match_count + 1
        end
    end
    return get_color(match_count)
end

return filter