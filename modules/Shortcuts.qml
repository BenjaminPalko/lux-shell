import qs.services
import qs.widgets
import Quickshell

Scope {
    id: root

    LuxShortcut {
        name: 'launcher'
        description: 'Open the application launcher'
        onPressed: Visibility.launcher = !Visibility.launcher
    }

    LuxShortcut {
        name: 'power-menu'
        description: 'Open the Power Menu'
        onPressed: Visibility.powermenu = !Visibility.powermenu
    }
}
