local utils = require "core.utils"
local tracker = require "core.tracker"
local explorer = require "core.explorer"

-- Reference the position from horde.lua
local horde_boss_room_position = vec3:new(-36.17675, -36.3222, 2.200)

local exit_horde_task = {
    name = "Exit Horde",
    delay_start_time = nil,
    moved_to_center = false,
    
    shouldExecute = function()
        return utils.player_in_zone("S05_BSK_Prototype02")
            and utils.get_stash() ~= nil
            and tracker.finished_chest_looting
    end,
    
    Execute = function(self)
        local current_time = get_time_since_inject()

        if utils.distance_to(horde_boss_room_position) > 2 then
            console.print("Moving to boss room position.")
            explorer:set_custom_target(horde_boss_room_position)
            explorer:move_to_target()
            return
        else
            console.print("Reached Central Room Postion.")
        end

        if not tracker.exit_horde_start_time then
            console.print("Starting 5-second timer before exiting Horde")
            tracker.exit_horde_start_time = current_time
        end
        
        local elapsed_time = current_time - tracker.exit_horde_start_time
        if elapsed_time >= 5 then
            console.print("5-second timer completed. Resetting all dungeons")
            reset_all_dungeons()
            tracker.clear_runtime_timers()
            tracker.victory_lap = false
            tracker.victory_positions = nil
            tracker.locked_door_found = false
            tracker.exit_horde_start_time = nil
            tracker.exit_horde_completion_time = current_time
            tracker.horde_opened = false
            tracker.sigil_used = false
            tracker.start_dungeon_time = nil
            tracker.boss_killed = false
        else
            console.print(string.format("Waiting to exit Horde. Time remaining: %.2f seconds", 5 - elapsed_time))
        end
    end
}

return exit_horde_task
