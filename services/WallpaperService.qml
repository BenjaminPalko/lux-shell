pragma Singleton

import qs.config
import qs.utils
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property string directory: "~/Wallpapers/"
    property alias files: properties.files
    property alias currentWallpaper: properties.currentWallpaper
    property list<string> fileTypes: ["jpg", "jpeg", "png"]
    property string command: `find ${root.directory} -maxdepth 1 -type f`

    Process {
        running: true
        command: ["bash", "-c", `find ${root.directory} -maxdepth 1 -type f`]
        stdout: StdioCollector {
            onStreamFinished: {
                root.files = this.text.split("\n");
            }
        }
    }

    DirectoryWatcher {
        path: root.directory
        fileFilter: ["jpg", "jpeg", "png"]
        onCreated: path => root.files.push(path)
        onDeleted: path => root.files.filter(file => file != path)
        onMovedFrom: path => root.files.filter(file => file != path)
        onMovedTo: path => path => root.files.push(path)
    }

    FileView {
        path: `${Paths.cache}/wallpaper.json`

        watchChanges: true
        onFileChanged: reload()

        // when changes are made to properties in the adapter, save them
        onAdapterUpdated: writeAdapter()

        JsonAdapter {
            id: properties

            property url currentWallpaper: ""
            property list<string> files: []
        }
    }
}
