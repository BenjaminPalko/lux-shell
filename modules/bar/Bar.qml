import QtQuick
import Quickshell
import "components"
import "components/hyprland"
import "components/mpris"
import "../../config/"

Scope {
    PanelWindow {
        id: root

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

            Row {
                id: leftbar

                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter

                anchors.leftMargin: Dimensions.bar.horizontalPadding
                anchors.topMargin: Dimensions.bar.verticalPadding
                anchors.bottomMargin: Dimensions.bar.verticalPadding

                spacing: Dimensions.bar.spacing

                SystemLogo {
                    anchors.verticalCenter: parent.verticalCenter
                    implicitSize: 22
                }

                Workspaces {
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            Row {
                id: centerbar

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter

                anchors.topMargin: Dimensions.bar.verticalPadding
                anchors.bottomMargin: Dimensions.bar.verticalPadding

                spacing: Dimensions.bar.spacing

                Mpris {}
            }

            Row {
                id: rightbar

                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter

                anchors.rightMargin: Dimensions.bar.horizontalPadding
                anchors.topMargin: Dimensions.bar.verticalPadding
                anchors.bottomMargin: Dimensions.bar.verticalPadding

                spacing: Dimensions.bar.spacing

                Clock {}
            }
        }
    }
}
