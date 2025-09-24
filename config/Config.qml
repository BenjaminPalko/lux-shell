pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
    id: root

    readonly property alias powermenu: adapter.powermenu
    readonly property alias wallpaper: adapter.wallpaper

    FileView {
        path: `${Paths.config}/shell.json`
        watchChanges: true
        onFileChanged: reload()

        // onAdapterUpdated: writeAdapter()

        JsonAdapter {
            id: adapter

            property var powermenu: PowerMenu {}
            property var wallpaper: Wallpaper {}
        }
    }

    component PowerMenu: JsonObject {
        property list<PowerMenuItem> actions
    }

    component PowerMenuItem: JsonObject {
        property string text
        property string command
    }

    component Wallpaper: JsonObject {
        property string directory
    }
}
