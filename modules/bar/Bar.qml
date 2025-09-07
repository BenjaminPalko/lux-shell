import "components"
import "components/bluetooth"
import "components/hyprland"
import "components/notifications"
import "components/tray"
import qs.components
import qs.config
import QtQuick
import QtQuick.Layouts

StyledWrapperRectangle {
    id: root

    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.margins: 6
    anchors.leftMargin: 10
    anchors.rightMargin: 10

    border.width: 3
    border.color: Styling.theme.base200

    margin: 4

    RowLayout {

        RowLayout {
            id: leftbar

            spacing: Styling.layout.spacing.base

            SystemLogo {
                implicitSize: 22
            }

            Workspaces {}

            Tray {}
        }

        RowLayout {
            id: centerbar

            Layout.alignment: Qt.AlignHCenter

            spacing: Styling.layout.spacing.base

            Mpris {}
        }

        RowLayout {
            id: rightbar

            Layout.alignment: Qt.AlignRight

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
