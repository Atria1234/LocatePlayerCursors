require('init')

function on_lua_shortcut(event)
	if event.prototype_name == LocatePlayerCursors.shortcut_name then
        locate_next_player(event)
	end
end

function locate_next_player(event)
    local target_player_index = get_next_player_index(event.player_index)
    if target_player_index ~= nil then
        local player = game.players[event.player_index]
        target_player = game.connected_players[target_player_index]
        if target_player.selected then
            player.set_controller({
                type = defines.controllers.remote,
                position = target_player.selected.position,
                surface = target_player.selected.surface
            })
            player.zoom = 1
        elseif target_player.character and target_player.character.valid then
            player.set_controller({
                type = defines.controllers.remote,
                surface = target_player.surface
            })
            player.centered_on = target_player.character
            player.zoom = 1
        else
            player.set_controller({
                type = defines.controllers.remote,
                position = target_player.position,
                surface = target_player.surface
            })
            player.zoom = 1
        end
    end
end

function get_next_player_index(player_index)
    local last_index = storage.player_last_index[player_index] or 0
    local player_count = table_size(game.connected_players)

    if player_count == 1 then
        return nil
    end

    last_index = (last_index + 1) % player_count

    if game.connected_players[last_index + 1].index == player_index then
        last_index = (last_index + 1) % player_count
    end

    storage.player_last_index[player_index] = last_index
    return last_index + 1
end

local function init_globals()
    if storage.player_last_index == nil then
        storage.player_last_index = {}
    end
end

script.on_event(defines.events.on_lua_shortcut, on_lua_shortcut)
script.on_event(LocatePlayerCursors.hotkey_name, locate_next_player)

script.on_init(init_globals)
script.on_configuration_changed(init_globals)
