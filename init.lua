LocatePlayerCursors = {}

LocatePlayerCursors.mod_name = 'LocatePlayerCursors'

function LocatePlayerCursors.prefix_with_mod_name(value)
    return LocatePlayerCursors.mod_name..'__'..value
end

LocatePlayerCursors.shortcut_name = LocatePlayerCursors.prefix_with_mod_name('locate-next-player')

LocatePlayerCursors.hotkey_name = LocatePlayerCursors.prefix_with_mod_name('locate-next-player')
