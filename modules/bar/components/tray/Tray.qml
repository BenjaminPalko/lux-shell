pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.Services.SystemTray

RowLayout {
    id: root

    spacing: 4

    Repeater {
        model: SystemTray.items

        Loader {
            id: loader
            required property SystemTrayItem modelData
            active: true

            sourceComponent: item
            property Component item: TrayItem {
                trayItem: loader.modelData
            }
        }
    }
}
