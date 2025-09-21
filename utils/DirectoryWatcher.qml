import QtQuick
import Quickshell.Io

Item {
    id: root

    required property string path
    property bool recursive: true
    property list<string> fileFilter: []
    signal created(path: string)
    signal modified(path: string)
    signal deleted(path: string)
    signal movedFrom(path: string)
    signal movedTo(path: string)

    Process {
        running: true
        command: ["bash", "-c", `inotifywait -m ${root.recursive ? "-r" : ""} ${root.path} -e modify,move,create,delete --format "%e-%w%f"`]
        stderr: StdioCollector {
            onStreamFinished: console.error(`DirectoryWatcher: ${this.text}`)
        }
        stdout: SplitParser {
            splitMarker: "\n"
            onRead: data => {
                const [action, path] = data.split("-");
                if (path.endsWith("~") || root.fileFilter.length > 0 && !root.fileFilter.some(filter => path.endsWith(filter))) {
                    return;
                }
                if (action.includes("CREATE")) {
                    root.created(path);
                } else if (action.includes("MODIFY")) {
                    root.modified(path);
                } else if (action.includes("DELETE")) {
                    root.deleted(path);
                } else if (action.includes("MOVED_FROM")) {
                    root.movedFrom(path);
                } else if (action.includes("MOVED_TO")) {
                    root.movedTo(path);
                }
            }
        }
    }
}
