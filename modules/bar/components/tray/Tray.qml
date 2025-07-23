import QtQuick
import Quickshell.Services.SystemTray
import "../../../../config/"

Row {
    id: root

    spacing: Dimensions.tray.spacing

    Repeater {
        model: SystemTray.items

        Loader {
            required property SystemTrayItem modelData
            active: true

            sourceComponent: item
            property Component item: TrayItem {
              trayItem: modelData
            }
        }
    }
}
