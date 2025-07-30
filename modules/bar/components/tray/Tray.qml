pragma ComponentBehavior: Bound

import qs.config
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.SystemTray

RowLayout {
    id: root

    spacing: Dimensions.tray.spacing

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
