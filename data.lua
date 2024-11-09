require('init')

data:extend(
    {
        {
            type = "custom-input",
            name = LocatePlayerCursors.hotkey_name,
            order = "LocatePlayerCursors__01",
            key_sequence = ""
        },
        {
            type = "shortcut",
            name = LocatePlayerCursors.shortcut_name,
            action = "lua",
            icon = "__LocatePlayerCursors__/graphics/shortcut.png",
            icon_size = 64,
            small_icon = "__LocatePlayerCursors__/graphics/shortcut.png",
            small_icon_size = 64
        }
    }
)
