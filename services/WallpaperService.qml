pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property string directory: "~/Wallpapers/"
    property list<url> files: []
    property list<string> fileTypes: ["jpg", "jpeg", "png"]

    Process {
        running: true
        command: ["bash", "-c", `find "$dir" -maxdepth 1 -type f & inotifywait -m -r ${root.directory} -e modify,move,create,delete | while read dir action; do find "$dir" -maxdepth 1 -type f; done`]
        stderr: StdioCollector {
            onStreamFinished: console.log(`line read: ${this.text}`)
        }
        stdout: SplitParser {
            splitMarker: "\n"
            onRead: data => root.files = data?.split("\n") ?? []
        }
    }
}
