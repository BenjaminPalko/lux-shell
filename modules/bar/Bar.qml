import qs.config
import QtQuick
import QtQuick.Layouts
import Quickshell
import "components"
import "components/bluetooth"
import "components/hyprland"
import "components/mpris"
import "components/tray"

Scope {
    PanelWindow {
        id: parentWindow

        anchors.top: true
        anchors.left: true
        anchors.right: true

        implicitHeight: Dimensions.bar.height
        color: 'transparent'

        Item {

            anchors.fill: parent
            anchors.leftMargin: Dimensions.bar.horizontalMargins
            anchors.rightMargin: Dimensions.bar.horizontalMargins
            anchors.topMargin: Dimensions.bar.verticalMargins
            anchors.bottomMargin: Dimensions.bar.verticalMargins

            Rectangle {
                id: background
                anchors.fill: parent
                color: Theme.palette.base300
                radius: Dimensions.radius

                border {
                    color: Theme.palette.base100
                    width: Dimensions.bar.border
                    pixelAligned: true
                }
            }

            RowLayout {
                id: leftbar

                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter

                anchors.leftMargin: Dimensions.bar.horizontalPadding
                anchors.topMargin: Dimensions.bar.verticalPadding
                anchors.bottomMargin: Dimensions.bar.verticalPadding

                spacing: Dimensions.bar.spacing

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

                anchors.topMargin: Dimensions.bar.verticalPadding
                anchors.bottomMargin: Dimensions.bar.verticalPadding

                spacing: Dimensions.bar.spacing

                Mpris {}
            }

            RowLayout {
                id: rightbar

                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter

                anchors.rightMargin: Dimensions.bar.horizontalPadding
                anchors.topMargin: Dimensions.bar.verticalPadding
                anchors.bottomMargin: Dimensions.bar.verticalPadding

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

                Clock {}

                Notifications {}
            }
        }
    }
}
