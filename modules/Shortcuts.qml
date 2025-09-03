import qs.services
import Quickshell
import Quickshell.Hyprland

Scope {
    id: root

    LuxShortcut {
        name: 'launcher'
        description: 'Open the application launcher'
        onPressed: Visibility.launcher = !Visibility.launcher
    }

    LuxShortcut {
        name: 'pomodoro'
        description: 'Open the Pomodoro'
        onPressed: Visibility.pomodoro = !Visibility.pomodoro
    }

    LuxShortcut {
        name: 'power-menu'
        description: 'Open the Power Menu'
        onPressed: Visibility.powermenu = !Visibility.powermenu
    }

    LuxShortcut {
        name: 'storybook'
        description: 'Open the Component Storybook'
        onPressed: Visibility.storybook = !Visibility.storybook
    }

    component LuxShortcut: GlobalShortcut {
        appid: "lux"
    }
}
