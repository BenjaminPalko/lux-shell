import QtQuick
import Quickshell.Services.SystemTray
import "../../../../config/"

Row {
    id: root

    spacing: Dimensions.tray.spacing

    Repeater {
        model: SystemTray.items

        TrayItem {}
    }
}
