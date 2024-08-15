local tracker = {
    finished_time = 0,
    pit_start_time = 0,
    open_chest_time = 0,
    ga_chest_opened = false,
    chest_opening_stopped = false
}


function tracker.check_time(key, delay)
    local current_time = get_time_since_inject()
    if not tracker[key] or current_time - tracker[key] >= delay then
        tracker[key] = current_time
        return true
    end
    return false
end

return tracker