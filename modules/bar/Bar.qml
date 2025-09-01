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
    anchors.leftMargin: Dimensions.bar.horizontalMargins
    anchors.rightMargin: Dimensions.bar.horizontalMargins
    anchors.topMargin: Dimensions.bar.verticalMargins
    anchors.bottomMargin: Dimensions.bar.verticalMargins

    margin: 4

    RowLayout {

        RowLayout {
            id: leftbar

            spacing: Dimensions.bar.spacing

            SystemLogo {
                implicitSize: 22
            }

            Workspaces {}

            Tray {}
        }

        RowLayout {
            id: centerbar

            Layout.alignment: Qt.AlignHCenter

            spacing: Dimensions.bar.spacing

            Mpris {}
        }

        RowLayout {
            id: rightbar

            Layout.alignment: Qt.AlignRight

            spacing: Dimensions.bar.spacing

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
