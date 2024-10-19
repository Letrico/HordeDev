local gui = require "gui"
local settings = {
    enabled = false,
    elites_only = false,
    pit_level = 1,
    salvage = false,
    aggresive_movement = true, 
    path_angle = 10,
    reset_time = 1,
    selected_chest_type = nil,
    failover_chest_type = nil,
    always_open_ga_chest = true,
    loot_mothers_gift = false,
    merry_go_round = true,
    movement_spell_to_objective = true,
    use_evade_as_movement_spell = true,
    open_chest_delay = 12,
    open_ga_chest_delay = 12,
    wait_loot_delay = 10,
    boss_kill_delay = 6,
    chest_move_attempts = 40,
    use_salvage_filter_toggle = false,
    affix_salvage_count = 0,
    greater_affix_count = 0,
}

function settings:update_settings()
    settings.enabled = gui.elements.main_toggle:get()
    settings.elites_only = gui.elements.elite_only_toggle:get()
    settings.salvage = gui.elements.salvage_toggle:get() -- Change this line
    settings.aggresive_movement = gui.elements.aggresive_movement_toggle:get() -- Finn's movement logic
    settings.path_angle = gui.elements.path_angle_slider:get()
    settings.selected_chest_type = gui.elements.chest_type_selector:get()
    settings.failover_chest_type = gui.elements.failover_chest_type_selector:get()
    settings.always_open_ga_chest = gui.elements.always_open_ga_chest:get()
    settings.loot_mothers_gift = gui.elements.loot_mothers_gift:get()
    settings.merry_go_round = gui.elements.merry_go_round:get()
    settings.movement_spell_to_objective = gui.elements.movement_spell_to_objective:get()
    settings.use_evade_as_movement_spell = gui.elements.use_evade_as_movement_spell:get()
    settings.open_chest_delay = gui.elements.open_chest_delay:get()
    settings.open_ga_chest_delay = gui.elements.open_ga_chest_delay:get()
    settings.wait_loot_delay = gui.elements.wait_loot_delay:get()
    settings.boss_kill_delay = gui.elements.boss_kill_delay:get()
    settings.chest_move_attempts = gui.elements.chest_move_attempts:get()
    settings.use_salvage_filter_toggle = gui.elements.use_salvage_filter_toggle:get()
    settings.affix_salvage_count = gui.elements.affix_salvage_count:get()
    settings.greater_affix_count = gui.elements.greater_affix_count:get()
end

return settings