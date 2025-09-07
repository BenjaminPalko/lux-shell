pragma Singleton

import Quickshell

Singleton {
    property alias dashboard: properties.dashboard
    property alias launcher: properties.launcher
    property alias pomodoro: properties.pomodoro
    property alias powermenu: properties.powermenu
    property alias storybook: properties.storybook

    PersistentProperties {
        id: properties

        property bool dashboard
        property bool launcher
        property bool pomodoro
        property bool powermenu
        property bool storybook
    }
}
