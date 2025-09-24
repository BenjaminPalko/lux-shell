pragma Singleton

import qs.config
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property alias currentWallpaper: properties.currentWallpaper

    FileView {
        path: `${Paths.cache}/wallpaper.json`

        watchChanges: true
        onFileChanged: reload()

        // when changes are made to properties in the adapter, save them
        onAdapterUpdated: writeAdapter()

        JsonAdapter {
            id: properties

            property url currentWallpaper: ""
        }
    }
}
