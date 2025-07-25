import Quickshell
import Quickshell.Io
import Quickshell.Widgets

IconImage {
    id: root

    Process {
        running: true
        command: ["sh", "-c", ". /etc/os-release && echo $LOGO"]
        stdout: StdioCollector {
            onStreamFinished: () => {
                root.source = Quickshell.iconPath(this.text.trim());
            }
        }
    }
}
