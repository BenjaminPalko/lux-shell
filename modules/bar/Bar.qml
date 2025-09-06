import "components"
import "components/bluetooth"
import "components/hyprland"
import "components/notifications"
import "components/tray"
import qs.config
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

PanelWindow {
    id: parentWindow

    anchors.top: true
    anchors.left: true
    anchors.right: true

    implicitHeight: 50
    color: 'transparent'

    WlrLayershell.layer: WlrLayer.Top

    Item {

        anchors.fill: parent
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        anchors.topMargin: 4
        anchors.bottomMargin: 4

        Rectangle {
            id: background
            anchors.fill: parent
            color: Styling.theme.base100
            radius: Styling.theme.radiusBox

            border {
                color: Styling.theme.base200
                width: Styling.theme.border
                pixelAligned: true
            }
        }

        RowLayout {
            id: leftbar

            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter

            anchors.leftMargin: 8
            anchors.topMargin: 4
            anchors.bottomMargin: 4

            spacing: Styling.layout.spacing.base

            SystemLogo {
                implicitSize: 22
            }

            Workspaces {}

            Tray {}
        }

        RowLayout {
            id: centerbar

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            anchors.topMargin: 4
            anchors.bottomMargin: 4

            spacing: Styling.layout.spacing.base

            Mpris {}
        }

        RowLayout {
            id: rightbar

            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter

            anchors.rightMargin: 8
            anchors.topMargin: 4
            anchors.bottomMargin: 4

            spacing: Styling.layout.spacing.base

            Pywal {}

            Pipewire {}

            Caffeine {}

            Network {}

            Bluetooth {}

            Storage {}

            Memory {}

            Cpu {}

            Gpu {}

            Power {}

            Clock {}

            Notifications {}
        }
    }
}
