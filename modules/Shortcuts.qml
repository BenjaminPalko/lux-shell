import Quickshell
import "../widget/"

Scope {
    id: root

    LuxShortcut {
        name: 'launcher'
        description: 'Open the application launcher'
        onPressed: {
            console.log("Launcher shortcut pressed");
        }
    }
}
